//
//  ViewController.swift
//  PlusMinusButton
//
//  Created by Bart van Kuik on 22/11/2018.
//  Copyright © 2018 DutchVirtual. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let plusButton = UIButton()
    let minusButton = UIButton()
    let resultLabel = UILabel()
    var result = 0

    override func viewDidLayoutSubviews() {
        let radius = self.resultLabel.frame.height / 2.0
        self.plusButton.layer.cornerRadius = radius
        self.minusButton.layer.cornerRadius = radius
    }
    
    @objc func buttonAction(_ sender: UIButton) {
        print(sender.tag)
        self.result += sender.tag
        self.resultLabel.text = String(describing: self.result)
    }

    override func viewDidLoad() {
        self.plusButton.translatesAutoresizingMaskIntoConstraints = false
        self.plusButton.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        self.plusButton.tag = 1
        self.plusButton.titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        self.plusButton.setTitle("+", for: .normal)
        self.plusButton.titleLabel?.textColor = .white
        self.plusButton.addTarget(self, action: #selector(buttonAction(_:)), for: .touchUpInside)
        self.view.addSubview(self.plusButton)
        
        self.minusButton.translatesAutoresizingMaskIntoConstraints = false
        self.minusButton.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        self.minusButton.tag = -1
        self.minusButton.titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        self.minusButton.setTitle("-", for: .normal)
        self.minusButton.titleLabel?.textColor = .white
        self.minusButton.addTarget(self, action: #selector(buttonAction(_:)), for: .touchUpInside)
        self.view.addSubview(self.minusButton)

        self.resultLabel.translatesAutoresizingMaskIntoConstraints = false
        self.resultLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        self.resultLabel.text = String(describing: self.result)
        self.resultLabel.textColor = .white
        self.resultLabel.textAlignment = .center
        self.view.addSubview(self.resultLabel)
        
        [self.plusButton, self.minusButton, self.resultLabel].forEach {
            $0.backgroundColor = .gray
        }

        let constraints = [
            self.minusButton.widthAnchor.constraint(equalTo: self.plusButton.widthAnchor),
            self.minusButton.rightAnchor.constraint(equalTo: self.resultLabel.leftAnchor),
            self.minusButton.centerYAnchor.constraint(equalTo: self.resultLabel.centerYAnchor),
            
            self.resultLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.resultLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 50),
            self.resultLabel.heightAnchor.constraint(equalTo: self.minusButton.heightAnchor),
            self.resultLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            
            self.plusButton.widthAnchor.constraint(greaterThanOrEqualToConstant: 100),
            self.plusButton.leftAnchor.constraint(equalTo: self.resultLabel.rightAnchor),
            self.plusButton.centerYAnchor.constraint(equalTo: self.resultLabel.centerYAnchor),
        ]
        self.view.addConstraints(constraints)
    }
}
