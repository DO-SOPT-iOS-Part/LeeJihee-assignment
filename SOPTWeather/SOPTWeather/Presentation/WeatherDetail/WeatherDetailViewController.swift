//
//  WeatherDetailViewController.swift
//  SOPTWeather
//
//  Created by 지희의 MAC on 2023/10/21.
//

import UIKit

import SnapKit

class WeatherDetailViewController: UIViewController {
    
    let weatherDetailView = WeatherDetailView()
    var weatherData = WeatherDateModel(cityName: "", weatherText: "", maxminTemp: "", weatherinfomation: [])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        addTarget()
    }
    
    func setView() {
        weatherDetailView.setInfomation(city: weatherData.cityName, temp: weatherData.weatherinfomation[0].tempText, weather: weatherData.weatherText, minmax: weatherData.maxminTemp, weatherDetail: weatherData.weatherinfomation)
        
        view.addSubview(weatherDetailView)
        
        weatherDetailView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func addTarget() {
        navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        navigationController?.interactivePopGestureRecognizer?.delegate = self
        weatherDetailView.listButton.addTarget(self, action: #selector(tapListButton), for: .touchUpInside)
    }
    
    @objc func tapListButton() {
        navigationController?.popViewController(animated: true)
    }
}

extension WeatherDetailViewController : UIGestureRecognizerDelegate { }
