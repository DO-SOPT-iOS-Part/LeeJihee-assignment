//
//  WeatherDetailViewController.swift
//  SOPTWeather
//
//  Created by 지희의 MAC on 2023/10/21.
//

import UIKit

import SnapKit

class WeatherDetailViewController: UIViewController {
    
    
    let weeklyWeatherData: [DayWeatherModel] = [DayWeatherModel(day: "오늘", weatherIconImage: ImageLiterals.sunIcon.withRenderingMode(.alwaysTemplate), minTempText: "15°", maxTempText: "29°"),
        DayWeatherModel(day: "월", weatherIconImage: ImageLiterals.sunIcon.withRenderingMode(.alwaysTemplate), minTempText: "18°", maxTempText: "27°"),
        DayWeatherModel(day: "화", weatherIconImage: ImageLiterals.sunIcon.withRenderingMode(.alwaysTemplate), minTempText: "20°", maxTempText: "25°"),
        DayWeatherModel(day: "수", weatherIconImage: ImageLiterals.sunIcon.withRenderingMode(.alwaysTemplate), minTempText: "17°", maxTempText: "25°"),
        DayWeatherModel(day: "목", weatherIconImage: ImageLiterals.sunIcon.withRenderingMode(.alwaysTemplate), minTempText: "18°", maxTempText: "27°"),
        DayWeatherModel(day: "금", weatherIconImage: ImageLiterals.sunIcon.withRenderingMode(.alwaysTemplate), minTempText: "18°", maxTempText: "27°"),
        DayWeatherModel(day: "토", weatherIconImage: ImageLiterals.sunIcon.withRenderingMode(.alwaysTemplate), minTempText: "18°", maxTempText: "27°"),
        DayWeatherModel(day: "일", weatherIconImage: ImageLiterals.sunIcon.withRenderingMode(.alwaysTemplate), minTempText: "18°", maxTempText: "27°"),
        DayWeatherModel(day: "월", weatherIconImage: ImageLiterals.sunIcon.withRenderingMode(.alwaysTemplate), minTempText: "18°", maxTempText: "27°"),
        DayWeatherModel(day: "화", weatherIconImage: ImageLiterals.sunIcon.withRenderingMode(.alwaysTemplate), minTempText: "18°", maxTempText: "27°"),
        DayWeatherModel(day: "수", weatherIconImage: ImageLiterals.sunIcon.withRenderingMode(.alwaysTemplate), minTempText: "18°", maxTempText: "27°")
    ]
    
    
    let weatherDetailView = WeatherDetailView()
    let cityWeatherDeatilView = CityWeatherDetailView()
    var weatherData = WeatherDateModel(cityName: "", weatherText: "", maxminTemp: "", weatherinfomation: [])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        addTarget()
    }
    
    func setView() {
   weatherDetailView.setInfomation(city: weatherData.cityName, temp: weatherData.weatherinfomation[0].tempText, weather: weatherData.weatherText, minmax: weatherData.maxminTemp, weatherDetail: weatherData.weatherinfomation)
        
        view.addSubview(cityWeatherDeatilView)
        
        cityWeatherDeatilView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func addTarget() {
        navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        navigationController?.interactivePopGestureRecognizer?.delegate = self
        weatherDetailView.listButton.addTarget(self, action: #selector(tapListButton), for: .touchUpInside)
    }
    
    func setDelegate() {
        cityWeatherDeatilView.collectionView.delegate = self
    }
    
    @objc func tapListButton() {
        navigationController?.popViewController(animated: true)
    }
}

extension WeatherDetailViewController : UIGestureRecognizerDelegate { }

extension WeatherDetailViewController: UICollectionViewDelegate { }


