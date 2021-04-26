//
//  MockAPIService.swift
//  MiniCartTests
//
//  Created by Sigit on 26/04/21.
//

import Foundation

@testable import MiniCart

class MockAPIService:  APIServiceProtocol{
    
    var product: Product = Product(name: "name", price: "price")
    var onSuccess: ((Product) -> Void)?
    
    func fetchProductData(onSuccess: @escaping (Product) -> Void) {
        onSuccess(product)
    }
}
