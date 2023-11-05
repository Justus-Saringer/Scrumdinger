//
//  CardView.swift
//  Scrumdinger
//
//  Created by Justus Saringer on 05.11.23.
//

import Foundation
import SwiftUI

struct CardView: View {
    
    let scrum: DailyScrum
    
    var body: some View {
        
        VStack (alignment: .leading) {
            
            Text(scrum.title).font(.headline)
            
            Spacer()
            
            HStack {
                Label("\(scrum.attendees.count)", systemImage: "person.3")
                
                Spacer()
                
                Label("\(scrum.lengthInMinutes) min", systemImage: "clock")
                    .labelStyle(.trailingIcon)
            }.font(.caption)
            
        }
        .padding()
        .foregroundColor(scrum.theme.accentColor)
        
    }
    
}

#Preview(traits: .fixedLayout(width: 400, height: 60)) {
    let scrum = DailyScrum.sampleData[0]
    let cardView = CardView(scrum: scrum)
        .background(scrum.theme.mainColor)
    
    return cardView
}
