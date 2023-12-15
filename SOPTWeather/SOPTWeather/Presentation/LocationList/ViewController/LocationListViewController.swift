//
//  LocationListViewController.swift
//  SOPTWeather
//
//  Created by 지희의 MAC on 2023/10/21.
//

import UIKit

class LocationListViewController: UIViewController {
    
    let pageController = WeatherDetailPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
    let locationListView = LocationListView()
    
    
    override func loadView() {
        self.view = locationListView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegate()
    }
    
    private func setDelegate() {
        locationListView.searchBar.delegate = self
        locationListView.weatherTableView.dataSource = self
        locationListView.weatherTableView.delegate = self
    }
    
}


extension LocationListViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            
        } else {
            let filteredCities = cityWeatherList.filter { $0.cityName.lowercased().contains(searchText.lowercased()) }
            cityWeatherList = filteredCities
            locationListView.weatherTableView.reloadData()
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
        return 4
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: WeatherListTableViewCell.cellReuseIdentifier, for: indexPath) as! WeatherListTableViewCell
      //  cell.weatherData = infoList[indexPath.row]
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
