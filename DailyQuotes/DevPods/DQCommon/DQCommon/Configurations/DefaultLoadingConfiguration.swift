//
//  DefaultLoadingConfiguration.swift
//  DQCommon
//
//  Created by dtrognn on 27/2/25.
//

import Foundation
import SVProgressHUD

public class DefaultLoadingConfiguration: ILoadingConfiguration {
    public init() { }

    public func configure() {
        SVProgressHUD.setDefaultMaskType(.black)
    }

    public func showLoading() {
        SVProgressHUD.show()
    }

    public func hideLoading() {
        SVProgressHUD.dismiss(withDelay: 0.5)
    }
}
