//
//  HASchemeCell.swift
//  HealthAssistant
//
//  Created by ZQ on 2017/11/9.
//  Copyright © 2017年 DaisyLiLiFamilies. All rights reserved.
//

import UIKit

class HASchemeCell: UITableViewCell {

    var icon: UIImageView!
    var contentLab: UILabel!
    var statueIcon: UIImageView!
    var sepreatLine = UIView()
    
        override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
            self.selectionStyle = .none
        setUpUI()
    }
    
       private func setUpUI() {
        self.icon = UIImageView.init()
        self.icon.bounds = CGRect(x:PADDING_LEFT_RIGHT,y:PADDING_LEFT_RIGHT,width:20,height:20)
        self.icon.center = CGPoint(x:PADDING_LEFT_RIGHT + 10,y: self.center.y)
        self.icon . image = UIImage.init(named: "notice")
        self.contentView.addSubview(self.icon)
    self.contentLab = UILabel.init()
    self.contentLab.textColor = COLOR_GREEN
    self.contentView.addSubview(self.contentLab)
    self.contentLab.snp.makeConstraints { (make) in
        make.left.equalTo(self.icon.snp.right).offset(PADDING_LEFT_RIGHT)
        make.centerY.equalTo(self.contentView.center.y)
        make.right.equalTo(self.contentView.snp.right).offset(-40)
        make.height.equalTo(30)
    }
    self.statueIcon = UIImageView.init()
    self.contentView.addSubview(self.statueIcon)
    self.statueIcon.image = UIImage.init(named: "down")
    self.statueIcon.snp.makeConstraints { (make) in
        make.right.equalTo(self.contentView.snp.right).offset(-PADDING_LEFT_RIGHT)
        make.centerY.equalTo(self.contentView.center.y)
        make.width.height.equalTo(30)
    }
        self.sepreatLine = UIView.init()
        self.sepreatLine.backgroundColor = COLOR_LINE_GRAY
        self.contentView.addSubview(self.sepreatLine)
        self.sepreatLine.snp.makeConstraints { (make) in
            make.left.equalTo(self.contentView.snp.left)
            make.right.equalTo(self.contentView.snp.right)
            make.bottom.equalTo(self.contentView.snp.bottom)
            make.height.equalTo(1)
        }
    }
    open var titleStr: String = "" {
        didSet {
            
            self.contentLab.text = self.titleStr
        }
    }

    //必要初始化器，当我们在子类定义了指定初始化器(包括自定义和重写父类指定初始化器)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
