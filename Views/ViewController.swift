//
//  ViewController.swift
//  Views
//
//  Created by Anofienam Isioma on 02/10/2018.
//  Copyright © 2018 com.chuck. All rights reserved.
//

import XLPagerTabStrip
import UIKit

extension UIColor{
    struct AppColors{
        static let primary = UIColor(red: CGFloat(120.0/255.0), green: CGFloat(148.0/255.0), blue: CGFloat(224.0/255.0), alpha: 1.0)
    }
}

extension UINavigationController {
    
    func hide(_ animated: Bool = false) {
        setNavigationBarHidden(true, animated: animated)
    }
    
    func show(_ animated: Bool = false) {
        setNavigationBarHidden(false, animated: animated)
    }
    
    func getNavBarLogo() -> UIImageView {
        let logo = UIImage(named:"alien")
        
        let logoView = UIImageView(image: logo)
        let navBarWidth = navigationBar.frame.size.width
        let navBarHeight = navigationBar.frame.size.height
        
        let Xposition = navBarWidth / 2 - logo!.size.width / 2
        let Yposition = navBarHeight / 2 - logo!.size.height / 2

        logoView.frame = CGRect(x: Xposition, y: Yposition, width: logo!.size.width, height: logo!.size.height)
        logoView.contentMode = .scaleAspectFit
        return logoView
    }
    
}

extension UIApplication {
    var statusBarView: UIView? {
        return value(forKey: "statusBar") as? UIView
    }
}

class ViewController: ButtonBarPagerTabStripViewController {
    
    @IBOutlet weak var topTab: ButtonBarView!
    let purpleInspireColor = UIColor(red:0.13, green:0.03, blue:0.25, alpha:1.0)
//    var mainView: MenuView { return self.view as! MenuView}
    
    private func customTopBars(view: UIView){
//        navigationItem.titleView = navigationController?.getNavBarLogo()
        navigationItem.title = "VIEWS"
        
        /***left BAR BUTTON****/
        let buttonIcon = UIImage(named: "icon_navbar_hamburger")
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: buttonIcon, style: UIBarButtonItem.Style.plain, target: self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)))
        
        view.addGestureRecognizer((self.revealViewController()?.panGestureRecognizer())!)
        self.revealViewController()?.rearViewRevealWidth = MenuScreenSize
        
        let worldIcon = UIImage(named: "world")
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: worldIcon, style: UIBarButtonItem.Style.plain, target: self.revealViewController(), action: nil)
        
        //set nav bar show and color
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = UIColor.AppColors.primary
        
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        //set status bar color
        UIApplication.shared.statusBarView?.backgroundColor = UIColor.AppColors.primary
    }
    
    override func viewDidLoad() {
//        navigationController?.navigationBar.isTranslucent = false
        customTopBars(view: view)
        // change selected bar color
        settings.style.buttonBarBackgroundColor = .white
        settings.style.buttonBarItemBackgroundColor = UIColor.AppColors.primary
        
        settings.style.selectedBarBackgroundColor = .red
        settings.style.buttonBarItemFont = .preferredFont(forTextStyle: .callout)
        settings.style.selectedBarHeight = 5.0
        
        settings.style.buttonBarMinimumLineSpacing = -1
        settings.style.buttonBarItemTitleColor = .white
        settings.style.buttonBarItemsShouldFillAvailiableWidth = true
        settings.style.buttonBarLeftContentInset = 0
        settings.style.buttonBarRightContentInset = 0
        
//        settings.style.buttonBarItemLeftRightMargin = 10
        
        changeCurrentIndexProgressive = { [weak self] (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }
            oldCell?.label.textColor = .white
            newCell?.label.textColor = .white
        }
        super.viewDidLoad()
    }
    
    @objc func addTapped(){
        print("tapped the image")
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        
        let all = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "all") as UIViewController
     
        let favorites = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "favorites") as UIViewController
        
        let latest = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "latest") as UIViewController
        
        return [all, favorites, latest]
    }

}

