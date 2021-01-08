//: A UIKit based Playground for presenting user interface
  
import PlaygroundSupport
import MyUIPlaygroundFramework
import SwiftUI

class MyViewController : UIViewController {
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white

        let label = UILabel()
        label.frame = CGRect(x: 150, y: 200, width: 200, height: 20)
        label.text = "Hello World!"
        label.textColor = .black
        
        view.addSubview(label)
        self.view = view
    }
}

struct ContentView:View{
    @State private var message = "Message"
     let newGesture = TapGesture().onEnded {
         print("Tap on VStack.")
        print("\(UIScreen.main.bounds.width)")
     }

     var body: some View {
         VStack(spacing:25) {
            
             Image(systemName: "heart.fill")
                 .resizable()
                 .frame(width: 75, height: 75)
                 .padding()
                 .foregroundColor(.red)
                 .onTapGesture {
                     print("Tap on image.")
                 }
             Rectangle()
                 .fill(Color.blue)
         }
//         .highPriorityGesture(newGesture)
         .frame(width: 200, height: 200)
         .border(Color.purple)
     }
}
// Present the view controller in the Live View window
PlaygroundPage.current.setLiveView(ContentView())
