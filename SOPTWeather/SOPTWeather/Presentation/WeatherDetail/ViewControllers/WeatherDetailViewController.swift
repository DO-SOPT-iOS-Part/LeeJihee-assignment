//
//  WeatherDetailViewController.swift
//  SOPTWeather
//
//  Created by 지희의 MAC on 2023/10/21.
//

import UIKit

import SnapKit

class WeatherDetailViewController: UIViewController {
    
    
    let weeklyWeatherData: [DayWeatherModel] = [DayWeatherModel(day: "오늘", weatherIconImage: ImageLiterals.sunIcon.withRenderingMode(.alwaysOriginal), minTempText: "15°", maxTempText: "29°", gradientImage: ImageLiterals.todayTempGradient),
                                                DayWeatherModel(day: "월", weatherIconImage: ImageLiterals.sunIcon.withRenderingMode(.alwaysOriginal), minTempText: "18°", maxTempText: "27°", gradientImage: ImageLiterals.oneDayTempGradient),
                                                DayWeatherModel(day: "화", weatherIconImage: ImageLiterals.sunIcon.withRenderingMode(.alwaysOriginal), minTempText: "20°", maxTempText: "25°", gradientImage: ImageLiterals.twoDayTempGradient),
                                                DayWeatherModel(day: "수", weatherIconImage: ImageLiterals.sunIcon.withRenderingMode(.alwaysOriginal), minTempText: "17°", maxTempText: "25°", gradientImage: ImageLiterals.threeDayTempGradient),
                                                DayWeatherModel(day: "목", weatherIconImage: ImageLiterals.sunIcon.withRenderingMode(.alwaysOriginal), minTempText: "18°", maxTempText: "27°", gradientImage: ImageLiterals.fourDayTempGradient),
                                                DayWeatherModel(day: "금", weatherIconImage: ImageLiterals.sunIcon.withRenderingMode(.alwaysOriginal), minTempText: "18°", maxTempText: "27°", gradientImage: ImageLiterals.fiveDayTempGradient),
                                                DayWeatherModel(day: "토", weatherIconImage: ImageLiterals.sunIcon.withRenderingMode(.alwaysOriginal), minTempText: "18°", maxTempText: "27°", gradientImage: ImageLiterals.sixDayTempGradient),
                                                DayWeatherModel(day: "일", weatherIconImage: ImageLiterals.sunIcon.withRenderingMode(.alwaysOriginal), minTempText: "18°", maxTempText: "27°", gradientImage: ImageLiterals.sevenDayTempGradient),
                                                DayWeatherModel(day: "월", weatherIconImage: ImageLiterals.sunIcon.withRenderingMode(.alwaysOriginal), minTempText: "18°", maxTempText: "27°", gradientImage: ImageLiterals.eightDayTempGradient),
                                                DayWeatherModel(day: "화", weatherIconImage: ImageLiterals.sunIcon.withRenderingMode(.alwaysOriginal), minTempText: "18°", maxTempText: "27°", gradientImage: ImageLiterals.nineDayTempGradient),
                                                DayWeatherModel(day: "수", weatherIconImage: ImageLiterals.sunIcon.withRenderingMode(.alwaysOriginal), minTempText: "18°", maxTempText: "27°", gradientImage: ImageLiterals.tenDayTempGradient)
    ]
    
    
    let weatherDetailView = WeatherDetailView()
    let cityWeatherDeatilView = CityWeatherDetailView()
    var weatherData = (cityName: "", weatherText: "", maxminTemp: "", weatherinfomation: [])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        addTarget()
    }
    
    func setView() {
        cityWeatherDeatilView.detailWeatherData = weatherData
        cityWeatherDeatilView.weekWeatherData = weeklyWeatherData
        
        view.addSubview(cityWeatherDeatilView)
        
        cityWeatherDeatilView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func addTarget() {
        navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        navigationController?.interactivePopGestureRecognizer?.delegate = self
        cityWeatherDeatilView.listButton.addTarget(self, action: #selector(tapListButton), for: .touchUpInside)
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


