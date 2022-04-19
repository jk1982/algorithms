import Dispatch

public typealias Handler = () -> Void

public func Measure(_ method: Handler){
    let start = DispatchTime.now()
    
    method()
    
    let end = DispatchTime.now()
    let timeInterval = Double(end.uptimeNanoseconds - start.uptimeNanoseconds) / 1_000_000
    
    print("\(timeInterval)ms")
    print("")
}
