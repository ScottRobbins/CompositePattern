/*:
 # ValidatorConfigurator
 Here we are going to compose the validators together in a helper class to make our code easy to read/use
*/

struct ValidatorConfigurator {
    static let sharedInstance = ValidatorConfigurator()
}

//: **Let's add the email validator.** Remember the 2 requirements we had for email
extension ValidatorConfigurator {
    func emailValidator() -> Validator {
        return CompositeValidator(validators: EmptyStringValidator(),
                                  EmailFormatValidator())
    }
}

/*:
 You can see this is going to return a `Validator`, which is really just a `CompositeValidator`, consisting of the validators to check for an empty string, and to check for the correct email format.
 
 **Now let's make our password validator**
*/

extension ValidatorConfigurator {
    func passwordValidator() -> Validator {
        return CompositeValidator(validators: EmptyStringValidator(),
                                  PasswordLengthValidator(),
                                  PasswordStrengthValidator())
    }
}

/*:
 I even got to reuse the `EmptyStringValidator`. You may or may not want to do that, it depends on your setup and personal preference.
 
 So how would this get used then? [Let's run some examples](Examples)
*/
