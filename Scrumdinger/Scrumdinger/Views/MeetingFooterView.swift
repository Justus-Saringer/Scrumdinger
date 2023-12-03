//
//  MeetingFooterView.swift
//  Scrumdinger
//
//  Created by Justus Saringer on 03.12.23.
//

import Foundation
import SwiftUI

struct MeetingFooterView: View {
    let speakers: [ScrumTimer.Speaker]
    let skipAction: () -> Void
    
    var body: some View {
        // don't understand why they use it in the
        VStack {
            HStack {
                if isLastSpeaker {
                    Text("Last speaker")
                } else {
                    Text(speakerText)
                    Spacer()
                    Button(action: skipAction) {
                        Image(systemName: "forward.fill")
                    }
                }
                
            }.accessibilityLabel("Next Speaker")
            
        }.padding([.bottom, .horizontal])
        
    }
    
    private var speakerNumber: Int? {
        guard let index = speakers.firstIndex(where: {!$0.isCompleted}) else { return nil }
        return index + 1
    }
    
    private var isLastSpeaker: Bool {
        return speakers.dropLast().allSatisfy { $0.isCompleted }
    }
    
    private var speakerText: String {
        guard let currentSpeaker = speakerNumber else { return "No more speakers"}
        return "Speaker \(currentSpeaker) of \(speakers.count)"
    }
    
}

#Preview {
    MeetingFooterView(speakers: DailyScrum.sampleData[0].attendees.speakers, skipAction: {})
        .previewLayout(.sizeThatFits)
}
