//
//  ContentView.swift
//  SwiftUI-PageViewController
//
//  Created by Ethan on 01/05/2022.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        //
        // Put here all Views you want to show in slider
        //
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
