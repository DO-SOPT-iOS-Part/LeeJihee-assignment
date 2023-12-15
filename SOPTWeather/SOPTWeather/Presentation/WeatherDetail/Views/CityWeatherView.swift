//
//  WeatherDetail.swift
//  SOPTWeather
//
//  Created by 지희의 MAC on 12/11/23.
//

import UIKit

import SnapKit

final class CityWeatherView: UIView {
    // MARK: - Variables
    // MARK: Constants
    let viewModel = WeatherDetailViewModel()
    
    // MARK: Property
    
    
    // MARK: Component
    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = ImageLiterals.backgroundFull
        return imageView
    }()
    
    let mapButton: UIButton = {
        let button = UIButton()
        button.setImage(ImageLiterals.mapIcon, for: .normal)
        button.tintColor = .white
        return button
    }()
    
    let listButton: UIButton = {
        let button = UIButton()
        button.setImage(ImageLiterals.listIcon, for: .normal)
        button.tintColor = .white
        return button
    }()
    
    lazy var weatherTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.backgroundColor = .clear
        tableView.register(WeatherTimeHeaderView.self, forHeaderFooterViewReuseIdentifier: WeatherTimeHeaderView.reuseId)
        tableView.register(WeekHeaderView.self, forHeaderFooterViewReuseIdentifier: WeekHeaderView.reuseId)
        tableView.register(TimeWeatherTableViewCell.self, forCellReuseIdentifier: TimeWeatherTableViewCell.reuseId)
        tableView.register(WeekWeatherTableViewCell.self, forCellReuseIdentifier: WeekWeatherTableViewCell.reuseId)
        return tableView
    }()

    // MARK: - Functio
    // MARK: LifeCycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        bindViewModel()
        setDelegate()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Layout Helpers
    private func setUI(){
        setViewHierarchy()
        setConstraints()
    }
    
    private func setViewHierarchy() {
        self.addSubViews(backgroundImageView, weatherTableView, listButton, mapButton)
    }
    
    private func setConstraints() {
        backgroundImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        weatherTableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        listButton.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(28)
            $0.bottom.equalToSuperview().inset(32)
        }
        
        mapButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(28)
            $0.bottom.equalTo(listButton.snp.bottom)
        }
    }
    
    // MARK: Custom Function
    func setDelegate() {
        self.weatherTableView.delegate = self
    }
    
    func bindViewModel() {
        self.weatherTableView.dataSource = viewModel 
    }
    
    // MARK: Objc Function 
    
    
}


extension CityWeatherView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section {
        case 0:
            let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: WeatherTimeHeaderView.reuseId) as? WeatherTimeHeaderView
            return header
        case 1:
            let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: WeekHeaderView.reuseId) as? WeekHeaderView
            return header
        default:
            let header = UIView()
            return header
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return 280
        case 1:
            return 40
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 212
        case 1:
            return 55
        default:
            return 0
        }
    }
    
}
