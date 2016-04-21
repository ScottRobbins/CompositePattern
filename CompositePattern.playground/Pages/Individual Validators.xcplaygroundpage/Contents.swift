import UIKit

/*:
 To follow the rules listed on the intro page, we are going to make several validators:
 * EmptyStringValidator
 * EmailFormatValidator
 * PasswordLengthValidator
 * PasswordStrengthValidator
*/

//: ## EmptyStringValidator


enum EmptyStringValidatorError: ErrorType {
    case EmptyString
}

struct EmptyStringValidator: Validator {
    
    func validateValue(value: String) -> ValidatorResult {
        if value.isEmpty {
            return .Invalid(error: EmptyStringValidatorError.EmptyString)
        } else {
            return .Valid
        }
    }
}

//: ## EmailFormatValidator

enum EmailFormatValidatorError: ErrorType {
    case InvalidEmailFormat
}

struct EmailFormatValidator: Validator {
    
    func validateValue(value: String) -> ValidatorResult {
        let magicEmailRegexStolenFromTheInternet = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", magicEmailRegexStolenFromTheInternet)
        
        if emailTest.evaluateWithObject(value) {
            return .Valid
        } else {
            return .Invalid(error: EmailFormatValidatorError.InvalidEmailFormat)
        }
    }
}

//: ## PasswordLengthValidator

enum PasswordLengthValidatorError: ErrorType {
    case TooShort
}

struct PasswordLengthValidator: Validator {
    
    func validateValue(value: String) -> ValidatorResult {
        if value.characters.count >= 6 {
            return .Valid
        } else {
            return .Invalid(error: PasswordLengthValidatorError.TooShort)
        }
    }
}

/*: 
 ## PasswordStrengthValidator
 > This one can probably be broken up into multiple validators, but for conciseness let's not. 
*/

enum PasswordStrengthValidatorError: ErrorType {
    case NoUppercaseLetter
    case NoLowercaseLetter
    case NoNumber
    case NoSpecialCharacter
}

//: Let's get all fancy and make a private extension of the string class to test for requirements

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

/*: 
 And back to your regularly scheduled programming
 
 > For simplicity I am just returning the first error I find instead of creating a validator protocol that returns an array or something like that.
*/

struct PasswordStrengthValidator: Validator {
    
    func validateValue(value: String) -> ValidatorResult {
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

//: We claimed all of these would be composable (hence, "composite"), so [let's see how that's accomplished with the CompositeValidator](CompositeValidator)
