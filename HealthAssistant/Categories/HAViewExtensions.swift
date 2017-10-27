//
//  HAViewExtensions.swift
//  HealthAssistant
//
//  Created by ZQ on 2017/10/26.
//  Copyright © 2017年 DaisyLiLiFamilies. All rights reserved.
//

import UIKit

extension UIView {
    public var X:CGFloat {
        get {
            return self.frame.origin.x
    }
        set(value) {
            self.frame = CGRect(x:value,y:self.Y,width:self.W,height:self.H)
        }
}
    public var Y:CGFloat {
        get {
            return self.frame.origin.y
        }
        set (value) {
            self.frame = CGRect (x:self.X,y:value,width:self.W,height:self.H)
        }
}
    public var W:CGFloat {
        get{
            return self.frame.size.width
        }
        set(value){
            self.frame = CGRect(x:self.X,y:self.Y,width:value,height:self.H)
        }
}
    public var H:CGFloat {
        get{
            return self.frame.size.height
        }
        set(value){
            self.frame = CGRect(x:self.X,y:self.Y,width:self.W,height:value)
        }
        
    }
}
