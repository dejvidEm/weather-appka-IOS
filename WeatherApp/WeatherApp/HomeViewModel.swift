//
//  HomeViewModel.swift
//  WeatherApp
//
//  Created by Dávid Mikuláš on 13/03/2023.
//

import Foundation

class HomeViewModel {
    var weather: Weather?
    
    var temperatureS: String {
        return String(format: "%.1f", (weather?.temp ?? 0).kelvinToCelsius) + "º"
    }
    
    var nameS: String {
        return String(weather?.name ?? "")
    }
    
    /*
     
     pocitLabel.text = viewModel.pocitS
     maxLabel.text = viewModel.maxS
     minLabel.text = viewModel.minS
     tlakLabel.text = viewModel.tlakS
     
     */
    
    var pocitS: String {
        return String(format: "%.1f", (weather?.pocit ?? 0).kelvinToCelsius) + "º"
    }
    var maxS: String {
        return String(format: "%.1f", (weather?.maxTeplota ?? 0).kelvinToCelsius) + "º"
    }
    var minS: String {
        return String(format: "%.1f", (weather?.minTeplota ?? 0).kelvinToCelsius) + "º"
    }
    var tlakS: String {
        return String(format: "%.1f", weather?.tlak ?? 0) + " hPa"
    }
    var vlhkostS: String {
        return String(format: "%.1f", weather?.vlhkost ?? 0) + " %"
    }
    
    func fetchWeather(for cityId: Int = 3060972, _ completion: @escaping (() -> Void)) {
        Controller.fetchWeather(for: cityId){ weather in
            self.weather = weather
            completion()
        }
    }
}
