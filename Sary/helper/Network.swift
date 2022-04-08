//
//  Network.swift
//  Sary
//
//  Created by EdfaPay on 08/04/2022.
//

import Foundation
import Alamofire

class Network{
    func createRequest(url:String,
                       method:HTTPMethod = .get,
                       params:[String:Any]? = nil,
                       token:String?=nil,
                       type:Int=0)->DataRequest{
        var headers =  HTTPHeaders()
    var parameters = Dictionary<String,Any>()
    if let para = params {
        parameters = para
    }
            headers["Authorization"] = "token eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6MjgxNTEyLCJ1c2VyX3Bob25lIjoiOTY2NTkxMTIyMzM0In0.phRQP0e5yQrCVfZiN4YlkI8NhXRyqa1fGRx5rvrEv0o"
            headers[" Device-Type"] = "ios"
            headers["App-Version"] = "5.5.0.0.0"
            headers["Accept-Language"] = "en"
            headers["Platform"] = "FLAGSHIP"
        let encoding: ParameterEncoding
        if method == .post {
            encoding = JSONEncoding.default
        } else {
            encoding = URLEncoding.default
        }


        let  request = AF.request(url,method:method,parameters: parameters,encoding: encoding,headers: headers ).validate()
        return request
        
    }
 
}
