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
        self.view.addSubview(self.tableView)
        self.tableView.mj_header = MJRefreshNormalHeader.init(refreshingBlock: {
            self.reloadData()
        })
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
    func reloadData() -> Void {
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
        return 3
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if (cell == nil) {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: "cell")
        }
        return cell!
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
