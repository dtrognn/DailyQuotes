//
//  StraightLineView.swift
//  DQCommon
//
//  Created by dtrognn on 27/2/25.
//

import SwiftUI

public struct StraightLineView: View {
    public init() {}

    public var body: some View {
        Divider().frame(height: 1)
            .overlay(ThemeManager.shared.activeTheme.textSecondaryColor.opacity(0.5))
    }
}
