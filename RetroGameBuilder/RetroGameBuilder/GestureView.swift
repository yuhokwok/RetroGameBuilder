//import SwiftUI
//
//struct ScenesEditorView : View {
//    
//    @Binding var project : Project
//    
//    var body: some View {
//        ScrollView {
//            ZStack {
//                ForEach(0..<project.scenes.count, id:\.self) {
//                    i in
//                    SceneView(scene: $project.scenes[i])
//                }
//            }
//        }
//    }
//}
//
//struct SceneView : View {
//    
//    @Binding var scene : GameScene
//    
//    @State private var cardPosition = CGPoint(x: 100, y: 100)
//    @State private var cardCoordString = "100, 100"
//    
//    // drag gesture props
//    @State private var touchLocation = CGPoint(x: 0, y: 0)
//    @State private var translationValue = CGSize(width: 0, height: 0)
//    @State private var startLocationValue = CGPoint(x: 0, y: 0)
//    @State private var predictedEndLocationValue = CGPoint(x: 0, y: 0)
//    @State private var predictedEndTranslation = CGSize(width: 0, height: 0)
//    
//    @State private var touchOffset = CGPoint(x: 0, y: 0)
//    
//    @State var isDragging = false
//    
//    
//    var body: some View {
//        VStack {
//            Text("DevTechie")
//                .font(.largeTitle)
//            Text("\(cardCoordString)")
//        }
//        .frame(width: 200, height: 100)
//        .background(Color.orange, in: RoundedRectangle(cornerRadius: 10))
//        .position(cardPosition)
//        .gesture(DragGesture()
//            .onChanged({ newValue in
//                
//                if isDragging == false {
//                    isDragging = true
//                    
//                    startLocationValue = newValue.startLocation
//                    touchOffset = CGPoint(x: cardPosition.x - startLocationValue.x, y: cardPosition.y - startLocationValue.y)
//                }
//                
//                self.cardPosition = CGPoint(x: newValue.location.x + touchOffset.x, y: newValue.location.y + touchOffset.y) //newValue.location
//                self.cardCoordString = "\(Int(newValue.location.x)), \(Int(newValue.location.y))"
//
//                
//                // drag gesture prop
//                touchLocation = newValue.location
//                translationValue = newValue.translation
//                startLocationValue = newValue.startLocation
//                predictedEndLocationValue = newValue.predictedEndLocation
//                predictedEndTranslation = newValue.predictedEndTranslation
//            })
//                .onEnded({
//                    
//                    newValue in
//                    isDragging = false
//                    
//                })
//        )
//    }
//}
//
//struct DragGestureExample: View {
//    
//    @State private var cardPosition = CGPoint(x: 100, y: 100)
//    @State private var cardCoordString = "100, 100"
//    
//    // drag gesture props
//    @State private var touchLocation = CGPoint(x: 0, y: 0)
//    @State private var translationValue = CGSize(width: 0, height: 0)
//    @State private var startLocationValue = CGPoint(x: 0, y: 0)
//    @State private var predictedEndLocationValue = CGPoint(x: 0, y: 0)
//    @State private var predictedEndTranslation = CGSize(width: 0, height: 0)
//    
//    @State private var touchOffset = CGPoint(x: 0, y: 0)
//    
//    @State var isDragging = false
//    
//    var body: some View {
//        ZStack(alignment: .bottomTrailing) {
//            VStack {
//                Text("DevTechie")
//                    .font(.largeTitle)
//                Text("\(cardCoordString)")
//            }
//            .frame(width: 200, height: 100)
//            .background(Color.orange, in: RoundedRectangle(cornerRadius: 10))
//            .position(cardPosition)
//            .gesture(DragGesture()
//                .onChanged({ newValue in
//                    
//                    if isDragging == false {
//                        isDragging = true
//                        
//                        startLocationValue = newValue.startLocation
//                        touchOffset = CGPoint(x: cardPosition.x - startLocationValue.x, y: cardPosition.y - startLocationValue.y)
//                    }
//                    
//                    self.cardPosition = CGPoint(x: newValue.location.x + touchOffset.x, y: newValue.location.y + touchOffset.y) //newValue.location
//                    self.cardCoordString = "\(Int(newValue.location.x)), \(Int(newValue.location.y))"
//
//                    
//                    // drag gesture prop
//                    touchLocation = newValue.location
//                    translationValue = newValue.translation
//                    startLocationValue = newValue.startLocation
//                    predictedEndLocationValue = newValue.predictedEndLocation
//                    predictedEndTranslation = newValue.predictedEndTranslation
//                })
//                    .onEnded({
//                        
//                        newValue in
//                        isDragging = false
//                        
//                    })
//            )
//            
//            VStack(alignment: .leading) {
//                Text("TouchLocation: \(touchLocation.x), \(touchLocation.y)")
//                Text("TranslationValue: \(translationValue.width), \(translationValue.height)")
//                Text("StartLocationValue: \(startLocationValue.x), \(startLocationValue.y)")
//                Text("PredictedEndLocationValye: \(predictedEndLocationValue.x), \(predictedEndLocationValue.y)")
//                Text("PredictedEndTranslation: \(predictedEndTranslation.width), \(predictedEndTranslation.height)")
//            }
//            .font(.callout)
//        }
//    }
//}
