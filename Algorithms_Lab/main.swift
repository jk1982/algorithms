import Foundation

Measure {
    Algorithms().fibo(15)
}
Measure {
    Algorithms().fiboDynamic(15)
}

let inputMaxSum: [Int] = [20, -30, 15, -10, 30, -20, -30, 30]

Measure {
    Algorithms().maxSum_ZeroHeight(inputMaxSum)
}
Measure {
    Algorithms().maxSum_OneHeight(inputMaxSum)
}
Measure {
    Algorithms().maxSum_DivideConquer(inputMaxSum)
}
