//
//  LocationListViewController.swift
//  SOPTWeather
//
//  Created by 지희의 MAC on 2023/10/21.
//

import UIKit

class LocationListViewController: UIViewController {
    
    
    let cityWeatherList: [WeatherDateModel] = [
        WeatherDateModel(cityName: "의정부시",
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
                         weatherinfomation: [TodayWeatherModel(time: "Now", weatherIconImage: ImageLiterals.cloudMoonIcon, tempText: "21°"),
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
        WeatherDateModel(cityName: "고양시",
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
                                             TodayWeatherModel(time: "17시", weatherIconImage: ImageLiterals.cloudSunRainIcon, tempText: "29°")])]
    
    
    
    
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
            var elementView = UIButton()
            if i == 0 {
                elementView = LocationListElementView(title: "나의 위치", city: cityWeatherList[i].cityName,
                                                      weather: cityWeatherList[i].weatherText,
                                                      nowTemp: cityWeatherList[i].weatherinfomation[0].tempText,
                                                      maxmin: cityWeatherList[i].maxminTemp)
            } else {
                elementView = LocationListElementView(title: cityWeatherList[i].cityName,
                                                      city: "",
                                                      weather: cityWeatherList[i].weatherText,
                                                      nowTemp: cityWeatherList[i].weatherinfomation[0].tempText,
                                                      maxmin: cityWeatherList[i].maxminTemp)
            }
            
            elementView.addTarget(self, action: #selector(tapListView), for: .touchUpInside)
            locationView.locationListStackView.addArrangedSubview(elementView)
        }
    }
    
    private func addTarget() {
        locationView.searchBar.delegate = self
    }
    
    @objc func tapListView() {
        let weatherDetailViewController = WeatherDetailViewController()
        weatherDetailViewController.weatherDetailView.setInfomation(city: "의정부시", temp: "21", weather: "흐림", minmax: "최고:29° 최저:15°")
        navigationController?.pushViewController(weatherDetailViewController, animated: true)
    }
}
extension LocationListViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            // If search text is empty, display all data
            locationView.locationListStackView.clearSubViews()
            bindData()
        } else {
            // Filter the cityWeatherList based on the search text
            let filteredCities = cityWeatherList.filter { $0.cityName.lowercased().contains(searchText.lowercased()) }

            // Clear the existing subviews
            locationView.locationListStackView.clearSubViews()

            // Add new subviews for filtered cities
            for cityWeather in filteredCities {
                let elementView = LocationListElementView(title: cityWeather.cityName,
                                                          city: "",
                                                          weather: cityWeather.weatherText,
                                                          nowTemp: cityWeather.weatherinfomation[0].tempText,
                                                          maxmin: cityWeather.maxminTemp)

                elementView.addTarget(self, action: #selector(tapListView), for: .touchUpInside)
                locationView.locationListStackView.addArrangedSubview(elementView)
            }
        }
    }
}
