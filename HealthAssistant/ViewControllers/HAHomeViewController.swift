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
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.delegate = self
        UIApplication.shared.isStatusBarHidden = true
        self.navigationController?.navigationBar.isHidden = true
        self.isScrol = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "首页"
        self.view.backgroundColor = UIColor.yellow
        self.setUpUI()
    }
    
    func setUpUI() -> Void {
        self.titleArray = NSArray.init()
        self.titleArray = ["档案:","调理方案","时令好文","调养妙方"]
        let imagesURLStrings = [
            "http://www.g-photography.net/file_picture/3/3587/4.jpg",
            "http://img2.zjolcdn.com/pic/0/13/66/56/13665652_914292.jpg",
            "http://c.hiphotos.baidu.com/image/w%3D400/sign=c2318ff84334970a4773112fa5c8d1c0/b7fd5266d0160924c1fae5ccd60735fae7cd340d.jpg",
            "http://img3.redocn.com/tupian/20150806/weimeisheyingtupian_4779232.jpg",
            ];
        self.scrolView = HACycleScrollView.llCycleScrollViewWithFrame(CGRect(x:0,y:0,width:SCREEN_WIDTH,height:200))
        scrolView.scrollDirection = .horizontal
        scrolView.customPageControlStyle = .snake
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(2)) {
             self.scrolView.imagePaths = imagesURLStrings
        }
        
        
        self.tableView = UITableView.init(frame: CGRect(x:0,y:0,width:SCREEN_WIDTH,height:SCREEN_HEIGHT), style: .grouped)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.tableHeaderView = self.scrolView
        self.tableView.register(HATipsCell.self, forCellReuseIdentifier: "cell")
        self.tableView.register(HARecordCell.self, forCellReuseIdentifier: "recordCell")

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
        return 2
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.titleArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! HATipsCell
            cell.backgroundColor = UIColor.white
            cell.titleLab.text = self.titleArray.object(at: indexPath.section) as? String
            if indexPath.section != self.titleArray.count - 1 {
                cell.backgroundColor = UIColor.brown
            }
            return cell
        } else {
            let recordCell = tableView.dequeueReusableCell(withIdentifier: "recordCell") as! HARecordCell
            return recordCell
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 44
        } else {
           return (SCREEN_WIDTH - PADDING_LEFT_RIGHT * 2) / 2
        }
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
        // Dispose of any resources that can be recreated.
    }


}
