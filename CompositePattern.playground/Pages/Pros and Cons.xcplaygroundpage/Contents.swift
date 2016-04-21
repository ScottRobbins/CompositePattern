/*:
 ### Pros
 * The validators are easily composable
 * The validators are small, succinct units of code that can easily be tested
 * The validators can be easily added/removed/changed without affecting outside code
 > Think about what would happen if you wanted to break apart the `PasswordStrengthValidator`. Maybe `PasswordStrengthValidator` could be a `CompositeValidator` itself.
 
 ### Cons
 * What was once in a single function has now been split across many files (could also be a benefit)
 * If you need to accept input that isn't a `String`, you will have to create another `Validator` protocol and `CompositeValidator` unless you know some generics wizardry I couldn't figure out
 ---
 **Scott Robbins** | [@scottrobbinsios](https://twitter.com/scottrobbinsios) | [srscottrobbins@gmail.com](mailto:srscottrobbins@gmail.com)
*/
