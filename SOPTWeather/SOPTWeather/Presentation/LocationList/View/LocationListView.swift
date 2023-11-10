//
//  LocationListView.swift
//  SOPTWeather
//
//  Created by 지희의 MAC on 2023/10/21.
//

import UIKit
import SnapKit

class LocationListView: UIView {
    // MARK: - Variables
    // MARK: Property
    
    // MARK: Component
    let listTitle: UILabel = {
        let label = UILabel()
        label.font = .sfProBold36
        label.textColor = .white
        label.text = "날씨"
        return label
    }()
    
    let moreButton: UIButton = {
        let button = UIButton()
        button.setImage(ImageLiterals.ellipsisIcon, for: .normal)
        button.contentEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        button.tintColor = .white
        return button
    }()
    
    let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.backgroundColor = .clear
        searchBar.placeholder = "도시 또는 공항 검색"
        searchBar.barStyle = .black
        return searchBar
    }()
    
    lazy var weatherTableView: UITableView = {
       let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.register(WeatherListTableViewCell.self, forCellReuseIdentifier: WeatherListTableViewCell.cellReuseIdentifier)
        return tableView
    }()
    
    /// scrollView 이용
    let scrollView: UIScrollView = {
       let scrollView = UIScrollView()
        scrollView.alwaysBounceVertical = true
        return scrollView
    }()
    
    let locationListStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 16
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI(){
        setViewHierarchy()
        setConstraints()
    }
    
    private func setViewHierarchy() {
        self.backgroundColor = .black
        
        self.addSubViews(listTitle,
                         moreButton,
                         searchBar,
                         weatherTableView)
        
       // scrollView.addSubview(locationListStackView)
        
    }
    
    private func setConstraints() {
        listTitle.snp.makeConstraints {
            $0.top.equalToSuperview().offset(53)
            $0.leading.equalToSuperview().offset(20)
        }
        
        moreButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(8)
            $0.trailing.equalToSuperview().inset(10)
            $0.size.equalTo(44)
        }
        
        searchBar.snp.makeConstraints {
            $0.top.equalTo(listTitle.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        weatherTableView.snp.makeConstraints {
            $0.top.equalTo(searchBar.snp.bottom).offset(15)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview()
        }
        
    }
}
