//
//  DailyScrum.swift
//  Scrumdinger
//
//  Created by Justus Saringer on 05.11.23.
//

import Foundation

struct DailyScrum: Identifiable {
    var id: UUID
    var title: String
    var attendees: [Attendee]
    var lengthInMinutes: Int
    var theme: Theme
    
    init(id: UUID = UUID(), title: String, attendees: [String], lengthInMinutes: Int, theme: Theme) {
        self.id = id
        self.title = title
        self.attendees = attendees.map{Attendee(name: $0)}
        self.lengthInMinutes = lengthInMinutes
        self.theme = theme
    }
}

extension DailyScrum {
    struct Attendee: Identifiable {
        let id: UUID
        var name: String
        
        init(id: UUID = UUID(), name: String) {
            self.id = id
            self.name = name
        }
    }
}

extension DailyScrum {
    static let sampleData: [DailyScrum] =
    [
        DailyScrum(title: "Product Managers",
                   attendees: ["Laura", "Anna", "Svenja", "Aline"],
                   lengthInMinutes: 10,
                   theme: .yellow),
        DailyScrum(title: "App Dev",
                   attendees: ["Justus", "Julius", "Arthur", "Sergej", "Jannis"],
                   lengthInMinutes: 5,
                   theme: .orange),
        DailyScrum(title: "Web Dev",
                   attendees: ["Norman", "Gerrit", "Justus", "Magda", "Stefan", "Georg", "Till", "Markus", "Frank", "Rasmus"],
                   lengthInMinutes: 5,
                   theme: .poppy)
    ]
}
