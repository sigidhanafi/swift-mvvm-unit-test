//
//  Service.swift
//  MiniCart
//
//  Created by Sigit on 26/04/21.
//

import Foundation

enum APIError: String, Error {
    case noNetwork = "No Network"
    case serverOverload = "Server is overloaded"
    case permissionDenied = "You don't have permission"
}

protocol APIServiceProtocol {
    func fetchProductData(onSuccess: @escaping (_ data: Product) -> Void)
}

class APIService: APIServiceProtocol {
    func fetchProductData(onSuccess: @escaping (Product) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let product = Product(name: "iPhone 12 Mini Grey", price: "IDR 12.000.000")
            
            onSuccess(product)
        }
    }
}
