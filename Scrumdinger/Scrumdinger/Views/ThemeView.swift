//
//  ThemeView.swift
//  Scrumdinger
//
//  Created by Justus Saringer on 05.11.23.
//

import SwiftUI

struct ThemeView: View {
    let theme: Theme
    
    var body: some View {
        Text(theme.rawValue)
            .padding(4)
            .frame(maxWidth: .infinity)
            .background(theme.mainColor)
            .foregroundColor(theme.accentColor)
            .cornerRadius(4.0)
            .padding()
    }
}

#Preview {
    ThemeView(theme: .bubblegum)
}
