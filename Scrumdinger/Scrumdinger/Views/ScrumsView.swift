//
//  ScrumsView.swift
//  Scrumdinger
//
//  Created by Justus Saringer on 05.11.23.
//

import Foundation
import SwiftUI

struct ScrumsView: View {
    let scrums: [DailyScrum]
    
    var body: some View {
        
        NavigationStack {
            
            List(scrums) { scrum in
                NavigationLink(destination: DetailView(scrum: scrum)) {
                    CardView(scrum: scrum)
                }.listRowBackground(scrum.theme.mainColor)
            }
            .navigationTitle("Daily Scrums")
            .toolbar {
                Button(action: {}) {
                    Image(systemName: "plus")
                }
                .accessibilityLabel("New Scrum")
            }
            
        }
        
    }
    
}

#Preview {
    return ScrumsView(scrums: DailyScrum.sampleData)
}
