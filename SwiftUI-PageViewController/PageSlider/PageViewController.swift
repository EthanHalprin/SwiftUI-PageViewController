//
//  PageViewController.swift
//  SwiftUI-PageViewController
//
//  Created by Ethan on 01/05/2022.
//

import SwiftUI

//
// A UIKit-UIViewControllerRepresentable struct for generating an UIPageViewController & accommodating
// the UIViewControllers to be presented
//
struct PageViewController: UIViewControllerRepresentable {
    
    var controllers : [UIViewController]?
    // UIPageViewControllerDelegate will need this to report Coordinator of the transition change:
    @ObservedObject var transitionTrigger: TransitionTrigger
   
    typealias UIViewControllerType = UIPageViewController

    func makeUIViewController(context: Context) -> UIPageViewController {
        let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
        pageViewController.dataSource = context.coordinator
        pageViewController.delegate = context.coordinator
        return pageViewController
    }
    
    func updateUIViewController(_ uiViewController: UIPageViewController, context: Context) {
        if let controller0 = self.controllers?[0] {
            uiViewController.setViewControllers([controller0],
                                                direction: .forward,
                                                animated: true)
        }
    }
    
    //
    // Coordinator class here is for supplying the data source and the motion in the slide.
    // (The data source part - see initialization in 'makeUIViewController')
    //
    // Usually in UIKit we would have implemented the protocol 'UIPageViewControllerDataSource'.
    // However, PageViewController is NOT a pure SwiftUI struct, therefore we can't
    // make it comply to 'UIPageViewControllerDataSource' (you can try for yourself and see the error).
    //
    // The solution here is to make PageViewController comply to 'UIViewControllerRepresentable' and
    // pass data thru Coordinator
    //
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }

    class Coordinator: NSObject, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
        
        let parent: PageViewController // <- we'll need this to get to the controllers
        
        init( _ parent: PageViewController) {
            self.parent = parent
        }

        //UIPageViewControllerDataSource
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
            guard let controllers = self.parent.controllers else { return nil }
            guard let index = controllers.firstIndex(of: viewController) else { return nil }
            
            if index == 0 {
                return controllers.last
            }

            return controllers[index - 1]
        }
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
            guard let controllers = self.parent.controllers else { return nil }
            guard let index = controllers.firstIndex(of: viewController) else { return nil }
            
            if index == controllers.count - 1 {
                return controllers.first
            }
            return controllers[index + 1]
        }
        
        //UIPageViewControllerDelegate
        func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
            guard let controllers = self.parent.controllers else { return }
            
            var index = 0
            for (i, vc) in controllers.enumerated() {
                if vc == pendingViewControllers.first {
                    index = i
                    break
                }
            }
            self.parent.transitionTrigger.pageNum = index
        }
    }
}

//
// An Observable class to accommodate the page num to be tranferred to
//
class TransitionTrigger: ObservableObject {
    @Published var pageNum = 0
}
