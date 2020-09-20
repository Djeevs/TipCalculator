import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var calculatorBrain = CalculatorBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        splitNumberLabel.text = String(calculatorBrain.splitNumber)
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        if sender.currentTitle == "0%" {
            zeroPctButton.isSelected = true
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
            calculatorBrain.tipPercentage = 0
        } else if sender.currentTitle == "10%" {
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = true
            twentyPctButton.isSelected = false
            calculatorBrain.tipPercentage = 0.1
        } else {
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = true
            calculatorBrain.tipPercentage = 0.2
        }
        billTextField.endEditing(true)
    }
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        calculatorBrain.splitNumber = Int(sender.value)
        splitNumberLabel.text = calculatorBrain.getSplitNumber()
        billTextField.endEditing(true)
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
        let bill = billTextField.text!
        if bill != "" {
            calculatorBrain.billAmount = Double(bill)!
            calculatorBrain.calculateBill()
            self.performSegue(withIdentifier: "goToResults", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.totalResult = calculatorBrain.getResult()
            destinationVC.numberOfPeople = calculatorBrain.getSplitNumber()
            destinationVC.tipPercentage = calculatorBrain.getTipPercentage()
        }
    }
}

