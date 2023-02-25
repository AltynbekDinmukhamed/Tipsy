//
//  ViewController.swift
//  Tipsy
//
//  Created by Димаш Алтынбек on 20.02.2023.
//

import UIKit

class ViewController: UIViewController {
    //MARK: -Views-
    
    //MARK: -Enter Part-
    let enterViewBackground: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let firstStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.backgroundColor = .white
        stack.spacing = 28
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let enterLabel: UILabel = {
        let label = UILabel()
        label.text = "Enter bill total"
        label.font = .systemFont(ofSize: 25)
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let enterTextField: UITextField = {
        let text = UITextField()
        text.textAlignment = .center
        text.font = .boldSystemFont(ofSize: 40)
        text.placeholder = "e.g. 123.56"
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    //MARK: -choose part-
    let choseStack: UIStackView = {
        let stack = UIStackView()
        stack.distribution = .fillProportionally
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let selectLabel: UILabel = {
        let label = UILabel()
        label.text = "Select tip"
        label.font = .systemFont(ofSize: 25)
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: -percent views-
    let buttonStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillProportionally
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var buttonZeroPercent: UIButton = {
        let button = UIButton()
        button.setTitle("0%", for:.normal)
        button.titleLabel?.font = .systemFont(ofSize: 35)
        button.setTitleColor(.custonGreen, for: .normal)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var buttonTenPercent: UIButton = {
        let button = UIButton()
        button.setTitle("10%", for:.normal)
        button.titleLabel?.font = .systemFont(ofSize: 35)
        button.setTitleColor(.custonGreen, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var buttonTwentyPercent: UIButton = {
        let button = UIButton()
        button.setTitle("20%", for:.normal)
        button.titleLabel?.font = .systemFont(ofSize: 35)
        button.setTitleColor(.custonGreen, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        return button
    }()
    
    //MARK: -secound chose elements-
    let secoundChoseStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let secoundChoseInsideStuck: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let secoundSelectLabel: UILabel = {
        let label = UILabel()
        label.text = "chose split"
        label.font = .systemFont(ofSize: 25)
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var labelTwoSpit: UILabel = {
        let button = UILabel()
        button.text = "2"
        button.font = .systemFont(ofSize: 35)
        button.textColor = .custonGreen
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var stepperView: UIStepper = {
        let stepper = UIStepper()
        stepper.value = 2
        stepper.minimumValue = 2
        stepper.maximumValue = 25
        stepper.stepValue = 1
        stepper.addTarget(self, action: #selector(stepperDidTap), for: .valueChanged)
        return stepper
    }()
    
    //MARK: -last button-
    private lazy var calculateBytton: UIButton = {
        let button = UIButton()
        button.setTitle("CALCULATE", for: .normal)
        button.backgroundColor = .custonGreen
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 35)
        button.addTarget(self, action: #selector(calculateDidTap), for: .touchUpInside)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var tip = 0.10
    var numberOfPeople = 2
    var billTotal = 0.0
    var finalResult = "0.0"
    
    //MARK: -Life cycle-
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    //MARK: -Functions-
    private func setUpViews() {
        view.backgroundColor = UIColor.greenBackgroundColor
        view.addSubview(enterViewBackground)
        view.addSubview(firstStack)
        firstStack.addArrangedSubview(enterLabel)
        firstStack.addArrangedSubview(enterTextField)
        NSLayoutConstraint.activate([
            enterViewBackground.topAnchor.constraint(equalTo: view.topAnchor),
            enterViewBackground.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            enterViewBackground.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            enterViewBackground.heightAnchor.constraint(equalToConstant: view.frame.height  / 4),
            
            firstStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            firstStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            firstStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            firstStack.heightAnchor.constraint(equalToConstant: view.frame.height / 4)
        ])
        
        NSLayoutConstraint.activate([
            enterLabel.topAnchor.constraint(equalTo: firstStack.topAnchor),
            enterLabel.leadingAnchor.constraint(equalTo: firstStack.leadingAnchor, constant: 50),
            enterLabel.trailingAnchor.constraint(equalTo: firstStack.trailingAnchor, constant: 50),
            
            enterTextField.topAnchor.constraint(equalTo: enterLabel.bottomAnchor),
            enterTextField.leadingAnchor.constraint(equalTo: firstStack.leadingAnchor),
            enterTextField.trailingAnchor.constraint(equalTo: firstStack.trailingAnchor)
        ])
        
        //CHOSE part
        view.addSubview(choseStack)
        choseStack.addArrangedSubview(buttonStackView)
        choseStack.addArrangedSubview(selectLabel)
        choseStack.addArrangedSubview(buttonStackView)
        buttonStackView.addArrangedSubview(buttonZeroPercent)
        buttonStackView.addArrangedSubview(buttonTenPercent)
        buttonStackView.addArrangedSubview(buttonTwentyPercent)
        NSLayoutConstraint.activate([
            choseStack.topAnchor.constraint(equalTo: firstStack.bottomAnchor, constant: 10),
            choseStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            choseStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            choseStack.heightAnchor.constraint(equalToConstant: view.frame.height / 6),
            
            selectLabel.topAnchor.constraint(equalTo: choseStack.topAnchor, constant: 5),
            selectLabel.leadingAnchor.constraint(equalTo: choseStack.leadingAnchor, constant: 10),
            selectLabel.trailingAnchor.constraint(equalTo: choseStack.trailingAnchor, constant: -10),
            
            buttonStackView.topAnchor.constraint(equalTo: selectLabel.bottomAnchor, constant: 10),
            buttonStackView.leadingAnchor.constraint(equalTo: choseStack.leadingAnchor, constant: 5),
            buttonStackView.trailingAnchor.constraint(equalTo: choseStack.trailingAnchor, constant: -5)
        ])
        //SECOUND CHOSE part
        view.addSubview(secoundChoseStack)
        secoundChoseStack.addArrangedSubview(secoundSelectLabel)
        secoundChoseStack.addArrangedSubview(secoundChoseInsideStuck)
        secoundChoseInsideStuck.addArrangedSubview(labelTwoSpit)
        secoundChoseInsideStuck.addArrangedSubview(stepperView)
        NSLayoutConstraint.activate([
            secoundChoseStack.topAnchor.constraint(equalTo: choseStack.bottomAnchor, constant: 10),
            secoundChoseStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            secoundChoseStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            secoundChoseStack.heightAnchor.constraint(equalToConstant: view.frame.height / 6)
        ])
        
        //adding calculate button
        view.addSubview(calculateBytton)
        NSLayoutConstraint.activate([
            calculateBytton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            calculateBytton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            calculateBytton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            calculateBytton.heightAnchor.constraint(equalToConstant: 70)
        ])
    }
    
    //MARK: -Selectors-
    @objc func didTapButton(_ sender: UIButton) {
        enterTextField.endEditing(true)
        
        buttonZeroPercent.isSelected = false
        buttonTenPercent.isSelected = false
        buttonTwentyPercent.isSelected = false
        sender.isSelected = true
        
        let buttonTitle = sender.currentTitle!
        let buttonTitleMinusPercentSign = String(buttonTitle.dropLast())
        let buttonTitleAsANumber = Double(buttonTitleMinusPercentSign)!
        tip = buttonTitleAsANumber / 100
        
        if sender.isSelected {
            sender.backgroundColor = .custonGreen
            sender.setTitleColor(.white, for: .normal)
        } else {
            
            sender.setTitleColor(.custonGreen, for: .normal)
            sender.backgroundColor = .clear
        }
    }
    
    @objc func stepperDidTap(_ stepper: UIStepper) {
        labelTwoSpit.text = String(format: "%.0f", stepper.value)
        numberOfPeople = Int(stepper.value)
    }
    
    @objc func calculateDidTap(_ sender: UIButton) {
        let bill = enterTextField.text!
        
        if bill != "" {
            billTotal = Double(bill)!
            let result = billTotal * (tip) / Double(numberOfPeople)
            let resultTo2DecimalPlaces = String(format: "%.2f", result)
            finalResult = resultTo2DecimalPlaces
        }
        print(numberOfPeople)
        let vc = ResultViewController()
        navigationController?.pushViewController(vc, animated: true)
        vc.result = finalResult
        vc.tip = Int(tip * 100)
        vc.split = numberOfPeople
    }

}

