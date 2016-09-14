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

    var pageIndex: Int!

    var bgPic: UIImageView!
    var pictureView: UIImageView!
    var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }

    func setup(){
        self.setupPictureView()
        self.setupLabel()
    }

    func setupPictureView(){
    //    let pictureView = UIImageView(frame: CGRect(x: self.view.frame.width/2 - 90, y: self.view.frame.height/2 - 75, width: 175, height: 150))
        let pictureView = UIImageView()
        pictureView.image = UIImage(named: PAGE[self.pageIndex].image)?.imageWithRenderingMode(.AlwaysOriginal)
        self.view.addSubview(pictureView)
        pictureView.contentMode = .ScaleAspectFit

        pictureView.snp_makeConstraints { (make) in
            make.centerY.centerX.equalTo(view)
        }
        self.pictureView = pictureView
    }

    func setupLabel(){
        let label = UILabel()
        label.text = PAGE[self.pageIndex].title
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

