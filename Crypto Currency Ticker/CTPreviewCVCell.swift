//
//  CTPreviewCVCell.swift
//  Crypto Currency Ticker
//
//  Created by Matthew Riley on 8/13/17.
//  Copyright © 2017 Matthew Riley. All rights reserved.
//

import UIKit
import CrytpoTicker
import SDWebImage

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
        
        if let sym = ticker.symbol {
            if let urlString = self.urlFor(symbol: sym) {
                iconImageView.sd_setShowActivityIndicatorView(true)
                iconImageView.sd_setIndicatorStyle(.whiteLarge)
                iconImageView.sd_setImage(with: URL(string: urlString), placeholderImage: #imageLiteral(resourceName: "coinPlaceholder"))
            }else{
                self.iconImageView.image = #imageLiteral(resourceName: "coinPlaceholder")
            }
        }
        
    }
    
    //used since I haven't stored many images on the website, if all were stored, then I could construct URL to retrieve image
    func urlFor(symbol : String) -> String? {
        
        switch symbol {
            case "BTC":
            return "https://farawaystars.com/cryptoImages/BTC.png"
            case "BCH":
            return "https://farawaystars.com/cryptoImages/BCH.png"
            case "ETH":
            return "https://farawaystars.com/cryptoImages/ETH.png"
            case "ETC":
            return "https://farawaystars.com/cryptoImages/ETC.png"
            case "XMR":
            return "https://farawaystars.com/cryptoImages/XMR.png"
            case "DASH":
            return "https://farawaystars.com/cryptoImages/DASH.png"
            case "ZEC":
            return "https://farawaystars.com/cryptoImages/ZEC.png"
            
            
        default:
            return nil
        }
    }

}
