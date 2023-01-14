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

extension Location {

    init?(dict: [String: Any]) {
        guard let latitude = dict["latitude"] as? Double,
              let longitude = dict["longitude"] as? Double else {
            return nil
        }

        self.latitude = latitude
        self.longitude = longitude
    }
}
