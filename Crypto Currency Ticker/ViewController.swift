//
//  ViewController.swift
//  Crypto Currency Ticker
//
//  Created by Matthew Riley on 8/13/17.
//  Copyright © 2017 Matthew Riley. All rights reserved.
//

import UIKit
import CrytpoTicker

class ViewController: UIViewController {

    @IBOutlet weak var previewCollectionView: UICollectionView!
    var previewDataSource = CTPreviewCollectionDatasource()
    var selectedItem : Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.previewCollectionView.dataSource = self.previewDataSource
        self.previewCollectionView.delegate = self
        self.getTickerInfo()
    }
    
    @IBAction func refresh(_ sender: UIBarButtonItem) {
        self.getTickerInfo()
    }
    
    func getTickerInfo() {
        CryptoTicker.getTickerInfo(limit: 20, convert: "USD") { (tickerInfo) -> (Void) in
            DispatchQueue.main.async {
                self.previewDataSource.cryptoInfo = tickerInfo ?? []
                self.previewCollectionView.reloadData()}
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let infoVC : CTInfoViewController = segue.destination as? CTInfoViewController {
            infoVC.ticker = self.previewDataSource.cryptoInfo[self.selectedItem ?? 0]}
    }
}

extension ViewController : UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.selectedItem = indexPath.item
        self.performSegue(withIdentifier: "showInfo", sender: self)
    }
}

