//
//  PopAnimator.swift
//  expedition
//
//  Created by J.C Gigonnet on 28/05/2016.
//  Copyright © 2016 KLCT. All rights reserved.
//

import UIKit

class PopAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    let duration = 0.3
    var presenting = true
    var originFrame = CGRect.zero

    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?)-> NSTimeInterval {
        return duration
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        let containerView = transitionContext.containerView()!
        let toView = transitionContext.viewForKey(UITransitionContextToViewKey)!
        let weatherDetailsView = presenting ? toView : transitionContext.viewForKey(UITransitionContextFromViewKey)!
        
        let initialFrame = presenting ? originFrame : weatherDetailsView.frame
        let finalFrame = presenting ? weatherDetailsView.frame : originFrame
        
        let xScaleFactor = presenting ? initialFrame.width / finalFrame.width : finalFrame.width / initialFrame.width
        
        let yScaleFactor = presenting ?
            initialFrame.height / finalFrame.height :
            finalFrame.height / initialFrame.height
        
        let scaleTransform = CGAffineTransformMakeScale(xScaleFactor, yScaleFactor)
        
        if presenting {
            weatherDetailsView.transform = scaleTransform
            weatherDetailsView.center = CGPoint(
                x: CGRectGetMidX(initialFrame),
                y: CGRectGetMidY(initialFrame))
//            weatherDetailsView.clipsToBounds = true
            
        }
        
        containerView.addSubview(toView)
        containerView.bringSubviewToFront(weatherDetailsView)
        
        UIView.animateWithDuration(duration, delay:0.0,
                                   options: [],
                                   animations: {
                                    weatherDetailsView.transform = self.presenting ?
                                        CGAffineTransformIdentity : scaleTransform
                                    
                                    weatherDetailsView.center = CGPoint(x: CGRectGetMidX(finalFrame),
                                        y: CGRectGetMidY(finalFrame))
                                    
            }, completion:{_ in
                transitionContext.completeTransition(true)
        })
        
        let round = CABasicAnimation(keyPath: "cornerRadius")
        round.fromValue = presenting ? 20.0/xScaleFactor : 0.0
        round.toValue = presenting ? 0.0 : 20.0/xScaleFactor
        round.duration = duration / 2
        weatherDetailsView.layer.addAnimation(round, forKey: nil)
        weatherDetailsView.layer.cornerRadius = presenting ? 0.0 : 20.0/xScaleFactor
    }
}
