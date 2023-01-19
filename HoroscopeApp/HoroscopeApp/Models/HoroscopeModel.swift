//
//  HoroscopeModel.swift
//  HoroscopeApp
//
//  Created by will astilla on 1/18/23.
//

import Foundation

struct HoroscopeModel: Codable {
    let dateRange, currentDate, description, compatibility: String
    let mood, color, luckyNumber, luckyTime: String

    enum CodingKeys: String, CodingKey {
        case dateRange = "date_range"
        case currentDate = "current_date"
        case description, compatibility, mood, color
        case luckyNumber = "lucky_number"
        case luckyTime = "lucky_time"
    }
}

extension HoroscopeModel{
    static var example: HoroscopeModel{
        HoroscopeModel(dateRange: "test", currentDate: "tes", description: "test", compatibility: "test", mood: "test", color: "test", luckyNumber: "test", luckyTime: "test")
    }
}
