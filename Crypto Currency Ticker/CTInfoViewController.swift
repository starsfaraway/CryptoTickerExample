//
//  CTInfoViewController.swift
//  Crypto Currency Ticker
//
//  Created by Matthew Riley on 8/13/17.
//  Copyright © 2017 Matthew Riley. All rights reserved.
//

import UIKit
import CrytpoTicker

class CTInfoViewController: UIViewController {
    
    var ticker : Ticker?

    @IBOutlet weak var infoTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.infoTextView.text = self.ticker?.getStringDescription()
    }

    

}
