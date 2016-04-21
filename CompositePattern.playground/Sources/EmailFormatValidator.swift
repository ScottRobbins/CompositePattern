import UIKit

public enum EmailFormatValidatorError: ErrorType {
    case InvalidEmailFormat
}

public struct EmailFormatValidator: Validator {
    
    public init() { }
    
    public func validateValue(value: String) -> ValidatorResult {
        let magicEmailRegexStolenFromTheInternet = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", magicEmailRegexStolenFromTheInternet)
        
        if emailTest.evaluateWithObject(value) {
            return .Valid
        } else {
            return .Invalid(error: EmailFormatValidatorError.InvalidEmailFormat)
        }
    }
}
