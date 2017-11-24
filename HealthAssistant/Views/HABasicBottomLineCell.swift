//
//  HABasicBottomLineCell.swift
//  HealthAssistant
//
//  Created by ZQ on 2017/11/22.
//  Copyright © 2017年 DaisyLiLiFamilies. All rights reserved.
//

import UIKit

class HABasicBottomLineCell: UITableViewCell {

    var horizonLine: UIView!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.horizonLine = UIView.init(frame:CGRect(x:0,y:self.H,width:SCREEN_WIDTH,height:1))
        self.horizonLine.backgroundColor = COLOR_LINE_GRAY
        self.contentView.addSubview(self.horizonLine)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
