//
//  HAPageViewController.swift
//  HealthAssistant
//
//  Created by ZQ on 2017/11/20.
//  Copyright © 2017年 DaisyLiLiFamilies. All rights reserved.
//

import UIKit
import Kingfisher

class HAPageViewController: UITableViewController {
    var tipsUrlString: String = ""
    var headerImageView = UIImageView()
    
    var numberLabel = UILabel()
    var headerView = UIView()
    var listArray :[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = COLOR_BACKGROUD_GRAY
//        self.tableView.estimatedRowHeight = 100
        self.tableView.separatorStyle = .none
        self.tableView.estimatedSectionFooterHeight = 0.0
        self.tableView.estimatedSectionHeaderHeight = 0.0
        self.tableView.showsVerticalScrollIndicator = false
        self.tableView.register(HAPageListCell.self, forCellReuseIdentifier: "PageListCell")
        self.setUpUI()
        self.tableView.tableHeaderView = self.headerView
        
    }
    
    func setUpUI() {
        self.headerView = UIView.init(frame: CGRect(x:0,y:0,width:SCREEN_WIDTH,height:180))
        self.headerView.backgroundColor = UIColor.white
        self.headerImageView = UIImageView.init(frame: CGRect(x:0,y:0,width:SCREEN_WIDTH,height:150))
        self.headerImageView.backgroundColor = UIColor.brown
        let resource = ImageResource.init(downloadURL:URL.init(string: tipsUrlString)!)
        self.headerImageView.kf.setImage(with: resource)
        self.headerView.addSubview(self.headerImageView)
        let lab = UILabel.init(frame: CGRect(x:0,y:160,width:SCREEN_WIDTH,height:20))
        lab.text = "—— 极力推荐 ——"
        lab.textAlignment = .center
        self.headerView.addSubview(lab)
        
    }
        // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 5
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PageListCell") as! HAPageListCell
        let resource = ImageResource.init(downloadURL: URL.init(string: self.listArray[indexPath.row])!)
         cell.leftImageView.kf.setImage(with: resource)
        return cell
        
    }
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 5.0
    }
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.1
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

   

}
