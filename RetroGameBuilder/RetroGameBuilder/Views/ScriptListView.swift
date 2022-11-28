//
//  ScriptListView.swift
//  RetroGameBuilder
//
//  Created by Yu Ho Kwok on 29/11/2022.
//

import SwiftUI

struct ScriptListView : View {
    var body: some View {
        
        
            ForEach(0...10, id:\.self ) {
                i in
                
                DisclosureGroup {
                    Text("Completed Inspections")
                    Text("Completed Inspections")
                    Text("Completed Inspections")
                } label: {
                    
                    HStack {
                        Text("Scene \(i)")
                        Spacer()
                    }
                }
            }
         
        
    }
}

struct ScriptListView_Previews : PreviewProvider {
    static var previews: some View {
        ScriptListView()
    }
}
