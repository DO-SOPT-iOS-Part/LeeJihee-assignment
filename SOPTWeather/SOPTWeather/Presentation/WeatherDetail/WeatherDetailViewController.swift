//
//  WeatherDetailViewController.swift
//  SOPTWeather
//
//  Created by 지희의 MAC on 2023/10/21.
//

import UIKit

class WeatherDetailViewController: UIViewController {
    
    let weatherDetailView = WeatherDetailView()
    
    override func loadView() {
        super.loadView()
        view = weatherDetailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addTarget()
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
