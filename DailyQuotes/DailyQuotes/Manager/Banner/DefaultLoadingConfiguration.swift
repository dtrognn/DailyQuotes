//
//  DefaultLoadingConfiguration.swift
//  DailyQuotes
//
//  Created by dtrognn on 26/3/25.
//

import DQCommon
import SVProgressHUD

public class DefaultLoadingConfiguration: ILoadingConfiguration {
    public init() {}

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
