//
//  HAPushTransitionAnimation.swift
//  HealthAssistant
//
//  Created by ZQ on 2017/10/24.
//  Copyright © 2017年 DaisyLiLiFamilies. All rights reserved.
//

import UIKit

class HAPushTransitionAnimation: NSObject, UIViewControllerAnimatedTransitioning {
    //转场时间
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.8
    }
    //转场的viewcontroller
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let fromeVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)
        let toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)
        toVC?.view.frame = CGRect(x:0,y:-SCREEN_HEIGHT,width:SCREEN_WIDTH,height:SCREEN_HEIGHT)
        transitionContext.containerView.addSubview((toVC?.view)!)
        
        UIView.animate(withDuration: 0.5, animations: {
            toVC?.view.frame = CGRect(x:0,y:0,width:SCREEN_WIDTH,height:SCREEN_HEIGHT)
            fromeVC?.view.frame = CGRect(x:0,y: SCREEN_HEIGHT,width:SCREEN_WIDTH,height:SCREEN_HEIGHT)
        }) { (finished) in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
    }
}
