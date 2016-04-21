public struct CompositeValidator: Validator {
    
    private let validators: [Validator]
    
    public init(validators: Validator...) {
        self.validators = validators
    }
    
    public func validateValue(value: String) -> ValidatorResult {
        
        for validator in validators {
            switch validator.validateValue(value) {
            case .Valid:
                break
            case .Invalid(let error):
                return .Invalid(error: error)
            }
        }
        
        return .Valid
    }
}
