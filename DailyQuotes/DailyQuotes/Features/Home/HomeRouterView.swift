//
//  HomeRouterView.swift
//  DailyQuotes
//
//  Created by dtrognn on 27/2/25.
//

import SwiftUI

enum HomeDestination: Route {}

struct HomeRouterView: View {
    @StateObject private var router = Router()

    var body: some View {
        NavigationStack(path: $router.navigationPath) {
            HomeView()
                .environmentObject(router)
        }.navigationDestination(for: HomeDestination.self) { _ in
            //
        }
    }
}
