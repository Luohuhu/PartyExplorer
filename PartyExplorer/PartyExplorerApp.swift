//
//  PartyExplorerApp.swift
//  PartyExplorer
//
//  Created by 罗贤甫 on 6/13/23.
//

import SwiftUI

@main
struct PartyExplorerApp: App {
    var body: some Scene {
        WindowGroup {
            ExploreView(viewModel: .init())
        }
    }
}
