public enum PasswordLengthValidatorError: ErrorType {
    case TooShort
}

public struct PasswordLengthValidator: Validator {
    
    public init() { }
    
    public func validateValue(value: String) -> ValidatorResult {
        if value.characters.count >= 6 {
            return .Valid
        } else {
            return .Invalid(error: PasswordLengthValidatorError.TooShort)
        }
    }
}
