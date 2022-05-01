//
//  ContentView.swift
//  SwiftUI-PageViewController
//
//  Created by Ethan on 01/05/2022.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        PageSliderView([PageContentView(name: "view_illustration_0", text: "Sunny Road"),
                        PageContentView(name: "view_illustration_1", text: "Sunset Drive"),
                        PageContentView(name: "view_illustration_2", text: "Night Trip")])
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


//
// SwiftUI view to hold page content
//
struct PageContentView: View {
    
    var name: String
    var text: String
    
    var body: some View {
        ZStack {
            Image(name)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .overlay(alignment: .bottomLeading) {
                    Text(text)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .shadow(color: .black, radius: 20)
                }
        }
    }
}
