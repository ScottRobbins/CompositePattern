public struct ValidatorConfigurator {
    public static let sharedInstance = ValidatorConfigurator()
}

public extension ValidatorConfigurator {
    public func emailValidator() -> Validator {
        return CompositeValidator(validators: EmptyStringValidator(),
                                  EmailFormatValidator())
    }
}

public extension ValidatorConfigurator {
    public func passwordValidator() -> Validator {
        return CompositeValidator(validators: EmptyStringValidator(),
                                  PasswordLengthValidator(),
                                  PasswordStrengthValidator())
    }
}
