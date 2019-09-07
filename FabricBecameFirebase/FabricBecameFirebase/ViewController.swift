//
//  ViewController.swift
//  FabricBecameFirebase
//
//  Created by guillaume MAIANO on 07/09/2019.
//  Copyright © 2019 guillaume MAIANO. All rights reserved.
//

import UIKit
import Crashlytics

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Crashlytics.sharedInstance().crash()
    }


}

