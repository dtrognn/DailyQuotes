//
//  MenuConfiguration.swift
//  DQCommon
//
//  Created by dtrognn on 1/3/25.
//

import SwiftUI

public struct MenuConfiguration {
    public var menuItemList: [MenuItemConfiguration]
    public var onSelect: (MenuItemConfiguration) -> Void

    public init(menuItemList: [MenuItemConfiguration], onSelect: @escaping (MenuItemConfiguration) -> Void) {
        self.menuItemList = menuItemList
        self.onSelect = onSelect
    }
}

public struct MenuItemConfiguration: Identifiable {
    public var id: String
    public var title: String
    public var leadingImage: Image?
    public var trailingImage: Image?
    public var isUseTheme: Bool
    public var data: Any?

    public init(
        id: String = UUID().uuidString,
        title: String,
        leadingImage: Image? = nil,
        trailingImage: Image? = nil,
        isUseTheme: Bool = true,
        data: Any? = nil)
    {
        self.id = id
        self.title = title
        self.leadingImage = leadingImage
        self.trailingImage = trailingImage
        self.isUseTheme = isUseTheme
        self.data = data
    }
}
