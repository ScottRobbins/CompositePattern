public enum EmptyStringValidatorError: ErrorType {
    case EmptyString
}

public struct EmptyStringValidator: Validator {
    
    public init() { }
    
    public func validateValue(value: String) -> ValidatorResult {
        if value.isEmpty {
            return .Invalid(error: EmptyStringValidatorError.EmptyString)
        } else {
            return .Valid
        }
    }
}
