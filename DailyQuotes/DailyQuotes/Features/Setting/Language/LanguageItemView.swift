//
//  LanguageItemView.swift
//  DailyQuotes
//
//  Created by dtrognn on 1/3/25.
//

import DQCommon
import SwiftUI

struct LanguageItemView: View {
    @EnvironmentObject private var themeManager: ThemeManager
    private var language: LanguageItemData

    init(_ language: LanguageItemData) {
        self.language = language
    }

    var body: some View {
        Button {
            Vibration.selection.vibrate()
            language.onSelect(language.value)
        } label: {
            VStack(spacing: LayoutSize.zeroSpacing) {
                HStack(spacing: LayoutSize.mediumSpacing) {
                    HStack(spacing: LayoutSize.largeSpacing) {
                        flagImage
                        languageText
                    }
                    Spacer()
                    if language.isSelected {
                        checkMarkImage
                    }
                }.padding(.all, LayoutSize.mediumPadding)

                StraightLineView()
            }.background(themeManager.activeTheme.rowCommonColor)
        }
    }
}

private extension LanguageItemView {
    var flagImage: some View {
        if let image = language.leftImage {
            return image
                .resizable()
                .scaledToFill()
                .frame(width: LayoutSize.largeIcon, height: LayoutSize.largeIcon)
                .clipShape(Circle())
                .clipped()
                .asAnyView
        }
        return EmptyView().asAnyView
    }

    var languageText: some View {
        return Text(language.title)
            .font(AppFont.regular16)
            .foregroundStyle(themeManager.activeTheme.textPrimaryColor)
            .multilineTextAlignment(.leading)
    }

    var checkMarkImage: some View {
        return Image.image("ic_cm_checkmark").applyTheme()
    }
}
