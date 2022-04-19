import Foundation

public class Algorithms {
    public init() {}
    
    public func fibo(_ length: Int = 15) {
        print("(Inefficient) Fibonacci - Length \(length)")
        
        func fiboInneficient(_ n: Int) -> Int {
            if (n <= 1)
            {
                return n;
            }
            
            return (fiboInneficient(n - 1) + fiboInneficient(n - 2))
        }
        
        var values: [Int] = []
        
        for i in 0..<length {
            values.append(fiboInneficient(i))
        }
        
        print(values.map{String($0)}.joined(separator: ","))
    }
    
    public func fiboDynamic(_ length: Int) {
        print("(Dynamic) Fibonacci - Length \(length)")
        var table: [Int] = []
        
        table.append(0)
        table.append(1)
        
        for i in 2..<length {
            table.append(table[i-1] + table[i-2])
        }
        
        print(table.map{String($0)}.joined(separator: ","))
    }
    
    public func maxSum_ZeroHeight(_ input: [Int]){
        print("MaxSum Zero Height - Given a vector, find a segment of the vector that has a maximum sum and print this value")
        
        var x = input[0]
        
        for i in 1..<input.count{
            for k in i..<input.count{
                var s: Int = 0
                
                for j in i..<k{
                    s = s + input[j]
                }
                
                x = max(x, s)
            }
        }
        
        print(x)
    }
    
    public func maxSum_OneHeight(_ input: [Int]){
        print("MaxSum One Height")
        
        var x = input[0]
        
        for q in 2..<input.count{
            var s: Int = 0
            
            for j in (1..<q).reversed(){
                s = s + input[j]
                x = max(x, s)
            }
        }
        
        print(x)
    }
    
    public func maxSum_DivideConquer(_ input: [Int]){
        print("MaxSum Divide And Conquer")
        
        if (input.count == 0){
            return;
        }
        
        func recursive(_ nums: [Int], _ left: Int, _ right: Int) -> Int {
            if (right == left){
                return nums[left]
            }
            
            let mid: Int = (left + right) / 2
            
            let firstVectorResult = recursive(nums, left, mid)
            let secondVectorResult = recursive(nums, mid + 1, right)
            
            var sum: Int = nums[mid]
            var maxLeft: Int = sum
            
            for i in stride(from: mid - 1, through: left, by: -1) {
                sum += nums[i]
                maxLeft = max(maxLeft, sum)
            }
            
            sum = nums[mid+1]
            var maxRight: Int = sum
            
            if (right >= (mid+2)){
                for i in (mid+2)..<right{
                    sum += nums[i]
                    maxRight = max(maxRight, sum)
                }
            }
            
            return max(firstVectorResult, maxLeft + maxRight, secondVectorResult)
        }
        
        print(recursive(input, 0, input.count -  1))
    }
}
