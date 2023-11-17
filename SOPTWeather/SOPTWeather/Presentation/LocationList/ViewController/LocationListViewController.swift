//
//  LocationListViewController.swift
//  SOPTWeather
//
//  Created by 지희의 MAC on 2023/10/21.
//

import UIKit

class LocationListViewController: UIViewController {
    
    let pageController = WeatherDetailPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
    let locationView = LocationListView()
    let locationList = ["iksan", "jeonju", "jeju", "cheonan", "cheongju", "chuncheon"]
    var infoList: [WeatherDateModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        getWeatherInfo()
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
    
    func getWeatherInfo(){
        for i in 0..<locationList.count {
            Task {
                if let result = try await GetWeatherService.shared.GetWeatherInfo(location: locationList[i]) {
                    print(result)
                    let maxminText = "\(Int(result.main.tempMax))° \(Int(result.main.tempMin))°"
                    let krName = translateCityNameToKorean(name: locationList[i])
                    infoList.append(WeatherDateModel(cityName: krName, weatherText: result.weather[0].description, maxminTemp: maxminText,currentTemp: "\(Int(result.main.temp))°", weatherinfomation: []))
                }
                locationView.weatherTableView.reloadData()
            }
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
        return infoList.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: WeatherListTableViewCell.cellReuseIdentifier, for: indexPath) as! WeatherListTableViewCell
        cell.weatherData = infoList[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
    
    func translateCityNameToKorean(name: String) -> String {
            let translations: [String: String] = [
                "iksan":"익산",
                "jeonju":"전주",
                "jeju":"제주",
                "cheonan":"천안",
                "cheongju":"청주",
                "chuncheon":"춘천"
            ]
            return translations[name] ?? name
        }
    
}
