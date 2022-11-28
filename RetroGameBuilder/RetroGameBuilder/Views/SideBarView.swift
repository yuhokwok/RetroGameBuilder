//
//  SideBarView.swift
//  RetroGameBuilder
//
//  Created by Yu Ho Kwok on 16/11/2022.
//

import SwiftUI

struct SideBarView : View {
    
    @Binding var scenes : [RGBScene]
    @State var scenes1 : [RGBScene] = [RGBScene(), RGBScene()]
    @State var scripts = ["script1" , "script2"]
    @State var variables = ["variable1" , "variable2"]
    
    var body: some View {

        VStack {
            List {
                ForEach(0...2, id:\.self)
                {
                    i in
                    
                    DisclosureGroup {
                        
                        switch i {
                        case 0 :
                            ForEach( scenes1 ) {
                                scene in
                                
                                DisclosureGroup {
                                    Text("Completed Inspections")
                                    Text("Completed Inspections")
                                    Text("Completed Inspections")
                                } label: {
                                    
                                    HStack {
                                        Text("Scene \(scene.id)")
                                        Spacer()
                                    }
                                    //.padding(5)
//                                    .onTapGesture {
//                                        print("hello")
//                                    }
                                }
                            }
                        case 1:
                            ForEach( scripts, id:\.self ){
                                script in
                                Text(script)
                            }
                        default:
                            ForEach( variables, id:\.self ){
                                variable in
                                Text(variable)
                            }
                        }
                        

                    } label: {
                        switch i {
                        case 0:
                            Text("Scene")
                        case 1:
                            Text("Script")
                        default:
                            Text("Variable")
                        }
                    }
                }
                
            }.listStyle(.plain)
            
        }
    }
    
    
//    ForEach( scenes1 ) {
//        scene in
//
//        DisclosureGroup {
//            Text("Completed Inspections")
//            Text("Completed Inspections")
//            Text("Completed Inspections")
//        } label: {
//
//            HStack {
//                Text("Scene \(scene.id)")
//                Spacer()
//            }
//            //.padding(5)
////                                    .onTapGesture {
////                                        print("hello")
////                                    }
//        }
//    }
}

//struct SideBarView_Preview : PreviewProvider {
//    static var previews: some View {
//        SideBarView()
//    }
//}
