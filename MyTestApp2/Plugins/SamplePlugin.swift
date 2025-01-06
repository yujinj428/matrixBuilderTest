//
//  Copyright (C) Inswave Systems, Inc - All Rights Reserved
//  Unauthorized copying of this file, via any medium is strictly prohibited
//  Proprietary and confidential
//  Written by Inswave Systems <webmaster@inswave.com>, April 2021
//

import Foundation
import WMatrixMobile

final class SamplePlugin : WMatrixPlugin {
    func echo(_ callBack: CallBackManager) {
        if let param = callBack.command.argument(at: 0) as? String {
            callBack.success(data: param)
        } else {
            callBack.error(status: .INVALID_PARAM)
        }
    }
}
