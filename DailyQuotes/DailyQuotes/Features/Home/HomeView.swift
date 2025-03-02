//
//  HomeView.swift
//  DailyQuotes
//
//  Created by dtrognn on 27/2/25.
//

import DQCommon
import SwiftUI

struct HomeView: View {
    @StateObject private var vM = HomeViewModel()

    private var screenConfiguration: ScreenConfiguration {
        let navibarConfiguration: NaviBarConfiguration = .init(title: "")
        return .init(showNaviBar: false, naviBarConfiguration: navibarConfiguration, hidesBottomBarWhenPushed: false)
    }

    var body: some View {
        ScreenContainerView(screenConfiguration) {
            VStack(spacing: LayoutSize.zeroSpacing) {
                VStack(spacing: LayoutSize.mediumSpacing) {
                    HStack {
                        Spacer()
                        tagsMenuView
                    }.padding(.horizontal, LayoutSize.mediumPadding)

                    ACarousel(vM.quotes) { quote in
                        QuoteItemCardView(quote)
                    }
                }
            }.onAppear {
                vM.loadData()
            }
        }
    }
}

private extension HomeView {
    var tagsMenuView: some View {
        return MenuView(tagMenuConfiguration) {
            Image.image("ic_cm_menu")
                .applyTheme()
        }
    }

    var tagMenuConfiguration: MenuConfiguration {
        return .init(menuItemList: tagMenuItemList) { menuItemConfiguration in
            didSelectTagsMenu(menuItemConfiguration)
        }
    }

    func didSelectTagsMenu(_ menuItem: MenuItemConfiguration) {
        guard let tag = menuItem.data as? String else { return }
        vM.handleSelectTag(tag)
    }

    var tagMenuItemList: [MenuItemConfiguration] {
        return vM.tags.map {
            .init(
                id: UUID().uuidString,
                title: $0,
                trailingImage: vM.tagsSelected.contains($0) ? .image("ic_cm_checkmark") : nil,
                isUseTheme: true,
                data: $0)
        }
    }
}
