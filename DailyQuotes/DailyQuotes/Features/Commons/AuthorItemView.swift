//
//  AuthorItemView.swift
//  DailyQuotes
//
//  Created by dtrognn on 2/3/25.
//

import DQCommon
import SwiftUI

struct AuthorItemView: View {
    @EnvironmentObject private var themeManager: ThemeManager
    private var author: AuthorItemViewData
    private var onSelect: ((AuthorItemViewData) -> Void)?

    init(_ author: AuthorItemViewData, onSelect: ((AuthorItemViewData) -> Void)? = nil) {
        self.author = author
        self.onSelect = onSelect
    }

    var body: some View {
        Button {
            Vibration.selection.vibrate()
            onSelect?(author)
        } label: {
            VStack(spacing: LayoutSize.zeroSpacing) {
                HStack(spacing: LayoutSize.mediumSpacing) {
                    nameText

                    Spacer()

                    HStack(spacing: LayoutSize.mediumSpacing) {
                        numberOfQuoteText
                        arrowRightImage
                    }
                }.padding(.all, LayoutSize.mediumPadding)
                    .background(themeManager.activeTheme.rowCommonColor)
            }.cornerRadius(LayoutSize.mediumRadius)
        }
    }
}

private extension AuthorItemView {
    var nameText: some View {
        return Text(author.name)
            .font(AppFont.regular16)
            .foregroundStyle(themeManager.activeTheme.textPrimaryColor)
            .lineLimit(1)
    }

    var numberOfQuoteText: some View {
        return Text("\(author.numberOfQuote)")
            .font(AppFont.regular16)
            .foregroundStyle(themeManager.activeTheme.textSecondaryColor)
            .lineLimit(1)
    }

    var arrowRightImage: some View {
        return Image.image("ic_cm_arrow_right")
            .applyTheme()
    }
}
