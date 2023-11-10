//
//  LocationListViewController.swift
//  SOPTWeather
//
//  Created by 지희의 MAC on 2023/10/21.
//

import UIKit

class LocationListViewController: UIViewController {
    
    let pageController = WeatherDetailPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
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
    
    let locationView = LocationListView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        bindVC()
        setDelegate()
        addView()
    }
    
    private func addView() {
        view.addSubview(locationView)
        locationView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    private func setDelegate() {
        locationView.searchBar.delegate = self
        locationView.weatherTableView.dataSource = self
        locationView.weatherTableView.delegate = self
    }
    
    private func bindVC(){
        
        for i in 0..<cityWeatherList.count {
            let weatherDeatilViewController = WeatherDetailViewController()
            weatherDeatilViewController.weatherData = cityWeatherList[i]
            pageController.contentControllers.append(weatherDeatilViewController)
        }
    }
    
    
}


extension LocationListViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            
        } else {
            let filteredCities = cityWeatherList.filter { $0.cityName.lowercased().contains(searchText.lowercased()) }
            cityWeatherList = filteredCities
            locationView.weatherTableView.reloadData()
        }
    }
}


extension LocationListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        pageController.index = indexPath.row
        navigationController?.pushViewController(pageController, animated: true)
    }
}

extension LocationListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityWeatherList.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: WeatherListTableViewCell.cellReuseIdentifier, for: indexPath) as! WeatherListTableViewCell
        cell.weatherData = self.cityWeatherList[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
    
    
}
