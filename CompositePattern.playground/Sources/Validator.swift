public enum ValidatorResult {
    case Valid
    case Invalid(error: ErrorType)
}

public protocol Validator {
    func validateValue(value: String) -> ValidatorResult
}
