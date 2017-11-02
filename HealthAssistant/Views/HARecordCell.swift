//
//  HARecordCell.swift
//  HealthAssistant
//
//  Created by ZQ on 2017/10/24.
//  Copyright © 2017年 DaisyLiLiFamilies. All rights reserved.
//

import UIKit
import SnapKit

class HARecordCell: UITableViewCell {
    var verticalLine: UIView!
    var titleLab: UILabel!
    var dateLab: UILabel!
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
     super.init(style: style, reuseIdentifier: reuseIdentifier)
       setUpUI()
        
    }
    func setUpUI() -> Void {
        self.verticalLine = UIView.init()
        self.verticalLine.backgroundColor = UIColor .green
        self.contentView.addSubview(self.verticalLine)
        self.verticalLine.snp.makeConstraints { (make) in
            make.right.equalTo(self.contentView.snp.right)
            make.width.equalTo(1)
            make.height.equalTo(self.H)
            make.top.equalTo(self.contentView.snp.top)
        }
        self.dateLab = UILabel.init()
        self.dateLab.backgroundColor = UIColor.yellow
        self.dateLab.text = "舒\n伸\n腿\n足"
        self.dateLab.numberOfLines = 0
        self.contentView.addSubview(self.dateLab)
        self.dateLab.snp.makeConstraints { (make) in
            make.left.equalTo(self.contentView.snp.left).offset(15)
            make.centerY.equalTo(self.contentView.snp.centerY)
            make.width.equalTo((self.W - PADDING_LEFT_RIGHT * 2) / 2)
            make.height.equalTo((self.W - PADDING_LEFT_RIGHT * 2) / 2)
        }
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
