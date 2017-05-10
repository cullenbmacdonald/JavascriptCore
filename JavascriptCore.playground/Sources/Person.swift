import JavaScriptCore

@objc public protocol PersonJSExport: JSExport {
    var email: String { get set }
    func quit(_ personalEmail: String)
}

public class Person: NSObject, PersonJSExport {
    public var name: String
    public var email: String
    public var employed: Bool
    
    public init(name: String, email: String, employed: Bool) {
        self.name = name
        self.email = email
        self.employed = employed
    }
    
    public func quit(_ personalEmail: String) {
        email = personalEmail
        employed = false
    }
}
