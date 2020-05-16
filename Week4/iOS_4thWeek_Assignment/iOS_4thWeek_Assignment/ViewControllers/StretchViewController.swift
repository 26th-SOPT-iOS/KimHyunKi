//
//  StretchViewController.swift
//  iOS_SecondWeek_Assignment_Login
//
//  Created by 김현기 on 2020/05/07.
//  Copyright © 2020 HyunKi Kim. All rights reserved.
//

import UIKit

class StretchViewController: UIViewController {
    @IBOutlet var imgViewHeightLayout: NSLayoutConstraint!
    
    @IBOutlet var scrollView: UIScrollView!
    
    var headerImgHeight: CGFloat = 210
    var minHeaderImgHeight: CGFloat = 108
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        scrollView.contentInsetAdjustmentBehavior = .never
       
    }
    
   

    
}

extension StretchViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y < 0.0 {
            // Scrolling down: Scale
            imgViewHeightLayout.constant = headerImgHeight - scrollView.contentOffset.y
        } else {
            // Scrolling up: Parallax
            var height = headerImgHeight - scrollView.contentOffset.y
            height = height > minHeaderImgHeight ? height : minHeaderImgHeight
            imgViewHeightLayout.constant = height
        }
    }
}

