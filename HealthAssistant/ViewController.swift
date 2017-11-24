//
//  ViewController.swift
//  HealthAssistant
//
//  Created by ZQ on 2017/10/19.
//  Copyright © 2017年 DaisyLiLiFamilies. All rights reserved.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {
    var applyImageView = UIImageView()
    var scrolToTopBtn = UIButton ()
    var isScrol = Bool()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "引导页"
        self.view.backgroundColor = UIColor.red
        //广告
        self.applyImageView = UIImageView.init(frame: CGRect(x: 0,y: 0,width: SCREEN_WIDTH,height: SCREEN_HEIGHT))
        self.applyImageView.isUserInteractionEnabled = true
        let resource = ImageResource.init(downloadURL: URL.init(string: "http://img.huofar.com/life/card/19_1.jpg")!, cacheKey: "my_cache")
        self.applyImageView.kf.setImage(with: resource)
        self.view.addSubview(self.applyImageView)
        
        //上滑按钮
        self.scrolToTopBtn = UIButton.init(type: .custom)
        self.scrolToTopBtn.alpha = 0.5
        self.scrolToTopBtn.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        self.scrolToTopBtn.frame = CGRect(x: (SCREEN_WIDTH - 120)/2,y: SCREEN_HEIGHT - 90,width: 120 ,height: 30)
        self.scrolToTopBtn.layer.cornerRadius = 15
        self.scrolToTopBtn.clipsToBounds = true
        self.scrolToTopBtn.backgroundColor = UIColor.black
        self.scrolToTopBtn.setTitleColor(UIColor.white, for: .normal)
        self.scrolToTopBtn.setTitle("⇪⇪ 上滑进入主页", for: .normal)
        self.applyImageView.addSubview(self.scrolToTopBtn)
        
        self.scrolToTopBtn.addTarget(self, action: #selector(btnEvent), for: UIControlEvents.touchUpInside);
        
        let recognizer = UISwipeGestureRecognizer.init(target: self, action: #selector(btnEvent))
        recognizer.direction = .up
        self.applyImageView.addGestureRecognizer(recognizer);
        
          }
    
    @objc func btnEvent(){
        self.navigationController?.popViewController(animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

