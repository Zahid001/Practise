import Foundation

let searchString = "p"
let array = ["apple", "workshops", "shopping", "sports", "parties", "pantry", "pen", "xyzzy"]
let result = array.filter{$0.contains(searchString)}
    .map{($0.hasPrefix(searchString) ? 0 : 1, $0)}

let asc = array.sorted(by: <)
    
print(asc)
