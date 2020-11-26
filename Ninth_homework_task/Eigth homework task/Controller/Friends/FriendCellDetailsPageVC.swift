//
//  test.swift
//  Eigth_homework_task
//
//  Created by Nihad on 11/23/20.
//

import UIKit

class FriendCellDetailsPageVC: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    let controllers = [
        ImageViewController(image: UIImage(named: "friend1photo")!),
        ImageViewController(image: UIImage(named: "friend1photo1")!),
        ImageViewController(image: UIImage(named: "friend1photo2")!),
        ImageViewController(image: UIImage(named: "friend2photo")!),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = self
        view.backgroundColor = .black
        guard  let coontrollersFirst = controllers.first else { return }
        
        setViewControllers([coontrollersFirst], direction: .forward, animated: true)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let index = self.controllers.firstIndex(where: {$0 == viewController}) ?? 0
        if index == 0 { return nil }
        return controllers[index - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let index = self.controllers.firstIndex(where: {$0 == viewController}) ?? 0
        if index == controllers.count - 1 { return nil }
        return controllers[index + 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        UIView.animate(withDuration: 0.5, delay: 0.5, options: .curveEaseOut, animations: {
            pageViewController.view.alpha = 0.0
        }, completion: nil)
    }
}


class ImageViewController: UIViewController {
    let imageView = UIImageView(image: UIImage(named: "friend1photo")!)
    
    init(image: UIImage) {
        imageView.image = image
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(imageView)
        imageView.pinTo(imageView.superview!)
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
