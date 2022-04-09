//
//  BannnerItemCell.swift
//  Sary
//
//  Created by EdfaPay on 08/04/2022.
//

import UIKit
import AlamofireImage
class BannnerItemCell: UICollectionViewCell {
    static let reuseIdentifer = "BannnerItemCell"

    @IBOutlet weak var imgViewBanner: UIImageView!
    
    var banner:BannerResult?{
        didSet{
            if let bannerData = banner,let url = URL(string: bannerData.photo){
            imgViewBanner.af.setImage(withURL: url)
            }
           
        }
    }
    var sliderBanner:Datum?{
        didSet{
            if let bannerData = sliderBanner,let url = URL(string: bannerData.image ?? ""){
                debugPrint(url)
            imgViewBanner.af.setImage(withURL: url)
            }
           
        }
    }
    
}
