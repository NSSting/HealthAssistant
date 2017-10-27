//
//  HACycleScrollViewCell.swift
//  HealthAssistant
//
//  Created by ZQ on 2017/10/26.
//  Copyright © 2017年 DaisyLiLiFamilies. All rights reserved.
//

import UIKit

class HACycleScrollViewCell: UICollectionViewCell {
    
    //标题
    var title: String = ""{
    didSet {
        titleLab.text = title
        if  title.characters.count > 0 {
            titleBackView.isHidden  =  false
            titleLab.isHidden = false
        } else {
            titleBackView.isHidden  =  true
            titleLab.isHidden = true
        }
        }
    }
    //标题颜色
    var titleLabelTextColor:UIColor! = UIColor.white {
        didSet {
            titleLab.textColor = titleLabelTextColor
        }
    }
    //标题字体
    var titleFont:UIFont = UIFont.systemFont(ofSize: 15) {
        didSet {
            titleLab.font = titleFont
        }
    }
    //文本行数
    var titleLines: NSInteger = 2{
        didSet {
            titleLab.numberOfLines = titleLines
        }
    }
    // 标题文本x轴间距
    var titleLabelLeading: CGFloat = 15 {
        didSet {
            setNeedsDisplay()
        }
    }
    // 标题背景色
    var titleBackViewBackgroundColor: UIColor = UIColor.black.withAlphaComponent(0.3) {
        didSet {
            titleBackView.backgroundColor = titleBackViewBackgroundColor
        }
    }
    
    // 标题Label高度
    var titleLabelHeight: CGFloat! = 56 {
        didSet {
            layoutSubviews()
        }
    }
    var titleBackView: UIView!
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLab()
        setupImaheView()
        setUpLabBackView()
    }
    //图片
    var imageView: UIImageView!
    fileprivate var titleLab: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //setupImageView默认模式
    fileprivate func setupImaheView() {
        imageView = UIImageView.init()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        self.contentView.addSubview(imageView)
    }
    //setuplab backView
    fileprivate func setupLab(){
        titleLab = UILabel.init()
        titleLab.isHidden = true
        titleLab.textColor = UIColor.white
        titleLab.numberOfLines = 1
        titleLab.backgroundColor = UIColor.clear
        
    }
    fileprivate func setUpLabBackView() {
        titleBackView = UIView.init()
        titleBackView.backgroundColor = UIColor.clear
        self.contentView.addSubview(titleBackView)
    }
    
    // MARK: layoutSubviews
    override func layoutSubviews() {
        super.layoutSubviews()
        
        imageView.frame = self.bounds
        titleBackView.frame = CGRect.init(x: 0, y: self.H - titleLabelHeight, width: self.W, height: titleLabelHeight)
        titleLab.frame = CGRect.init(x: titleLabelLeading, y: 0, width: self.W - titleLabelLeading - 5, height: titleLabelHeight)
    }
}
