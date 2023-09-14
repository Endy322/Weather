// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct RequestWithCityModel: Codable {
    let coord: Coord_?
    let weather: [Weather_]?
    let base: String?
    let main: Main_?
    let visibility: Int?
    let wind: Wind_?
    let rain: Rain_?
    let clouds: Clouds_?
    let dt: Int?
    let sys: Sys_?
    let timezone, id: Int?
    let name: String?
    let cod: Int?
}

// MARK: - Clouds
struct Clouds_: Codable {
    let all: Int?
}

// MARK: - Coord
struct Coord_: Codable {
    let lon, lat: Double?
}

// MARK: - Main
struct Main_: Codable {
    let temp, feelsLike, tempMin, tempMax: Double?
    let pressure, humidity, seaLevel, grndLevel: Int?

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure, humidity
        case seaLevel = "sea_level"
        case grndLevel = "grnd_level"
    }
}

// MARK: - Rain
struct Rain_: Codable {
    let the1H: Double?

    enum CodingKeys: String, CodingKey {
        case the1H = "1h"
    }
}

// MARK: - Sys
struct Sys_: Codable {
    let type, id: Int?
    let country: String?
    let sunrise, sunset: Int?
}

// MARK: - Weather
struct Weather_: Codable {
    let id: Int?
    let main, description, icon: String?
}

// MARK: - Wind
struct Wind_: Codable {
    let speed: Double?
    let deg: Int?
    let gust: Double?
}

