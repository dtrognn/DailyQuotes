//
//  MenuView.swift
//  DQCommon
//
//  Created by dtrognn on 1/3/25.
//

import SwiftUI

public struct MenuView<Content: View>: View {
    @EnvironmentObject private var themeManager: ThemeManager
    private var configuration: MenuConfiguration
    private var content: () -> Content

    public init(_ configuration: MenuConfiguration, content: @escaping () -> Content) {
        self.configuration = configuration
        self.content = content
    }

    public var body: some View {
        Menu {
            ForEach(configuration.menuItemList) { menuItem in
                Button {
                    Vibration.selection.vibrate()
                    configuration.onSelect(menuItem)
                } label: {
                    HStack(spacing: LayoutSize.largeSpacing) {
                        HStack(spacing: LayoutSize.mediumSpacing) {
                            if let leadingImage = menuItem.leadingImage {
                                leadingImage
                            }

                            Text(menuItem.title)
                                .font(AppFont.regular12)
                                .foregroundStyle(themeManager.activeTheme.textPrimaryColor)
                        }

                        if let trailingImage = menuItem.trailingImage {
                            if menuItem.isUseTheme {
                                trailingImage.applyTheme()
                            } else {
                                trailingImage
                            }
                        }
                    }
                }
            }
        } label: {
            content()
        }
    }
}
