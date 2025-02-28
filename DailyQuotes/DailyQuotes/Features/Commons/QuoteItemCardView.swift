//
//  QuoteItemCardView.swift
//  DailyQuotes
//
//  Created by dtrognn on 28/2/25.
//

import DQCommon
import SwiftUI

struct QuoteItemCardView: View {
    @EnvironmentObject private var themeManager: ThemeManager
    private var quote: QuoteItemViewData

    init(_ quote: QuoteItemViewData) {
        self.quote = quote
    }

    var body: some View {
        GeometryReader { proxy in
            VStack(spacing: LayoutSize.zeroSpacing) {
                VStack(spacing: LayoutSize.largeSpacing) {
                    quoteText

                    HStack(spacing: LayoutSize.zeroSpacing) {
                        Spacer()
                        authorText
                    }
                }.padding(.all, LayoutSize.largeSpacing)
            }.frame(width: proxy.size.width, height: proxy.size.width / (16 / 9))
                .background(quote.linearGradient)
                .cornerRadius(30)
                .shadow(radius: 5)
        }
    }
}

private extension QuoteItemCardView {
    var quoteText: some View {
        return Text("\"\(quote.quote)\"")
            .font(AppFont.semibold18)
            .foregroundStyle(themeManager.activeTheme.textHightlightColor)
            .multilineTextAlignment(.center)
    }

    var authorText: some View {
        return Text(String(format: "- %@ -", quote.author))
            .font(AppFont.regular16)
            .foregroundStyle(themeManager.activeTheme.textHightlightColor)
    }
}
