//
//  Controller.swift
//  WeatherApp
//
//  Created by Dávid Mikuláš on 06/03/2023.
//

import Foundation

struct Controller {
    private static var baseUrl = "api.openweathermap.org"
    private static let apiKey = "64cded6142aeb8562e6928443369c54f"
    
    /*
    func chechImage(){
        if(weather.temp > 20){
            fotkaPocasie.image = UIImage(named: "sun")
        }
        else {
            fotkaPocasie.image = UIImage(named: "sun")
        }
    }
    
    */

    
    enum Endpoint {
        case cityId(path: String = "/data/2.5/weather", id: Int)
        
        var url: URL? {
            var components = URLComponents()
            components.scheme = "https"
            components.host = baseUrl
            components.path = path
            components.queryItems = queryItems
            
            return components.url
        }
        
        private var path: String {
            switch self {
            case .cityId(let path, _):
                return path
            }
        }
        
        var queryItems: [URLQueryItem] {
            
            var queryItems = [URLQueryItem]()
            
            switch self {
            case .cityId(_, let id):
                queryItems.append(URLQueryItem(name: "id", value: String(id)))
            }
            queryItems.append((URLQueryItem(name: "appid", value: apiKey)))
            
            return queryItems
        }
    }
    
    static func fetchWeather(for cityId: Int, _ completion: @escaping ((Weather) -> Void)) {
        
        
        if let url = Endpoint.cityId(id: cityId).url {
            URLSession.shared.dataTask(with: url) {(data, response, error) in
                if let error = error {
                    print("Error", error)
                }
                if let data = data {
                    do {
                        let weather = try JSONDecoder().decode(Weather.self, from: data)
                        completion(weather)
                    } catch let error {
                        print(error)
                    }
                }
            }.resume()
        }
    }
}
