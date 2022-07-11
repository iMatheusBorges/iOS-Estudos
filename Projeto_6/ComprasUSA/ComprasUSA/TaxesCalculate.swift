
import Foundation

class TaxesCalculate {
    
    static let shared = TaxesCalculate()
    var dolar: Double = 5.19
    var iof: Double = 6.38
    var stateTax: Double = 7.0
    var shopphingValue: Double = 0
    
    var formatter = NumberFormatter()
    
    var shoppingValueInReal: Double {
        return shopphingValue * dolar
    }
    
    var stateTaxValue: Double {
        return shopphingValue * stateTax/100
    }
    
    var iofValue: Double {
        return (shopphingValue + stateTax) * iof/100
    }
    
    func calculate(usingCreditCard: Bool) -> Double {
        var finalValue = shopphingValue + stateTaxValue
        if usingCreditCard {
            finalValue += iofValue
        }
        return finalValue * dolar
    }
    
    func convertToDouble(_ string: String) ->Double {
        formatter.numberStyle = .none
        return formatter.number(from: string)!.doubleValue
        
    }
    
    func getFormattedValue(of value: Double, withCurrency currency: String) -> String {
        formatter.numberStyle = .currency
        formatter.currencySymbol = currency
        formatter.alwaysShowsDecimalSeparator = true
        return formatter.string(for: value)!
    }
    
    private init() {
        formatter.usesGroupingSeparator = true
    }
    
}
