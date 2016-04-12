//
//  ViewController.swift
//  PopUpViewTest
//
//  Created by Rynn, David on 3/29/16.
//  Copyright © 2016 Rynn, David. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let popUpView = DRViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // self.addChildViewController(popUpView)
        popUpView.view.frame = CGRectMake(0, self.view.frame.size.height/2, self.view.frame.size.width, self.view.frame.size.height)
        self.view.addSubview(popUpView.view)

        
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

