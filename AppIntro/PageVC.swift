//
//  PageVC.swift
//  AppIntro
//
//  Created by Valentina Butenko on 9/7/16.
//  Copyright © 2016 ValentinaButenko. All rights reserved.
//

import UIKit

class PageVC: UIPageViewController, UIPageViewControllerDataSource{

    var arrPageTitle: NSArray!
    var arrImgNames: NSArray!

    override func viewDidLoad() {
        super.viewDidLoad()

        arrImgNames = ["travel.png", "camera.png", "check.png"]
        arrPageTitle = ["Travel to new places", "Take awesome photos", "Publish photos on map!"]
        self.dataSource = self

        self.setViewControllers([getViewControllerAtIndex(0)] as [UIViewController], direction: .Forward, animated: true, completion: nil)
    }

    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        let pageContent: PageContent = viewController as! PageContent
        var index = pageContent.pageIndex
        if ((index == 0) || (index == NSNotFound))
        {
            return nil
        }
        index -= 1
        return getViewControllerAtIndex(index)
        }

    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        let pageContent: PageContent = viewController as! PageContent
        var index = pageContent.pageIndex
        if (index == NSNotFound)
        {
            return nil
        }
        index += 1
        if (index == arrPageTitle.count)
        {
            return nil
        }
        return getViewControllerAtIndex(index)
    }

    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return self.arrImgNames.count
    }

    func getViewControllerAtIndex(index: NSInteger) -> PageContent{
        let vc = PageContent()
        vc.lblText = "\(arrPageTitle[index])"
        vc.pictureName = "\(arrImgNames[index])"
        vc.pageIndex = index

        self.presentViewController(vc, animated: true, completion: nil)

        return vc
    }
 }
