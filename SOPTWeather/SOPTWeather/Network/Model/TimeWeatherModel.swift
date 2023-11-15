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

var cityWeatherList: [WeatherDateModel] = [
    WeatherDateModel(cityName: "나의 위치",
                     subTitle: "의정부시",
                     weatherText: "흐림",
                     maxminTemp: "최고:29° 최저:15°",
                     weatherinfomation: [TimeWeatherModel(time: "Now", weatherIconImage: ImageLiterals.cloudMoonIcon, tempText: "21°"),
                                         TimeWeatherModel(time: "10시", weatherIconImage: ImageLiterals.drizzleRainIcon, tempText: "21°"),
                                         TimeWeatherModel(time: "11시", weatherIconImage: ImageLiterals.heavyRainIcon, tempText: "19°"),
                                         TimeWeatherModel(time: "12시", weatherIconImage: ImageLiterals.cloudBoltIcon, tempText: "19°"),
                                         TimeWeatherModel(time: "13시", weatherIconImage: ImageLiterals.cloudSunRainIcon, tempText: "19°"),
                                         TimeWeatherModel(time: "14시", weatherIconImage: ImageLiterals.heavyRainIcon, tempText: "24°"),
                                         TimeWeatherModel(time: "15시", weatherIconImage: ImageLiterals.heavyRainIcon, tempText: "26°"),
                                         TimeWeatherModel(time: "16시", weatherIconImage: ImageLiterals.heavyRainIcon, tempText: "28°"),
                                         TimeWeatherModel(time: "17시", weatherIconImage: ImageLiterals.cloudSunRainIcon, tempText: "29°")]),
    WeatherDateModel(cityName: "노원시",
                     weatherText: "흐림",
                     maxminTemp: "최고:29° 최저:15°",
                     weatherinfomation: [TimeWeatherModel(time: "Now", weatherIconImage: ImageLiterals.cloudMoonIcon, tempText: "23°"),
                                         TimeWeatherModel(time: "10시", weatherIconImage: ImageLiterals.drizzleRainIcon, tempText: "21°"),
                                         TimeWeatherModel(time: "11시", weatherIconImage: ImageLiterals.heavyRainIcon, tempText: "19°"),
                                         TimeWeatherModel(time: "12시", weatherIconImage: ImageLiterals.cloudBoltIcon, tempText: "19°"),
                                         TimeWeatherModel(time: "13시", weatherIconImage: ImageLiterals.cloudSunRainIcon, tempText: "19°"),
                                         TimeWeatherModel(time: "14시", weatherIconImage: ImageLiterals.heavyRainIcon, tempText: "24°"),
                                         TimeWeatherModel(time: "15시", weatherIconImage: ImageLiterals.heavyRainIcon, tempText: "26°"),
                                         TimeWeatherModel(time: "16시", weatherIconImage: ImageLiterals.heavyRainIcon, tempText: "28°"),
                                         TimeWeatherModel(time: "17시", weatherIconImage: ImageLiterals.cloudSunRainIcon, tempText: "29°")]),
    WeatherDateModel(cityName: "화양시",
                     weatherText: "흐림",
                     maxminTemp: "최고:26° 최저:15°",
                     weatherinfomation: [TimeWeatherModel(time: "Now", weatherIconImage: ImageLiterals.cloudMoonIcon, tempText: "19°"),
                                         TimeWeatherModel(time: "10시", weatherIconImage: ImageLiterals.drizzleRainIcon, tempText: "21°"),
                                         TimeWeatherModel(time: "11시", weatherIconImage: ImageLiterals.heavyRainIcon, tempText: "19°"),
                                         TimeWeatherModel(time: "12시", weatherIconImage: ImageLiterals.cloudBoltIcon, tempText: "19°"),
                                         TimeWeatherModel(time: "13시", weatherIconImage: ImageLiterals.cloudSunRainIcon, tempText: "19°"),
                                         TimeWeatherModel(time: "14시", weatherIconImage: ImageLiterals.heavyRainIcon, tempText: "24°"),
                                         TimeWeatherModel(time: "15시", weatherIconImage: ImageLiterals.heavyRainIcon, tempText: "26°"),
                                         TimeWeatherModel(time: "16시", weatherIconImage: ImageLiterals.heavyRainIcon, tempText: "26°"),
                                         TimeWeatherModel(time: "17시", weatherIconImage: ImageLiterals.cloudSunRainIcon, tempText: "29°")]),
    WeatherDateModel(cityName: "고양시",
                     weatherText: "흐림",
                     maxminTemp: "최고:25° 최저:14°",
                     weatherinfomation: [TimeWeatherModel(time: "Now", weatherIconImage: ImageLiterals.cloudMoonIcon, tempText: "16°"),
                                         TimeWeatherModel(time: "10시", weatherIconImage: ImageLiterals.drizzleRainIcon, tempText: "21°"),
                                         TimeWeatherModel(time: "11시", weatherIconImage: ImageLiterals.heavyRainIcon, tempText: "19°"),
                                         TimeWeatherModel(time: "12시", weatherIconImage: ImageLiterals.cloudBoltIcon, tempText: "19°"),
                                         TimeWeatherModel(time: "13시", weatherIconImage: ImageLiterals.cloudSunRainIcon, tempText: "19°"),
                                         TimeWeatherModel(time: "14시", weatherIconImage: ImageLiterals.heavyRainIcon, tempText: "25°"),
                                         TimeWeatherModel(time: "15시", weatherIconImage: ImageLiterals.heavyRainIcon, tempText: "25°"),
                                         TimeWeatherModel(time: "16시", weatherIconImage: ImageLiterals.heavyRainIcon, tempText: "25°"),
                                         TimeWeatherModel(time: "17시", weatherIconImage: ImageLiterals.cloudSunRainIcon, tempText: "23°")])]
