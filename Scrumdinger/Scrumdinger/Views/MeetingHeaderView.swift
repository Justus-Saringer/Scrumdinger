//
//  MeetingHeaderView.swift
//  Scrumdinger
//
//  Created by Justus Saringer on 03.12.23.
//

import Foundation
import SwiftUI

struct MeetingHeaderView: View {
    let secondsElapsed: Int
    let secondsRemaining: Int
    let theme: Theme
    
    var body: some View {
        VStack {
            ProgressView(value: progress)
                .progressViewStyle(ScrumProgressViewStyle(theme: theme))
            
            HStack {
                VStack (alignment: .leading) {
                    Text("Seconds Elapsed").font(.caption)
                    Label(String(secondsElapsed), systemImage: "hourglass.tophalf.fill")
                }
                
                Spacer()
                
                VStack (alignment: .trailing) {
                    Text("Seconds Remaining").font(.caption)
                    Label(String(secondsRemaining), systemImage: "hourglass.bottomhalf.fill")
                }
                .labelStyle(.trailingIcon)
            }
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("Time Remaining")
        .accessibilityValue("\(minutesRemaining) minutes")
        .padding([.top, .horizontal])
    }
    
    private var totalSeconds: Int {
        secondsElapsed + secondsRemaining
    }
    
    private var progress: Double {
        guard totalSeconds > 0 else { return 1 }
        return Double(secondsElapsed) / Double(secondsRemaining)
    }
    
    private var minutesRemaining: Int {
        secondsRemaining / 60
    }
}

#Preview {
    MeetingHeaderView(secondsElapsed: 60, secondsRemaining: 180, theme: .magenta)
        .previewLayout(.sizeThatFits)
        .padding()
}
