//
//  ToggleRowCommonView.swift
//  DailyQuotes
//
//  Created by dtrognn on 1/3/25.
//

import DQCommon
import SwiftUI

struct ToggleRowCommonView: View {
    @EnvironmentObject private var themeManager: ThemeManager
    @Binding private var isOn: Bool
    private var title: String
    private var image: String
    private var onToggle: ((Bool) -> Void)?

    init(isOn: Binding<Bool>, title: String, image: String, onToggle: ((Bool) -> Void)? = nil) {
        self._isOn = isOn
        self.title = title
        self.image = image
        self.onToggle = onToggle
    }

    var body: some View {
        VStack(spacing: LayoutSize.zeroSpacing) {
            HStack(spacing: LayoutSize.mediumSpacing) {
                HStack(spacing: LayoutSize.largeSpacing) {
                    leadingImage
                    titleText
                }
                Spacer()
                toggleView
            }.padding(.all, LayoutSize.mediumPadding)
        }.onChange(of: isOn) { newValue in
            onToggle?(newValue)
        }
    }
}

private extension ToggleRowCommonView {
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

    var toggleView: some View {
        return Toggle("", isOn: $isOn).tint(themeManager.activeTheme.accentColor)
    }
}
