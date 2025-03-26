//
//  Theme.swift
//  DQCommon
//
//  Created by dtrognn on 27/2/25.
//

import SwiftUI

public protocol Theme {
    var backgroundColor: Color { get }
    var accentColor: Color { get }
    var primaryColor: Color { get }
    var secondaryColor: Color { get }
    var rowCommonColor: Color { get }

    var textPrimaryColor: Color { get }
    var textSecondaryColor: Color { get }
    var textHightlightColor: Color { get }

    var buttonEnableBackgroundColor: Color { get }
    var buttonEnableTextColor: Color { get }
    var buttonDisableBackgroundColor: Color { get }
    var buttonDisableTextColor: Color { get }

    var navigationBackgroundColor: Color { get }
    var navigationTextColor: Color { get }
    var navigationButtonColor: Color { get }

    var tabbarSelectedColor: Color { get }
    var tabbarBackgroundColor: Color { get }

    func themeFor(scheme: ColorScheme) -> Self
}

public struct AppTheme: Theme {
    public var backgroundColor: Color
    public var accentColor: Color
    public var primaryColor: Color
    public var secondaryColor: Color
    public var rowCommonColor: Color

    public var textPrimaryColor: Color
    public var textSecondaryColor: Color
    public var textHightlightColor: Color

    public var buttonEnableBackgroundColor: Color
    public var buttonEnableTextColor: Color
    public var buttonDisableBackgroundColor: Color
    public var buttonDisableTextColor: Color

    public var navigationBackgroundColor: Color
    public var navigationTextColor: Color
    public var navigationButtonColor: Color

    public var tabbarSelectedColor: Color
    public var tabbarBackgroundColor: Color

    init(
        backgroundColor: Color,
        accentColor: Color,
        primaryColor: Color,
        secondaryColor: Color,
        rowCommonColor: Color,
        textPrimaryColor: Color,
        textSecondaryColor: Color,
        textHightlightColor: Color,
        buttonEnableBackgroundColor: Color,
        buttonEnableTextColor: Color,
        buttonDisableBackgroundColor: Color,
        buttonDisableTextColor: Color,
        navigationBackgroundColor: Color,
        navigationTextColor: Color,
        navigationButtonColor: Color,
        tabbarSelectedColor: Color,
        tabbarBackgroundColor: Color)
    {
        self.backgroundColor = backgroundColor
        self.accentColor = accentColor
        self.primaryColor = primaryColor
        self.secondaryColor = secondaryColor
        self.rowCommonColor = rowCommonColor
        self.textPrimaryColor = textPrimaryColor
        self.textSecondaryColor = textSecondaryColor
        self.textHightlightColor = textHightlightColor
        self.buttonEnableBackgroundColor = buttonEnableBackgroundColor
        self.buttonEnableTextColor = buttonEnableTextColor
        self.buttonDisableBackgroundColor = buttonDisableBackgroundColor
        self.buttonDisableTextColor = buttonDisableTextColor
        self.navigationBackgroundColor = navigationBackgroundColor
        self.navigationTextColor = navigationTextColor
        self.navigationButtonColor = navigationButtonColor
        self.tabbarSelectedColor = tabbarSelectedColor
        self.tabbarBackgroundColor = tabbarBackgroundColor
    }

    public func themeFor(scheme: ColorScheme) -> AppTheme {
        return switch scheme {
        case .light: .lightTheme
        case .dark:.darkTheme
        @unknown default: .lightTheme
        }
    }
}

public extension AppTheme {
    static var darkTheme: Self {
        return .init(
            backgroundColor: Color(hexString: "#14213d")!,
            accentColor: Color(hexString: "#83c5be")!,
            primaryColor: Color(hexString: "#83c5be")!,
            secondaryColor: .black,
            rowCommonColor: Color(hexString: "#778da9")!,
            textPrimaryColor: .white,
            textSecondaryColor: .white,
            textHightlightColor: .black,
            buttonEnableBackgroundColor: .black,
            buttonEnableTextColor: .black,
            buttonDisableBackgroundColor: .black,
            buttonDisableTextColor: .black,
            navigationBackgroundColor: Color(hexString: "#14213d")!,
            navigationTextColor: .white,
            navigationButtonColor: .white,
            tabbarSelectedColor: Color(hexString: "#83c5be")!,
            tabbarBackgroundColor: Color(hexString: "#14213d")!)
    }

    static var lightTheme: Self {
        return .init(
            backgroundColor: Color(hexString: "#FAF2E1")!,
            accentColor: Color(hexString: "#83c5be")!,
            primaryColor: Color(hexString: "#83c5be")!,
            secondaryColor: Color(hexString: "#83c5be")!,
            rowCommonColor: Color(hexString: "#e3d5ca")!,
            textPrimaryColor: Color(hexString: "#0d1321")!,
            textSecondaryColor: Color(hexString: "#8b8c89")!,
            textHightlightColor: .white,
            buttonEnableBackgroundColor: .black,
            buttonEnableTextColor: .black,
            buttonDisableBackgroundColor: .black,
            buttonDisableTextColor: .black,
            navigationBackgroundColor: Color(hexString: "#FAF2E1")!,
            navigationTextColor: .black,
            navigationButtonColor: .black,
            tabbarSelectedColor: Color(hexString: "#83c5be")!,
            tabbarBackgroundColor: Color(hexString: "#FAF2E1")!)
    }
}
