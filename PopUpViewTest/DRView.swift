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
    
    @IBOutlet private weak var label: UILabel!
    
    var labelTitle: String {
        get {
            return label.text ?? ""
        }
        set {
            label.text = newValue
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.transparencySetup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.transparencySetup()
        
    }


    class func instanceFromNib() -> DRView {
        return UINib(nibName: "DRView", bundle: nil).instantiateWithOwner(nil, options: nil)[0] as! DRView
    }
    
    private func transparencySetup() {
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
    override func layoutSubviews() {
        super.layoutSubviews()
        self.label.center = self.center
        self.bringSubviewToFront(label)
    }
}
