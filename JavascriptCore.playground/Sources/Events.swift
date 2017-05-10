import JavaScriptCore

// NOTE! JSManagedValues are a thing
public typealias EventHandler = [String: [JSValue]]

@objc public protocol EventDispatchJSExport: JSExport {
    var events: [Int: EventHandler] { get set }
    func on(_ obj: AnyObject, _ event: String, _ handler: JSValue)
    func trigger(_ obj: AnyObject, _ event: String)
}

@objc public class EventDispatch: NSObject, EventDispatchJSExport {

    public var events = [Int: EventHandler]()
    
    public func on(_ obj: AnyObject , _ event: String, _ handler: JSValue) {
        let key = ObjectIdentifier(obj).hashValue
        
        var classHandlers = events[key] ?? EventHandler()
        var eventHandlers = classHandlers[event] ?? [JSValue]()
        
        eventHandlers.append(handler)
        classHandlers[event] = eventHandlers
        events[key] = classHandlers
    }
    
    public func trigger(_ obj: AnyObject, _ event: String) {
        let klass: AnyClass = type(of: obj)
        let key = ObjectIdentifier(klass).hashValue
        events[key]?[event]?.forEach { (handler) in
            handler.call(withArguments: [obj])
        }
    }
}
