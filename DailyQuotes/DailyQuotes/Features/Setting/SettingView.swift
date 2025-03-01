//
//  SettingView.swift
//  DailyQuotes
//
//  Created by dtrognn on 27/2/25.
//

import DQCommon
import SwiftUI

struct SettingView: View {
    @EnvironmentObject private var router: Router
    @EnvironmentObject private var themeManager: ThemeManager
    @StateObject private var vM = SettingViewModel()

    private var screenConfiguration: ScreenConfiguration {
        let navibarConfiguration: NaviBarConfiguration = .init(title: "")
        return .init(showNaviBar: false, naviBarConfiguration: navibarConfiguration, hidesBottomBarWhenPushed: false)
    }

    var body: some View {
        ScreenContainerView(screenConfiguration) {
            VStack {
                VStack(spacing: LayoutSize.zeroSpacing) {
                    darkModeRowView
                }.background(themeManager.activeTheme.rowCommonColor)
                    .cornerRadius(LayoutSize.mediumRadius)

                VStack(spacing: LayoutSize.zeroSpacing) {
                    languageSettingRowView
                }.background(themeManager.activeTheme.rowCommonColor)
                    .cornerRadius(LayoutSize.mediumRadius)
            }.padding(.all, LayoutSize.mediumPadding)
        }
    }
}

private extension SettingView {
    var darkModeRowView: some View {
        return ToggleRowCommonView(isOn: $vM.isDarkMode, title: language("Setting_A_01"), image: "ic_cm_moon") { isOn in
            vM.setTheme(isOn)
        }
    }

    var languageSettingRowView: some View {
        return RowCommonView(title: language("Setting_A_02"), image: "ic_cm_world", showUnderline: false) {
            router.route(to: SettingDestination.language)
        }
    }
}
