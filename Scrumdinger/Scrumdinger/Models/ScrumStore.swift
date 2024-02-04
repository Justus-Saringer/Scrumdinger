//
//  ScrumStore.swift
//  Scrumdinger
//
//  Created by Justus Saringer on 04.02.24.
//
import SwiftUI

@MainActor
class ScrumStore: ObservableObject {
    @Published var scrums: [DailyScrum] = []
    
    func load() async throws {
        let task = Task<[DailyScrum], Error> {
            let fileUrl = try Self.fileURL()
            
            guard let data = try? Data(contentsOf: fileUrl) else { return [] }
            let dailyScrums = try JSONDecoder().decode([DailyScrum].self, from: data)
            return dailyScrums
        }
        
        let loadedScrums = try await task.value
        self.scrums = loadedScrums
    }
    
    func save(scrums: [DailyScrum]) async throws {
        let task = Task {
            let data = try JSONEncoder().encode(scrums)
            let outfile = try Self.fileURL()
            try data.write(to: outfile)
        }
        _ = try await task.value
    }
    
    private static func fileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory,
                                    in: .userDomainMask,
                                    appropriateFor: nil,
                                    create: false)
        .appendingPathComponent("scrums.data")
    }
}
