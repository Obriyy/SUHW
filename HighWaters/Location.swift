//
//  Location.swift
//  HighWaters
//
//  Created by Artem Kosheliev on 14.01.2023.
//

import Foundation

struct Location {
    var latitude: Double
    var longitude: Double

    func toDictionary() -> [String: Any] {
        return ["latitude": latitude, "longitude": longitude]
    }
}
