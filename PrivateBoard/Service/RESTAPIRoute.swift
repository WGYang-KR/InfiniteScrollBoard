//
//  RESTAPIRoute.swift
//  PrivateBoard
//
//  Created by WG Yang on 2022/08/03.
//

import Foundation

protocol RESTAPIRoute {
    var path: String { get }
    var method: RESTAPIMethod { get }
    var params: [String:Any]? { get }
}
