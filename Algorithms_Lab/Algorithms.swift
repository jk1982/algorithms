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
        
        func recursive(_ A: [Int], _ p: Int, _ r: Int) -> Int {
            if (p == r){
                return A[p]
            }
            
            let q = (p+r)/2
            
            let x1 = recursive(A, p, q)
            let x2 = recursive(A, q+1, r)
            
            var s = A[q]
            var y1 = s;
            
            for i in (p..<(q-1)).reversed() {
                print(i)
                s += A[i]
                y1 = max(y1, s)
            }
            
            s = A[q+1]
            
            var y2 = s
            
            for j in (q+2)..<r {
                s += A[j]
                y2 = max(y2, s)
            }
            
            let x = max(x1, y1 + y2, x2)
            
            return x
        }
            
        print(recursive(input, 0, input.count))
    }
}
