//
//  LocationListElementView.swift
//  SOPTWeather
//
//  Created by 지희의 MAC on 2023/10/21.
//

import UIKit
import SnapKit

class LocationListElementView: UIButton {
    
    var weatherData = (cityName: "", weatherText: "", maxminTemp: "", weatherinfomation: []){
        didSet{
            bindData()
        }
    }
    
    private let backgroundImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = ImageLiterals.backgroundList
        return imageView
    }()
    
    private let locationTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "나의 위치"
        label.font = .sfProBold24
        
        label.textColor = .white
        return label
    }()
    
    private let locationLabel: UILabel = {
        let label = UILabel()
        label.font = .sfProMedium17
        label.textColor = .white
        return label
    }()
    
    private let weatherLabel: UILabel = {
        let label = UILabel()
        label.font = .sfProMedium16
        label.textColor = .white
        return label
    }()
    
    private let tempLabel: UILabel = {
        let label = UILabel()
        label.font = .sfProLight52
        label.textColor = .white
        return label
    }()
    
    private let maxMinTempLabel: UILabel = {
        let label = UILabel()
        label.font = .sfProMedium15
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
    
    func bindData() {
        locationTitleLabel.text = weatherData.cityName
        locationLabel.text = weatherData.subTitle
        weatherLabel.text = weatherData.weatherText
        tempLabel.text = weatherData.weatherinfomation.first?.tempText
        maxMinTempLabel.text = weatherData.maxminTemp
        setUI()
    }
    
    private func setUI(){
        setViewHierarchy()
        setConstraints()
    }
    
    private func setViewHierarchy() {
        
        self.addSubViews(backgroundImageView,
                         locationTitleLabel,
                        locationLabel,
                         weatherLabel,
                         tempLabel,
                         maxMinTempLabel)
    }
    
    private func setConstraints() {
        self.setBackgroundImage(ImageLiterals.backgroundList, for: .normal)
        
        locationTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.leading.equalToSuperview().offset(16)
        }
        
        locationLabel.snp.makeConstraints {
            $0.top.equalTo(locationTitleLabel.snp.bottom).offset(8)
            $0.leading.equalToSuperview().offset(16)
        }
        
        weatherLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(10)
            $0.leading.equalToSuperview().offset(16)
        }
        
        tempLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(4)
            $0.trailing.equalToSuperview().inset(16)
        }
        
        maxMinTempLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(10)
            $0.trailing.equalToSuperview().inset(16)
        }
        
    }
}
