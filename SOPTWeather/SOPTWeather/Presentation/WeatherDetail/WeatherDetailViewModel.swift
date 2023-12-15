//
//  WeatherDetailViewModel.swift
//  SOPTWeather
//
//  Created by 지희의 MAC on 12/12/23.
//

import UIKit

class WeatherDetailViewModel: NSObject {
    
    let weeklyWeatherData: [DayWeatherModel] = [DayWeatherModel(day: "오늘", weatherIconImage: ImageLiterals.sunIcon.withRenderingMode(.alwaysOriginal), minTempText: "15°", maxTempText: "29°", gradientImage: ImageLiterals.todayTempGradient),
                                                DayWeatherModel(day: "월", weatherIconImage: ImageLiterals.sunIcon.withRenderingMode(.alwaysOriginal), minTempText: "18°", maxTempText: "27°", gradientImage: ImageLiterals.oneDayTempGradient),
                                                DayWeatherModel(day: "화", weatherIconImage: ImageLiterals.sunIcon.withRenderingMode(.alwaysOriginal), minTempText: "20°", maxTempText: "25°", gradientImage: ImageLiterals.twoDayTempGradient),
                                                DayWeatherModel(day: "수", weatherIconImage: ImageLiterals.sunIcon.withRenderingMode(.alwaysOriginal), minTempText: "17°", maxTempText: "25°", gradientImage: ImageLiterals.threeDayTempGradient),
                                                DayWeatherModel(day: "목", weatherIconImage: ImageLiterals.sunIcon.withRenderingMode(.alwaysOriginal), minTempText: "18°", maxTempText: "27°", gradientImage: ImageLiterals.fourDayTempGradient),
                                                DayWeatherModel(day: "금", weatherIconImage: ImageLiterals.sunIcon.withRenderingMode(.alwaysOriginal), minTempText: "18°", maxTempText: "27°", gradientImage: ImageLiterals.fiveDayTempGradient),
                                                DayWeatherModel(day: "토", weatherIconImage: ImageLiterals.sunIcon.withRenderingMode(.alwaysOriginal), minTempText: "18°", maxTempText: "27°", gradientImage: ImageLiterals.sixDayTempGradient),
                                                DayWeatherModel(day: "일", weatherIconImage: ImageLiterals.sunIcon.withRenderingMode(.alwaysOriginal), minTempText: "18°", maxTempText: "27°", gradientImage: ImageLiterals.sevenDayTempGradient),
                                                DayWeatherModel(day: "월", weatherIconImage: ImageLiterals.sunIcon.withRenderingMode(.alwaysOriginal), minTempText: "18°", maxTempText: "27°", gradientImage: ImageLiterals.eightDayTempGradient),
                                                DayWeatherModel(day: "화", weatherIconImage: ImageLiterals.sunIcon.withRenderingMode(.alwaysOriginal), minTempText: "18°", maxTempText: "27°", gradientImage: ImageLiterals.nineDayTempGradient),
                                                DayWeatherModel(day: "수", weatherIconImage: ImageLiterals.sunIcon.withRenderingMode(.alwaysOriginal), minTempText: "18°", maxTempText: "27°", gradientImage: ImageLiterals.tenDayTempGradient)
    ]
    
}

extension WeatherDetailViewModel: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 10
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TimeWeatherTableViewCell.reuseId, for: indexPath) as? TimeWeatherTableViewCell else { return cell }
            cell.selectionStyle = .none
            return cell
        } else if indexPath.section == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: WeekWeatherTableViewCell.reuseId, for: indexPath) as? WeekWeatherTableViewCell else { return cell }
            cell.setData(week: weeklyWeatherData[indexPath.row].day , icon: weeklyWeatherData[indexPath.row].weatherIconImage, min: weeklyWeatherData[indexPath.row].minTempText, gradient: weeklyWeatherData[indexPath.row].gradientImage, max: weeklyWeatherData[indexPath.row].maxTempText)
            cell.selectionStyle = .none
            return cell
        }
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    
}




//
//extension CityWeatherDetailView: UICollectionViewDataSource {
//    
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 3
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        switch section {
//        case 0:
//            return 1
//        case 1:
//            return detailWeatherData.weatherinfomation.count
//        case 2:
//            return weekWeatherData.count
//        default:
//            return 1
//        }
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        if indexPath.section == 0 {
//            let cell = SummaryCollectionViewCell.dequeueReusableCell(collectionView: collectionView, indexPath: indexPath)
//            
//            cell.setData(city: detailWeatherData.cityName, temp: detailWeatherData.weatherinfomation[0].tempText, weather: detailWeatherData.weatherText, maxMin: detailWeatherData.maxminTemp)
//            return cell
//
//        } else if indexPath.section == 1 {
//            let cell = TimeWeatherCollectionViewCell.dequeueReusableCell(collectionView: collectionView, indexPath: indexPath)
//            cell.setData(time: detailWeatherData.weatherinfomation[indexPath.row].time,
//                         icon: detailWeatherData.weatherinfomation[indexPath.row].weatherIconImage,
//                         temp: detailWeatherData.weatherinfomation[indexPath.row].tempText)
//            return cell
//            
//        } else if indexPath.section == 2 {
//            let cell = WeeklyWeatherCollectionViewCell.dequeueReusableCell(collectionView: collectionView, indexPath: indexPath)
//            cell.setData(week: weekWeatherData[indexPath.row].day, icon: weekWeatherData[indexPath.row].weatherIconImage, min: weekWeatherData[indexPath.row].minTempText, gradient: weekWeatherData[indexPath.row].gradientImage, max: weekWeatherData[indexPath.row].maxTempText)
//            return cell
//        }
//        
//        return UICollectionViewCell()
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        if kind == UICollectionView.elementKindSectionHeader {
//            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderView.reuseId, for: indexPath) as! HeaderView
//            if indexPath.section == 1 {
//                
//                let label = UILabel()
//                label.text = "08:00~09:00에 강우 상태가, 18:00에 한때 흐린 상태가 예상됩니다."
//                label.font = .sfProRegular18
//                label.textColor = .white
//                label.numberOfLines = 3
//                
//                headerView.addSubview(label)
//                
//                // 레이블의 제약조건 설정 (예: 스냅킷 라이브러리 사용)
//                label.snp.makeConstraints {
//                    $0.top.equalToSuperview().inset(15)
//                    $0.leading.trailing.equalToSuperview().inset(16)
//                }
//                
//            } else if indexPath.section == 2 {
//                let iconImageView = UIImageView(image: UIImage(systemName: "calendar")?.withTintColor(.white.withAlphaComponent(0.3), renderingMode: .alwaysOriginal))
//                
//                
//                let label = UILabel()
//                label.text = "10일간의 일기예보"
//                label.font = .sfProMedium15
//                label.textColor = .white.withAlphaComponent(0.3)
//                headerView.addSubViews(iconImageView, label)
//                
//                iconImageView.snp.makeConstraints {
//                    $0.top.equalToSuperview().offset(15)
//                    $0.leading.equalToSuperview().offset(15)
//                    $0.size.equalTo(24)
//                }
//                
//                label.snp.makeConstraints {
//                    $0.centerY.equalTo(iconImageView)
//                    $0.leading.equalTo(iconImageView.snp.trailing).offset(5)
//                }
//            }
//            return headerView
//        }
//        return UICollectionReusableView()
//    }
//    
//}
