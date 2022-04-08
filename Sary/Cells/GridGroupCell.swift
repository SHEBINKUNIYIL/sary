//
//  GridGroupCell.swift
//  Sary
//
//  Created by EdfaPay on 09/04/2022.
//

import UIKit

class GridGroupCell: UICollectionViewCell {
    static let reuseIdentifer = "GridGroupCell"
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblTittle: UILabel!
    var data:Datum?{
        didSet{

            if let gridSmartData = data,let url = URL(string: gridSmartData.image ?? ""){

                imgView.af.setImage(withURL: url)
            }
            lblTittle.text = data?.name
           
        }
    }
}
