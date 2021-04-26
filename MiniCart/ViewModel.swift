//
//  ViewModel.swift
//  MiniCart
//
//  Created by Sigit on 22/04/21.
//

class ViewModel {
    internal var changeQuantityLabel: ((Int) -> Void)?
    internal var updateMessage: ((String) -> Void)?
    internal var resetViewTrigger: ((Int, String) -> Void)?
    
    internal var quantity: Int = 1
    internal var message: String = "Press Buy button to process your shopping cart"
    
//    init() {
//        self.quantity = quantity
//        self.changeQuantityLabel = changeQuantityLabel
//        self.updateMessage = updateMessage
//        self.resetViewTrigger = resetView
//    }
    
    func minusButtonTapped() {
        if quantity > 1 {
            quantity -= 1
            
            self.changeQuantityLabel?(quantity)
        }
    }
    
    func plusButtonTapped() {
        if quantity < 5 {
            quantity += 1
            
            self.changeQuantityLabel?(quantity)
        }
    }
    
    func buyButtonTapped() {
        if quantity >= 1 && quantity <= 5 {
            self.message = "Your shopping cart processed, thank you."
        } else {
            self.message = "Your shopping cart failed, please try again."
        }
        self.updateMessage?(message)
    }
    
    func resetView() {
        quantity = 1
        message = "Press Buy button to process your shopping cart"
        
        self.resetViewTrigger?(quantity, message)
    }
}
