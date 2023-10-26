//
//  LocationListViewController.swift
//  SOPTWeather
//
//  Created by 지희의 MAC on 2023/10/21.
//

import UIKit

class LocationListViewController: UIViewController {
    let locationView = LocationListView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        addView()
        addTarget()
    }
    
    private func addView() {
        view.addSubview(locationView)
        
        locationView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    private func addTarget() {
        locationView.locationListElementView.addTarget(self, action: #selector(tapListView), for: .touchUpInside)
    }

    @objc func tapListView() {
        let weatherDetailViewController = WeatherDetailViewController()
        let locationElement = self.locationView.locationListElementView
        weatherDetailViewController.weatherDetailView.setInfomation(city: "의정부시", temp: "21", weather: "흐림", minmax: "최고:29° 최저:15°")
        navigationController?.pushViewController(weatherDetailViewController, animated: true)
    }
}
