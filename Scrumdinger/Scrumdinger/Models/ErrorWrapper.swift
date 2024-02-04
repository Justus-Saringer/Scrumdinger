//
//  ErrorWrapper.swift
//  Scrumdinger
//
//  Created by Justus Saringer on 04.02.24.
//

import Foundation

struct ErrorWrapper : Identifiable {
    let id: UUID
    let error: Error
    let guidance: String
    
    init(id: UUID = UUID(), error: Error, guidance: String) {
        self.id = id
        self.error = error
        self.guidance = guidance
    }
}
