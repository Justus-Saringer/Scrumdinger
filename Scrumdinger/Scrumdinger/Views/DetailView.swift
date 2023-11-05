//
//  DetailView.swift
//  Scrumdinger
//
//  Created by Justus Saringer on 05.11.23.
//

import Foundation
import SwiftUI

struct DetailView: View {
    let scrum: DailyScrum
    
    var body: some View {
        List {
            Section(header: Text("Meeting Info")){
                Label("Start Meeting", systemImage: "timer")
                    .font(.headline)
                    .foregroundColor(.accentColor)
            }
            
            HStack {
                Label("Length", systemImage: "clock")
                Spacer()
                Text("\(scrum.lengthInMinutes) min")
            }
            .accessibilityElement(children: .combine)
            
            HStack {
                Label("Theme", systemImage: "paintpalette")
                Spacer()
                Text(scrum.theme.rawValue)
                    .padding(4)
                    .foregroundColor(scrum.theme.accentColor)
                    .background(scrum.theme.mainColor)
                    .cornerRadius(4.0)
            }
            .accessibilityElement(children: .combine)
            
        }
    }
}

#Preview {
    NavigationStack {
        DetailView(scrum: DailyScrum.sampleData[0])
    }
}
