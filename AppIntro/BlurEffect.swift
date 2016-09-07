//
//  BlurEffect.swift
//  AppIntro
//
//  Created by Valentina Butenko on 9/7/16.
//  Copyright © 2016 ValentinaButenko. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView{
    func makeBlurEffect(targetImageView: UIImageView){
        let blurEffect = UIBlurEffect(style: .Light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = targetImageView.bounds

        blurEffectView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        targetImageView.addSubview(blurEffectView)
    }
}
