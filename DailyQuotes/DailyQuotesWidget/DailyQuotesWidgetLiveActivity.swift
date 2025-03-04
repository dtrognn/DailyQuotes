//
//  DailyQuotesWidgetLiveActivity.swift
//  DailyQuotesWidget
//
//  Created by dtrognn on 4/3/25.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct DailyQuotesWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct DailyQuotesWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: DailyQuotesWidgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension DailyQuotesWidgetAttributes {
    fileprivate static var preview: DailyQuotesWidgetAttributes {
        DailyQuotesWidgetAttributes(name: "World")
    }
}

extension DailyQuotesWidgetAttributes.ContentState {
    fileprivate static var smiley: DailyQuotesWidgetAttributes.ContentState {
        DailyQuotesWidgetAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: DailyQuotesWidgetAttributes.ContentState {
         DailyQuotesWidgetAttributes.ContentState(emoji: "🤩")
     }
}

//#Preview("Notification", as: .content, using: DailyQuotesWidgetAttributes.preview) {
//   DailyQuotesWidgetLiveActivity()
//} contentStates: {
//    DailyQuotesWidgetAttributes.ContentState.smiley
//    DailyQuotesWidgetAttributes.ContentState.starEyes
//}
