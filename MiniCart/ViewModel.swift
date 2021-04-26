//
//  ViewModel.swift
//  MiniCart
//
//  Created by Sigit on 22/04/21.
//

class ViewModel {
    private let apiService: APIServiceProtocol
    
    internal var loadView: ((Product) -> Void)?
    internal var changeQuantityLabel: ((Int) -> Void)?
    internal var updateMessage: ((String) -> Void)?
    internal var resetViewTrigger: ((Int, String) -> Void)?
    
    internal var isLoading: Bool = false
    internal var product: Product? {
        didSet {
            if let product = product {
                self.loadView?(product)
            }
        }
    }
    internal var quantity: Int = 1
    internal var message: String = "Press Buy button to process your shopping cart"
    
    init(apiService: APIServiceProtocol = APIService()) {
        self.apiService = apiService
    }
    
    func didLoadTrigger() {
        self.apiService.fetchProductData { data in
            self.product = data
        }
    }
    
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
