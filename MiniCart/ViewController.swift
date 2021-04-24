//
//  ViewController.swift
//  MiniCart
//
//  Created by Sigit on 21/04/21.
//

import UIKit

class ViewController: UIViewController {
    
    private var contentView: ContentView!
    
    private var viewModel: ViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.contentView = ContentView()
        
        let changeQuantityLabel: (Int) -> Void = { [weak self] quantity in
            self?.contentView.labelQuantity.text = "\(quantity)"
        }
        
        self.viewModel = ViewModel(quantity: 1, changeQuantityLabel: changeQuantityLabel)
        
        setupView()
    }
    
    func setupView() {
        view.backgroundColor = .white
        
        view.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        contentView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        contentView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        
        setupAction()
    }
    
    private func setupAction() {
        contentView.buttonBuy.addTarget(self, action: #selector(buyButtonTapped), for: .touchUpInside)
        contentView.buttonPlus.addTarget(self, action: #selector(plusButtonTapped), for: .touchUpInside)
        contentView.buttonMinus.addTarget(self, action: #selector(minusButtonTapped), for: .touchUpInside)
    }
    
    @objc private func plusButtonTapped() {
        self.viewModel.plusButtonTapped()
    }
    
    @objc private func minusButtonTapped() {
        self.viewModel.minusButtonTapped()
    }
    
    @objc private func buyButtonTapped() {
        self.viewModel.buyButtonTapped()
    }

}

