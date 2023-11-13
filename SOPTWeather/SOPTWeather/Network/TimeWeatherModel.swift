//
//  TodayWeatherModel.swift
//  SOPTWeather
//
//  Created by 지희의 MAC on 2023/10/26.
//

import UIKit

// MARK: WeatherDateModel - 도시별 상세 날씨 정보

struct WeatherDateModel {
    var cityName: String
    var subTitle: String = ""
    var weatherText: String
    var maxminTemp: String
    var weatherinfomation: [TimeWeatherModel]
}


struct TimeWeatherModel {
    var time: String
    var weatherIconImage: UIImage
    var tempText: String
}

struct DayWeatherModel {
    var day: String
    var weatherIconImage: UIImage
    var precipitation: String?
    var minTempText: String
    var maxTempText: String
    var gradientImage: UIImage
}
