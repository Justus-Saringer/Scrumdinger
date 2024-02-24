//
//  HistoryView.swift
//  Scrumdinger
//
//  Created by Justus Saringer on 24.02.24.
//

import SwiftUI

struct HistoryView: View {
    let history: History
    
    var body: some View {
        
        ScrollView {
            VStack(alignment: .leading) {
                Divider()
                    .padding(.bottom)
                Text("Attendees")
                    .font(.headline)
                
                Text(history.attendeeString)
                
                if let transcript = history.transcript {
                    Text(transcript)
                        .font(.headline)
                        .padding(.top)
                }
            }
        }
        .navigationTitle(Text(history.date, style: .date))
        .padding()
        
    }
}

private extension History {
    var attendeeString: String {
        ListFormatter.localizedString(byJoining: self.attendees.map( { $0.name }))
    }
}

#Preview {
    HistoryView(
        history:
                    History(
                        attendees: [
                            DailyScrum.Attendee(name: "Arthur"),
                            DailyScrum.Attendee(name: "Nikita"),
                            DailyScrum.Attendee(name: "Finn"),
                            DailyScrum.Attendee(name: "Eva-Christiane"),
                        ],
                        transcript: "Arthur, Nikita, what is the current status? Are there any news?"
                    )
    )
}
