//  MainViewController.swift
//  Template
//

import Foundation
import UIKit
import WebKit
import WMatrixMobile

class MainViewController : UIViewController {
    
    var wmatrix: WMatrix?
    var webView: WMatrixWebView?
    var loadingView: UIView?
    
    var useServerSelectScreen: Bool {
        wmatrix?.targetInfo.useSeverSelect ?? false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // loading 추가
        self.showLoadingView()
        
        // wmatrix객체 생성
        self.wmatrix = WMatrix(delegate: self)
        
        // 서버 선택 화면
        self.showServerSelect()
    }
    
    func addWebView(tag:String, webView:WMatrixWebView?) {
        DispatchQueue.main.async {
            guard let matrixWebView = webView else { return }
            self.view.addSubview(matrixWebView)
            self.view.sendSubviewToBack(matrixWebView)
            matrixWebView.translatesAutoresizingMaskIntoConstraints = false
            let layoutGuide = self.view.safeAreaLayoutGuide
            matrixWebView.topAnchor.constraint(equalTo: layoutGuide.topAnchor).isActive = true
            matrixWebView.leftAnchor.constraint(equalTo: layoutGuide.leftAnchor).isActive = true
            matrixWebView.rightAnchor.constraint(equalTo: layoutGuide.rightAnchor).isActive = true
            matrixWebView.bottomAnchor.constraint(equalTo: layoutGuide.bottomAnchor).isActive = true
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
      // iOS Dark mode시 viewColor가 white인 경우 statusbar text가 white라 안보이는 현상처리
      if #available(iOS 13.0, *) {
        if self.traitCollection.userInterfaceStyle == .dark {
          if self.view.backgroundColor == .white {
            return .darkContent
          }
        }
      }
      return .default
    }
    
    func showLoadingView(){
        DispatchQueue.main.async {
            self.loadingView = LoadingView(frame: self.view.frame)
            guard let view = self.loadingView else { return }
            view.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview(view)
            view.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
            view.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
            view.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
            view.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        }
    }
    
    
    /// 서버선택화면을 출력하거나 create를 실행한다.
    func showServerSelect() {
        // 서버선택화면 사용시
        if self.useServerSelectScreen {
            self.wmatrix?.showServerSelect()
        } else {
            // 서버선택화면 미사용시
            // WMatrixConfig.plist에 target이름과 일치하는 Dictionary에 startServerGroup과 일치하는 serverGroup으로 시작한다.
            if let serverGroup = self.wmatrix?.getStartServerGroupFromConfig() {
                WMLog.debug(msg: "groupName:\(serverGroup.groupName), serverList:\(serverGroup.serverList)")
                self.createWMatrix(serverGroup:serverGroup)
            } else {
                WMLog.debug(msg: "WMatrixConfig.plist에 startServerGroup이름을 확인하세요.")
            }
        }
    }
    
    
    /// 서버그룹을 인자로 받아 wmatrix에 create함수를 실행한다.
    /// - Parameter serverGroup: 접속할 serverGroup
    func createWMatrix(serverGroup: ServerGroup) {
        serverGroup.serverList.forEach { serverData in
            var options = WebViewOptions()
            self.wmatrix?.create(tag: serverData.name, serverData: serverData, webViewOptions: options)
        }
    }
    
    deinit {
        print("\(#function): \(String(describing:MainViewController.self))")
    }
}

extension MainViewController: WMatrixProtocol {
    
    
    /// wmatrix에서 Create함수 실행 후 실행되는 이벤트
    /// - Parameter tag: tag
    func onMatrixCreated(tag: String) {
        self.wmatrix?.start(tag:tag)
    }
    
    
    /// wmatrix에서 start함수 실행 후 실행되는 이벤트
    /// - Parameter tag: tag
    func onMatrixStarted(tag: String) {
        self.wmatrix?.makeWebView(tag:tag)
    }
    
    
    /// wmatrix에서 makeWebView함수 실행 후 발생하는 이벤트
    /// - Parameters:
    ///   - tag: tag
    ///   - matrixWebView: wmatrixwebview
    func onMatrixWebViewCreated(tag: String, matrixWebView: WMatrixWebView?) {
        DispatchQueue.main.async {
            // wkwebview inspector on/off
            if #available(iOS 16.4, *) {
                matrixWebView?.isInspectable = true
            }
            
            self.webView = matrixWebView
            self.addWebView(tag: tag, webView:self.webView)
            self.webView?.loadStartPage()
            
        }
        
//        DispatchQueue.main.asyncAfter(deadline: .now(), execute: { [self] in
//            
//            let info = wmatrix?.getServerGroupFromConfigTobe()
//            print("info ----------- dump \(dump(info))")
//        })
    }
    
    
    /// ServerSelect 화면에서 서버 그룹 선택시 발생하는 이벤트
    /// - Parameter group: serverGroup
    func onMatrixGroupSelect(group: WMatrixMobile.ServerGroup) {
        self.createWMatrix(serverGroup: group)
    }
    
    
    /// LoadingView제거
    func onDismissLoadingView() {
        DispatchQueue.main.async {
            guard let progressView = self.loadingView else { return }
            UIView.animate(withDuration: 0.5, animations: {
                progressView.alpha = 0
            }, completion: {_ in
                progressView.removeFromSuperview()
                self.loadingView = nil
            })
        }
    }
    
    
    /// wmatrix 실행시 발생하는 오류 이벤트
    /// - Parameters:
    ///   - tag: tag
    ///   - error: matrix error
    func onMatrixError(tag: String, error: MatrixError) {
        DispatchQueue.main.async {
            let message = error.errorMessage
            let reason = error.errorReason
            
            let alert = UIAlertController.init(title: "", message: "\(String(describing: message)) (\(String(describing: reason)) - \(tag)", preferredStyle: .alert)
            
            let confirmBtn = UIAlertAction.init(title: "확인", style: .default) { action in
                UIApplication.shared.perform(#selector(NSXPCConnection.suspend))
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) { exit(0) }
            }
            alert.addAction(confirmBtn)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
}
