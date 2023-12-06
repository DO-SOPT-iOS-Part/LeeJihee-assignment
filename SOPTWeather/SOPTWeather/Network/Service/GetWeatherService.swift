//
//  GetWeatherService.swift
//  SOPTWeather
//
//  Created by 지희의 MAC on 2023/11/14.
//

import Foundation

class GetWeatherService {
    static let shared = GetWeatherService()
        private init() {}
        
    func makeRequest(location: String) -> URLRequest {
        let url = URL(string:"\(Config.baseURL)?q=\(location)&units=metric&lang=kr&appid=\(Config.apiKey)")!
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            let header = ["Content-Type": "application/json"]
            header.forEach {
                request.addValue($0.value, forHTTPHeaderField: $0.key)
            }
            return request
        }
        
    func GetWeatherInfo(location: String) async throws -> WeatherDTO? {
            do {
                let request = self.makeRequest(location: location)
                let (data, response) = try await URLSession.shared.data(for: request)
                dump(request)
                guard response is HTTPURLResponse else {
                    throw NetworkError.responseError
                }
                dump(response)
                return parseUserInfoData(data: data)
            } catch {
                throw error
            }
            
        }
        
        
        private func parseUserInfoData(data: Data) -> WeatherDTO? {
            do {
                let jsonDecoder = JSONDecoder()
                let result = try jsonDecoder.decode(WeatherDTO.self, from: data)
                return result
            } catch {
                print(error)
                return nil
            }
        }
        
        private func configureHTTPError(errorCode: Int) -> Error {
            return NetworkError(rawValue: errorCode)
            ?? NetworkError.unknownError
        }
}
