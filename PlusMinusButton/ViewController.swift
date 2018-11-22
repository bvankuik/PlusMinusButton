//
//  ViewController.swift
//  PlusMinusButton
//
//  Created by Bart van Kuik on 22/11/2018.
//  Copyright © 2018 DutchVirtual. All rights reserved.
//

import UIKit

    class PlusMinusButton: UIView {
        private let plusButton = UIButton()
        private let minusButton = UIButton()
        private let resultLabel = UILabel()
        var result = 0

        @objc func buttonAction(_ sender: UIButton) {
            print(sender.tag)
            self.result += sender.tag
            self.resultLabel.text = String(describing: self.result)
        }

        override func layoutSubviews() {
            let radius = self.resultLabel.frame.height / 2.0
            self.plusButton.layer.cornerRadius = radius
            self.minusButton.layer.cornerRadius = radius
        }
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            
            let stackView = UIStackView()
            stackView.translatesAutoresizingMaskIntoConstraints = false
            stackView.distribution = .fillEqually
            self.addSubview(stackView)
            
            self.minusButton.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
            self.minusButton.tag = -1
            self.minusButton.setTitle("-", for: .normal)
            stackView.addArrangedSubview(self.minusButton)

            self.resultLabel.font = UIFont.preferredFont(forTextStyle: .headline)
            self.resultLabel.text = String(describing: self.result)
            self.resultLabel.textColor = .white
            self.resultLabel.textAlignment = .center
            self.resultLabel.adjustsFontForContentSizeCategory = true
            stackView.addArrangedSubview(self.resultLabel)

            self.plusButton.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
            self.plusButton.tag = 1
            self.plusButton.setTitle("+", for: .normal)
            stackView.addArrangedSubview(self.plusButton)
            
            [self.plusButton, self.minusButton].forEach {
                $0.titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
                $0.titleLabel?.textColor = .white
                $0.titleLabel?.adjustsFontForContentSizeCategory = true
                $0.addTarget(self, action: #selector(buttonAction(_:)), for: .touchUpInside)
            }
            
            [self.plusButton, self.minusButton, self.resultLabel].forEach {
                $0.backgroundColor = .gray
            }
            
            let constraints = [
                stackView.leftAnchor.constraint(equalTo: self.leftAnchor),
                stackView.topAnchor.constraint(equalTo: self.topAnchor),
                stackView.rightAnchor.constraint(equalTo: self.rightAnchor),
                stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            ]
            self.addConstraints(constraints)
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }

    class ViewController: UIViewController {
        override func viewDidLoad() {
            let plusMinusButton = PlusMinusButton()
            plusMinusButton.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview(plusMinusButton)
            
            let constraints = [
                plusMinusButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
                plusMinusButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
                plusMinusButton.widthAnchor.constraint(greaterThanOrEqualToConstant: 150)
            ]
            self.view.addConstraints(constraints)
        }
    }
