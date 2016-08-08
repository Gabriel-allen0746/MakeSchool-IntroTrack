/*:
 ![Make School Banner](./swift_banner.png)
 # Efficiently Lazy

 Finals are coming up, and Morty wants to know how much he needs to study. According to the syllabus, Morty's final grade is calculated using the following constraints:

 - **Homework:** 20%
 - **Quizzes:** 25%
 - **Tests:** 30%
 - **Midterm:** 10%
 - **Final Exam:** 15%

 Morty's current grades are:

 - **Homework:** 100, 100, 100, 85, 65, 100, 100, 100, 0, 105, 105
 - **Quizzes:** 93, 87, 100, 100, 100, 72
 - **Tests:** 98, 92, 75, 80
 - **Midterm:** 85
 - **Final exam:** ???

 ----

 ## 1. Calculate Morty's current grade.

 - callout(Challenge): Create a function called `calculateMortysGrade`. It should take no arguments and return Morty's _current grade_ as a `Double`. The final exam should not be included in this calculation!
 
 - note: Store Morty's current grade in the `let` constant `mortyGradeWithoutFinal`.

*/


func calculateMortysGrade() -> Double
{
    let homeworkAverage: Double = (100 + 100 + 100 + 85 + 65 + 100 + 100 + 100 + 0 + 105 + 105) / 11
    let quizAverage: Double = (93 + 87 + 100 + 100 + 100 + 72) / 6
    let testAverage: Double = (98 + 92 + 75 + 80) / 4
    let midterm: Double = 85
    let mortyGradeWithoutFinal: Double = (homeworkAverage * 0.20) + (quizAverage * 0.25) + (testAverage * 0.30) + (midterm * 0.10)
    return mortyGradeWithoutFinal
}

let mortyGradeWithoutFinal: Double = calculateMortysGrade()







/*:

 ----
 
## 2. Calcuate the lowest score Morty can earn on the final while still earning an *A* in the class.

 - callout(Challenge): Create a function called `calculateMortysFinalExamGradeNeeded` with an arugment of `gradeWithoutFinal`. It should return the grade Morty needs to earn on the final to earn an *A* in the class. Assume that Morty's final grade needs to be at least 89.5 points to earn an *A*.
 
 - note: Store the grade Morty needs on his final exam in the variable `mortyFinalNeeded`.

*/
let a: Double = 89.5

func calculateMortysFinalExamGradeNeeded(gradeWithoutFinal: Double) -> Double
{
    let gradeNeeded: Double = (89.5 - gradeWithoutFinal) / 0.15
    return gradeNeeded
}

let mortyFinalNeeded = calculateMortysFinalExamGradeNeeded(calculateMortysGrade())




/*:
 
 ----
 
 ## 3. Help out your classmates.

 Your classmates found out about your final exam grade calculator and want you to help them calculate the scores they need on their final exams.

 Create two functions:

 1. `calculateGradeWithoutFinalExam`
 2. `calculateFinalExamGradeNeeded`

 You should be able to use these two functions for all four scenarios below!
 
 - important: These functions might need a lot of parameters. That is okay! Start on paper and plan out your approach before you code!

 ----

 ### a. Beth wants to earn 97 points for an A+.

 - **Homework:** 100 points _(20%)_
 - **Quizzes:** 100 points _(20%)_
 - **Tests:** 100 points _(20%)_
 - **Midterm:** 100 points _(20%)_
 - **Final Exam:** ??? points _(20%)_
 
 - note: Store Beth's current grade in `bethGradeWithoutFinal` and the score she  needs on her final exam in the variable `bethFinalNeeded`.

*/
func calculateGradeWithoutFinal(homeworkavg homeworkavg: Double, homeworkWeight: Double, quizzesavg: Double, quizzesWeight: Double, testsavg: Double, testsWeight: Double, midtermavg: Double, midtermWeight: Double) -> Double
{
    let homework = homeworkavg * homeworkWeight
    let quizzes = quizzesavg * quizzesWeight
    let tests = testsavg * testsWeight
    let midterm = midtermavg * midtermWeight
    let grade = homework + quizzes + tests + midterm
    return grade
}

func calculateFinalExamGradeNeeded(currentScore currentScore: Double, desiredScore: Double, finalExamWeight: Double) -> Double
{
    let gradeNeeded: Double = (desiredScore - currentScore) / finalExamWeight
    return gradeNeeded
}

let bethGradeWithoutFinal: Double = calculateGradeWithoutFinal(homeworkavg: 100, homeworkWeight: 0.20, quizzesavg: 100, quizzesWeight: 0.20, testsavg: 100, testsWeight: 0.20, midtermavg: 100, midtermWeight: 0.20)

let bethFinalNeeded: Double = calculateFinalExamGradeNeeded(currentScore: bethGradeWithoutFinal, desiredScore: 97, finalExamWeight: 0.20)






