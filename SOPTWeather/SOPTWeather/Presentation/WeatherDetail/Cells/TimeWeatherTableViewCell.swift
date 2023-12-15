//
//  TimeWeatherTableViewCell.swift
//  SOPTWeather
//
//  Created by 지희의 MAC on 12/12/23.
//

import UIKit

class TimeWeatherTableViewCell: UITableViewCell {
    
    static let reuseId = "TimeWeatherTableViewCell"

    var detailLabel: UILabel = {
        let label = UILabel()
        label.text = "08:00~09:00에 강우 상태가, 18:00에 한때 흐린 상태가 예상됩니다."
        label.font = .sfProRegular18
        label.textColor = .white
        label.numberOfLines = 3
        return label
    }()
    
    lazy var timeWeatherCollectionView: UICollectionView =  {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: 44, height: 100)
        flowLayout.minimumInteritemSpacing = 10
        flowLayout.scrollDirection = .horizontal
        flowLayout.sectionInset = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.register(TimeWeatherCollectionViewCell.self, forCellWithReuseIdentifier: TimeWeatherCollectionViewCell.reuseIdentifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUI(){
        setViewHierarchy()
        setConstraints()
    }
    
    private func setViewHierarchy() {
        
        self.backgroundColor = .clear
        self.contentView.backgroundColor = .white.withAlphaComponent(0.1)
        self.contentView.layer.cornerRadius = 20
        self.contentView.addSubViews(detailLabel, timeWeatherCollectionView)
    }
    
    private func setConstraints() {
        
        detailLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.width.equalTo(340)
            $0.centerX.equalToSuperview()
        }
        
        timeWeatherCollectionView.snp.makeConstraints {
            $0.top.equalTo(detailLabel.snp.bottom).offset(5)
            $0.leading.trailing.bottom.equalToSuperview()
            $0.height.equalTo(140)
        }
    }
    
}

extension TimeWeatherTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cityWeatherList[0].weatherinfomation.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TimeWeatherCollectionViewCell.reuseIdentifier, for: indexPath) as? TimeWeatherCollectionViewCell else { return UICollectionViewCell() }
        cell.setData(time: cityWeatherList[0].weatherinfomation[indexPath.item].time, icon: cityWeatherList[0].weatherinfomation[indexPath.item].weatherIconImage, temp: cityWeatherList[0].weatherinfomation[indexPath.item].tempText)
        return cell
    }
    
    
}

extension TimeWeatherTableViewCell: UICollectionViewDelegate {
    
}
