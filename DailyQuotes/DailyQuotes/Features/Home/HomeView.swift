//
//  HomeView.swift
//  DailyQuotes
//
//  Created by dtrognn on 27/2/25.
//

import DQCommon
import SwiftUI

struct HomeView: View {
    private var screenConfiguration: ScreenConfiguration {
        let navibarConfiguration: NaviBarConfiguration = .init(title: "Home")
        return .init(naviBarConfiguration: navibarConfiguration, hidesBottomBarWhenPushed: false)
    }

    var body: some View {
        ScreenContainerView(screenConfiguration) {
            VStack {
                //
            }
        }
    }
}

#Preview {
    HomeView()
}
