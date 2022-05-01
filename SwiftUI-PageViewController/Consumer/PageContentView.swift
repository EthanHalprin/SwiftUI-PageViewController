//
//  PageContentView.swift
//  SwiftUI-PageViewController
//
//  Created by Ethan on 01/05/2022.
//

import SwiftUI


struct PageContentView: View {
    //
    // Design here a single View to be shown in slider
    //
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

struct PageContentView_Previews: PreviewProvider {
    static var previews: some View {
        PageContentView(name: "view_illustration_0", text: "Sunny Road")
    }
}
