//
//  ViewController.swift
//  SimpleCalc
//
//  Created by Vincent Saluzzo on 29/03/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let calculator = Calculator()

    @IBOutlet weak var textView: UITextView!
    @IBOutlet var numberButtons: [UIButton]!

    func myTextView () {
        textView.text = calculator.txtRecoveryCalculation
    }
    
    var elements: [String] {
        return textView.text.split(separator: " ").map { "\($0)" }
    }
    
    // View Life cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    // View actions
    @IBAction func tappedNumberButton(_ sender: UIButton) {
        guard let numberText = sender.title(for: .normal) else {
            return
        }
        calculator.tappedNumber(nuberTxt: numberText)
        myTextView()
    }
    
    @IBAction func tappedAdditionButton(_ sender: UIButton) {
        if calculator.canAddOperator {
            calculator.addition()
            myTextView()
        } else {
            alert(titleAlert: "Erreur", messsageAlert: "Un operateur est déja mis !")
        }
    }
    
    @IBAction func tappedSubstractionButton(_ sender: UIButton) {
        if calculator.canAddOperator {
            calculator.substraction()
            myTextView()
        } else {
            alert(titleAlert: "Erreur", messsageAlert: "Un operateur est déja mis !")
        }
    }

    @IBAction func tappedMultiplicationButton(_ sender: UIButton) {
        if calculator.canAddOperator {
            calculator.multiplication()
            myTextView()
        } else {
            alert(titleAlert: "Erreur", messsageAlert: "Un operateur est déja mis !")
        }
    }

    @IBAction func tappedDivisionButton(_ sender: UIButton) {
        if calculator.canAddOperator {
            calculator.division()
            myTextView()
        } else {
            alert(titleAlert: "Erreur", messsageAlert: "Un operateur est déja mis !")
        }
        
    }

    @IBAction func tappedEqualButton(_ sender: UIButton) {
        guard calculator.expressionIsCorrect else {
            alert(titleAlert: "Erreur", messsageAlert: "Entrez une expression correcte !")
            return
        }
        
        guard calculator.expressionHaveEnoughElement else {
            alert(titleAlert: "Erreur", messsageAlert: "Démarrez un nouveau calcul !")
            return
        }

        calculator.calculate()

        guard !calculator.expressionNoZeroDivision else {
            alert(titleAlert: "Zéro !", messsageAlert: "La division par zero est impossible !")
            textView.text = "Erreur"
            return
        }

        myTextView()
    }

    @IBAction func clearButton(_ sender: UIButton) {
        calculator.clear()
        myTextView()
        textView.text = "0"
    }

    func alert (titleAlert: String, messsageAlert: String) {
        let alertVC = UIAlertController(title: titleAlert, message: messsageAlert, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        return self.present(alertVC, animated: true, completion: nil)
    }

}

