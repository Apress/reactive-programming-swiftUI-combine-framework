# CombineMe

## SwiftUI / Combine

Tutorial for 360iDev 2021 Conference :-)

[video from last year!](https://360idev.com/session-videos/?vimeography_gallery=10&vimeography_video=457826085)
[On YouTube] (https://www.youtube.com/watch?v=2eezk9u2lcE&list=PLnD_TKDSaFyXBC1yqsWCdBMmV4Gq99u7u&index=3)

****Requirements****
Mac OS 10.15.6 or newer because we are using XCode 13 Beta 5.

If you do not have these you can still follow along ...
We will work in pure SwiftUI (No UIKit)

Talks covering both Android and iOS (given @ GDG SF / Berkley)
https://docs.google.com/presentation/d/1nVVyWUnnenSJa-vyr_B0sfYr9uPhFFzJyUdKu3NmwrU/edit?ts=60f89549#slide=id.p


Schedule
--
#### Start (9am) - End (12:30pm)

We start with a presentation covering Why SwiftUI? / Combine Framework.
[Slides](https://docs.google.com/presentation/d/1dKb4akc9U4xW9_L57Gx21qNbH33SVJjdvmSaFXkCCeI/edit?usp=sharing)


#### 9am - 9:30am - Swift 5.3 / 5.4 / (5.5?) (Review)
[Part 1 Slides 1 - 22](https://docs.google.com/presentation/d/1dKb4akc9U4xW9_L57Gx21qNbH33SVJjdvmSaFXkCCeI/edit?usp=sharing)
[Swift 5 Lang Playgrounds]
* Basic language constructs
* Methods, Functions, Closures (escaping)
* Property Wrappers 
* Swift Package Manager -- https://github.com/onevcat/Kingfisher - example
* MVVM Architecture explained

#### 9:30am - 10pm - SwiftUI 3 (Tutorial)
[Part 2 Slides 23 - 51](https://docs.google.com/presentation/d/1dKb4akc9U4xW9_L57Gx21qNbH33SVJjdvmSaFXkCCeI/edit#slide=id.g5e0c07467c_0_1823)
[SwiftUI Playground Tutorials]
- XCode Design Tools / Preview
- Layouts Views
- Modifiers
- V/H/Z Stacks
- List, Forms and Containers
- Animations
- UserInput (Tap Gesture &  Sliders / Toggle / Picker / Stepper)
- Alerts / Action Sheets
- Navigation
- Data Flow with Combine Framework

#### 10am - 10:30am SwiftUI State Management (Tutorial)
[Part 3 Slides 51 - 61](https://docs.google.com/presentation/d/1dKb4akc9U4xW9_L57Gx21qNbH33SVJjdvmSaFXkCCeI/edit#slide=id.g5e0c07467c_0_1868)
[SwiftUI State Managment Playground Tutorials]
Cold vs Hot Stream
- @State
- @Binding
- @StateObject
- @ObservedObject
- @AppStorage
- @SceneStorage
- @EnvironmentObject

##### Combine Famework (Tutorial)
[Part 4 Slides 61 - end](https://docs.google.com/presentation/d/1dKb4akc9U4xW9_L57Gx21qNbH33SVJjdvmSaFXkCCeI/edit#slide=id.g5e0c07467c_0_1868)
[Combine Playground Tutorials]
- Publisher
- Subject
- Operators
- Subscriber
- SwiftUI Property Wrappers
- Codable / JSON     

[Orig Credit for Combine Playgrounds ](https://github.com/AvdLee/CombineSwiftPlayground)

Combine / SwiftUI Code Project
--
#### 10:30am - 11:30am Project Setup
` UI Bike Sharing Project `

#### 11:30pm - 12pm Project Development
` Data Bike Sharing Project `

- testing
- Questions
- Review the day.

--
## Resources

API generator
https://app.quicktype.io


--

##### SwiftUI
* https://github.com/vlondon/awesome-swiftui
* https://github.com/WillieWangWei/SwiftUI-Tutorials
* https://github.com/peterfriese/SwiftUI-Combine
* https://github.com/AvdLee/CombineSwiftPlayground
* https://github.com/sergdort/CombineFeedback
* https://github.com/AlexeyVoronov96/NewsApp-With-SwiftUI-And-Combine
* https://github.com/heckj/swiftui-notes
* https://github.com/kevinjohnason/combine-magic-swiftui - Combine magic
* https://github.com/attoPascal/SwiftUI-Tutorial-Playground
* https://github.com/CypherPoet/book--swiftui-by-tutorials

~~~
Combine Tutorial
- (Apple)[https://developer.apple.com/documentation/combine]
* https://www.donnywals.com/an-introduction-to-combine/ - done
* https://www.raywenderlich.com/7864801-combine-getting-started
* https://theswiftdev.com/the-ultimate-combine-framework-tutorial-in-swift/
* https://www.swiftbysundell.com/basics/combine/
* https://www.avanderlee.com/swift/combine/
* https://www.vadimbulavin.com/swift-combine-framework-tutorial-getting-started/

SwiftUI
* https://swiftuihub.com/swiftui-tutorials/combine/
* https://www.andrewcbancroft.com/blog/ios-development/ui-work/swiftui-essentials-playgrounds/

Whats new in Swfit 3.0
enable pull to refresh
add a search bar to filter your data
add custom swipe action buttons to a List row
load a remote image from a URL
add visual effect blurs
add a toolbar to the keyboard
run an asynchronous task when a view is shown


MVVM Arch

* https://github.com/kitasuke/SwiftUI-MVVM
https://quickbirdstudios.com/blog/swiftui-architecture-redux-mvvm/
https://github.com/quickbirdstudios/SwiftUI-Architectures/blob/master/README/MVVM.jpeg
~~~
