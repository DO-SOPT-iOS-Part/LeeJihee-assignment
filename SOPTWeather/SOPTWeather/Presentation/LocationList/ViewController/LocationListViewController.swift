//
//  LocationListViewController.swift
//  SOPTWeather
//
//  Created by 지희의 MAC on 2023/10/21.
//

import UIKit

class LocationListViewController: UIViewController {
    
    let pageController = WeatherDetailPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
    let cityWeatherList: [WeatherDateModel] = [
        WeatherDateModel(cityName: "나의 위치",
                         subTitle: "의정부시",
                         weatherText: "흐림",
                         maxminTemp: "최고:29° 최저:15°",
                         weatherinfomation: [TodayWeatherModel(time: "Now", weatherIconImage: ImageLiterals.cloudMoonIcon, tempText: "21°"),
                                             TodayWeatherModel(time: "10시", weatherIconImage: ImageLiterals.drizzleRainIcon, tempText: "21°"),
                                             TodayWeatherModel(time: "11시", weatherIconImage: ImageLiterals.heavyRainIcon, tempText: "19°"),
                                             TodayWeatherModel(time: "12시", weatherIconImage: ImageLiterals.cloudBoltIcon, tempText: "19°"),
                                             TodayWeatherModel(time: "13시", weatherIconImage: ImageLiterals.cloudSunRainIcon, tempText: "19°"),
                                             TodayWeatherModel(time: "14시", weatherIconImage: ImageLiterals.heavyRainIcon, tempText: "24°"),
                                             TodayWeatherModel(time: "15시", weatherIconImage: ImageLiterals.heavyRainIcon, tempText: "26°"),
                                             TodayWeatherModel(time: "16시", weatherIconImage: ImageLiterals.heavyRainIcon, tempText: "28°"),
                                             TodayWeatherModel(time: "17시", weatherIconImage: ImageLiterals.cloudSunRainIcon, tempText: "29°")]),
        WeatherDateModel(cityName: "노원시",
                         weatherText: "흐림",
                         maxminTemp: "최고:29° 최저:15°",
                         weatherinfomation: [TodayWeatherModel(time: "Now", weatherIconImage: ImageLiterals.cloudMoonIcon, tempText: "23°"),
                                             TodayWeatherModel(time: "10시", weatherIconImage: ImageLiterals.drizzleRainIcon, tempText: "21°"),
                                             TodayWeatherModel(time: "11시", weatherIconImage: ImageLiterals.heavyRainIcon, tempText: "19°"),
                                             TodayWeatherModel(time: "12시", weatherIconImage: ImageLiterals.cloudBoltIcon, tempText: "19°"),
                                             TodayWeatherModel(time: "13시", weatherIconImage: ImageLiterals.cloudSunRainIcon, tempText: "19°"),
                                             TodayWeatherModel(time: "14시", weatherIconImage: ImageLiterals.heavyRainIcon, tempText: "24°"),
                                             TodayWeatherModel(time: "15시", weatherIconImage: ImageLiterals.heavyRainIcon, tempText: "26°"),
                                             TodayWeatherModel(time: "16시", weatherIconImage: ImageLiterals.heavyRainIcon, tempText: "28°"),
                                             TodayWeatherModel(time: "17시", weatherIconImage: ImageLiterals.cloudSunRainIcon, tempText: "29°")]),
        WeatherDateModel(cityName: "화양시",
                         weatherText: "흐림",
                         maxminTemp: "최고:26° 최저:15°",
                         weatherinfomation: [TodayWeatherModel(time: "Now", weatherIconImage: ImageLiterals.cloudMoonIcon, tempText: "19°"),
                                             TodayWeatherModel(time: "10시", weatherIconImage: ImageLiterals.drizzleRainIcon, tempText: "21°"),
                                             TodayWeatherModel(time: "11시", weatherIconImage: ImageLiterals.heavyRainIcon, tempText: "19°"),
                                             TodayWeatherModel(time: "12시", weatherIconImage: ImageLiterals.cloudBoltIcon, tempText: "19°"),
                                             TodayWeatherModel(time: "13시", weatherIconImage: ImageLiterals.cloudSunRainIcon, tempText: "19°"),
                                             TodayWeatherModel(time: "14시", weatherIconImage: ImageLiterals.heavyRainIcon, tempText: "24°"),
                                             TodayWeatherModel(time: "15시", weatherIconImage: ImageLiterals.heavyRainIcon, tempText: "26°"),
                                             TodayWeatherModel(time: "16시", weatherIconImage: ImageLiterals.heavyRainIcon, tempText: "26°"),
                                             TodayWeatherModel(time: "17시", weatherIconImage: ImageLiterals.cloudSunRainIcon, tempText: "29°")]),
        WeatherDateModel(cityName: "고양시",
                         weatherText: "흐림",
                         maxminTemp: "최고:25° 최저:14°",
                         weatherinfomation: [TodayWeatherModel(time: "Now", weatherIconImage: ImageLiterals.cloudMoonIcon, tempText: "16°"),
                                             TodayWeatherModel(time: "10시", weatherIconImage: ImageLiterals.drizzleRainIcon, tempText: "21°"),
                                             TodayWeatherModel(time: "11시", weatherIconImage: ImageLiterals.heavyRainIcon, tempText: "19°"),
                                             TodayWeatherModel(time: "12시", weatherIconImage: ImageLiterals.cloudBoltIcon, tempText: "19°"),
                                             TodayWeatherModel(time: "13시", weatherIconImage: ImageLiterals.cloudSunRainIcon, tempText: "19°"),
                                             TodayWeatherModel(time: "14시", weatherIconImage: ImageLiterals.heavyRainIcon, tempText: "25°"),
                                             TodayWeatherModel(time: "15시", weatherIconImage: ImageLiterals.heavyRainIcon, tempText: "25°"),
                                             TodayWeatherModel(time: "16시", weatherIconImage: ImageLiterals.heavyRainIcon, tempText: "25°"),
                                             TodayWeatherModel(time: "17시", weatherIconImage: ImageLiterals.cloudSunRainIcon, tempText: "23°")])]
    
    
    
    
    let locationView = LocationListView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        bindData()
        addView()
        addTarget()
    }
    
    private func addView() {
        view.addSubview(locationView)
        
        locationView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    func bindData(){
        for i in 0..<cityWeatherList.count {
            var elementView = LocationListElementView()
            elementView.weatherData = cityWeatherList[i]
            elementView.addTarget(self, action: #selector(tapListView), for: .touchUpInside)
            locationView.locationListStackView.addArrangedSubview(elementView)
        }
    }
    
    private func addTarget() {
        locationView.searchBar.delegate = self
    }
    
    @objc func tapListView(sender: LocationListElementView) {
        //        let weatherDetailViewController = WeatherDetailViewController()
        //        weatherDetailViewController.weatherData = sender.weatherData
        
        for i in 0..<cityWeatherList.count {
            let weatherDeatilViewController = WeatherDetailViewController()
            weatherDeatilViewController.weatherData = cityWeatherList[i]
            pageController.contentControllers.append(weatherDeatilViewController)
        }
        navigationController?.pushViewController(pageController, animated: true)
    }
}
extension LocationListViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            locationView.locationListStackView.clearSubViews()
            bindData()
        } else {
            let filteredCities = cityWeatherList.filter { $0.cityName.lowercased().contains(searchText.lowercased()) }
            locationView.locationListStackView.clearSubViews()
            for cityWeather in filteredCities {
                let elementView = LocationListElementView()
                elementView.weatherData = cityWeather
                elementView.addTarget(self, action: #selector(tapListView), for: .touchUpInside)
                locationView.locationListStackView.addArrangedSubview(elementView)
            }
        }
    }
}
