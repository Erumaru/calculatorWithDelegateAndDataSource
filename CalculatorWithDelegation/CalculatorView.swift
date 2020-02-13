//
//  CalculatorView.swift
//  CalculatorWithDelegation
//
//  Created by erumaru on 2/13/20.
//  Copyright © 2020 kbtu. All rights reserved.
//

import UIKit

class CalculatorView: UIView {
//    var buttons: [[String]] = [
//        ["+", "-", "*"],
//        ["1", "2", "3"]
//    ]
    weak var dataSource: CalculatorViewDataSource? = nil
    weak var delegate: CalculatorViewDelegate? = nil
    let buttonSize = CGSize(width: 100, height: 100)
    
    func reloadView() {
        guard let buttons = dataSource?.getButtons() else { return }
        
        for i in 0..<buttons.count {
            for j in 0..<buttons[i].count {
                let button = UIButton(frame: CGRect(x: CGFloat(i) * buttonSize.width, y: CGFloat(j) * buttonSize.height, width: buttonSize.width, height: buttonSize.height))
                button.setTitle(buttons[i][j], for: .normal)
                button.backgroundColor = .green
                button.addTarget(self, action: #selector(didPress(sender:)), for: .touchUpInside)
                
                self.addSubview(button)
            }
        }
    }
    
    @objc private func didPress(sender: UIButton) {
        guard let symbol = sender.titleLabel?.text else { return }
        
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
