//
//  Layout.swift
//  DQCommon
//
//  Created by dtrognn on 27/2/25.
//

import SwiftUI

struct LayoutSize {
    // Padding
    static let smallPadding: CGFloat = 8.0
    static let mediumPadding: CGFloat = 16.0
    static let largePadding: CGFloat = 24.0

    // Corner Radius
    static let smallRadius: CGFloat = 4.0
    static let mediumRadius: CGFloat = 8.0
    static let largeRadius: CGFloat = 12.0

    // Button Sizes
    static let buttonHeightSmall: CGFloat = 32.0
    static let buttonHeightMedium: CGFloat = 44.0
    static let buttonHeightLarge: CGFloat = 56.0
    static let buttonMinWidth: CGFloat = 100.0

    // Spacing
    static let zeroSpacing: CGFloat = 0.0
    static let smallSpacing: CGFloat = 4.0
    static let mediumSpacing: CGFloat = 8.0
    static let largeSpacing: CGFloat = 16.0

    // Icon Sizes
    static let smallIcon: CGFloat = 16.0
    static let mediumIcon: CGFloat = 24.0
    static let largeIcon: CGFloat = 32.0

    // Card Sizes
    static let cardMinWidth: CGFloat = 200.0
    static let cardMinHeight: CGFloat = 150.0

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
