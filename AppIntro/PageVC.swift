//
//  PageVC.swift
//  AppIntro
//
//  Created by Valentina Butenko on 9/7/16.
//  Copyright © 2016 ValentinaButenko. All rights reserved.
//

import UIKit
import SnapKit

class PageVC: UIViewController{

    var pageViewController: UIPageViewController!
    var startButton: UIButton!

    var buttonFirstClicked = true

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()

        let bgPic = UIImageView(image: UIImage(named: "bg.png"))
        bgPic.makeBlurEffect(bgPic)
        self.view.addSubview(bgPic)
        bgPic.snp_makeConstraints { (make) in
            make.edges.equalTo(view)
        }

        self.setupPageVC()
        self.setupStartButton()

        self.pageViewController.didMoveToParentViewController(self)

    }

    func setupPageVC(){
        let pc = UIPageControl.appearance()
        pc.pageIndicatorTintColor = UIColor(red: 190/255, green: 144/255, blue: 212/255, alpha: 1.0)
        pc.currentPageIndicatorTintColor = UIColor(red: 155/255, green: 89/255, blue: 182/255, alpha: 1.0)
        pc.backgroundColor = UIColor.clearColor()

        self.pageViewController = UIPageViewController(transitionStyle: .Scroll, navigationOrientation: .Horizontal, options: nil)
        
        self.pageViewController.dataSource = self
        self.addChildViewController(self.pageViewController)

        self.view.addSubview(self.pageViewController.view)
        self.pageViewController.view.snp_makeConstraints { (make) in
            make.edges.equalTo(self.view)
        }
    }

    func setupStartButton(){
        let startBtn = UIButton()
        startBtn.setImage(UIImage(named: "start.png")?.imageWithRenderingMode(.AlwaysOriginal), forState: UIControlState.Normal)
        startBtn.addTarget(self, action: #selector(PageVC.restartAction(_:)), forControlEvents: .TouchUpInside)

        self.view.addSubview(startBtn)
        startBtn.snp_makeConstraints { (make) in
            make.centerX.centerY.equalTo(self.view)
        }
        self.startButton = startBtn
    }

    func viewControllerAtIndex(index: Int) -> PageContent{
        if (PAGE.count == 0) || (index >= PAGE.count){
            return PageContent()
        }
        let vc = PageContent()
        vc.pageIndex = index
        return vc
    }

    func restartAction(sender: UIButton!){
        if buttonFirstClicked == true{

            self.pageViewController.setViewControllers([self.viewControllerAtIndex(0)], direction: .Forward, animated: true, completion: nil)
        }
    }

    func buttonGrowInSize(){
        
    }
}
