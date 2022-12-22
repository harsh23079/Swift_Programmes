//Don't change any of this code.
var innerArray = ["⬜️", "⬜️", "⬜️", "⬜️", "⬜️", "⬜️", "⬜️"]

var outerArray = [[String]]()

var outerIndex = 0
var innerIndex = 0


func createWorld() {
    for _ in 0...6 {
        outerArray.append([])
    }
    for i in 0...6 {
        outerArray[i] = innerArray
    }
}


func start() {
    createWorld();
    outerArray[0][0] = "🦊"
    outerArray[5][4] = "🌽"
    for i in 0...6 {
        print(outerArray[i])
    }
}

func locateFox() {
    for i in 0..<outerArray.count - 1 {
        if let n1 = outerArray.firstIndex(where: {$0[i] ==  "🦊"})  {
            outerIndex = n1
        }
        if let n2 = outerArray[outerIndex].firstIndex(where: {$0 ==  "🦊"}) {
            innerIndex = n2
        }
        //        print("\(outerIndex)\(innerIndex)")
    }
}

func left() {
    locateFox()
    if innerIndex > 0 {
       outerArray[outerIndex][innerIndex] = "⬜️"
       outerArray[outerIndex][innerIndex - 1] = "🦊"
    } else {
      print("can't go further left.")
    }
} 

func right() {
    locateFox()
    if (innerIndex < innerArray.count) {
      outerArray[outerIndex][innerIndex] = "⬜️"
      outerArray[outerIndex][innerIndex + 1] = "🦊"
    } else {
      print("Can't go further right.")
    }
}

func up() {
    locateFox()
    if outerIndex > 0 {
      outerArray[outerIndex][innerIndex] = "⬜️"
      outerArray[outerIndex - 1][innerIndex] = "🦊"
    } else {
      print("Can't go further up.")
    }
}


func down() {
    locateFox()
    if outerIndex < outerArray.count {
      outerArray[outerIndex][innerIndex] = "⬜️"
      outerArray[outerIndex + 1][innerIndex] = "🦊"
    } else {
      print("Can't go further down.")
    }
}


func visualise() {
    for i in 0...6 {
        print(outerArray[i])
    }
}


