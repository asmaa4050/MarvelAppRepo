//
//  UIImageView+Extension.swift
//  MarvelApp
//
//  Created by Asmaa Elkhouly on 7/9/19.
//  Copyright © 2019 Asmaa Elkhouly. All rights reserved.
//

import Foundation
import UIKit
extension UIImageView {
    func loadRemoteImage(withUrl url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
