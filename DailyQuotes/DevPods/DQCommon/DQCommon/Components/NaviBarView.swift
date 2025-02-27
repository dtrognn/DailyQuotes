//
//  NaviBarView.swift
//  DQCommon
//
//  Created by dtrognn on 27/2/25.
//

import SwiftUI

struct NaviBarView: View {
    @EnvironmentObject private var themeManager: ThemeManager
    @ObservedObject private var configuration: NaviBarConfiguration

    init(_ configuration: NaviBarConfiguration) {
        self.configuration = configuration
    }

    var body: some View {
        VStack(spacing: LayoutSize.zeroSpacing) {
            HStack(spacing: LayoutSize.mediumSpacing) {
                backButton
                Spacer()
                titleText
                Spacer()
                rightButton
            }.background(configuration.setBackgroundColor ? themeManager.activeTheme.navigationBackgroundColor : Color.clear)

            if configuration.showUnderline {
                StraightLineView()
            }
        }.frame(height: LayoutSize.buttonHeightMedium)
            .navigationBarHidden(true)
    }
}

private extension NaviBarView {
    var backButton: some View {
        if configuration.showBackButton {
            return Button {
                configuration.onBackAction?()
            } label: {
                Image.image("ic_back_3")
                    .applyTheme(themeManager.activeTheme.navigationButtonColor)
                    .scaleEffect(1.3)
                    .frame(width: LayoutSize.buttonHeightMedium, height: LayoutSize.buttonHeightMedium)
            }.asAnyView
        }
        return EmptyView().asAnyView
    }

    var titleText: some View {
        return Text(configuration.title)
            .font(AppFont.semibold16)
            .foregroundStyle(themeManager.activeTheme.navigationTextColor)
            .lineLimit(1)
    }

    var rightButton: some View {
        if let rightImage = configuration.rightButton {
            return Button {
                configuration.onSelectRightButton?()
            } label: {
                rightImage
                    .applyTheme(themeManager.activeTheme.navigationButtonColor)
                    .frame(width: LayoutSize.buttonHeightMedium, height: LayoutSize.buttonHeightMedium)
            }.asAnyView
        } else {
            return Image("")
                .applyTheme(themeManager.activeTheme.navigationButtonColor)
                .frame(width: LayoutSize.buttonHeightMedium, height: LayoutSize.buttonHeightMedium)
                .asAnyView
        }
    }
}
