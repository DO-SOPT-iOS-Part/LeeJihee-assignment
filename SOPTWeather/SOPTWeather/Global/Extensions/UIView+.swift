//
//  UIView+.swift
//  SOPTWeather
//
//  Created by 지희의 MAC on 2023/10/20.
//

import UIKit

extension UIView {
    func showToast(message: String) {
        let toastLabel = UILabel()
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center
        toastLabel.font = .systemFont(ofSize: 13)
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10
        toastLabel.clipsToBounds = true
        toastLabel.numberOfLines = 2
        
        let toastWidth = toastLabel.intrinsicContentSize.width + 20
        let toastHeight = toastLabel.intrinsicContentSize.height + 10
        toastLabel.frame = CGRect(x: self.frame.size.width/2 - toastWidth/2,
                                  y: self.frame.size.height - toastHeight - 60,
                                  width: toastWidth,
                                  height: toastHeight)
        self.addSubview(toastLabel)
        
        UIView.animate(withDuration: 2.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
}
