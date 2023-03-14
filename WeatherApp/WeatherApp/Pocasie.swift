//
//  Pocasie.swift
//  WeatherApp
//
//  Created by Dávid Mikuláš on 06/03/2023.
//

import Foundation

struct Weather: Decodable{
    var name: String
    var main: Main
    
    struct Main: Decodable {
        var temp: Double
        var feels_like: Double
        var temp_min: Double
        var temp_max: Double
        var pressure: Double
        var humidity: Double
        
        enum keys: String, CodingKey {
            case feelsLike = "feels_like"
            case tempMin = "temp_min"
            case tempMax = "temp_max"
            case temp
            case pressure
            case humidity
        }
    }
}

extension Weather {
    var temp: Double {
        return main.temp
    }
    
    var pocit: Double {
        return main.feels_like
    }
    
    var maxTeplota: Double {
        return main.temp_max
    }
    
    var minTeplota: Double {
        return main.temp_min
    }
    
    var tlak: Double {
        return main.pressure
    }
    
    var vlhkost: Double {
        return main.humidity
    }
}
