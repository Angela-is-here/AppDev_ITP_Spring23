import UIKit
import Foundation

//setting var up for intro
let firstName = "Angie"
let familyName = "Kim"
let schoolYear = "1st year"
let undergradDepartment = "Fine Arts"
let gradDepartment = "ITP"
let undergradSchool = "Kookmin University"
let gradSchool = "NYU"
var age = "24"

var ageGuess = [22, 23, 24, 25, 26, 27, 28]
ageGuess.append(30)
ageGuess.append(40)

let characterAge = "Count the number of this sentence."
let characterAge2 = "minus 10 ="
var correctAge = characterAge.count - characterAge2.count

let intro = """
Hello, my name is \(firstName) \(familyName)
and I am \(schoolYear) student in \(gradDepartment) \(gradSchool).
I studied \(undergradDepartment) at \(undergradSchool) before coming here.

Guess my age!
\(ageGuess[0])? \(ageGuess[1])? \(ageGuess[2])? \(ageGuess[3])? \(ageGuess[4])? \(ageGuess[5])?
even \(ageGuess[6]) or \(ageGuess[7])?

"""

print(intro)
print(characterAge)
print("(which is \(characterAge.count), I'll do the math)")
print("that \(characterAge2) my age, which is \(correctAge)."
)

print(" ")
print("--------I'm done with my intro --------")

//diary section with emoji
//set var + array of emojis i'll use
let clapEmoji = "👏"
let emojisForToday = ["😱", "🤬", "🤯", "😢", "🧐", "💻", "😔", "😍", "🥤", "🍪"]
print(" ")
print("Let me write a short diary of today with emojis" + clapEmoji)
print(" ")
print("""
      Today I was quite \(emojisForToday[2]).
      The first reason that i was feeling \(emojisForToday[2]) was that I kinda feeling tired\(emojisForToday[6]) without any reason.
      I came back home after finishing all works that I needed to do on the floor
      and tried to find a charger for \(emojisForToday[5]), which I succeed.
      But the thing was that it was for 220V and I couldn't find an adapter for that in my entire place\(emojisForToday[0])
      It was frustrating but my good friends who just live next to me borrowed their ones so I felt \(emojisForToday[7]).
      However, my \(emojisForToday[5]) turned up with a glitchy screen and it was worse than before.
      I was \(emojisForToday[1]) and \(emojisForToday[4]) of buying a new one.
      but for now I'll just have \(emojisForToday[8]) and \(emojisForToday[9]) and sleep.
      """)

print(" ")
print(" ")
print(" ")

//emoji fortune cookie section

print("Tomorrow I'll be like these emojis.")
print("It's random like a little fortune cookie")

//Unicode of the clap emoji is 1F44F
print("I'll start with this emoji right here" + clapEmoji + "and the unicode for that will be:")
print("1F44F")
print(" ")
print("I'll add up 1 to that array for the numeric value of the code just like this")
print(" ")

//using for loop to add 1 to the initial value and print the result
//set initial value
var initialValue = 44
//set for loop
for increseValue in 1...5 {
    
    //+1 to the initial value for 5 times
    initialValue = initialValue + increseValue
    
    //set the codepoint format like 1F(00)F
    let codepoint = "1F\(initialValue)" + "F"
    
    //set the result to be an emoji with UnicodeScalar
    let result = UnicodeScalar(Int(codepoint, radix: 16)!)!
    
    //print the result
    print(codepoint, result)
    
    //reset the initial value
    initialValue = 44
}
print(" ")
print("Seems like I'll have a gay day!")

