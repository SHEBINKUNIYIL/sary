//
//  ViewController.swift
//  Sary
//
//  Created by EdfaPay on 08/04/2022.
//

import UIKit
import RxSwift
class HomeViewController: UIViewController {
    let homeVm = HomeVM()
    let disposeBag = DisposeBag()
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        homeVm.bannerApiCall()
        homeVm.catalogApiCall()
        self.homeVm.banners.subscribe(onNext: { (banners) in
            self.collectionView.reloadData()
        }).disposed(by: disposeBag)
        self.homeVm.cataloges.subscribe(onNext: { (banners) in
            self.collectionView.reloadData()
        }).disposed(by: disposeBag)
    }
}

extension HomeViewController:UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        switch indexPath.section {
        case 0:
            let width  = (collectionView.frame.width)
            return CGSize(width: width, height: 200)
        default:
            
            let catalog =  self.homeVm.cataloges.value[indexPath.section-1]
            if catalog.uiType == .grid && catalog.dataType == .smart{
                let rowCount  = catalog.rowCount
                let totalSpace = CGFloat((rowCount)*20)
                let width  = (collectionView.frame.width-totalSpace)/CGFloat(rowCount)
                return CGSize(width: width, height: width+50)
            }
            
            else if catalog.uiType == .slider && catalog.dataType == .banner{
                let width  = (collectionView.frame.width-20)
                let height = width*(268/1000)
                return CGSize(width: width, height: height)
                
            }
            else if catalog.uiType == .grid && catalog.dataType == .group{
                let rowCount  = catalog.rowCount
                let totalSpace = CGFloat((rowCount)*20)
                let width  = (collectionView.frame.width-totalSpace)/CGFloat(rowCount)
                return CGSize(width: width, height: width+50)
                
            }
            else if catalog.uiType == .slider && catalog.dataType == .group{
                let rowCount  = catalog.rowCount
                let totalSpace = CGFloat((rowCount)*20)
                let width  = (collectionView.frame.width-totalSpace)/CGFloat(rowCount)
                return CGSize(width: width, height: width+50)
            }
            else{
                
                let width  = (collectionView.frame.width/4)
                return CGSize(width: width, height: width+50)
            }
        }
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SectionHeader.reuseIdentifer, for: indexPath) as! SectionHeader
        if kind == UICollectionView.elementKindSectionHeader && self.homeVm.cataloges.value.count>0 && self.homeVm.banners.value.count>0 {
            switch indexPath.section {
            case 0:
                return sectionHeader
                
            default:
                let catalog =  self.homeVm.cataloges.value[indexPath.section-1]
                if catalog.showTitle {
                    
                    sectionHeader.lblTittle.text = catalog.title
                    return sectionHeader
                }
                return sectionHeader
            }
        } else { //No footer in this case but can add option for that
            return sectionHeader
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        switch section {
        case 0:
            return CGSize(width: collectionView.frame.width, height: 0)
        default:
            let catalog =  self.homeVm.cataloges.value[section-1]
            if catalog.showTitle && catalog.data.count>0 {
                return CGSize(width: collectionView.frame.width, height: 30)
            }
            return CGSize(width: collectionView.frame.width, height: 0)
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BannerCollectionViewCell.reuseIdentifer, for: indexPath) as! BannerCollectionViewCell
            cell.banners = self.homeVm.banners.value
            return cell
            
        default:
            let catalog =  self.homeVm.cataloges.value[indexPath.section-1]
            if catalog.uiType == .grid && catalog.dataType == .smart{
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GridSmartCell.reuseIdentifer, for: indexPath) as! GridSmartCell
                let data =  self.homeVm.cataloges.value[indexPath.section-1].data[indexPath.row]
                cell.data = data
                
                return cell
            }
            else if catalog.uiType == .slider && catalog.dataType == .banner{
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BannerCollectionViewCell.reuseIdentifer, for: indexPath) as! BannerCollectionViewCell
                cell.sliderBanner = catalog.data
                return cell
            }
            else if catalog.uiType == .grid && catalog.dataType == .group{
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GridGroupCell.reuseIdentifer, for: indexPath) as! GridGroupCell
                let data =  self.homeVm.cataloges.value[indexPath.section-1].data[indexPath.row]
                cell.data = data
                
                return cell
                
            }
            else if catalog.uiType == .slider && catalog.dataType == .group{
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GridGroupCell.reuseIdentifer, for: indexPath) as! GridGroupCell
                let data =  self.homeVm.cataloges.value[indexPath.section-1].data[indexPath.row]
                cell.data = data
                
                return cell
                
            }
            else{
                //                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Emptycell", for: indexPath) as! UICollectionViewCell
                //
                //
                //                return cell
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GridGroupCell.reuseIdentifer, for: indexPath) as! GridGroupCell
                let data =  self.homeVm.cataloges.value[indexPath.section-1].data[indexPath.row]
                cell.data = data
                
                return cell
            }
        }
        
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        let catalogCount = self.homeVm.cataloges.value.count
        return catalogCount+1
    }
    func collectionView(_ collectionView: UICollectionView,numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return self.homeVm.banners.value.count>0 ? 1 : 0
            
        default:
            
            let catalog =  self.homeVm.cataloges.value[section-1]
            if catalog.uiType == .grid && (catalog.dataType == .smart || catalog.dataType == .banner || catalog.dataType == .group){
                return catalog.data.count
            }
            else if catalog.uiType == .slider && catalog.dataType == .group{
                return catalog.data.count
            }
            return catalog.data.count
        }
    }
}
