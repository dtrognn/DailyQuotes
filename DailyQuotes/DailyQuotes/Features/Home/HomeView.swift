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
            VStack {
                ACarousel(vM.quotes) { quote in
                    QuoteItemCardView(quote)
                }
            }.onAppear {
                vM.loadData()
            }
        }
    }
}
