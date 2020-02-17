//
//  ViewController.swift
//  CalculatorWithDelegation
//
//  Created by erumaru on 2/13/20.
//  Copyright © 2020 kbtu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, CalculatorViewDataSource, CalculatorViewDelegate {
    
    lazy var calculatorView: CalculatorView = {
        let view = CalculatorView()
        view.frame = self.view.frame
        view.dataSource = self
        view.delegate = self
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(calculatorView)
        calculatorView.backgroundColor = .red
        calculatorView.reloadView()
    }
    
    func getButtons() -> [[String]] {
        return [["+", "-"], ["1", "2"]]
    }
    
    func didPress(symbol: String) {
        print(symbol)
    }
}

