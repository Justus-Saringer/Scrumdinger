//
//  DetailView.swift
//  Scrumdinger
//
//  Created by Justus Saringer on 05.11.23.
//

import Foundation
import SwiftUI

struct DetailView: View {
    @Binding var scrum: DailyScrum
    @State private var editingScrum = DailyScrum.emptyScrum
    @State private var isEditViewVisible = false
    
    var body: some View {
        List {
            Section(header: Text("Meeting Info")) {
                
                NavigationLink(destination: MeetingView(scrum: $scrum)) {
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
            
            Section(header: Text("Attendees")) {
                ForEach(scrum.attendees) { attendee in
                    Label(attendee.name, systemImage: "person")
                }
            }
            
            Section(header: Text("History")) {
                if scrum.history.isEmpty {
                    Label("No meetings yet", systemImage: "calendar.badge.exclamationmark")
                }
                ForEach(scrum.history) { history in
                    NavigationLink(destination: HistoryView(history: history)) {
                        HStack {
                            Image(systemName: "calendar")
                            Text(history.date, style: .date)
                        }
                    }
                }
            }
            
        }
        .navigationTitle(scrum.title)
        .toolbar {
            Button("Edit") {
                isEditViewVisible = true
                editingScrum = scrum
            }
        }
        .sheet(isPresented: $isEditViewVisible) {
            NavigationStack {
                DetailEditView(scrum: $editingScrum)
                    .navigationTitle(scrum.title)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Cancel") {
                                isEditViewVisible = false
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Done") {
                                scrum = editingScrum
                                isEditViewVisible = false
                            }
                        }
                    }
            }
        }
        
    }
}

#Preview {
    NavigationStack {
        DetailView(scrum: .constant(DailyScrum.sampleData[0]))
    }
}
