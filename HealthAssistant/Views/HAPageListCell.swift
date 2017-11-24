//
//  HAPageListCell.swift
//  HealthAssistant
//
//  Created by ZQ on 2017/11/22.
//  Copyright © 2017年 DaisyLiLiFamilies. All rights reserved.
//

import UIKit

class HAPageListCell: UITableViewCell {
    var leftImageView = UIImageView()
    var bottomLine = UIView()
    var kindLab = UILabel()
    var effectLab = UILabel()
    

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpUI()
    }
    
     func setUpUI()  {
        
        self.leftImageView = UIImageView.init()
        self.leftImageView.center = CGPoint(x:PADDING_LEFT_RIGHT + 30,y:self.contentView.center.y)
        self.leftImageView.image = UIImage.init(named: "recommendFood")
        self.contentView.addSubview(leftImageView)
        self.leftImageView.snp.makeConstraints { (make) in
            make.left.equalTo(self.contentView.snp.left).offset(PADDING_LEFT_RIGHT)
            make.width.equalTo(100)
            make.top.equalTo(self.contentView.snp.top).offset(PADDING_LEFT_RIGHT)
            make.height.equalTo(70)
        }
        
        
        self.kindLab = UILabel.init()
        self.kindLab.text = "绿叶蔬菜"
        self.contentView.addSubview(self.kindLab)
        self.kindLab.snp.makeConstraints { (make) in
            make.left.equalTo(self.leftImageView.snp.right).offset(10)
            make.right.equalTo(self.contentView.snp.right)
            make.top.equalTo(self.leftImageView.snp.top)
        }
        
        self.bottomLine = UIView.init()
        self.bottomLine.backgroundColor = COLOR_LINE_GRAY
        self.contentView.addSubview(self.bottomLine)
        self.bottomLine.snp.makeConstraints { (make) in
            make.left.equalTo(self.contentView.snp.left)
            make.right.equalTo(self.contentView.snp.right)
            make.height.equalTo(1)
            make.bottom.equalTo(self.contentView.snp.bottom)
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
