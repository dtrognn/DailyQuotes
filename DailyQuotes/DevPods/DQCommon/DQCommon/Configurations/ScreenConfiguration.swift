//
//  ScreenConfiguration.swift
//  DQCommon
//
//  Created by dtrognn on 27/2/25.
//

import SwiftUI

public class NaviBarConfiguration: ObservableObject {
    @Published public var title: String
    @Published public var showBackButton: Bool
    @Published public var showUnderline: Bool
    @Published public var setBackgroundColor: Bool

    public var rightButton: Image?
    public var onBackAction: (() -> Void)?
    public var onSelectRightButton: (() -> Void)?

    public init(
        title: String,
        showBackButton: Bool = true,
        showUnderline: Bool = true,
        setBackgroundColor: Bool = true,
        rightButton: Image? = nil,
        onBackAction: (() -> Void)? = nil,
        onSelectRightButton: (() -> Void)? = nil)
    {
        self.title = title
        self.showBackButton = showBackButton
        self.showUnderline = showUnderline
        self.setBackgroundColor = setBackgroundColor
    }
}

public class ScreenConfiguration: ObservableObject {
    @Published public var showNaviBar: Bool
    @Published public var naviBarConfiguration: NaviBarConfiguration
    @Published public var hidesBottomBarWhenPushed: Bool

    public init(
        showNaviBar: Bool = true,
        naviBarConfiguration: NaviBarConfiguration,
        hidesBottomBarWhenPushed: Bool)
    {
        self.showNaviBar = showNaviBar
        self.naviBarConfiguration = naviBarConfiguration
        self.hidesBottomBarWhenPushed = hidesBottomBarWhenPushed
    }
}
