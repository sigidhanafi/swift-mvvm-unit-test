//
//  ContentView.swift
//  MiniCart
//
//  Created by Sigit on 22/04/21.
//

import Foundation
import UIKit

class ContentView: UIView {
    internal let containerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 50
        
        return stackView
    }()
    
    private let spacerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        return view
    }()
    
    internal let labelProductStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        
        return stackView
    }()
    
    internal let labelProductName: UILabel = {
        let label = UILabel()
        label.text = "iPhone 12 256 Black"
        label.font = UIFont.systemFont(ofSize: 24)
        label.textAlignment = .center
        label.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return label
    }()
    
    internal let labelProductPrice: UILabel = {
        let label = UILabel()
        label.text = "IDR 20.000.000"
        label.font = UIFont.systemFont(ofSize: 24)
        label.textAlignment = .center
        label.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return label
    }()
    
    internal let quantityEditoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        
        return stackView
    }()
    
    internal let labelQuantity: UILabel = {
        let label = UILabel()
        label.text = "1"
        label.font = UIFont.systemFont(ofSize: 24)
        label.textAlignment = .center
        label.widthAnchor.constraint(equalToConstant: 70).isActive = true
        
        return label
    }()
    
    internal let buttonMinus: UIButton = {
        let button = UIButton()
        button.setTitle("-", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.widthAnchor.constraint(equalToConstant: 40).isActive = true
        button.backgroundColor = .cyan
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.cyan.cgColor
        
        return button
    }()
    
    internal let buttonPlus: UIButton = {
        let button = UIButton()
        button.setTitle("+", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.widthAnchor.constraint(equalToConstant: 40).isActive = true
        button.backgroundColor = .cyan
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.cyan.cgColor
        
        return button
    }()
    
    internal let buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fill
        
        return stackView
    }()
    
    internal let buttonBuy: UIButton = {
        let button = UIButton()
        button.setTitle("Buy", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.widthAnchor.constraint(equalToConstant: 100).isActive = true
        button.backgroundColor = .cyan
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.cyan.cgColor
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        containerStackView.addArrangedSubview(spacerView)
        
        labelProductStackView.addArrangedSubview(labelProductName)
        labelProductStackView.addArrangedSubview(labelProductPrice)
        containerStackView.addArrangedSubview(labelProductStackView)

        quantityEditoStackView.addArrangedSubview(buttonMinus)
        quantityEditoStackView.addArrangedSubview(labelQuantity)
        quantityEditoStackView.addArrangedSubview(buttonPlus)
        containerStackView.addArrangedSubview(quantityEditoStackView)
        
        buttonStackView.addArrangedSubview(buttonBuy)
        containerStackView.addArrangedSubview(buttonStackView)
        
        self.addSubview(containerStackView)
        containerStackView.translatesAutoresizingMaskIntoConstraints = false
        containerStackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        containerStackView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        containerStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        containerStackView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        
    }
    
}
