//
//  Image+Ext.swift
//  DQCommon
//
//  Created by dtrognn on 27/2/25.
//

import SwiftUI

public extension Image {
    func applyTheme(_ theme: Color = ThemeManager.shared.activeTheme.primaryColor) -> some View {
        return self.renderingMode(.template)
            .foregroundStyle(theme)
    }
}
