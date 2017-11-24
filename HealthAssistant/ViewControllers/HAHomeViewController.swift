//
//  HAHomeViewController.swift
//  HealthAssistant
//
//  Created by ZQ on 2017/10/19.
//  Copyright © 2017年 DaisyLiLiFamilies. All rights reserved.
//

import UIKit
import Alamofire
import Kingfisher
import MJRefresh

class HAHomeViewController: UIViewController ,UIScrollViewDelegate,UINavigationControllerDelegate,UITableViewDelegate,UITableViewDataSource{
    var tableView = UITableView()
    var isScrol = Bool()
    var scrolView = HACycleScrollView()
    var titleArray: NSArray!
    var statueArray: Array<Any>!
    var detailArray: NSArray!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.delegate = self
        UIApplication.shared.isStatusBarHidden = true
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "首页"
        self.isScrol = false
        self.view.backgroundColor = UIColor.yellow
        self.setUpUI()
    }
    
    func setUpUI() -> Void {
        self.titleArray = NSArray.init()
        self.titleArray = ["档案:","调理方案","气血不通+抗衰老=行气活血、温补脾肾","血气不通+增强免疫力=疏肝理气、通补气血","气血不通+好气色=活血化瘀、通补气血","气血不通+养肺益气=理气化痰","时令好文","调养妙方"]
        let imagesURLStrings = [
            "http://img2.zjolcdn.com/pic/0/13/66/56/13665652_914292.jpg",
            "http://c.hiphotos.baidu.com/image/w%3D400/sign=c2318ff84334970a4773112fa5c8d1c0/b7fd5266d0160924c1fae5ccd60735fae7cd340d.jpg",
            "http://img3.redocn.com/tupian/20150806/weimeisheyingtupian_4779232.jpg",
            ];
        self.statueArray = [2,0,0,0,0,2,2]
        self.detailArray = ["小编1说：身体瘀堵的人，需要延缓衰老，首先是疏通气血，其次是温补脾肾，而青梅露酒正好合适。每天喝一点，通血脉、补脾肾之气、吃得香、睡得好，身体自然年轻","小编2说：身体瘀堵的人，需要延缓衰老，首先是疏通气血，其次是温补脾肾，而青梅露酒正好合适。每天喝一点，通血脉、补脾肾之气、吃得香、睡得好，身体自然年轻","小编3说：身体瘀堵的人，需要延缓衰老，首先是疏通气血，其次是温补脾肾，而青梅露酒正好合适。每天喝一点，通血脉、补脾肾之气、吃得香、睡得好，身体自然年轻","小编4说：身体瘀堵的人，需要延缓衰老，首先是疏通气血，其次是温补脾肾，而青梅露酒正好合适。每天喝一点，通血脉、补脾肾之气、吃得香、睡得好，身体自然年轻"]
        self.scrolView = HACycleScrollView.llCycleScrollViewWithFrame(CGRect(x:0,y:0,width:SCREEN_WIDTH,height:200))
        scrolView.scrollDirection = .horizontal
        scrolView.customPageControlStyle = .snake
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(2)) {
             self.scrolView.imagePaths = imagesURLStrings
        }
        self.tableView = UITableView.init(frame: CGRect(x:0,y:0,width:SCREEN_WIDTH,height:SCREEN_HEIGHT), style: .grouped)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.separatorStyle = .none
        self.tableView.tableHeaderView = self.scrolView
        self.tableView.register(HATipsCell.self, forCellReuseIdentifier: "cell")
        self.tableView.register(HARecordCell.self, forCellReuseIdentifier: "recordCell")
        self.tableView.register(HASchemeCell.self, forCellReuseIdentifier: "schemeCell")
        self.tableView.register(HAHomeContentCell.self, forCellReuseIdentifier: "contentCell")
        self.tableView.register(HAGoodEssayCell.self, forCellReuseIdentifier: "essayCell")
        //禁用区间距自适应
        self.tableView.estimatedSectionFooterHeight = 0
        self.tableView.estimatedSectionHeaderHeight = 0
        self.view.addSubview(self.tableView)
        let header = HADIYHeader.init(refreshingTarget: self, refreshingAction: #selector(loadData))
        self.tableView.mj_header = header
        header?.beginRefreshing()
    }
    ///** 返回转场动画实例*/
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
       
        if operation == UINavigationControllerOperation.pop && fromVC.isKind(of: type(of: ViewController()) as AnyClass)  {
           return popTrasition
        } else if operation == UINavigationControllerOperation.push && toVC.isKind(of: type(of: ViewController()) as AnyClass){
            return pushTrasition
        } else if operation == UINavigationControllerOperation.pop && fromVC.isKind(of: type(of: self)){
            self.navigationController?.delegate = nil
        }
        return nil
    }
    @objc func loadData() {
        self.tableView.mj_header.endRefreshing()
        if isScrol {
            self.navigationController?.pushViewController(ViewController(), animated: true)
        }
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y < -120 {
            isScrol = true
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 || section == self.titleArray.count - 1 || section == self.titleArray.count - 2 {
            return 2
        } else {
            let statue = self.statueArray[section] as AnyObject
            if (statue as! Int == 1) {
                return 2
            }
            return 1
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.titleArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 || indexPath.section == 1 || indexPath.section == self.titleArray.count - 1 || indexPath.section == self.titleArray.count - 2{
            
            if indexPath.row == 0 {
                //竖标标题行
                let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! HATipsCell
                cell.backgroundColor = UIColor.white
                cell.titleLab.text = self.titleArray.object(at: indexPath.section) as? String
                return cell
            }
            if indexPath.section == self.titleArray.count - 2  || indexPath.section == self.titleArray.count - 1{
                let goodCell = tableView.dequeueReusableCell(withIdentifier: "essayCell") as! HAGoodEssayCell
                return goodCell
            }
            
            //普通行
            let recordCell = tableView.dequeueReusableCell(withIdentifier: "recordCell") as! HARecordCell
            return recordCell
                
        } else {
            if indexPath.row == 0 {
                //一阶行标题行
                   let contentCell = tableView.dequeueReusableCell(withIdentifier: "schemeCell") as! HASchemeCell
                 contentCell.contentLab.text = self.titleArray.object(at: indexPath.section) as? String
                    return contentCell
                }
                //包含描述
                let schemeCell = tableView.dequeueReusableCell(withIdentifier: "contentCell") as! HAHomeContentCell
                schemeCell.detailStr = self.detailArray[indexPath.section - 2] as! String
                return schemeCell
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 || indexPath.section == 1 {
            return 50
        } else {
            if indexPath.section == 2 || indexPath.section == 3 || indexPath.section == 4 || indexPath.section == 5 {
                return 100
            }
           return (SCREEN_WIDTH - PADDING_LEFT_RIGHT * 2) / 2
        }
    }
    
    //UITableViewDelegate点击事件代理
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //找到点击的行，和对应得开合状态
        if (indexPath.section == 2 || indexPath.section == 3 || indexPath.section == 4 || indexPath.section == 5) && indexPath.row == 0 {
            tableView.deselectRow(at: indexPath, animated: true)
            let cell = tableView.cellForRow(at: indexPath) as! HASchemeCell
            let statue = self.statueArray[indexPath.section] as! Int
            self.statueArray[indexPath.section] = (statue + 1)%2
            //根据状态刷新表的开合
            if cell.isKind(of: HASchemeCell.self) {
                if  self.statueArray[indexPath.section] as! Int == 1{
                    cell.titleStr = (self.titleArray[indexPath.section] as? String)!
                }
                self.tableView.reloadData()
            }
        } else {
            //其他行
        }
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 0 || section == self.titleArray.count - 1 || section == self.titleArray.count - 2 {
            return 10
        }
        return 0.1
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
      return  0.1
    }
lazy var popTrasition : HAPopTransitionAnimation = {
        let popTrasition = HAPopTransitionAnimation.init()
        return popTrasition
    }()
lazy var pushTrasition : HAPushTransitionAnimation = {
        let pushTrasition = HAPushTransitionAnimation.init()
      return pushTrasition
    }()
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}
