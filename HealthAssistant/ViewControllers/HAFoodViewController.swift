//
//  HAFoodViewController.swift
//  HealthAssistant
//
//  Created by ZQ on 2017/10/19.
//  Copyright © 2017年 DaisyLiLiFamilies. All rights reserved.
//

import UIKit
import PageMenu

class HAFoodViewController: UIViewController ,CAPSPageMenuDelegate{
    
    var pageMenu :CAPSPageMenu?
    var parameters: [CAPSPageMenuOption] = []
    var viewControllers: [UIViewController] = []
    var tips: [String] = []
    var tipsUrlArray: [String] = []
    var listArray = Array<Any>()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIApplication.shared.isStatusBarHidden = false
        self.navigationController?.navigationBar.isHidden = false
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "饮食搭配"
        self.loadData()
       setUpPageMenuView()
       
    }
    func loadData() {
        self.tips = ["立冬宜忌","绿叶","水果","肉类","五谷杂粮","水产","养颜"]
        self.tipsUrlArray = ["http://img.huofar.com/life/day/eat/jieqi/newjieqi/suishis/20.jpg","http://img.huofar.com/ia/newScene/covers/2105.background.jpg","http://img.huofar.com/ia/newScene/covers/2090.background.jpg","http://img.huofar.com/ia/newScene/covers/2091.background2.jpg","http://img.huofar.com/ia/newScene/covers/2093.background2.jpg","http://img.huofar.com/ia/newScene/covers/2092.background2.jpg","http://img.huofar.com/ia/newScene/covers/2109.background.jpg"]
        self.listArray = ["http://img.huofar.com/food/120/3_60@2x.jpg","http://img.huofar.com/food/120/13_60@2x.jpg","http://img.huofar.com/food/120/239_60@2x.jpg","http://img.huofar.com/food/120/30_60@2x.jpg","http://img.huofar.com/food/120/49_60@2x.jpg"]
        //,["http://img.huofar.com/food/120/23_60@2x.jpg","http://img.huofar.com/food/120/38_60@2x.jpg","http://img.huofar.com/food/120/49_60@2x.jpg","http://img.huofar.com/food/120/49_60@2x.jpg","http://img.huofar.com/food/120/49_60@2x.jpg"],["http://img.huofar.com/food/120/23_60@2x.jpg","http://img.huofar.com/food/120/38_60@2x.jpg","http://img.huofar.com/food/120/49_60@2x.jpg","http://img.huofar.com/food/120/49_60@2x.jpg","http://img.huofar.com/food/120/49_60@2x.jpg"],["http://img.huofar.com/food/120/23_60@2x.jpg","http://img.huofar.com/food/120/38_60@2x.jpg","http://img.huofar.com/food/120/49_60@2x.jpg","http://img.huofar.com/food/120/49_60@2x.jpg","http://img.huofar.com/food/120/49_60@2x.jpg"]
    }
    func setUpPageMenuView() {
        
        for  i in 0..<self.tips.count {
            let controller = HAPageViewController.init(style: .grouped)
            controller.listArray = self.listArray as! [String]
            controller.title = tips[i]
            controller.tipsUrlString = self.tipsUrlArray[i]
            self.viewControllers.append(controller)
        }
        self.parameters = [
            .menuMargin(1),
            .menuHeight(50),
            .selectedMenuItemLabelColor(UIColor.black),
            .scrollMenuBackgroundColor(COLOR_BACKGROUD_GRAY),
            .menuItemWidth(CGFloat(Int(SCREEN_WIDTH) / 4)),
            .centerMenuItems(true),
            .selectionIndicatorColor(COLOR_GREEN)
        ]
        // Initialize page menu with controller array, frame, and optional parameters
        pageMenu = CAPSPageMenu(viewControllers: viewControllers, frame: CGRect(x:0.0, y:64, width:SCREEN_WIDTH, height:SCREEN_HEIGHT - 100), pageMenuOptions: parameters)
        pageMenu?.delegate = self
        view.addSubview((pageMenu?.view)!)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

