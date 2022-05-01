//
//  PageViewController.swift
//  SwiftUI-List
//
//  Created by Ethan on 28/04/2022.
//

import SwiftUI
import UIKit


//
// A SwiftUI struct for holding & filling the PageViewController with real
// controllers.
//
// *Remark:
//
//   In this case the controllers need to be a PageContentView. But the latter is
//   a SwiftUI struct, while PageViewController member of this class demands that
//   the controllers are of [UIViewController] type.
//   Hence, this is a usecase for UIHostingController (applied when we need to
//   accommodate a SwiftUI struct ('PageContentView') inside an UIKit struct
//   ('[UIViewController]')
//
struct PageSliderView: View {
    
    var controllers = [UIHostingController<PageContentView>]()
    //
    // This state object is crucial for passing the transion data
    // and will be sent to both PageViewController & PageIndicatorView
    //
    @StateObject var transitionTrigger = TransitionTrigger()
    
    init(_ data: [String]) {
        self.controllers = data.map({ UIHostingController(rootView: PageContentView(data: $0)) })
    }
    
    var body: some View {
        PageViewController(controllers: controllers, transitionTrigger: transitionTrigger)
            .overlay(alignment: .bottom) {
                PageIndicatorView(transitionTrigger: transitionTrigger)
            }
    }
}

