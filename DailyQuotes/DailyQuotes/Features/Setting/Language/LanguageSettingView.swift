//
//  LanguageSettingView.swift
//  DailyQuotes
//
//  Created by dtrognn on 1/3/25.
//

import DQCommon
import SwiftUI

struct LanguageSettingView: View {
    @EnvironmentObject private var router: Router
    @StateObject private var vM = LanguageSettingViewModel()

    private var screenConfiguration: ScreenConfiguration {
        let naviBarConfig: NaviBarConfiguration = .init(
            title: language("Language_A_01"),
            showUnderline: false,
            onBackAction: {
                router.pop()
            })
        return .init(naviBarConfiguration: naviBarConfig)
    }

    var body: some View {
        ScreenContainerView(screenConfiguration) {
            ScrollView(.vertical) {
                LazyVStack(spacing: LayoutSize.zeroSpacing) {
                    ForEach(vM.languages) { language in
                        LanguageItemView(language)
                    }
                }.padding(.vertical, LayoutSize.mediumPadding)
            }
        }
    }
}
