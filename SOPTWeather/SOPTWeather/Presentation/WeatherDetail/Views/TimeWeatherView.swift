//
//  TimeWeatherView.swift
//  SOPTWeather
//
//  Created by 지희의 MAC on 2023/10/26.
//

import UIKit

import SnapKit

class TimeWeatherView: UIView {
    // MARK: - Variables
    // MARK: Constants
    
    // MARK: Property
    
    // MARK: Component
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.font = .sfProMedium17
        label.textColor = .white
        return label
    }()
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let tempLabel: UILabel = {
        let label = UILabel()
        label.font = .sfProMedium22
        label.textColor = .white
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(time: String, iconImage: UIImage, temp: String) {
        super.init(frame: .zero)
        self.timeLabel.text = time
        self.iconImageView.image = iconImage.withAlignmentRectInsets(UIEdgeInsets(top: -10, left: -10, bottom: -10, right: -10))
        self.tempLabel.text = temp
        setUI()
    }
    
    private func setUI(){
        setViewHierarchy()
        setConstraints()
    }
    
    private func setViewHierarchy() {
        self.addSubViews(timeLabel,iconImageView,tempLabel)
    }
    
    private func setConstraints() {
        self.snp.makeConstraints {
            $0.width.equalTo(44)
        }
        
        timeLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
        
        iconImageView.snp.makeConstraints {
            $0.top.equalTo(timeLabel.snp.bottom).offset(14)
            $0.centerX.equalToSuperview()
            $0.size.equalTo(44)
        }
        
        tempLabel.snp.makeConstraints {
            $0.top.equalTo(iconImageView.snp.bottom).offset(14)
            $0.centerX.equalToSuperview()
        }
    }
}
