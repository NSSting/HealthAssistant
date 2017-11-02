//
//  HATipsCell.swift
//  HealthAssistant
//
//  Created by ZQ on 2017/11/1.
//  Copyright © 2017年 DaisyLiLiFamilies. All rights reserved.
//

import UIKit

class HATipsCell: UITableViewCell {

    var verticalLine: UIView!
    var titleLab: UILabel!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.verticalLine = UIView()
        self.verticalLine.backgroundColor = UIColor.green
        self.verticalLine.frame = CGRect(x:15,y:(self.H - 15)/2,width:5,height:15)
        self.contentView.addSubview(self.verticalLine)
        self.titleLab = UILabel.init()
        self.titleLab.text = "调养方案"
        self.contentView.addSubview(self.titleLab)
        self.titleLab.snp.makeConstraints { (make) in
            make.width.equalTo(100)
            make.height.equalTo(self.verticalLine.H)
            make.centerY.equalTo(self.contentView.center.y)
            make.left.equalTo(verticalLine.snp.right).offset(10)
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
