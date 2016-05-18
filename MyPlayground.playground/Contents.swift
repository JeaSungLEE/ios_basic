//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
let str2 = "hi"

var view = UIView.init(frame: CGRectMake(0 , 0, 100, 100))
view.backgroundColor = UIColor.redColor()
view.backgroundColor = UIColor.yellowColor()

var numberArray : [Int] = [Int]()
for number in 0..<10{
    numberArray.append(number)
}

numberArray
print("\(numberArray)")
func hammingWeight(x:Int) -> (String,Int){
    var count = 0
    var result = ""
    var z=x
    while(z != 0){
        result = String(z%2) + result
        if(z%2==1){
            count += 1
        }
        z = (Int)(z/2)
        
    }
    return (result,count)
}
let result = hammingWeight(11)
result.0
result.1


