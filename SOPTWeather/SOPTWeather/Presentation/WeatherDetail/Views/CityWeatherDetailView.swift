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
    private var detailWeatherList: [TimeWeatherModel] = []
    
    // MARK: Component
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
        collectionView.backgroundColor = .black
        collectionView.contentInsetAdjustmentBehavior = .never
        
        TimeWeatherCollectionViewCell.register(collectionView: collectionView)
        WeeklyWeatherCollectionViewCell.register(collectionView: collectionView)
        //        collectionView.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderView.identifier)
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
            $0.top.equalToSuperview().offset(10)
            $0.leading.trailing.equalToSuperview()
        }
    }
    private func createMainLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(self.bounds.width), heightDimension: .absolute(498))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4)
        // group설정
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(505.0))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: item, count: 1)
        // section 설정
        let section = NSCollectionLayoutSection(group: group)
        //스크롤 설정
        section.orthogonalScrollingBehavior = .paging
        
        return section
    }
    
    
    private func createPosterLayout() -> NSCollectionLayoutSection {
        // 각 item의 사이즈 설정 ( width: 98, height: 146 )
        let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(102.0), heightDimension: .absolute(146.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 4, bottom: 0, trailing: 4)
        
        // group설정
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(200.0))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: item, count: 4)
        // section 설정
        let section = NSCollectionLayoutSection(group: group)
        
        //헤더뷰 레이아웃
        section.boundarySupplementaryItems = [.init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .topLeading)]
        //스크롤 설정
        section.orthogonalScrollingBehavior = .continuous
        
        return section
    }
    
    private func createBasicLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(160), heightDimension: .absolute(80))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(160.0))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: item, count: 3)
        
        let section = NSCollectionLayoutSection(group: group)
        
        section.orthogonalScrollingBehavior = .continuous
        
        section.boundarySupplementaryItems = [.init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .topLeading)]
        
        return section
    }
    
    private func createLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout {[weak self] sectionNumber, env -> NSCollectionLayoutSection? in
            
            switch sectionNumber {
            case 0:
                return self?.createMainLayout()
            case 2:
                return self?.createBasicLayout()
            default:
                return self?.createPosterLayout()
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
        case 1:
            return 1
        case 2:
            return 10
        case 3:
            return 10
        default:
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 1 {
            
        } else if indexPath.section == 2 {
            
        } else if indexPath.section == 3 {
            
        }
        
        return UICollectionViewCell()
    }
    
}
