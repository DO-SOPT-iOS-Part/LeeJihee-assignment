//
//  HeaderView.swift
//  SOPTWeather
//
//  Created by 지희의 MAC on 2023/11/10.
//

import UIKit

class HeaderView: UICollectionReusableView {
    static var reuseId = "HeaderView"
    
    override init(frame: CGRect) {
            super.init(frame: frame)
            setupUI()
        }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        private func setupUI() {
            // 헤더 뷰의 UI 구성을 설정합니다.
        }
}
