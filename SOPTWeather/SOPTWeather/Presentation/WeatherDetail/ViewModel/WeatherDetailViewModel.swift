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
