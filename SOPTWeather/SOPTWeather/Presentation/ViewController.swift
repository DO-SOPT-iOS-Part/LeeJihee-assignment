//
//  ViewController.swift
//  SOPTWeather
//
//  Created by 지희의 MAC on 2023/10/20.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        for family in UIFont.familyNames {
          print(family)

          for sub in UIFont.fontNames(forFamilyName: family) {
            print("====> \(sub)")
          }
        }
        // Do any additional setup after loading the view.
    }


}

