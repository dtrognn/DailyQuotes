//
//  LanguageItemData.swift
//  DailyQuotes
//
//  Created by dtrognn on 1/3/25.
//

import DQCommon
import SwiftUI

struct LanguageItemData: Identifiable {
    var id: String = UUID().uuidString
    var leftImage: Image?
    var title: String = ""
    var value: LanguageCode = .system
    var isSelected: Bool = false
    var onSelect: (LanguageCode) -> Void
}
