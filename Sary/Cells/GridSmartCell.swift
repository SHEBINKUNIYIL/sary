//
//  GridSmartCell.swift
//  Sary
//
//  Created by SHEBIN on 08/04/2022.
//

import UIKit

class GridSmartCell: UICollectionViewCell {
    static let reuseIdentifer = "GridSmartCell"
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
