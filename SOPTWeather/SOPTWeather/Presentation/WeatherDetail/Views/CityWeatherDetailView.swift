//
//  CityWeatherDetailView.swift
//  SOPTWeather
//
//  Created by 지희의 MAC on 2023/11/08.
//

import UIKit

import SnapKit

class CityWeatherDetailView: UIView {
    // MARK: - Variables
    // MARK: Property
    var detailWeatherData: WeatherDateModel = WeatherDateModel(cityName: "", weatherText: "", maxminTemp: "", weatherinfomation: [])
    var weekWeatherData: [DayWeatherModel] = []
    
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
    
    lazy var collectionView: UICollectionView = {
        let flowLayout =  createLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.isScrollEnabled = true
        collectionView.backgroundColor = .clear
        
        flowLayout.register(SectionBackgroundView.self, forDecorationViewOfKind: "background")
        
        collectionView.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderView.reuseId)
        
        SummaryCollectionViewCell.register(collectionView: collectionView)
        TimeWeatherCollectionViewCell.register(collectionView: collectionView)
        WeeklyWeatherCollectionViewCell.register(collectionView: collectionView)
        collectionView.dataSource = self
        return collectionView
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
        self.addSubViews(backgroundImageView,
                         collectionView,
                         mapButton,
                         listButton)
    }
    
    private func setConstraints() {
        
        backgroundImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(34)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        mapButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(34)
            $0.leading.equalToSuperview().inset(16)
        }
        
        listButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(34)
            $0.trailing.equalToSuperview().inset(16)
        }
    }
    
    private func createMainLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(self.bounds.width), heightDimension: .absolute(212))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        // group설정
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(250))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: item, count: 1)
        // section 설정
        let section = NSCollectionLayoutSection(group: group)
        //스크롤 설정
        section.orthogonalScrollingBehavior = .paging
        
        return section
    }
    
    
    private func createTimeLayout() -> NSCollectionLayoutSection {
        // 각 item의 사이즈 설정
        let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(44), heightDimension: .absolute(122))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 34, bottom: 10, trailing: 34)
        
        // group설정
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(144))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.interItemSpacing = NSCollectionLayoutSpacing.fixed(22)
    
        // section 설정
        let section = NSCollectionLayoutSection(group: group)
        

        //헤더뷰 레이아웃
        section.boundarySupplementaryItems = [.init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .topLeading)]
        section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 24, bottom: 20, trailing: 24)
        
        
            // Background
                let sectionBackgroundDecoration = NSCollectionLayoutDecorationItem.background(elementKind: "background")
                section.decorationItems = [sectionBackgroundDecoration]
                
        //스크롤 설정
        section.orthogonalScrollingBehavior = .continuous
        
        return section
    }
    
    private func createWeekLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(self.bounds.width), heightDimension: .absolute(55))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        
        section.orthogonalScrollingBehavior = .none
        
        section.boundarySupplementaryItems = [.init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .topLeading)]
        
        return section
    }
    
    private func createLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout {[weak self] sectionNumber, env -> NSCollectionLayoutSection? in
            
            switch sectionNumber {
            case 0:
                return self?.createMainLayout()
            case 1:
                return self?.createTimeLayout()
            default:
                return self?.createWeekLayout()
            }
        }
    }
    
}

extension CityWeatherDetailView: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return detailWeatherData.weatherinfomation.count
        case 2:
            return weekWeatherData.count
        default:
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = SummaryCollectionViewCell.dequeueReusableCell(collectionView: collectionView, indexPath: indexPath)
            
            cell.setData(city: detailWeatherData.cityName, temp: detailWeatherData.weatherinfomation[0].tempText, weather: detailWeatherData.weatherText, maxMin: detailWeatherData.maxminTemp)
            return cell

        } else if indexPath.section == 1 {
            let cell = TimeWeatherCollectionViewCell.dequeueReusableCell(collectionView: collectionView, indexPath: indexPath)
            cell.setData(time: detailWeatherData.weatherinfomation[indexPath.row].time,
                         icon: detailWeatherData.weatherinfomation[indexPath.row].weatherIconImage,
                         temp: detailWeatherData.weatherinfomation[indexPath.row].tempText)
            return cell
            
        } else if indexPath.section == 2 {
            let cell = WeeklyWeatherCollectionViewCell.dequeueReusableCell(collectionView: collectionView, indexPath: indexPath)
            cell.setData(week: weekWeatherData[indexPath.row].day, icon: weekWeatherData[indexPath.row].weatherIconImage, min: weekWeatherData[indexPath.row].minTempText, gradient: weekWeatherData[indexPath.row].gradientImage, max: weekWeatherData[indexPath.row].maxTempText)
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderView.reuseId, for: indexPath) as! HeaderView
            if indexPath.section == 1 {
                
                let label = UILabel()
                label.text = "08:00~09:00에 강우 상태가, 18:00에 한때 흐린 상태가 예상됩니다."
                label.font = .sfProRegular18
                label.textColor = .white
                label.numberOfLines = 3
                
                headerView.addSubview(label)
                
                // 레이블의 제약조건 설정 (예: 스냅킷 라이브러리 사용)
                label.snp.makeConstraints {
                    $0.top.equalToSuperview().inset(15)
                    $0.leading.trailing.equalToSuperview().inset(16)
                }
                
            } else if indexPath.section == 2 {
                let iconImageView = UIImageView(image: UIImage(systemName: "calendar")?.withTintColor(.white.withAlphaComponent(0.3), renderingMode: .alwaysOriginal))
                
                
                let label = UILabel()
                label.text = "10일간의 일기예보"
                label.font = .sfProMedium15
                label.textColor = .white.withAlphaComponent(0.3)
                headerView.addSubViews(iconImageView, label)
                
                iconImageView.snp.makeConstraints {
                    $0.top.equalToSuperview().offset(15)
                    $0.leading.equalToSuperview().offset(15)
                    $0.size.equalTo(24)
                }
                
                label.snp.makeConstraints {
                    $0.centerY.equalTo(iconImageView)
                    $0.leading.equalTo(iconImageView.snp.trailing).offset(5)
                }
            }
            return headerView
        }
        return UICollectionReusableView()
    }
    
}
