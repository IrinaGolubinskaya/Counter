//
//  ViewController.swift
//  Counter
//
//  Created by Irina Golubinskaya on 26.04.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var minusOneButton: UIButton!
    @IBOutlet weak var plusOneButton: UIButton!
    @IBOutlet weak var historyView: UITextView!
    
    var value = 0
    
    func getStringDate()-> String {
        let today = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
        dateFormatter.locale = Locale(identifier: "ru_RU")
        let dateString = dateFormatter.string(from: today)
        return dateString
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        resultLabel.text = String(0)
        
        resetButton.setTitle("reset", for: .normal)
        resetButton.layer.cornerRadius = 10
        minusOneButton.layer.cornerRadius = 10
        plusOneButton.layer.cornerRadius = 10
        historyView.layer.cornerRadius = 10
    }
    
    @IBAction func resetAction(_ sender: UIButton) {
        value = 0
        resultLabel.text = String(value)
        historyView.text = " \(getStringDate()) :\n значение сброшено."
    }
    
    @IBAction func subtractionAction(_ sender: Any) {
        if value >= 1 {
            value -= 1
            resultLabel.text = String(value)
            historyView.text = "\(getStringDate()) :\n значение изменено на -1."
        } else {
            value = 0
            resultLabel.text = String(value)
            historyView.text = " \(getStringDate()) :\n попытка уменьшить значение счётчика ниже 0."
        }
    }
    
    @IBAction func additionAction(_ sender: Any) {
        value += 1
        resultLabel.text = String(value)
        historyView.text = " \(getStringDate()) :\n значение изменено на +1."
    }
    
}

