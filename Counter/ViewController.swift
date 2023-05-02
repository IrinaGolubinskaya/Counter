//
//  ViewController.swift
//  Counter
//
//  Created by Irina Golubinskaya on 26.04.2023.
//

import UIKit

final class ViewController: UIViewController {
    @IBOutlet weak private var resetButton: UIButton!
    @IBOutlet weak private var resultLabel: UILabel!
    @IBOutlet weak private var minusOneButton: UIButton!
    @IBOutlet weak private var plusOneButton: UIButton!
    @IBOutlet weak private var historyView: UITextView!
    
    private var value = 0
    private var text = "История изменений:"
    private func getStringDate()-> String {
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
    
    @IBAction private func resetAction(_ sender: UIButton) {
        value = 0
        resultLabel.text = String(value)
       text +=  "\n \(getStringDate()) :\n значение сброшено."
        historyView.text = text
    }
    
    @IBAction private func subtractionAction(_ sender: Any) {
        if value >= 1 {
            value -= 1
            resultLabel.text = String(value)
            text += "\n\(getStringDate()) :\n значение изменено на -1."
            historyView.text = text
        } else {
            value = 0
            resultLabel.text = String(value)
            text += "\n \(getStringDate()) :\n попытка уменьшить значение счётчика ниже 0."
            historyView.text = text
        }
    }
    
    @IBAction private func additionAction(_ sender: Any) {
        value += 1
        resultLabel.text = String(value)
       text += "\n \(getStringDate()) :\n значение изменено на +1."
        historyView.text = text
    }
    
}

