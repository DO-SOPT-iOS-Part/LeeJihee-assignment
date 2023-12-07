//
//  LocationListViewModel.swift
//  SOPTWeather
//
//  Created by 지희의 MAC on 12/6/23.
//

import Foundation
import UIKit

protocol ObservableViewModelProtocol {
    func fetchWeatherData()
    func setError(_ message: String)
    var weather: Observable<[WeatherDTO]> { get set }
    var errorMessage: Observable<String?> { get set }
    var error: Observable<Bool> { get set }
 }

class LocationListViewModel: NSObject, ObservableViewModelProtocol {
    
    let locationList = ["iksan", "jeonju", "jeju", "cheonan", "cheongju", "chuncheon"]

    var weather: Observable<[WeatherDTO]> = Observable([])
    var errorMessage: Observable<String?> = Observable(nil)
    var error: Observable<Bool> = Observable(false)
    
    func fetchWeatherData() {
        locationList.forEach { city in
            Task {
                if let result = try await GetWeatherService.shared.GetWeatherInfo(location: city) {
                    print(result)
                    weather.value.append(result)
                }
            }
        }
        
    }
    
    func setError(_ message: String) {
        self.errorMessage = Observable(message)
        self.error = Observable(true)
    }
}


// 근데 여기서 만약 아직 네트워크가 실행되지 않았다면 ? 테이블 뷰가 나타나지 않을거임.. 고민해보자
extension LocationListViewModel: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weather.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: WeatherListTableViewCell.cellReuseIdentifier, for: indexPath) as! WeatherListTableViewCell
      //  cell.weatherData = infoList[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
}
