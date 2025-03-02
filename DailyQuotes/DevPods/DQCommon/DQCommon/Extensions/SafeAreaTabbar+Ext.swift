//
//  SafeAreaTabbar+Ext.swift
//  DQCommon
//
//  Created by dtrognn on 2/3/25.
//

import SwiftUI

public extension EnvironmentValues {
    var safeAreaInsets: EdgeInsets {
        self[SafeAreaInsetsEnvironmentKey.self]
    }
}

private struct SafeAreaInsetsEnvironmentKey: EnvironmentKey {
    static var defaultValue: EdgeInsets {
        UIApplication.shared.keyWindow?.safeAreaInsets.swiftUIInsets ?? EdgeInsets()
    }
}

private extension UIEdgeInsets {
    var swiftUIInsets: EdgeInsets {
        EdgeInsets(top: top, leading: left, bottom: bottom, trailing: right)
    }
}
