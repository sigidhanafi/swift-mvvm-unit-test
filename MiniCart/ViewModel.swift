//
//  ViewModel.swift
//  MiniCart
//
//  Created by Sigit on 22/04/21.
//

class ViewModel {
    private let changeQuantityLabel: (Int) -> Void
    
    internal var quantity: Int
    
    init(quantity: Int, changeQuantityLabel: @escaping (Int) -> Void) {
        self.quantity = quantity
        self.changeQuantityLabel = changeQuantityLabel
    }
    
    func minusButtonTapped() {
        if quantity > 1 {
            quantity -= 1
            
            changeQuantityLabel(quantity)
        }
    }
    
    func plusButtonTapped() {
        if quantity < 5 {
            quantity += 1
            
            changeQuantityLabel(quantity)
        }
    }
    
    func buyButtonTapped() {
        
    }
}
