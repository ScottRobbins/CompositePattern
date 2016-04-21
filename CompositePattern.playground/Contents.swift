/*:
 # Composite Pattern
 
 ## What is the Composite Pattern?
 ---
 The composite pattern is a design pattern in which a group of objects can be treated the same way as a single object.
 
 The idea is to compose objects into tree structures to represent partial hierarchies.
 
 ## Our Example
 ---
 ### Scenario
 Imagine you have a login. In order to login the user has to enter these fields:
 * Email
 * Password
 
 Each of these fields has their own requirements.
 
 ### Requirements
 **Email:** 
 1. Must not be empty
 2. Must be a valid email format
 
 **Password:**
 1. Must not be empty
 3. Must be at least 6 characters long
 2. Must have one uppercase letter, lowercase letter, number and special character
 
 ### Let's see some code!
 Great! This is the fun part. So in order to set this up, there are a few
*/
