// SwiftUI 2 Playground
import SwiftUI
import PlaygroundSupport

struct ContentViewHW: View {
    var body: some View {
        Text("Hello World")
        
    }
}

struct ContentViewSlider: View {
    @State private var bgColor =
        Color(.sRGB, red: 0.98, green: 0.9, blue: 0.2)
    
    @State private var age = 18
    
    
    var colors = ["Red", "Green", "Blue", "Tartan"]
    @State private var selectedColor = 0
    
    @State private var celsius: Double = 0
    @State var sliderValue = 0.0
    @State private var showGreeting = true
    
    var minimumValue = 0.0
    var maximumvalue = 100.0
    
    var body: some View {
        VStack {
            // Slider
            VStack {
                HStack {
                    Text("\(Int(minimumValue))")
                    Slider(value: $sliderValue, in: minimumValue...maximumvalue)
                    Text("\(Int(maximumvalue))")
                }.padding()
                Text("\(Int(sliderValue))")
            }
            Divider()
            // Toggle
            VStack {
                Toggle(isOn: $showGreeting) {
                    Text("Show welcome message")
                }.padding()
                
                if showGreeting {
                    Text("Hello World!").onTapGesture(count: 2) {
                        print("Tapped!")
                    }
                }
            }
            Divider()
            // Picker
            VStack {
                Picker(selection: $selectedColor, label: Text("Please choose a color")) {
                    ForEach(0 ..< colors.count) {
                        Text(self.colors[$0])
                    }
                }
                Text("You selected: \(colors[selectedColor])")
            }
            Divider()
            //Stepper
            VStack {
                Stepper("Enter your age", value: $age, in: 0...130)
                Text("Your age is \(age)")
                // ColouPickerView() // very easy to add views.
            }
        }/*.frame(minWidth: 0,
                maxWidth: .infinity,
                minHeight: 0,
                maxHeight: .infinity,
                alignment: .topLeading)*/
        Spacer()
    }
}

struct ColorPickerView: View {
  @State private var bgColor =
    Color(.sRGB, red: 0.98, green: 0.9, blue: 0.2)
  
  var body: some View {
    VStack {
      ColorPicker("Alignment Guides", selection: $bgColor)
            .frame(width: 500, height: 1000)
    }
  }
}

PlaygroundPage.current
    .setLiveView(ContentViewSlider())
    //.setLiveView(ColourPickerView())
