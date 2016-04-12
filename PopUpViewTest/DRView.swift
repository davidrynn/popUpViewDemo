//
//  DRView.swift
//  PopUpViewTest
//
//  Created by Rynn, David on 3/29/16.
//  Copyright © 2016 Rynn, David. All rights reserved.
//

import UIKit

class DRView: UIView {
    var lastLocation: CGPoint = CGPointMake(0,0)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let panRecognizer = UIPanGestureRecognizer(target: self, action: "detectPan:")
        self.gestureRecognizers = [panRecognizer]
        
        if !UIAccessibilityIsReduceTransparencyEnabled() {
            self.backgroundColor = UIColor.clearColor()
            let blurEffect = UIBlurEffect(style: .Light)
            let blurView = UIVisualEffectView(effect: blurEffect)
            blurView.frame = self.bounds
            blurView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
            
            self.addSubview(blurView)
        } else {
            self.backgroundColor = UIColor.whiteColor()
        }
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func detectPan(recognizer: UIPanGestureRecognizer){
        if let superview = self.superview {
            let translation = recognizer.translationInView(superview)
            self.center = CGPointMake(lastLocation.x, lastLocation.y + translation.y)
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        //TODO: Remove subview to front?
        self.superview?.bringSubviewToFront(self)
        lastLocation = self.center
    }
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        //if self.frame is closer to top/bottom pop controller to top/bottom
        if let superCenter = self.superview?.center {
            if (lastLocation.y <= superCenter.y/2) {
                self.center = superCenter
            } else {
                self.center.y = superCenter.y/4
            }
        }
        
    }
    
    override func t
}
