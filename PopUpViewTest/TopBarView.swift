//
//  TopBarView.swift
//  PopUpViewTest
//
//  Created by Rynn, David on 4/25/16.
//  Copyright © 2016 Rynn, David. All rights reserved.
//

import UIKit

class TopBarView: UIView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    class func instanceFromNib() ->TopBarView {
        return UINib(nibName: "TopBar", bundle: nil).instantiateWithOwner(nil, options: nil)
    }
}
