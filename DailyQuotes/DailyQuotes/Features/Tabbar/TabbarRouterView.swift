//
//  TabbarRouterView.swift
//  DailyQuotes
//
//  Created by dtrognn on 27/2/25.
//

import DQCommon
import SwiftUI

struct TabItemData {
    var title: LocalizedStringKey
    var image: Image
}

struct TabItem: View {
    let tabType: TabbarRouter.TabType
    private let tabItemData: TabItemData
    @State var languageIdentifier = LanguageManager.shared.currentLanguage.getLanguageCode()

    init(tabType: TabbarRouter.TabType) {
        self.tabType = tabType
        self.tabItemData = tabType.tabItemData()
    }

    var body: some View {
        Label {
            Text(tabItemData.title)
        } icon: {
            tabItemData.image
                .applyTheme()
        }.environment(\.locale, .init(identifier: languageIdentifier))
            .onReceive(LanguageManager.shared.onChangeLanguageBundle) { languageCode in
                languageIdentifier = languageCode.getLanguageCode()
            }
    }
}

class TabbarRouter: ObservableObject {
    enum TabType: Hashable {
        case home
        case setting

        func tabItemData() -> TabItemData {
            switch self {
            case .home:
                return TabItemData(title: language("Tabbar_A_01"), image: Image("ic_tabbar_home"))
            case .setting:
                return TabItemData(title: language("Tabbar_A_02"), image: Image("ic_tabbar_setting"))
            }
        }
    }

    @Published var selectedTab: TabType = .home
}

struct TabbarRouterView: View {
    @EnvironmentObject private var themeManager: ThemeManager
    @StateObject private var router = TabbarRouter()

    var body: some View {
        tabView.tint(themeManager.activeTheme.tabbarSelectedColor)
    }

    var tabView: some View {
        TabView(selection: $router.selectedTab) {
            HomeRouterView()
                .tabItem {
                    TabItem(tabType: .home)
                }.tag(TabbarRouter.TabType.home)

            SettingRouterView()
                .tabItem {
                    TabItem(tabType: .setting)
                }.tag(TabbarRouter.TabType.setting)
        }.tint(themeManager.activeTheme.tabbarSelectedColor)
            .environment(\.horizontalSizeClass, .compact)
    }
}
