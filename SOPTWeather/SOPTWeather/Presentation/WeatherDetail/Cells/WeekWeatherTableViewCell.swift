//
//  WeekWeatherTableViewCell.swift
//  SOPTWeather
//
//  Created by 지희의 MAC on 12/12/23.
//

import UIKit

class WeekWeatherTableViewCell: UITableViewCell {

    static let reuseId = "WeekWeatherTableViewCell"
    
    private let weekLabel: UILabel = {
        let label = UILabel()
        label.font = .sfProMedium22
        label.textColor = .white
        return label
    }()
    
    private let WeathericonImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private let precipitationLabel: UILabel = {
        let label = UILabel()
        label.font = .sfProMedium15
        label.textColor = .blue
        return label
    }()
    
    private lazy var weatherStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.addArrangeSubViews(WeathericonImageView, precipitationLabel)
        return stackView
    }()
    
    private let minTempLabel: UILabel = {
        let label = UILabel()
        label.font = .sfProMedium22
        label.textColor = .white.withAlphaComponent(0.3)
        return label
    }()
    
    private let gradientView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private let maxTempLabel: UILabel = {
        let label = UILabel()
        label.font = .sfProMedium22
        label.textColor = .white
        return label
    }()
    
    private lazy var horizontalStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalCentering
        stackView.addArrangeSubViews(weekLabel,weatherStackView,minTempLabel,gradientView,maxTempLabel)
        stackView.setCustomSpacing(10, after: minTempLabel)
        stackView.setCustomSpacing(10, after: gradientView)
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setData(week:String, icon: UIImage, min:String, gradient: UIImage, max: String) {
        weekLabel.text = week
        WeathericonImageView.image = icon
        minTempLabel.text = min
        gradientView.image = gradient
        maxTempLabel.text = max
    }
    
    private func setUI(){
        setViewHierarchy()
        setConstraints()
    }
    
    private func setViewHierarchy() {
        self.backgroundColor = .clear
        self.addSubViews(horizontalStackView)
    }
    
    private func setConstraints() {
        horizontalStackView.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
    
}
