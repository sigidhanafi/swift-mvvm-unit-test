//
//  ViewModel.swift
//  MiniCart
//
//  Created by Sigit on 22/04/21.
//

class ViewModel {
    private let changeQuantityLabel: (Int) -> Void
    private let updateMessage: (String) -> Void
    private let resetViewTrigger: (Int, String) -> Void
    
    internal var quantity: Int
    internal var message: String = "Press Buy button to process your shopping cart"
    
    init(quantity: Int,
         changeQuantityLabel: @escaping (Int) -> Void,
         updateMessage: @escaping (String) -> Void,
         resetView: @escaping (Int, String) -> Void) {
        self.quantity = quantity
        self.changeQuantityLabel = changeQuantityLabel
        self.updateMessage = updateMessage
        self.resetViewTrigger = resetView
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
        if quantity >= 1 && quantity <= 5 {
            self.message = "Your shopping cart processed, thank you."
        } else {
            self.message = "Your shopping cart failed, please try again."
        }
        updateMessage(message)
    }
    
    func resetView() {
        quantity = 1
        message = "Press Buy button to process your shopping cart"
        
        resetViewTrigger(quantity, message)
    }
}
