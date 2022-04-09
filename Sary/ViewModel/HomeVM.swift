//
//  HomeVM.swift
//  Sary
//
//  Created by SHEBIN on 08/04/2022.
//

import Foundation
import RxCocoa

class HomeVM{
    
    let banners: BehaviorRelay<[BannerResult]> = BehaviorRelay(value: [])
    let cataloges: BehaviorRelay<[Result]> = BehaviorRelay(value: [])

    func bannerApiCall(){
        let request =  Network().createRequest(url: ApiUrl.bannerUrl)
        request.responseDecodable(of: Banner.self) { (response) in
            if let bannerValue = response.value?.result{
                self.banners.accept(bannerValue)
            }
        }
    }
    
    
    func catalogApiCall(){
        let request =  Network().createRequest(url:ApiUrl.catalogurl)
        request.responseDecodable(of:Catalog.self) { (response) in
            if let cateloges = response.value?.result{
                self.cataloges.accept(cateloges)
            }
        }
    }
    
    
}
