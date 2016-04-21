/*:
 # Validator Protocol
 
 We're going to create a protocol that will be used as the interface for all of our validators. (Validators being the objects that will take user input [a `String`], and return whether or not it was valid).
 
 **Before creating the protocol, let's create the result type that will be returned for each validator.**
*/

enum ValidatorResult {
    case Valid
    case Invalid(error: ErrorType)
}

/*:
 Each validator is going to respond with whether the input it was given was valid or not. If it is not valid, it will return some type of error explaining why.
 
 **Great, now let's look at this validator protocol.**
*/

protocol Validator {
    func validateValue(value: String) -> ValidatorResult
}

/*:
 So each validator is going to have a single `validateValue` function that will accept a `String` input and return a `ValidatorResult`. [Let's see how these are implemented](Individual%20Validators)
*/
