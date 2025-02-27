//
//  DQCommonBundle.swift
//  DQCommon
//
//  Created by dtrognn on 27/2/25.
//

import Foundation
import SwiftUI

public enum DQCommonBundle {
    public static let useResourceBundles = false
    public static let bundleName = "DQCommon.bundle"
}

private class GetBundle {}

public extension Bundle {
    class func dqCommonResourceBundle() -> Bundle {
        let framework = Bundle(for: GetBundle.self)
        guard DQCommonBundle.useResourceBundles else {
            return framework
        }
        guard let resourceBundleURL = framework.url(forResource: DQCommonBundle.bundleName,
                                                    withExtension: nil)
        else {
            fatalError("\(DQCommonBundle.bundleName) not found!")
        }
        guard let resourceBundle = Bundle(url: resourceBundleURL) else {
            fatalError("Cannot access \(DQCommonBundle.bundleName)")
        }
        return resourceBundle
    }
}

extension Image {
    static func image(_ name: String) -> Image {
        return Image(name, bundle: Bundle.dqCommonResourceBundle())
    }
}
