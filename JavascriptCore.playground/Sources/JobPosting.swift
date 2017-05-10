import JavaScriptCore


@objc protocol JobPostingJSExport: JSExport {
    var company: String { get set }
    var title: String { get set }
}

@objc public class JobPosting: NSObject, JobPostingJSExport {
    public var company: String
    public var title: String
    public var responsibilities = [String]()
    public var filled = false
    
    public init(company: String, title: String) {
        self.company = company
        self.title = title
    }
}

