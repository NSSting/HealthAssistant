
//
//  HADIYHeader.swift
//  HealthAssistant
//
//  Created by ZQ on 2017/11/2.
//  Copyright © 2017年 DaisyLiLiFamilies. All rights reserved.
//

import UIKit
import MJRefresh

class HADIYHeader: MJRefreshHeader {
    var titleLab = UILabel()
    var headerImage = UIImageView()
    
   override func prepare() {
        super.prepare()
    //设置空间高度
    self.mj_h = 50
    //添加lab
    let lab = UILabel.init()
    lab.text = "开始刷新"
    lab.textColor = UIColor.red
    lab.font = UIFont.boldSystemFont(ofSize: 15)
    lab.textAlignment = .center
//    self.addSubview(lab)
    self.titleLab = lab
    
    
    //添加图片
    let imageView = UIImageView.init()
    imageView.image = UIImage.init(named: "quick")
    self.addSubview(imageView)
    self.headerImage = imageView
    
    
    }
  override  func placeSubviews() {
    super.placeSubviews()
//    self.titleLab.frame = self.bounds
    self.headerImage.bounds = CGRect(x:0,y:0,width:50,height:50)
    self.headerImage.center = CGPoint(x:self.mj_w * 0.5,y: 10)
    }
    override func scrollViewContentOffsetDidChange(_ change: [AnyHashable : Any]!) {
        super.scrollViewContentOffsetDidChange(change)
    }
    override func scrollViewContentSizeDidChange(_ change: [AnyHashable : Any]!) {
        super.scrollViewContentSizeDidChange(change)
    }
    override func scrollViewPanStateDidChange(_ change: [AnyHashable : Any]!) {
        super.scrollViewPanStateDidChange(change)
    }
    func setState(state:MJRefreshState) {
        switch state {
        case .idle:
            self.titleLab.text = ""
           break
        case .pulling:
            
            break
        case .refreshing:
            self.titleLab.text = "刷新数据中...."
            break
        case .willRefresh:
            self.titleLab.text = "即将刷新数据"
            break
        default:
            break
        }
    }
    
}
