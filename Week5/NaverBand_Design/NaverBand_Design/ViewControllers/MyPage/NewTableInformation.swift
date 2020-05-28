//
//  NewTableInformation.swift
//  NaverBand_Design
//
//  Created by 김현기 on 2020/05/28.
//  Copyright © 2020 HyunKi Kim. All rights reserved.
//

import Foundation
import UIKit

struct NewTableInformation {

    var image : Image
    var title : String
    var subtitle : String

    init(image: Image, title: String, subtitle: String){
        self.image = image
        self.title = title
        self.subtitle = subtitle
    }
}

enum Image {
    case cell1
    case cell2
    case cell3

    func getImageName() -> String {
        switch self{
        case .cell1: return "icPhoto1"
        case .cell2: return "icPhoto2"
        case .cell3: return "icPhoto3"
        }
    }
}
