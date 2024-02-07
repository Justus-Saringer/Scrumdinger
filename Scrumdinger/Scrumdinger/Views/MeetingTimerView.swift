//
//  MeetingTimerView.swift
//  Scrumdinger
//
//  Created by Justus Saringer on 05.02.24.
//

import SwiftUI

struct MeetingTimerView : View {
    let speakers: [ScrumTimer.Speaker]
    let theme: Theme
    
    private var currentSpeaker: String {
        speakers.first(where: {$0.isCompleted == false})?.name ?? "someone"
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
            .overlay {
                ForEach(speakers) { speaker in
                    if speaker.isCompleted, let index = speakers.firstIndex(where:  { $0.id == speaker.id }) {
                        SpeakerArc(speakerIndex: index, totalSpeakers: speakers.count)
                            .rotation(Angle(degrees: -90))
                    }
                }
            }
            .padding(.horizontal)
    }
}

#Preview {
    MeetingTimerView(
        speakers: [ScrumTimer.Speaker(name: "Bill", isCompleted: true), ScrumTimer.Speaker(name: "Cathy", isCompleted: false)],
        theme: .bubblegum)
}
