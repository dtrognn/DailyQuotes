//
//  HomeView.swift
//  DailyQuotes
//
//  Created by dtrognn on 27/2/25.
//

import DQCommon
import SwiftUI

struct HomeView: View {
    @Environment(\.safeAreaInsets) private var safeAreaInsets
    @EnvironmentObject private var router: Router
    @EnvironmentObject private var themeManager: ThemeManager
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

                    GeometryReader { proxy in
                        ScrollView {
                            VStack(spacing: LayoutSize.zeroSpacing) {
                                ACarousel(vM.quotes) { quote in
                                    QuoteItemCardView(quote)
                                }.frame(width: proxy.size.width, height: proxy.size.width / (16 / 9))

                                authorsView
                            }.padding(.vertical, LayoutSize.smallPadding)
                        }
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

    var authorsView: some View {
        return VStack(alignment: .leading, spacing: LayoutSize.mediumSpacing) {
            authorListText

            LazyVStack(spacing: LayoutSize.mediumSpacing) {
                ForEach(vM.authors) { author in
                    AuthorItemView(author) { _ in
                        //
                    }
                }
            }
        }.padding(.horizontal, LayoutSize.mediumPadding)
            .padding(.bottom, UITabBarController().height + safeAreaInsets.bottom)
    }

    var authorListText: some View {
        return Text(language("Home_A_01"))
            .font(AppFont.medium16)
            .foregroundStyle(themeManager.activeTheme.textPrimaryColor)
    }
}
