//
//  HAHomeViewController.swift
//  HealthAssistant
//
//  Created by ZQ on 2017/10/19.
//  Copyright © 2017年 DaisyLiLiFamilies. All rights reserved.
//

import UIKit

class HAHomeViewController: UIViewController ,UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource{
    var scrolView = UIScrollView()
    var applyImageView = UIImageView()
    var tableView = UITableView()
    var scrolToTopBtn = UIButton ()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIApplication.shared.isStatusBarHidden = true
        self.navigationController?.navigationBar.isHidden = true
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        UIApplication.shared.isStatusBarHidden = false
        self.navigationController?.navigationBar.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "首页"
        
        self.view.backgroundColor = UIColor.yellow
        self.setUpUI()
        
    }
    func setUpUI() -> Void {
        
        self.scrolView = UIScrollView.init()
        self.scrolView.frame = CGRect(x:0,y:0,width:SCREEN_WIDTH,height:SCREEN_HEIGHT)
        self.view.addSubview(self.scrolView)
        self.scrolView.delegate = self
        self.scrolView.contentSize = CGSize(width:SCREEN_WIDTH,height:SCREEN_HEIGHT * 2)
        self.scrolView.isPagingEnabled = true
        //广告
        self.applyImageView = UIImageView.init(frame: CGRect(x: 0,y: 0,width: SCREEN_WIDTH,height: SCREEN_HEIGHT))
        self.scrolView.isUserInteractionEnabled = true
        self.applyImageView.image = UIImage(named: "apply")
        self.scrolView.addSubview(self.applyImageView)
        //上滑按钮
        self.scrolToTopBtn = UIButton.init(type: .custom)
        self.scrolToTopBtn.frame = CGRect(x: (SCREEN_WIDTH - 200)/2,y: SCREEN_HEIGHT - 80,width: 200 ,height: 30)
        self.scrolToTopBtn.layer.cornerRadius = 15
        self.scrolToTopBtn.clipsToBounds = true
        self.scrolToTopBtn.backgroundColor = UIColor.lightGray
        self.scrolToTopBtn.setTitleColor(UIColor.white, for: .normal)
        self.scrolToTopBtn.setTitle("上滑进入主页", for: .normal)
        self.applyImageView.addSubview(self.scrolToTopBtn)
        
        self.tableView = UITableView.init(frame: CGRect(x:0,y:SCREEN_HEIGHT,width:SCREEN_WIDTH,height:SCREEN_HEIGHT), style: .grouped)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.scrolView.addSubview(self.tableView)
        
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y > SCREEN_HEIGHT - 10 {
            UIApplication.shared.isStatusBarHidden = false
            self.navigationController?.navigationBar.isHidden = false
        } else {
            UIApplication.shared.isStatusBarHidden = true
            self.navigationController?.navigationBar.isHidden = true
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
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
