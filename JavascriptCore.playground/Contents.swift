








//  JavascriptCore 
//      4 lyphe

















// Cullen MacDonald

// http://cullen.website
// @cullenmacdonald












// Handshake
// www.handshake.com













// No job right now















import JavaScriptCore

let context = JSContext()! /// dont actually force unwrap
context.globalObject.setValue("i have so much free time", forProperty: "wow")
context.globalObject.forProperty("wow")







let wow = context.globalObject.forProperty("wow")
wow?.toString()








let this = context.globalObject! /// dont actually force unwrap
this.setValue(28, forProperty: "daysSinceJob")
this.forProperty("daysSinceJob").toInt32() + 2











context.evaluateScript("daysSinceJob + 2")
this.forProperty("daysSinceJob")

context.evaluateScript("daysSinceHob = daysSinceJob + 2;")
this.forProperty("daysSinceJob")













context.evaluateScript(
    "function sum(num1, num2) {" +
        "return num1 + num2; " +
    "}"
)
this.forProperty("sum").call(withArguments: [3, 10])












var emailValidation = "(function (email) { " +
    "return email.indexOf('@') > -1;" +
"});"
context.evaluateScript(emailValidation)
    .call(withArguments: ["@gmailcullen.website"])











// Using Magic™









var cullen = Person(name: "cullen", email: "cullen@handshake.com", employed: true)
context.setObject(cullen, forKeyedSubscript: NSString(string: "me"))
context.evaluateScript("me.email")
context.evaluateScript("me.email = 'gmail@cullen.website'")

cullen.email







// Using existing libraries




context.evaluateScript("_.filter")

let underscore = Bundle.main.url(forResource: "underscore", withExtension: "js")!
context.evaluateScript(try! String(contentsOf: underscore))
context.evaluateScript("_.filter")





let jobs = [JobPosting(company: "Spotify", title: "playlist maker"),
            JobPosting(company: "Facebook", title: "fake news maker"),
            JobPosting(company: "Apple", title: "lazy programmer")]

let jobFilter = context.evaluateScript("(function (job) { return job.title == 'lazy programmer'; })")!
context.evaluateScript("_.filter").call(withArguments: [jobs, jobFilter]).toArray()






// Exception Handling




context.exceptionHandler = { context, exception in
    if let exc = exception {
        print("JS Exception:", exc.toString())
    }
}







// Basic Events






let events = EventDispatch()
context.setObject(events, forKeyedSubscript: NSString(string: "Events"))



events.events


context.setObject(Person.self, forKeyedSubscript: NSString(string: "Person"))
let personOn = Bundle.main.url(forResource: "person_on", withExtension: "js")!
context.evaluateScript(try! String(contentsOf: personOn))




events.events



let you = Person(name: "it u af", email: "native email", employed: false)
you.email




events.trigger(you, "change")
you.email








// Events and CoreData













// Whats left? (hint: months of work)






















