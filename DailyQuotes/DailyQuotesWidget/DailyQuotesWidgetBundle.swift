//
//  DailyQuotesWidgetBundle.swift
//  DailyQuotesWidget
//
//  Created by dtrognn on 4/3/25.
//

import WidgetKit
import SwiftUI

@main
struct DailyQuotesWidgetBundle: WidgetBundle {
    var body: some Widget {
        DailyQuotesWidget()
        DailyQuotesWidgetLiveActivity()
    }
}
