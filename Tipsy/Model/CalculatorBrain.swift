
import Foundation

struct CalculatorBrain {
    var tipPercentage: Double = 0.1
    var splitNumber = 2
    var billAmount: Double?
    var totalResult: String?

    mutating func calculateBill() {
        totalResult = String(format: "%.2f", billAmount! * (1.0 + tipPercentage) / Double(splitNumber))
    }
    
    func getResult() -> String {
        return totalResult!
    }
    
    func getSplitNumber() -> String {
        return String(splitNumber)
    }
    
    func getTipPercentage() -> String {
        return String(Int(tipPercentage*100))
    }
}
