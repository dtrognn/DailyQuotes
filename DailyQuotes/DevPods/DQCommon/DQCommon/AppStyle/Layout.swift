//
//  Layout.swift
//  DQCommon
//
//  Created by dtrognn on 27/2/25.
//

import SwiftUI

public enum LayoutSize {
    // Padding
    public static let smallPadding: CGFloat = 8.0
    public static let mediumPadding: CGFloat = 16.0
    public static let largePadding: CGFloat = 24.0

    // Corner Radius
    public static let smallRadius: CGFloat = 4.0
    public static let mediumRadius: CGFloat = 8.0
    public static let largeRadius: CGFloat = 12.0

    // Button Sizes
    public static let buttonHeightSmall: CGFloat = 32.0
    public static let buttonHeightMedium: CGFloat = 44.0
    public static let buttonHeightLarge: CGFloat = 56.0
    public static let buttonMinWidth: CGFloat = 100.0

    // Spacing
    public static let zeroSpacing: CGFloat = 0.0
    public static let smallSpacing: CGFloat = 4.0
    public static let mediumSpacing: CGFloat = 8.0
    public static let largeSpacing: CGFloat = 16.0

    // Icon Sizes
    public static let smallIcon: CGFloat = 16.0
    public static let mediumIcon: CGFloat = 24.0
    public static let largeIcon: CGFloat = 32.0

    // Card Sizes
    public static let cardMinWidth: CGFloat = 200.0
    public static let cardMinHeight: CGFloat = 150.0

    // Screen-based calculations
    static func adaptiveWidth(percentage: CGFloat) -> CGFloat {
        let screenWidth = UIScreen.main.bounds.width
        return screenWidth * (percentage / 100.0)
    }

    static func adaptiveHeight(percentage: CGFloat) -> CGFloat {
        let screenHeight = UIScreen.main.bounds.height
        return screenHeight * (percentage / 100.0)
    }
}
