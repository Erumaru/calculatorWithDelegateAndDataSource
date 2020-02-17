//
//  CalculatorView.swift
//  CalculatorWithDelegation
//
//  Created by erumaru on 2/13/20.
//  Copyright © 2020 kbtu. All rights reserved.
//

import UIKit

class CalculatorView: UIView {
    let buttonSize = CGSize(width: 100, height: 100)
    weak var dataSource: CalculatorViewDataSource? = nil
    weak var delegate: CalculatorViewDelegate? = nil
    
    func reloadView() {
        guard let buttons = dataSource?.getButtons() else { return }
        
        for i in 0..<buttons.count {
            for j in 0..<buttons[i].count {
                let button = UIButton(frame: CGRect(x: CGFloat(i) * buttonSize.width, y: CGFloat(j) * buttonSize.height, width: buttonSize.width, height: buttonSize.height))
                
                button.setTitle(buttons[i][j], for: .normal)
                button.titleLabel?.font = .systemFont(ofSize: 25)
                button.addTarget(self, action: #selector(didPress(button:)), for: .touchUpInside)
                self.addSubview(button)
            }
        }
    }
    
    @objc func didPress(button: UIButton) {
        guard let symbol = button.titleLabel?.text else { return }
        
        delegate?.didPress(symbol: symbol)
    }
}

protocol CalculatorViewDataSource: class {
    func getButtons() -> [[String]]
}

protocol CalculatorViewDelegate: class {
    func didPress(symbol: String)
}

// STRONG REFERENCE CYCLE
