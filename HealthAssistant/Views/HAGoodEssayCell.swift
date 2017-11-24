//
//  HAGoodEssayCell.swift
//  HealthAssistant
//
//  Created by ZQ on 2017/11/20.
//  Copyright © 2017年 DaisyLiLiFamilies. All rights reserved.
//

import UIKit

class HAGoodEssayCell: UITableViewCell {

    var textLab: UILabel = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor .white
        self.selectionStyle = .none
        self.setUpUI()
    }
    
   
    func setUpUI() {
        self.textLab = UILabel.init()
        self.textLab.numberOfLines = 0
        self.textLab.textAlignment = .left
        self.textLab.text = "寒冬季节注意保暖寒冬季意保暖寒冬季节注节注意注节注意保暖寒冬季节注节注意保暖寒冬季节注节注意保暖寒冬季节注意保暖"
        self.textLab.frame = CGRect(x: PADDING_LEFT_RIGHT,y: PADDING_LEFT_RIGHT,width: SCREEN_WIDTH / 2,height:32)
        self.textLab.sizeToFit()
        self.addSubview(self.textLab)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