/*:
 
 ----

 ### b. Jerry wants to earn 80 points for a B.

 - **Homework:** 91 points _(20%)_
 - **Quizzes:** 72 points _(25%)_
 - **Tests:** 77 points _(25%)_
 - **Midterm:** 64 points _(10%)_
 - **Final Exam:** ??? points _(20%)_

 - note: Store Jerry's current grade in `jerryGradeWithoutFinal` and the score he needs on his final exam in the variable `jerryFinalNeeded`.
 
*/


let jerryGradeWithoutFinal: Double = calculateGradeWithoutFinal(homeworkavg: 91, homeworkWeight: 0.20, quizzesavg: 72, quizzesWeight: 0.25, testsavg: 77, testsWeight: 0.25, midtermavg: 64, midtermWeight: 0.10)

let jerryFinalNeeded: Double = calculateFinalExamGradeNeeded(currentScore: jerryGradeWithoutFinal, desiredScore: 80, finalExamWeight: 0.20)




/*:
 
 ----

 ### c. Summer wants to earn 89.5 points for an A.

 - **Homework:** 94 points _(20%)_
 - **Quizzes:** 89 points _(25%)_
 - **Tests:** 83 points _(30%)_
 - **Midterm:** 93 points _(10%)_
 - **Final Exam:** ??? points _(15%)_

 - note: Store Summer's current grade in `summerGradeWithoutFinal` and the score she  needs on her final exam in the variable `summerFinalNeeded`.
 
*/

let summerGradeWithoutFinal: Double = calculateGradeWithoutFinal(homeworkavg: 94, homeworkWeight: 0.20, quizzesavg: 89, quizzesWeight: 0.25, testsavg: 83, testsWeight: 0.30, midtermavg: 93, midtermWeight: 0.10)

let summerFinalNeeded: Double = calculateFinalExamGradeNeeded(currentScore: summerGradeWithoutFinal, desiredScore: 89.5, finalExamWeight: 0.15)



/*:
 
 ----

 ### d. Rick doesn't care about school. He's fine earning 70 points for a C.

 - **Homework:** 0 points _(10%)_
 - **Quizzes:** 20 points _(10%)_
 - **Tests:** 33.33 points _(15%)_
 - **Midterm:** 100 points _(10%)_
 - **Final Exam:** ??? points _(55%)_
 
 - note: Store Rick's current grade in `rickGradeWithoutFinal` and the score he  needs on his final exam in the variable `rickFinalNeeded`.

*/
let rickGradeWithoutFinal = calculateGradeWithoutFinal(homeworkavg: 0, homeworkWeight: 0.10, quizzesavg: 20, quizzesWeight: 0.10, testsavg: 33.33, testsWeight: 0.15, midtermavg: 100, midtermWeight: 0.10)

let rickFinalNeeded = calculateFinalExamGradeNeeded(currentScore: rickGradeWithoutFinal, desiredScore: 70, finalExamWeight: 0.55)






/*:
 
 ----

 ## 4. Format the results!

 It's time to create a function to format the results into _Strings_.
 
 - important: "Printing" is a programming term that means "output to the console". We are not talking about printing it to paper! To view the console, press this button on the top right. ![Open console](./print_console.png)
 
     An empty white box should have appeared at the bottom of your editor! How do you actually "print" to this area? You use the `print` function. `print` takes a single argument -- a `String`.
     
     If you call `print("Hello, Make School!")` then you will see `Hello, Make School!` in the console.
     
     Now... you might be wondering, how do you inject variable values into a `String`? We do this with "string interpolation". If you have the following:
     
         let number: Int = 5
         print("My number is \(number), it is one less than \(number + 1)")
     
     Then it would print `My number is 5, it is one less than 6` to the console. You can add as many of the `\(expression)` interpolations into your string as you would like. Try it out and complete the challenge below :)

 - callout(Challenge): Create a function that returns a fully formatted string. Use that function to _print_ each person's current grade and final exam grade needed (including Morty) to the console with the format: "_name_ currently has _gradeWithoutFinal_ points and needs to earn at least _finalExamGradeNeeded_ points on the final exam to be happy."

*/
func printCurrentAndFinalNeeded(name name: String, gradeWithoutFinal: Double, finalExamGradeNeeded: Double)
{
    print( "\(name) currently has \(gradeWithoutFinal) points and needs to earn at least \(finalExamGradeNeeded) points on the final exam to be happy.")
}

printCurrentAndFinalNeeded(name: "Morty", gradeWithoutFinal: mortyGradeWithoutFinal, finalExamGradeNeeded: mortyFinalNeeded)

printCurrentAndFinalNeeded(name: "Beth", gradeWithoutFinal: bethGradeWithoutFinal, finalExamGradeNeeded: bethFinalNeeded)

printCurrentAndFinalNeeded(name: "Jerry", gradeWithoutFinal: jerryGradeWithoutFinal, finalExamGradeNeeded: jerryFinalNeeded)

printCurrentAndFinalNeeded(name: "Summer", gradeWithoutFinal: summerGradeWithoutFinal, finalExamGradeNeeded: summerFinalNeeded)

printCurrentAndFinalNeeded(name: "Rick", gradeWithoutFinal: rickGradeWithoutFinal, finalExamGradeNeeded: rickFinalNeeded)








