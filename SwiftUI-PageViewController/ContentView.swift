//
//  ContentView.swift
//  SwiftUI-PageViewController
//
//  Created by Ethan on 01/05/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        PageSliderView(["Page #0", "Page #1", "Page #2"])
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
