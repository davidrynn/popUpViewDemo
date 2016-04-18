//
//  ViewController.swift
//  PopUpViewTest
//
//  Created by Rynn, David on 3/29/16.
//  Copyright © 2016 Rynn, David. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let popUpViewController = DRViewController()
    var lastLocation: CGPoint = CGPointMake(0, 0)
    lazy var popUpViewY: CGFloat = {
        
        return self.view.height*4/5
        
    }()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.addChildViewController(popUpViewController)
        //        transitionFromViewController(self, toViewController: popUpViewController, duration: 0.33, options: .CurveEaseInOut, animations: nil, completion: nil)
        self.view.addSubview(popUpViewController.view)
        popUpViewController.didMoveToParentViewController(self)
        
        let panRecognizer = UIPanGestureRecognizer(target: self, action: "detectPan:")
        popUpViewController.view.gestureRecognizers = [panRecognizer]
    }
    
    //put viewdidlayout so that we know everything else is formatted correctly before subviews are layed out.
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        popUpViewController.view.frame = CGRectMake(0, self.popUpViewY, self.view.width, self.view.height)
        
    }
    
    func detectPan(recognizer: UIPanGestureRecognizer){
        
        let translation = recognizer.translationInView(self.view)
        self.popUpViewController.view.center.y = lastLocation.y + translation.y
        
        if recognizer.state == UIGestureRecognizerState.Ended {
            UIView.animateWithDuration(0.1, delay: 0.0, options: .CurveEaseInOut, animations: {
                if self.popUpViewController.view.center.y >= self.view.height {
                    self.popUpViewController.view.y = self.popUpViewY
                } else {
                    self.popUpViewController.view.centerVerticallyInSuperview()
                }
                }, completion: nil)
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        lastLocation = self.popUpViewController.view.center
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit {
        //remove observer eg
        popUpViewController.willMoveToParentViewController(nil)
        popUpViewController.removeFromParentViewController()
    }
    
    
}


