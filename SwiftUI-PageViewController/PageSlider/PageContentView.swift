//
//  PageContentView.swift
//  SwiftUI-PageViewController
//
//  Created by Ethan on 01/05/2022.
//

import SwiftUI

//
// SwiftUI view to hold page content
//
struct PageContentView: View {
    
    var data: String
    
    var body: some View {
        ZStack {
            Color.yellow
                .ignoresSafeArea()
            Text(self.data)
                .font(.title)
                .foregroundColor(Color.black)
        }
    }
}
