//
//  GFItemInfoVC.swift
//  GHFollowers
//
//  Created by Femi Aliu on 27/06/2022.
//

import UIKit

class GFItemInfoVC: UIViewController {
    
    let stackview = UIStackView()
    let itemInfoViewOne = GFItemInfoView()
    let itemInfoViewTwo = GFItemInfoView()
    let actionButton = GFButton()

    override func viewDidLoad() {
        super.viewDidLoad()

        configureBackgroundView()
        layoutUI()
        configureStackView()
    }
    
    
    private func configureBackgroundView() {
        view.layer.cornerRadius = 18
        view.backgroundColor = .secondarySystemBackground
        
    }
    
    private func configureStackView() {
        stackview.axis = .horizontal
        stackview.distribution = .equalSpacing
        
        stackview.addArrangedSubview(itemInfoViewOne)
        stackview.addArrangedSubview(itemInfoViewTwo)
    }
    
    private func layoutUI() {
        view.addSubview(stackview)
        view.addSubview(actionButton)
        
        stackview.translatesAutoresizingMaskIntoConstraints = false
        let padding: CGFloat = 20
        
        NSLayoutConstraint.activate([
            stackview.topAnchor.constraint(equalTo: view.topAnchor, constant: padding),
            stackview.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            stackview.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            stackview.heightAnchor.constraint(equalToConstant: 50),
            
            actionButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -padding),
            actionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            actionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            actionButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
}
