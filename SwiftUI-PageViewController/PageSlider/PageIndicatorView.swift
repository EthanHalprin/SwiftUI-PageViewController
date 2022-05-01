//
//  PageIndicatorView.swift
//  SwiftUI-PageViewController
//
//  Created by Ethan on 01/05/2022.
//

import SwiftUI

//
// PageIndicatorView to encapsulate and create a UIKit UIPageControl
//
struct PageIndicatorView: UIViewRepresentable {
    
    typealias UIViewType = UIPageControl
    @ObservedObject var transitionTrigger: TransitionTrigger

    
    func makeUIView(context: Context) -> UIPageControl {
        let pageControl = UIPageControl()
        pageControl.currentPageIndicatorTintColor = .blue
        pageControl.numberOfPages = 3
        pageControl.pageIndicatorTintColor = .gray
        return pageControl
    }

    func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.currentPage = transitionTrigger.pageNum
    }
}
