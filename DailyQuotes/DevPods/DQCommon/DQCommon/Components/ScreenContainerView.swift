//
//  ScreenContainerView.swift
//  DQCommon
//
//  Created by dtrognn on 27/2/25.
//

import SwiftUI

public struct ScreenContainerView<Content: View>: View {
    @EnvironmentObject private var themeManager: ThemeManager
    @ObservedObject private var configuration: ScreenConfiguration
    public var content: Content

    public init(_ configuration: ScreenConfiguration, @ViewBuilder content: () -> Content) {
        self.configuration = configuration
        self.content = content()
    }

    public var body: some View {
        ZStack(alignment: .top) {
            themeManager.activeTheme.backgroundColor.ignoresSafeArea()

            VStack(spacing: LayoutSize.zeroSpacing) {
                if configuration.showNaviBar {
                    NaviBarView(configuration.naviBarConfiguration)
                }

                content
                    .frame(minHeight: 0, maxHeight: .infinity, alignment: .top)
                    .toolbar(configuration.hidesBottomBarWhenPushed ? .hidden : .visible, for: .tabBar)
                    .onDisappear {
                        if configuration.hidesBottomBarWhenPushed == true {
                            configuration.hidesBottomBarWhenPushed = false
                        }
                    }
            }
        }.ignoresSafeArea(edges: .bottom)
    }
}
