//
//  MeetingTimerView.swift
//  Scrumdinger
//
//  Created by Justus Saringer on 05.02.24.
//

import SwiftUI

struct MeetingTimerView : View {
    let speaker: [ScrumTimer.Speaker]
    let theme: Theme
    
    private var currentSpeaker: String {
        speaker.first(where: {$0.isCompleted == false})?.name ?? "someone"
    }
    
    var body: some View {
        Circle()
            .strokeBorder(lineWidth: 24)
            .overlay {
                VStack {
                    Text(currentSpeaker)
                        .font(.title)
                    Text("is speaking")
                }
                .accessibilityElement(children: .combine)
                .foregroundColor(theme.mainColor)
            }
    }
}

#Preview {
    MeetingTimerView(
        speaker: [ScrumTimer.Speaker(name: "Bill", isCompleted: true), ScrumTimer.Speaker(name: "Cathy", isCompleted: false)],
        theme: .bubblegum)
}
