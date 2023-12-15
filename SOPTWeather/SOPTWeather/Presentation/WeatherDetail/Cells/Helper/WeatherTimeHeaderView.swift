//
//  HeaderView.swift
//  SOPTWeather
//
//  Created by 지희의 MAC on 12/11/23.
//

import UIKit

import SnapKit

final class WeatherTimeHeaderView: UITableViewHeaderFooterView {
    // MARK: - Variables
    // MARK: Const
    static var reuseId = "WeatherTimeHeaderView"
    
    // MARK: Component
    private let cityTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .sfProRegular36
        label.textColor = .white
        label.text = "고양시"
        return label
    }()
    
    private let tempTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .sfProThin102
        label.textColor = .white
        label.text = "0℃"
        return label
    }()
    
    private let weatherLabel: UILabel = {
        let label = UILabel()
        label.font = .sfProRegular24
        label.textColor = .white
        label.text = "맑음"
        return label
    }()
    
    private let maxMinTempLabel: UILabel = {
        let label = UILabel()
        label.font = .sfProMedium20
        label.textColor = .white
        label.text = "최대 0℃ 최소 -12℃"
        return label
    }()
    
    private lazy var weatherStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.addArrangeSubViews(cityTitleLabel,
                                     tempTitleLabel,
                                     weatherLabel,
                                     maxMinTempLabel)
        stackView.spacing = 4
        stackView.alignment = .center
        stackView.axis = .vertical
        return stackView
    }()
    
    
    // MARK: - Function
    // MARK: LifeCycle
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setUI()
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
        self.addSubViews(weatherStackView)
    }
    
    private func setConstraints() {
        
        weatherStackView.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
    
    func setData (city: String, temp: String, weather: String, maxmin: String) {
        self.cityTitleLabel.text = city
        self.tempTitleLabel.text = temp
        self.weatherLabel.text = weather
        self.maxMinTempLabel.text = maxmin
    }
}
