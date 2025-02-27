//
//  Font.swift
//  DQCommon
//
//  Created by dtrognn on 27/2/25.
//

import SwiftUI

public protocol IFont {
    static var regular10: Font { get }
    static var regular12: Font { get }
    static var regular13: Font { get }
    static var regular14: Font { get }
    static var regular15: Font { get }
    static var regular16: Font { get }
    static var regular17: Font { get }
    static var regular18: Font { get }
    static var regular20: Font { get }
    static var regular24: Font { get }
    static var regular30: Font { get }
    static var regular32: Font { get }
    static var regular40: Font { get }

    static var semibold10: Font { get }
    static var semibold12: Font { get }
    static var semibold14: Font { get }
    static var semibold15: Font { get }
    static var semibold16: Font { get }
    static var semibold17: Font { get }
    static var semibold18: Font { get }
    static var semibold20: Font { get }
    static var semibold24: Font { get }
    static var semibold30: Font { get }
    static var semibold32: Font { get }
    static var semibold40: Font { get }

    static var medium6: Font { get }
    static var medium10: Font { get }
    static var medium12: Font { get }
    static var medium14: Font { get }
    static var medium15: Font { get }
    static var medium16: Font { get }
    static var medium17: Font { get }
    static var medium18: Font { get }
    static var medium20: Font { get }
    static var medium24: Font { get }
    static var medium30: Font { get }
    static var medium32: Font { get }
    static var medium40: Font { get }

    static var bold10: Font { get }
    static var bold12: Font { get }
    static var bold14: Font { get }
    static var bold15: Font { get }
    static var bold16: Font { get }
    static var bold17: Font { get }
    static var bold18: Font { get }
    static var bold20: Font { get }
    static var bold22: Font { get }
    static var bold24: Font { get }
    static var bold32: Font { get }
    static var bold40: Font { get }
}

public struct AppFont: IFont {
    public static var regular10: Font { Font.regular(ofSize: 10) }
    public static var regular12: Font { Font.regular(ofSize: 12) }
    public static var regular13: Font { Font.regular(ofSize: 13) }
    public static var regular14: Font { Font.regular(ofSize: 14) }
    public static var regular15: Font { Font.regular(ofSize: 15) }
    public static var regular16: Font { Font.regular(ofSize: 16) }
    public static var regular17: Font { Font.regular(ofSize: 17) }
    public static var regular18: Font { Font.regular(ofSize: 18) }
    public static var regular20: Font { Font.regular(ofSize: 20) }
    public static var regular24: Font { Font.regular(ofSize: 24) }
    public static var regular30: Font { Font.regular(ofSize: 30) }
    public static var regular32: Font { Font.regular(ofSize: 32) }
    public static var regular40: Font { Font.regular(ofSize: 40) }

    public static var semibold10: Font { Font.semibold(ofSize: 10) }
    public static var semibold12: Font { Font.semibold(ofSize: 12) }
    public static var semibold14: Font { Font.semibold(ofSize: 14) }
    public static var semibold15: Font { Font.semibold(ofSize: 15) }
    public static var semibold16: Font { Font.semibold(ofSize: 16) }
    public static var semibold17: Font { Font.semibold(ofSize: 17) }
    public static var semibold18: Font { Font.semibold(ofSize: 18) }
    public static var semibold20: Font { Font.semibold(ofSize: 20) }
    public static var semibold24: Font { Font.semibold(ofSize: 24) }
    public static var semibold30: Font { Font.semibold(ofSize: 30) }
    public static var semibold32: Font { Font.semibold(ofSize: 32) }
    public static var semibold40: Font { Font.semibold(ofSize: 40) }

    public static var medium6: Font { Font.medium(ofSize: 6) }
    public static var medium10: Font { Font.medium(ofSize: 10) }
    public static var medium12: Font { Font.medium(ofSize: 12) }
    public static var medium14: Font { Font.medium(ofSize: 14) }
    public static var medium15: Font { Font.medium(ofSize: 15) }
    public static var medium16: Font { Font.medium(ofSize: 16) }
    public static var medium17: Font { Font.medium(ofSize: 17) }
    public static var medium18: Font { Font.medium(ofSize: 18) }
    public static var medium20: Font { Font.medium(ofSize: 20) }
    public static var medium24: Font { Font.medium(ofSize: 24) }
    public static var medium30: Font { Font.medium(ofSize: 30) }
    public static var medium32: Font { Font.medium(ofSize: 32) }
    public static var medium40: Font { Font.medium(ofSize: 40) }

    public static var bold10: Font { Font.bold(ofSize: 10) }
    public static var bold12: Font { Font.bold(ofSize: 12) }
    public static var bold14: Font { Font.bold(ofSize: 14) }
    public static var bold15: Font { Font.bold(ofSize: 15) }
    public static var bold16: Font { Font.bold(ofSize: 16) }
    public static var bold17: Font { Font.bold(ofSize: 17) }
    public static var bold18: Font { Font.bold(ofSize: 18) }
    public static var bold20: Font { Font.bold(ofSize: 20) }
    public static var bold22: Font { Font.bold(ofSize: 24) }
    public static var bold24: Font { Font.bold(ofSize: 30) }
    public static var bold32: Font { Font.bold(ofSize: 32) }
    public static var bold40: Font { Font.bold(ofSize: 40) }
}

public extension Font {
    static func regular(ofSize size: CGFloat) -> Font {
//        return FontManager.setFontSwiftUI(size, fontName: .SFProDisplayRegular)
        return Font.system(size: size, weight: .light, design: .default)
    }

    static func bold(ofSize size: CGFloat) -> Font {
//        return FontManager.setFontSwiftUI(size, fontName: .SFProDisplayBold)
        return Font.system(size: size, weight: .bold, design: .default)
    }

    static func semibold(ofSize size: CGFloat) -> Font {
//        return FontManager.setFontSwiftUI(size, fontName: .SFProDisplaySemibold)
        return Font.system(size: size, weight: .semibold, design: .default)
    }

    static func medium(ofSize size: CGFloat) -> Font {
//        return FontManager.setFontSwiftUI(size, fontName: .SFProDisplayMedium)
        return Font.system(size: size, weight: .medium, design: .default)
    }
}
