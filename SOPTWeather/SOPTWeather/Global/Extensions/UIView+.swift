//
//  UIView+.swift
//  SOPTWeather
//
//  Created by 지희의 MAC on 2023/10/20.
//

import UIKit

extension UIView {
        func addSubViews(_ views: UIView...) {
                views.forEach {
                        self.addSubview($0)
                }
        }
}
