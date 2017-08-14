//
//  CTPreviewCollectionDatasource.swift
//  Crypto Currency Ticker
//
//  Created by Matthew Riley on 8/13/17.
//  Copyright © 2017 Matthew Riley. All rights reserved.
//

import UIKit
import CrytpoTicker



class CTPreviewCollectionDatasource: NSObject, UICollectionViewDataSource {
    
    var cryptoInfo : [Ticker] = []
    
    var isNibRegistered : Bool = false
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.cryptoInfo.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if(!self.isNibRegistered){
           self.registerNib(collectionView: collectionView)}
        let item = indexPath.item
        if let cell : CTPreviewCVCell = collectionView.dequeueReusableCell(withReuseIdentifier: "previewCell", for: indexPath) as? CTPreviewCVCell {
            cell.populateCellFor(ticker: cryptoInfo[item])
            return cell
        }else{
            return CTPreviewCVCell()
        }
    }
    
    //NO HEADER OR FOOTER (SUPPLEMENTARY VIEW)
    
    //NO REORDERING
    
    //MARK: Register Nib
    
    func registerNib(collectionView : UICollectionView) {
        if(!isNibRegistered) {
            collectionView.register(UINib(nibName: "CTPreviewCVCell", bundle: nil), forCellWithReuseIdentifier: "previewCell")
        }
    }
}
