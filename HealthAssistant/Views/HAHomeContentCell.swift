//
//  HAHomeContentCell.swift
//  HealthAssistant
//
//  Created by ZQ on 2017/11/10.
//  Copyright © 2017年 DaisyLiLiFamilies. All rights reserved.
//

import UIKit

class HAHomeContentCell: UITableViewCell {
    var titleLab: UILabel!
    var textLab: UILabel!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = COLOR_BACKGROUD_GRAY
        setUpUI()
        
    }
        func setUpUI() -> Void {
        //时间节气
        self.titleLab = UILabel.init()
        self.textLab = UILabel.init()
        self.textLab.text = "五方运中汤五方运中汤五方运中汤五方运中汤五方运中汤方运中汤五方运中汤五方运中汤方运中汤五方运中汤五方运中汤方运中汤五方运中汤五方运中汤方运中汤五方运中汤五方运中汤"
        self.textLab.textAlignment = .left
        self.textLab.textColor = UIColor.lightGray
        self.textLab.font = UIFont.boldSystemFont(ofSize: 15)
        self.textLab.numberOfLines = 0
        self.contentView.addSubview(self.textLab)
        self.textLab.snp.makeConstraints { (make) in
                make.left.equalTo(self.contentView.snp.left).offset(PADDING_LEFT_RIGHT)
                make.top.equalTo(self.contentView.snp.top).offset(PADDING_LEFT_RIGHT)
                make.right.equalTo(self.contentView.snp.right).offset(-PADDING_LEFT_RIGHT)
            }
            
    }
    
    open var detailStr: String = "" {
        didSet {
            self.textLab.text = self.detailStr
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
