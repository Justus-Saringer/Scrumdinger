//
//  DetailEditView.swift
//  Scrumdinger
//
//  Created by Justus Saringer on 05.11.23.
//

import Foundation
import SwiftUI

struct DetailEditView: View {
    @State private var scrum: DailyScrum = DailyScrum.emptyScrum
    @State private var newAttendeeName: String = ""
    
    var body: some View {
        Form {
            
            Section(header: Text("Meeting Info")) {
                TextField("Title", text: $scrum.title)
                
                HStack {
                    Slider(value: $scrum.lenghtInMintutesAsDouble, in: 5...30, step: 1) {
                        Text("Length")
                    }
                    Spacer()
                    Text("\(scrum.lengthInMinutes) min")
                }
            }
            
            Section(header: Text("Attendees")) {
                
                ForEach(scrum.attendees) { attendee in
                    Text(attendee.name)
                }.onDelete { indexSet in
                    scrum.attendees.remove(atOffsets: indexSet)
                }
                
                HStack {
                    TextField("New Attendee", text: $newAttendeeName)
                    Button(action: {
                        withAnimation {
                            let attendee = DailyScrum.Attendee(name: newAttendeeName)
                            scrum.attendees.append(attendee)
                            newAttendeeName = ""
                        }
                    }) {
                        Image(systemName: "plus.circle.fill")
                    }.disabled(newAttendeeName.isEmpty)
                }
                
            }
            
        }
    }
}

#Preview {
    DetailEditView()
}
