//
//  WeatherDetailPageViewController.swift
//  SOPTWeather
//
//  Created by 지희의 MAC on 2023/10/27.
//

import UIKit

class WeatherDetailPageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    // Your array of view controllers
    var contentControllers: [UIViewController] = []
    var pageControl = UIPageControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the data source and delegate
        dataSource = self
        delegate = self
        
        // Set the initial view controller
        if let firstViewController = contentControllers.first {
            setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }
        setupPageControl()
    }
    
    func setupPageControl() {
        // Configure the appearance of the page control
        pageControl.numberOfPages = contentControllers.count
        pageControl.currentPage = 0
        pageControl.tintColor = .white
        pageControl.pageIndicatorTintColor = UIColor.gray
        pageControl.currentPageIndicatorTintColor = .white
        pageControl.setCurrentPageIndicatorImage(ImageLiterals.locationIcon, forPage: 0)
        
        // Add page control to the view hierarchy
        view.addSubview(pageControl)
        pageControl.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().inset(44)
        }
    }
    
    // MARK: - UIPageViewControllerDataSource
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        // Implement this method to provide the view controller before the given view controller
        if let currentIndex = contentControllers.firstIndex(of: viewController), currentIndex > 0 {
            return contentControllers[currentIndex - 1]
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        // Implement this method to provide the view controller after the given view controller
        if let currentIndex = contentControllers.firstIndex(of: viewController), currentIndex < contentControllers.count - 1 {
            return contentControllers[currentIndex + 1]
        }
        return nil
    }
    
    // MARK: - UIPageViewControllerDelegate
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed, let currentViewController = pageViewController.viewControllers?.first,
           let currentIndex = contentControllers.firstIndex(of: currentViewController) {
            pageControl.currentPage = currentIndex
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        if let pendingViewController = pendingViewControllers.first,
           let index = contentControllers.firstIndex(of: pendingViewController) {
            // Update the page control to reflect the pending view controller
            pageControl.currentPage = index
        }
    }
    
    
}
