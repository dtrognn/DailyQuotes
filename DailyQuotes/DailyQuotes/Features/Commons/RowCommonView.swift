//
//  RowCommonView.swift
//  DailyQuotes
//
//  Created by dtrognn on 1/3/25.
//

import DQCommon
import SwiftUI

struct RowCommonView: View {
    @EnvironmentObject private var themeManager: ThemeManager
    private var title: String
    private var image: String
    private var showUnderline: Bool
    private var onSelect: (() -> Void)?

    init(title: String, image: String, showUnderline: Bool, onSelect: (() -> Void)? = nil) {
        self.title = title
        self.image = image
        self.showUnderline = showUnderline
        self.onSelect = onSelect
    }

    var body: some View {
        Button {
            Vibration.selection.vibrate()
            onSelect?()
        } label: {
            VStack(spacing: LayoutSize.zeroSpacing) {
                HStack(spacing: LayoutSize.mediumSpacing) {
                    HStack(spacing: LayoutSize.largeSpacing) {
                        leadingImage
                        titleText
                    }
                    Spacer()
                    arrowRightImage
                }.padding(.all, LayoutSize.mediumPadding)

                if showUnderline {
                    StraightLineView()
                }
            }
        }
    }
}

private extension RowCommonView {
    var leadingImage: some View {
        return Image.image(image)
            .applyTheme()
    }

    var titleText: some View {
        return Text(title)
            .font(AppFont.medium16)
            .foregroundStyle(themeManager.activeTheme.textPrimaryColor)
            .lineLimit(1)
    }

    var arrowRightImage: some View {
        return Image.image("ic_cm_arrow_right")
            .applyTheme()
    }
}
