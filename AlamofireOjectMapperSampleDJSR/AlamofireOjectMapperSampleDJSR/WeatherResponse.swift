//
//  WeatherResponse.swift
//  AlamofireOjectMapperSampleDJSR
//
//  Created by Fourtime on 24/04/2018.
//  Copyright © 2018 Fourtime. All rights reserved.
//

import Foundation
import ObjectMapper

class WeatherResponse: Mappable {
    var location: String?
    var threeDayForecast: [Forecast]?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        location <- map["location"]
        threeDayForecast <- map["three_day_forecast"]
    }
}

class Forecast: Mappable {
    var day: String?
    var temperature: Int?
    var conditions: String?
    
    required init?(map: Map) {
        day <- map["day"]
        temperature <- map["temperature"]
        conditions <-  map["conditions"]
    }
    
    func mapping(map: Map) {
    }
}
