//
//  HeaderView.swift
//  SOPTWeather
//
//  Created by 지희의 MAC on 2023/11/10.
//

import UIKit

class SectionBackgroundView: UICollectionReusableView {
    private let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 0.5
        view.layer.cornerRadius = 15
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        addSubview(backgroundView)

        backgroundView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(10)
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
