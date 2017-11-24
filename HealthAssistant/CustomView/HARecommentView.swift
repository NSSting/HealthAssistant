//
//  HARecommentView.swift
//  HealthAssistant
//
//  Created by ZQ on 2017/11/7.
//  Copyright © 2017年 DaisyLiLiFamilies. All rights reserved.
//

import UIKit

class HARecommentView: UIView {
    
    var titleLab: UILabel!
    var recommendLab: UILabel!
    var iconImageView: UIImageView!

    var labH: CGFloat!
    var labW: CGFloat!
    let  leftMargin: CGFloat = 5.0
    let  topMargin:CGFloat = 5.0
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        labH = (frame.size.height - topMargin * 2)/2
        labW = (frame.size.width - leftMargin * 2)/2
        setUpUI()
        
    }
    func setUpUI() {
        
        self.recommendLab = UILabel.init()
        self.recommendLab.text = "三餐"
        self.recommendLab.frame = CGRect(x:5,y:topMargin ,width:labW,height:labH)
        self.recommendLab.textColor = COLOR_GREEN
        self.recommendLab.textAlignment = .left
        self.recommendLab.sizeToFit()
        self.addSubview(self.recommendLab)
        
        
        self.titleLab = UILabel.init()
        self.titleLab.textColor = UIColor.black
        self.titleLab.textAlignment = .left
        self.titleLab.text = "幸运水果:椰子"
        self.titleLab.frame = CGRect(x:5,y:topMargin + labH,width:labW,height:labH)
        self.titleLab.sizeToFit()
        self.addSubview(self.titleLab)
        
        //icon图片
        self.iconImageView = UIImageView.init()
        self.iconImageView.layer.cornerRadius = 5
        self.iconImageView.clipsToBounds = true
        self.iconImageView.frame = CGRect(x:labW * 2 ,y: topMargin + 5,width:40 ,height:40)
        self.addSubview(iconImageView)
    }
    
  open var titleArray: Array<String> = [] {
        didSet {
            if self.titleArray.count > 0 {
              self.recommendLab.text = self.titleArray[0]
              self.titleLab.text = self.titleArray[1]
            }
        }
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

