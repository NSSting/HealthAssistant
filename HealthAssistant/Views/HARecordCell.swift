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
    var recommendLab: HARecommentView!
    var mealView: HARecommentView!
    var horizonLine: UIView!
    
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
     super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
       setUpUI()
        
    }
    func setUpUI() -> Void {
        //时间节气
        self.dateLab = UILabel.init()
        self.dateLab.textColor = COLOR_GREEN
        self.dateLab.text = "避 过\n风 早\n如 锻\n避 炼\n箭"
        self.dateLab.numberOfLines = 0
        self.contentView.addSubview(self.dateLab)
        //标签高度是单元格宽度的一半
        self.dateLab.snp.makeConstraints { (make) in
            make.left.equalTo(self.contentView.snp.left).offset(PADDING_LEFT_RIGHT)
            make.centerY.equalTo(self.contentView.snp.centerY)
            make.width.equalTo((self.W - PADDING_LEFT_RIGHT * 2) / 2)
            make.height.equalTo((self.W - PADDING_LEFT_RIGHT * 2) / 2)
        }
        //分离线
        self.verticalLine = UIView.init()
        self.verticalLine.backgroundColor = COLOR_LINE_GRAY
        self.verticalLine.alpha = 0.5
        self.verticalLine.frame = CGRect (x:(self.W - PADDING_LEFT_RIGHT * 2) / 2 + PADDING_LEFT_RIGHT,y:PADDING_LEFT_RIGHT,width:1,height:(self.W - PADDING_LEFT_RIGHT * 2)/2)
        self.contentView.addSubview(self.verticalLine)

        self.recommendLab = HARecommentView.init(frame: CGRect(x:self.verticalLine.X + 6,y:PADDING_LEFT_RIGHT,width:self.W - self.verticalLine.X - PADDING_LEFT_RIGHT,height:self.verticalLine.H / 2))
        self.recommendLab.titleArray = ["三餐","幸运水果:樱桃"]
        self.recommendLab.iconImageView.image = UIImage.init(named: "recommendFood")
        self.contentView.addSubview(self.recommendLab)
        
        
        self.mealView = HARecommentView.init(frame: CGRect(x:self.verticalLine.X + 6,y:self.verticalLine.H / 2 + PADDING_LEFT_RIGHT,width:self.recommendLab.W,height:self.verticalLine.H / 2))
        self.mealView.titleArray = ["起居","恢复精神法"]
        self.mealView.iconImageView.image = UIImage.init(named: "recommend_live")
        self.contentView.addSubview(self.mealView)
        
        //横向分割
        self.horizonLine = UIView.init()
        self.horizonLine.frame = CGRect(x:self.verticalLine.X + 1,y:self.mealView.Y,width:SCREEN_WIDTH - self.verticalLine.X,height:1)
        self.horizonLine.backgroundColor = COLOR_LINE_GRAY
        self.horizonLine.alpha = 0.5
        self.contentView.addSubview(self.horizonLine)
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
