//
//  UIImageView+Extensions.swift
//  iOS_4thWeek_Assignment
//
//  Created by 김현기 on 2020/06/13.
//  Copyright © 2020 HyunKi Kim. All rights reserved.
//

import Foundation
import Kingfisher

func setImage(from url: String) {
    self.kf.indicatorType = .activity
    let cache = ImageCache.default
    
    cache.retrieveImage(forKey: url) { result in
        switch result {
        case .success(let value):
            if value.image != nil { self.image = value.image }
            else { self.kf.setImage(with: URL(string: url)) }
        case .failure(let err):
            print(err.errorCode)
        }
        
    }
}
