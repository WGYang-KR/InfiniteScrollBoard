//
//  RESTAPIManager.swift
//  PrivateBoard
//
//  Created by WG Yang on 2022/08/03.
//

import Foundation
import Alamofire


class YHAPIService {
    static let shared = YHAPIService()
    private init() { }
    
    let baseURL = BaseURL.YHAPI
    
    typealias requestJSONCallBack<T> = (_ decodedData: T?, _ responseSuccess:Bool) -> Void
    func requestJSON<T>(route: RESTAPIRoute, completion: @escaping requestJSONCallBack<T> ) where T: Codable {
        let requestURL = "\(baseURL)\(route.path)"
        let encoding: ParameterEncoding = (route.method == .GET) ? URLEncoding.default : JSONEncoding.default
        let httpMethod = HTTPMethod(rawValue: route.method.rawValue)
        
        AF.request(requestURL, method: httpMethod, parameters: route.params, encoding: encoding, headers: ["Content-Type": "application/json", "Accept": "application/json"])
            .responseData(completionHandler: { response in
                switch response.result {
                case .success(let jsonData):
                    //통신성공
                    //디코딩
                    do {
                        print(String(bytes: jsonData, encoding: String.Encoding.utf8))
                        let decodedData = try JSONDecoder().decode(T.self, from: jsonData)
                        completion(decodedData, true)
                    }
                    catch(let error) {
                        print("Failure Decoding: \(error)")
                        completion(nil,true)
                    }
                case .failure(let error):
                    //통신실패
                    //전체통신내용출력
                    print("Failure Response: \(response)")
                    print("Error:\(error)")
                    completion(nil,false)
                }
            })
    }
   
}

