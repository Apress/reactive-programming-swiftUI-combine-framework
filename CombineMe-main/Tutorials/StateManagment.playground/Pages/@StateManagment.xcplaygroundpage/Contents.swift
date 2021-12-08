import SwiftUI
import PlaygroundSupport
/**
 #@State property wrapper
 is used inside of View objects and allows your view to respond to any changes
 
 Stack is used for static memory allocation - Allocated only durning compile time.
 * More efficient when allocating and deallocating data.
 * Stacks store value types, such as structs and enums.
 * Data stored in the stack is only there temporarily until the function exits and causes all memory on the stack to be automatically deallocated.
 * Makes memory lookup and access very fast from how well it is organized.
 * The most frequently reserved block is the first to be freed.
 
 Heap for dynamic memory allocation - Allocated durning run time
 * It’s more dynamic but less efficient than the stack.
 * Can grow and shrink in size.
 * Stores reference types such as classes.
 * Goes through 3 steps: allocation, tracking reference counts, and deallocation. As such, this process is less efficient when compared to stacks.
 
 #### Reference Types always goes to the Heap, whereas Value Types always go where they are declared.
 
 **Value Type** — each instance keeps a unique COPY of its data.
 -> *instance type are stored in Stack* Memory is very fast - LIFO.  Once memory is placed on the stack it can not be changed as it is packed in a que.
 
 If the Value Type is part of a class instance stored in the heap beacuse Classes are Reference Type!
 -->  value types, the object itself is stored on the stack.
 
 **Reference Type** — each instances share a single copy of the data always, so returns a reference to the same existing instance.
 -> *reference type instances are stored in HEAP* Memor is slow and managed by reference counting
 -->  reference is stored on the stack while the object it refers to is stored on the heap.
 
 --> effectively move its storage out from our struct and into shared storage managed by SwiftUI
 
 */

class DataProvider: ObservableObject {
    //var currentValue = 7 // remove publisher and updates stop
    @Published var currentValue = 7// All Observables start with 7 as init
}

private var systemDataProvider: DataProvider = DataProvider()
/**
 #### @State
 * The view itself creates (and owns) the instance you want to wrap.
 * You need to respond to changes that occur within the wrapped property.
 * You're wrapping a value type (struct or enum).
 */
struct StateExample: View {
    /* this struct is going to static memory so we can not put a variable in it*/
    @State private var intValue = 0
    
    var body: some View {
        VStack {
            //Image(uiImage: UIImage(named: "WhenToUse.jpg")!).resizable()
            //    .frame(width: 100.0, height: 100.0)
            
            Group {
                Text("intValue \(intValue)")
                Button("Increment @State") {
                    intValue += 1
                }
                BindingView(intValue: $intValue)
            }
            Divider()
            Group {
                // creating the data in the view
                StateDataOwnerView1()
            }
            Divider()
            Group {
                ObservedDataUser(provider:systemDataProvider)
                ObservedDataUser2(provider:systemDataProvider)
            }
            Divider()
            Group{
                AppStroageView()
                //SceneStorageContentView()
                //EnvContentView()
            }
        }
    }
}

/**
 #### @Binding
 1) You need read- and write access to a property that's owned by a parent view.
 2) The wrapped property is a value type (struct or enum).
 3) You don't own the wrapped property (it's provided by a parent view).
 */
struct BindingView: View {
    @Binding var intValue: Int
    
    var body: some View {
        VStack {
            Button("Increment @Binding (+2)") {
                intValue += 2
            }
        }
    }
}

/**
 #### @StateObject property with iOS 14+
 is used for similar reasons as @State, except it's applied to ObservableObject (reference type)
 @StateObject for any given view is initialized only once
 
 Think of StateObject and ObservedObject as the reference type equivalents to State and Binding.
 1) You want to respond to changes or updates in an ObservableObject.
 2) The view you're using @StateObject in creates the instance of the ObservableObject itself.
 */
struct StateDataOwnerView1: View {
    // view creates a local copy
    @StateObject private var provider: DataProvider = DataProvider()
    
    var body: some View {
        Text("provider value1: \(provider.currentValue)")
        Button("Increment @StateObj") {
            provider.currentValue += 1
        }
        StateDataUserView1(provider: provider)
    }
}

struct StateDataUserView1: View {
    // view creates a local copy
    @ObservedObject var provider : DataProvider /* never do = DataProvider()*/
    
    var body: some View {
        Button("Increment @ObserObj (+3)") {
            provider.currentValue += 3
        }
    }
}

/**
 #### @ObservedObject property
 is used to wrap ObservableObject instances that are not created or owned by the view that's used in
 */
struct ObservedDataUser: View {
    @ObservedObject  var provider: DataProvider
    
    var body: some View {
        Text("provider value1: \(provider.currentValue)")
        Button("Increment system provider") {
            provider.currentValue += 1
        }
    }
}

struct ObservedDataUser2: View {
    @ObservedObject  var provider: DataProvider
    
    var body: some View {
        Button("Increment system provider 2") {
            provider.currentValue += 1
        }
    }
}

// saved across restarts.  Stored in user defaults
struct AppStroageView: View {
    @AppStorage("username") var username: String = "Anonymous"
    
    var body: some View {
        VStack {
            Text("Welcome, \(username)!")
            
            Button("Log in") {
                self.username = "ash"
            }
        }
    }
}

// every scene has its own storage.
/*struct SceneStorageContentView: View {
    @SceneStorage("text") var text = ""
    var body: some View {
        TextEditor(text: $text)
    }
}*/


/**
 #### @EnvironmentObject property
 is used when you want to pass these objects down to the initializer of each view you create.
 
 class Order: ObservableObject {
 @Published var item = "hi"
 }
 
 struct EnvContentView: View {
 @EnvironmentObject var order: Order
 
 var body: some View {
 Text(order.item)
 }
 }*/

PlaygroundPage.current
    .setLiveView(StateExample())
/**
 [credti](https://swiftuipropertywrappers.com)
 
 [Great resource](https://www.swiftbysundell.com/articles/swiftui-state-management-guide/)
 
 
 
 */
