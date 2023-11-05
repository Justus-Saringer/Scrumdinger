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
    var attendees: [String]
    var lengthInMinutes: Int
    var theme: Theme
    
    init(id: UUID = UUID(), title: String, attendees: [String], lengthInMinutes: Int, theme: Theme) {
        self.id = id
        self.title = title
        self.attendees = attendees
        self.lengthInMinutes = lengthInMinutes
        self.theme = theme
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
