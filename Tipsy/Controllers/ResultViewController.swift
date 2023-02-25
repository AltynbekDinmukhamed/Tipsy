//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Димаш Алтынбек on 25.02.2023.
//

import UIKit

class ResultViewController: UIViewController {
    
    //MARK: -Views-
    let enterViewBackground: UIView = {
        let view = UIView()
        view.backgroundColor = .greenBackgroundColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let totalLabel: UILabel = {
        let label = UILabel()
        label.text = "Total per person"
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var resultLable: UILabel = {
        let label = UILabel()
        label.text = "0.00"
        label.textColor = .custonGreen
        label.font = .boldSystemFont(ofSize: 45)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    /// creating explanation
    let descriptionlabel: UILabel = {
        let label = UILabel()
        label.text = "Split between 2 people, with 10% tip."
        label.numberOfLines = 0
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var result = "0.0"
    var tip = 10
    var split = 2
    //MARK: -LifeCycle-
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
    
    //MARK: -Functions-
    private func setUpViews() {
        view.backgroundColor = .white
        view.addSubview(enterViewBackground)
        enterViewBackground.addSubview(totalLabel)
        enterViewBackground.addSubview(resultLable)
        view.addSubview(descriptionlabel)
        NSLayoutConstraint.activate([
            enterViewBackground.topAnchor.constraint(equalTo: view.topAnchor),
            enterViewBackground.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            enterViewBackground.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            enterViewBackground.heightAnchor.constraint(equalToConstant: view.frame.height  / 2.5),
            
            totalLabel.centerYAnchor.constraint(equalTo: enterViewBackground.centerYAnchor),
            totalLabel.centerXAnchor.constraint(equalTo: enterViewBackground.centerXAnchor),
            
            resultLable.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            resultLable.topAnchor.constraint(equalTo: totalLabel.bottomAnchor, constant: 5),
            
            descriptionlabel.topAnchor.constraint(equalTo: enterViewBackground.bottomAnchor, constant: 20),
            descriptionlabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            descriptionlabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            
        ])
        
        resultLable.text = result
        descriptionlabel.text = "Split between \(split) people, with \(tip)% tip."
    }
}
