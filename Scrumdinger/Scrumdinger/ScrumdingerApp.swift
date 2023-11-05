//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Justus Saringer on 04.11.23.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: DailyScrum.sampleData)
        }
    }
}
