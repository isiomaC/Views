//
//  MenuViewController.swift
//  Views
//
//  Created by Anofienam Isioma on 23/10/2018.
//  Copyright © 2018 com.chuck. All rights reserved.
//

import UIKit

struct CollectionViewStub{
    let title: UILabel?
    let img: UIImageView?
    let preview: UILabel?
}

class MenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    let iconText = ["Worldwide", "Trending", "Places", "People", "Notifications"]
    
    let worldwideIcon = UIImage(named: "world")
    let trendingIcon = UIImage(named: "trend")
    let placesIcon = UIImage(named: "location")
    let peopleIcon = UIImage(named: "profile")
    let notificationIcon = UIImage(named: "bell")
    
    var iconSet: [UIImage] = []
 
    let data: [CollectionViewStub] = []

    private var myTableView: UITableView!
    
//    override func loadView() {
//        view = MenuView(frame: UIScreen.main.bounds)
//    }
    
    func initializeTableView() {
        let cellNib = UINib(nibName: "MenuTableCell", bundle: Bundle.main)
        myTableView = UITableView(frame: CGRect(x: 0, y: screenSize.size.height * 0.5, width: MenuScreenSize, height: screenSize.size.height  * 0.5 ))
        myTableView.register(cellNib, forCellReuseIdentifier: "MenuCell")
        myTableView.dataSource = self
        myTableView.delegate = self
        myTableView.backgroundColor = UIColor.clear
        myTableView.isScrollEnabled = true
        myTableView.separatorStyle = .none
        view.addSubview(myTableView)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = MenuView()
        initializeTableView()
        iconSet = [worldwideIcon!, trendingIcon!, placesIcon!, peopleIcon!, notificationIcon!]
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Num: \(indexPath.row)")
        print("Value: \(iconText[indexPath.row])")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return iconText.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(50)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath) as! MenuTableCell
        cell.backgroundColor = UIColor.clear
        
        cell.selectionStyle = .none
        
//        let bgColorView = UIView()
//        bgColorView.backgroundColor = UIColor.clear
//        cell.selectedBackgroundView = bgColorView
        
        cell.leftIcon.image = iconSet[indexPath.row].resized(newSize: CGSize(width: CGFloat(20), height: CGFloat(20)))
        cell.leftIcon.contentMode = .center
        
        cell.iconLabel.text = "\(iconText[indexPath.row])"
        cell.iconLabel.textColor = UIColor(red: 188/255, green: 189/255, blue: 197/255, alpha: 1.0)
        
        
        return cell
    }
    
}
