//
//  FineDust.swift
//  FineDust
//
//  Created by lee on 2021/01/27.
//

import Foundation

// MARK: - FineDust
struct FineDust: Codable {
    let weather: Weather
    let common: Common
    let result: Result
}

// MARK: - Common
struct Common: Codable {
    let alertYn, stormYn: String
}

// MARK: - Result
struct Result: Codable {
    let code: Int
    let requestURL, message: String

    enum CodingKeys: String, CodingKey {
        case code
        case requestURL = "requestUrl"
        case message
    }
}

// MARK: - Weather
struct Weather: Codable {
    let dust: [Dust]
}

// MARK: - Dust
struct Dust: Codable {
    let station: Station
    let timeObservation: String
    let pm10: Pm10
}

// MARK: - Pm10
struct Pm10: Codable {
    let grade, value: String
}

// MARK: - Station
struct Station: Codable {
    let latitude, longitude, name, id: String
}
