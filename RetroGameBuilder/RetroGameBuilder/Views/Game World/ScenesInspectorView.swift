//
//  ScenesInspectorView.swift
//  RetroGameBuilder
//
//  Created by Yu Ho Kwok on 16/11/2022.
//

import SwiftUI

struct ScenesInspectorView : View {
    

    @State var showingPopover = false
    
    @State var isEnable = true
    @State var input : String = ""
    
    @State var value : Int = 0
    
    var body: some View {
        VStack (alignment: .leading) {
            Text("Author")
                .font(.footnote)
            
            TextField("hihi", text: $input)
                .textFieldStyle(.roundedBorder)
                .font(.footnote)
            
            HStack {
                Toggle("Enable Color Mode", isOn: $isEnable).font(.footnote)
                Button(action: {}, label: {
                    Text("More Settings")
                        .buttonStyle(.bordered)
                })
            }
            
            Text("Starting Scene")
                .font(.footnote)
            TextField("hihi", text: $input).textFieldStyle(.roundedBorder)
                .font(.footnote)
            
            
            Text("Start Position")
                .font(.footnote)
            TextField("hihi", text: $input).textFieldStyle(.roundedBorder)
                .font(.footnote)
            
            
            Text("Direction")
                .font(.footnote)
            TextField("hihi", text: $input).textFieldStyle(.roundedBorder)
                .font(.footnote)
            
            
            Button("Show Menu") {
                        showingPopover = true
                    }
                    .popover(isPresented: $showingPopover) {
                        Text("Your content here")
                            .font(.headline)
                            .padding()
                    }
        }
        .padding()
        
    }
}

struct InpsectorView_Preview : PreviewProvider {
    static var previews: some View {
        ScenesInspectorView()
    }
}
