//
//  SideBarView.swift
//  RetroGameBuilder
//
//  Created by Yu Ho Kwok on 16/11/2022.
//

import SwiftUI

struct SideBarView : View {
    
    @Binding var project : Project
    

    var body: some View {

        VStack {
            List {
                ForEach(0...2, id:\.self)
                {
                    i in
                    
                    DisclosureGroup {
                        
                        switch i {
                        case 0 :
                            ForEach( project.scenes ) {
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
                            ForEach( project.scripts ){
                                script in
                                Text(script.name)
                            }
                        default:
                            ForEach( project.variables ){
                                variable in
                                Text(variable.name)
                            }
                        }
                        

                    } label: {
                        switch i {
                        case 0:
                            HStack {
                                Image(systemName: "rectangle.on.rectangle")
                                Text("Scene")
                            }
                        case 1:
                            HStack {
                                Image(systemName: "applescript")
                                Text("Script")
                            }
                        default:
                            HStack {
                                Image(systemName: "x.squareroot")
                                Text("Variable")
                            }
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
