/*:
 # CompositeValidator
 
 So the whole idea behind this, was that we would be able to compose those individual validators into a larger tree of validators, and allow this tree to be used in the same way as if it were a leaf. 
 
 To do this, we are going to create the `CompositeValidator`. This validators is going to be initialized with another set of validators. When it is called to validate, it will iterate through them and ask each individual one to vadiate  the input.
 
 > Again, for the sake of simplicity it is going to just return the first invalid response.
*/

struct CompositeValidator: Validator {
    
    let validators: [Validator]
    
    init(validators: Validator...) {
        self.validators = validators
    }
    
    func validateValue(value: String) -> ValidatorResult {
        
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

//: Alright, so now that we have all of the parts to compose the different validators, [let's create a configurator class](ValidatorConfigurator) to actually compose these into complete validators
