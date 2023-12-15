//
//  WeatherDetailViewController.swift
//  SOPTWeather
//
//  Created by 지희의 MAC on 2023/10/21.
//

import UIKit

import SnapKit

class CityWeatherDetailViewController: UIViewController {
    
    let cityWeatherDeatilView = CityWeatherView()
    var weatherData = (cityName: "", weatherText: "", maxminTemp: "", weatherinfomation: [])
    
    override func loadView() {
        super.loadView()
        self.view = cityWeatherDeatilView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addTarget()
    }
    
    func addTarget() {
        navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        navigationController?.interactivePopGestureRecognizer?.delegate = self
        cityWeatherDeatilView.listButton.addTarget(self, action: #selector(tapListButton), for: .touchUpInside)
    }
    
    func setDelegate() {
        cityWeatherDeatilView.weatherTableView.delegate = self
    }
    
    @objc func tapListButton() {
        navigationController?.popViewController(animated: true)
    }
}

extension CityWeatherDetailViewController : UIGestureRecognizerDelegate { }

extension CityWeatherDetailViewController: UITableViewDelegate { }


