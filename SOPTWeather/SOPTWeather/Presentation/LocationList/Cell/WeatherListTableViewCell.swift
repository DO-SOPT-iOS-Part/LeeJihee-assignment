//
//  WeatherListTableViewCell.swift
//  SOPTWeather
//
//  Created by 지희의 MAC on 2023/11/08.
//

import UIKit

class WeatherListTableViewCell: UITableViewCell {
    
    static let cellReuseIdentifier = "cellReuseIdentifier"
    
    var weatherData = (cityName: "", weatherText: "", maxminTemp: "", weatherinfomation: [])
    
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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
            // Cell 간격 조정
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0))
      }
    
    private func setUI(){
        setViewHierarchy()
        setConstraints()
    }
    
    
    
    private func setViewHierarchy() {
        
        contentView.addSubViews(backgroundImageView,
                         locationTitleLabel,
                        locationLabel,
                         weatherLabel,
                         tempLabel,
                         maxMinTempLabel)
    }
    
    private func setConstraints() {
        self.backgroundColor = .clear
        
        backgroundImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

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
