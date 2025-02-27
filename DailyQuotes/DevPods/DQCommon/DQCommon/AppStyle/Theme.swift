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

    func themeFor(scheme: ColorScheme) -> Self
}

public struct AppTheme: Theme {
    public var backgroundColor: Color
    public var accentColor: Color
    public var primaryColor: Color
    public var secondaryColor: Color

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

    internal init(
        backgroundColor: Color,
        accentColor: Color,
        primaryColor: Color,
        secondaryColor: Color,
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
        tabbarSelectedColor: Color)
    {
        self.backgroundColor = backgroundColor
        self.accentColor = accentColor
        self.primaryColor = primaryColor
        self.secondaryColor = secondaryColor
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
            backgroundColor: .black,
            accentColor: .black,
            primaryColor: .black,
            secondaryColor: .black,
            textPrimaryColor: .black,
            textSecondaryColor: .black,
            textHightlightColor: .black,
            buttonEnableBackgroundColor: .black,
            buttonEnableTextColor: .black,
            buttonDisableBackgroundColor: .black,
            buttonDisableTextColor: .black,
            navigationBackgroundColor: .black,
            navigationTextColor: .black,
            navigationButtonColor: .black,
            tabbarSelectedColor: .black)
    }

    static var lightTheme: Self {
        return .init(
            backgroundColor: .white,
            accentColor: .black,
            primaryColor: .black,
            secondaryColor: .black,
            textPrimaryColor: .black,
            textSecondaryColor: .black,
            textHightlightColor: .black,
            buttonEnableBackgroundColor: .black,
            buttonEnableTextColor: .black,
            buttonDisableBackgroundColor: .black,
            buttonDisableTextColor: .black,
            navigationBackgroundColor: .white,
            navigationTextColor: .black,
            navigationButtonColor: .black,
            tabbarSelectedColor: .black)
    }
}
