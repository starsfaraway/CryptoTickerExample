//
//  CTPreviewCVCell.swift
//  Crypto Currency Ticker
//
//  Created by Matthew Riley on 8/13/17.
//  Copyright © 2017 Matthew Riley. All rights reserved.
//

import UIKit
import CrytpoTicker

class CTPreviewCVCell: UICollectionViewCell {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var tickerSymbol: UILabel!
    
    @IBOutlet weak var cryptoName: UILabel!
    @IBOutlet weak var cryptoPrice: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func populateCellFor(ticker : Ticker) {
        self.tickerSymbol.text = ticker.symbol
        self.cryptoName.text = ticker.name
        self.cryptoPrice.text = "$" + "\(ticker.price_usd?.doubleValue ?? 0.0)"
    }

}
