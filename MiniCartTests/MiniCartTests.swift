//
//  MiniCartTests.swift
//  MiniCartTests
//
//  Created by Sigit on 22/04/21.
//

import XCTest

@testable import MiniCart

class MiniCartTests: XCTestCase {
    
    var viewModel: ViewModel!
    var quantity: Int = 1
    var message: String = ""

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        viewModel = ViewModel(quantity: quantity,
                              changeQuantityLabel: { [weak self] quantity in
                                self?.quantity = quantity
                              },
                              updateMessage: { [weak self] message in
                                self?.message = message
                              }, resetView: { [weak self] quantity, message in
                                self?.message = message
                                self?.quantity = quantity
                              })
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testIncrement() {
        // given last quantity 1
        viewModel.quantity = 1
        
        // when plus button tapped
        viewModel.plusButtonTapped()
        
        // then last quantity = 2
        XCTAssertEqual(viewModel.quantity, 2)
    }
    
    func testIncrementMaxQuantityFive() {
        // given last quantity 5
        viewModel.quantity = 5
        
        // when plus button tapped
        viewModel.plusButtonTapped()
        
        // then last quantity = 2
        XCTAssertEqual(viewModel.quantity, 5)
    }
    
    func testDecrementMinQuantityOne() {
        // given last quantity = 1
        viewModel.quantity = 1
        
        // when
        viewModel.minusButtonTapped()
        
        // then quantity = 1
        XCTAssertEqual(viewModel.quantity, 1)
    }
    
    func testBuySuccess() {
        // given
        viewModel.quantity = 3
        
        // when
        viewModel.buyButtonTapped()
        
        // then
        XCTAssertEqual(viewModel.message, "Your shopping cart processed, thank you.")
    }
    
    func testBuyFailed() {
        // given
        viewModel.quantity = 10
        
        // when
        viewModel.buyButtonTapped()
        
        // then
        XCTAssertEqual(viewModel.message, "Your shopping cart failed, please try again.")
    }
    
    func testResetView() {
        // given
        viewModel.message = "aaa"
        viewModel.quantity = 5
        
        // when
        viewModel.resetView()
        
        // then
        XCTAssertEqual(viewModel.message, "Press Buy button to process your shopping cart")
        XCTAssertEqual(viewModel.quantity, 1)
    }
}
