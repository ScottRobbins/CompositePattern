import UIKit

public enum PasswordStrengthValidatorError: ErrorType {
    case NoUppercaseLetter
    case NoLowercaseLetter
    case NoNumber
    case NoSpecialCharacter
}

public struct PasswordStrengthValidator: Validator {
    
    public init() { }
    
    public func validateValue(value: String) -> ValidatorResult {
        guard value.hasUppercaseLetter() else {
            return .Invalid(error: PasswordStrengthValidatorError.NoUppercaseLetter)
        }
        
        guard value.hasLowercaseLetter() else {
            return .Invalid(error: PasswordStrengthValidatorError.NoLowercaseLetter)
        }
        
        guard value.hasNumber() else {
            return .Invalid(error: PasswordStrengthValidatorError.NoNumber)
        }
        
        guard value.hasSpecialCharacter() else {
            return .Invalid(error: PasswordStrengthValidatorError.NoSpecialCharacter)
        }
        
        return .Valid
    }
}

private extension String {
    func hasUppercaseLetter() -> Bool {
        return doesMatchWithRegex(".*[A-Z]+.*")
    }
    
    func hasLowercaseLetter() -> Bool {
        return doesMatchWithRegex(".*[a-z]+.*")
    }
    
    func hasNumber() -> Bool {
        return doesMatchWithRegex(".*[0-9]+.*")
    }
    
    func hasSpecialCharacter() -> Bool {
        return doesMatchWithRegex(".*[!&^%$#@()/]+.*")
    }
    
    private func doesMatchWithRegex(regex: String) -> Bool {
        let test = NSPredicate(format:"SELF MATCHES %@", regex)
        
        return test.evaluateWithObject(self)
    }
}
