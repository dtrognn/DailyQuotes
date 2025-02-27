//
//  BannerAlertMessageConfiguration.swift
//  DQCommon
//
//  Created by dtrognn on 27/2/25.
//

import Foundation
import NotificationBannerSwift

class CustomBannerColors: BannerColorsProtocol {
    func color(for style: BannerStyle) -> UIColor {
        switch style {
        case .danger: return UIColor(red: 0.90, green: 0.31, blue: 0.26, alpha: 1.00)
        case .info: return UIColor(red: 0.23, green: 0.60, blue: 0.85, alpha: 1.00)
        case .customView: return UIColor.clear
        case .success: return UIColor(red: 0.22, green: 0.80, blue: 0.46, alpha: 1.00)
        case .warning: return UIColor(red: 1.00, green: 0.66, blue: 0.16, alpha: 1.00)
        }
    }
}

public class BannerAlertMessageConfiguration: IAlertMessage {
    public var banner: GrowingNotificationBanner?

    public init() {}

    public func configure() {}

    public func showMessage(_ message: String, style: AlertMessageStyle) {
        let bannerStyle = style.mapToBannerStyle

        let title: String = language("Common_A_01")
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }

            if let bannerCurrent = self.banner {
                if !bannerCurrent.isDisplaying {
                    self.banner = GrowingNotificationBanner(title: title, subtitle: message, style: bannerStyle, colors: CustomBannerColors())
                    self.banner?.duration = TimeInterval(2)
                } else {
                    // bannerCurrent.dismiss()
                }
            } else {
                self.banner = GrowingNotificationBanner(title: title, subtitle: message, style: bannerStyle, colors: CustomBannerColors())
                self.banner?.duration = TimeInterval(2)
            }
            self.banner?.show()
        }
    }
}

extension AlertMessageStyle {
    var mapToBannerStyle: BannerStyle {
        switch self {
        case .danger:
            return .danger
        case .info:
            return .info
        case .customView:
            return .customView
        case .success:
            return .success
        case .warning:
            return .warning
        }
    }
}

public class DefaultAlertMessageConfiguration: BannerAlertMessageConfiguration {}
