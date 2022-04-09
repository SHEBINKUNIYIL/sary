//
//  BannerCollectionViewCell.swift
//  Sary
//
//  Created by SHEBIN on 08/04/2022.
//

import UIKit

class BannerCollectionViewCell: UICollectionViewCell {
    static let reuseIdentifer = "BannerCollectionViewCell"

    @IBOutlet weak var collectionViewBanner: UICollectionView!
    
  
    var banners:[BannerResult]?{
        didSet{
            self.collectionViewBanner.reloadData()
        }
    }
    
    var sliderBanner:[Datum]?{
        didSet{
            self.collectionViewBanner.reloadData()
        }
    }
    
    
    
}
extension BannerCollectionViewCell:UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
       {
               // In this function is the code you must implement to your code project if you want to change size of Collection view
               let width  = (collectionView.frame.width)
           return CGSize(width: width, height: collectionView.frame.height)
       }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BannnerItemCell.reuseIdentifer, for: indexPath) as! BannnerItemCell
        if let banner = self.banners{
        cell.banner = banner[indexPath.row]
        }
        else if  let sliders = self.sliderBanner{
            cell.sliderBanner = sliders[indexPath.row]

        }
        return cell
    }
   
    func collectionView(_ collectionView: UICollectionView,        numberOfItemsInSection section: Int) -> Int {
         // myData is the array of items
        if let banner = self.banners{
        return banner.count
        }
        else{
            return self.sliderBanner?.count ?? 0

        }

    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let banner = self.banners{
       let banner = banner[indexPath.row]
            Toast().show(message: banner.link)
        }
        else if  let sliders = self.sliderBanner{
          let sliderBanner = sliders[indexPath.row]
            Toast().show(message: sliderBanner.deepLink ?? "")


        }
    }
}
