//
//  DailyScrum.swift
//  Scrumdinger
//
//  Created by Justus Saringer on 05.11.23.
//

import Foundation

struct DailyScrum {
    var title: String
    var attendees: [String]
    var lengthInMinutes: Int
    var theme: Theme
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
