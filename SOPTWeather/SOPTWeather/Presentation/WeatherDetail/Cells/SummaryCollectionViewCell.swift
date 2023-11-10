//
//  SummaryCollectionViewCell.swift
//  SOPTWeather
//
//  Created by 지희의 MAC on 2023/11/10.
//

import UIKit

class SummaryCollectionViewCell: UICollectionViewCell {
    
    private let cityTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .sfProRegular36
        label.textColor = .white
        return label
    }()
    
    private let tempTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .sfProThin102
        label.textColor = .white
        return label
    }()
    
    private let weatherLabel: UILabel = {
        let label = UILabel()
        label.font = .sfProRegular24
        label.textColor = .white
        return label
    }()
    
    private let maxMinTempLabel: UILabel = {
        let label = UILabel()
        label.font = .sfProMedium20
        label.textColor = .white
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setData(city: String, temp: String, weather: String, maxMin: String) {
        self.cityTitleLabel.text = city
        self.tempTitleLabel.text = temp
        self.weatherLabel.text = weather
        self.maxMinTempLabel.text = maxMin
    }
    
    
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
}

extension SummaryCollectionViewCell: CollectionViewCellReuseProtocol {
    
}
