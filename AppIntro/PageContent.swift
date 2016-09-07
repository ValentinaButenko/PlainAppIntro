//
//  PageContent.swift
//  AppIntro
//
//  Created by Valentina Butenko on 9/7/16.
//  Copyright © 2016 ValentinaButenko. All rights reserved.
//

import UIKit
import SnapKit

class PageContent: UIViewController {

    var pageIndex = 0
    var pictureName: String!
    var lblText: String!

    var bgPic: UIImageView!
    var logoView: UIImageView!
    var pictureView: UIImageView!
    var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        self.setup()
    }

    func setup(){
        self.setupBgPicure()
        self.setupLogoView()
        self.setupPictureView()
        self.setupLabel()
    }

    func setupBgPicure(){
        let bgPic = UIImageView(image: UIImage(named: "bg.png"))
        bgPic.makeBlurEffect(bgPic)
        self.view.addSubview(bgPic)
        bgPic.snp_makeConstraints { (make) in
            make.edges.equalTo(view)
        }
        self.bgPic = bgPic
    }

    func setupLogoView(){
        let logoView = UIImageView(image: UIImage(named: "logo.png"))
        logoView.alpha = 0.3
        self.view.addSubview(logoView)
        logoView.snp_makeConstraints { (make) in
            make.top.equalTo(view).inset(40)
            make.centerX.equalTo(view)
            make.height.width.equalTo(100)
        }
        self.logoView = logoView
    }

    func setupPictureView(){
        let pictureView = UIImageView(frame: CGRect(x: self.view.frame.width/2 - 90, y: self.view.frame.height/2 - 75, width: 175, height: 150))
        pictureView.image = UIImage(named: pictureName)
        self.view.addSubview(pictureView)
        pictureView.contentMode = .ScaleAspectFit

        self.pictureView = pictureView
    }

    func setupLabel(){
        let label = UILabel()
        label.text = lblText
        label.textAlignment = .Center
        label.textColor = UIColor.whiteColor()
        label.font = UIFont(name: "HelveticaNeue-Light", size: 25)
        self.view.addSubview(label)

        label.snp_makeConstraints { (make) in
            make.bottom.equalTo(view).inset(50)
            make.leading.trailing.equalTo(view).inset(50)
        }
        self.label = label
    }
}

