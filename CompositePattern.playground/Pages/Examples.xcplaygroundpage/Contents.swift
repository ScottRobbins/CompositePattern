/*:
 # Examples
 > * Ignore the example(){} blocks, they are just used to format nicely in the console and manage scope
 >
 > * View the output in the console
*/
//: ### Email Examples
example("Empty Email") {
    let email = ""
    
    let result = ValidatorConfigurator.sharedInstance
        .emailValidator()
        .validateValue(email)
    
    print(result)
}

example("invalid Email Format") {
    let email = "invalidEmail@"
    
    let result = ValidatorConfigurator.sharedInstance
        .emailValidator()
        .validateValue(email)
    
    print(result)
}

example("Valid Email") {
    let email = "validEmail@validDomain.com"
    
    let result = ValidatorConfigurator.sharedInstance
        .emailValidator()
        .validateValue(email)
    
    print(result)
}

//: ### Password Examples
example("Empty Password") {
    let password = ""
    
    let result = ValidatorConfigurator.sharedInstance
        .passwordValidator()
        .validateValue(password)
    
    print(result)
}

example("Too short of password") {
    let password = "psS$"
    
    let result = ValidatorConfigurator.sharedInstance
        .passwordValidator()
        .validateValue(password)
    
    print(result)
}

example("Missing Special character") {
    let password = "paSsw0rd"
    
    let result = ValidatorConfigurator.sharedInstance
        .passwordValidator()
        .validateValue(password)
    
    print(result)
}

example("Valid password") {
    let password = "paS$w0rd"
    
    let result = ValidatorConfigurator.sharedInstance
        .passwordValidator()
        .validateValue(password)
    
    print(result)
}

//: Yay, things work. But [why would we want to structure our code this way?](Pros%20and%20Cons)
