//
//  ThemePicker.swift
//  Scrumdinger
//
//  Created by Justus Saringer on 05.11.23.
//

import Foundation
import SwiftUI

struct ThemePicker: View {
    @Binding var selection: Theme
    
    var body: some View {
        
        Picker("Theme", selection: $selection) {
            ForEach(Theme.allCases) { theme in
                ThemeView(theme: theme)
                    .tag(theme)
            }
        }
        .pickerStyle(.navigationLink)
        
    }
}

#Preview {
    ThemePicker(selection: .constant(.periwinkle))
}
