//
//  WeatherDetailView.swift
//  SOPTWeather
//
//  Created by 지희의 MAC on 2023/10/21.
//

import UIKit
import SnapKit

class WeatherDetailView: UIView {
    
    // MARK: - Variables
    // MARK: Property
    private var detailWeatherList: [TodayWeatherModel] = []
    
    // MARK: Component
    let scrollView: UIScrollView = {
       let scrollView = UIScrollView()
        scrollView.alwaysBounceVertical = true
        return scrollView
    }()
    
    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = ImageLiterals.backgroundFull
        return imageView
    }()
    
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
    
    
    private let weatherDetailLabel: UILabel = {
        let label = UILabel()
        label.font = .sfProRegular18
        label.textColor = .white
        label.numberOfLines = 3
        label.text = "08:00~09:00에 강우 상태가, 18:00에 한때 흐린 상태가 예상됩니다."
        return label
    }()
    
    private let lineView: UIView = {
        let view = UIView()
        view.backgroundColor = .darkGray
        return view
    }()
    
    private let timeWeatherScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()
    
    private lazy var weatherDetailStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 11
        stackView.addArrangeSubViews(weatherDetailLabel,
                                     lineView,
                                     timeWeatherScrollView)
        stackView.layer.cornerRadius = 15
        stackView.layer.borderWidth = 1
        stackView.layer.borderColor = UIColor.darkGray.cgColor
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
        stackView.frame = CGRect(x: 0, y: 0, width: 335, height: 212)
        
        return stackView
    }()
    
    private lazy var timeStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 22
        return stackView
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
    
    
    // MARK: - Function
    // MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
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
        
        self.addSubViews(backgroundImageView,scrollView,
                         mapButton,
                         listButton)
        
        scrollView.addSubViews(weatherStackView,
                               weatherDetailStackView)
        
        timeWeatherScrollView.addSubview(timeStackView)
        
        for i in 0..<detailWeatherList.count {
            let timeView = TimeWeatherView(time: detailWeatherList[i].time,
                                           iconImage: detailWeatherList[i].weatherIconImage,
                                           temp: detailWeatherList[i].tempText)
            timeStackView.addArrangedSubview(timeView)
        }
        
        
    }
    
    private func setConstraints() {
        
        backgroundImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        weatherStackView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(78)
            $0.leading.trailing.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
        
        weatherDetailStackView.snp.makeConstraints {
            $0.top.equalTo(weatherStackView.snp.bottom).offset(44)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(212)
            $0.width.equalTo(335)
        }
        
        lineView.snp.makeConstraints {
            $0.height.equalTo(1)
        }
        
        timeStackView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(timeWeatherScrollView.snp.height)
        }
        
        mapButton.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(10)
            $0.bottom.equalToSuperview().inset(34)
            $0.size.equalTo(44)
        }
        
        listButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(10)
            $0.bottom.equalToSuperview().inset(34)
            $0.size.equalTo(44)
        }
        
    }
    
    
    // MARK: Custom Function
    func setInfomation(city: String, temp: String,
                       weather: String, minmax: String,
                       weatherDetail: [TodayWeatherModel]) {
        cityTitleLabel.text = city
        tempTitleLabel.text = temp
        weatherLabel.text = weather
        maxMinTempLabel.text = minmax
        detailWeatherList  = weatherDetail
        setUI()
    }
}
