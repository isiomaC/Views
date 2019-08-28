//
//  MainView.swift
//  Views
//
//  Created by Anofienam Isioma on 23/10/2018.
//  Copyright © 2018 com.chuck. All rights reserved.
//

import Foundation
public let screenSize = UIScreen.main.bounds
public let MenuScreenSize = screenSize.width * 0.8
public let MenuScreenOffset = screenSize.width - MenuScreenSize


extension UIStackView{
    func addbgColor(color: UIColor){
        let bg = CAShapeLayer()
        self.layer.insertSublayer(bg, at: 0)
        bg.path = UIBezierPath(rect: self.bounds).cgPath
        bg.fillColor = color.cgColor
    }
    
}
class MenuView: UIView{
    
     let contentView : UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: MenuScreenSize, height: screenSize.height ))
//        view.layer.borderWidth = 1.0
        view.backgroundColor =  UIColor(patternImage: UIImage(named: "image.jpg")!)
        view.layer.borderColor = UIColor.lightGray.cgColor
        return view
    }()
    
    let logoImage : UIImageView = {
        let logoImage = UIImage(named: "logo.png")
        let logoImageView = UIImageView()
        logoImageView.image = logoImage
        logoImageView.clipsToBounds = true
        logoImageView.translatesAutoresizingMaskIntoConstraints = true
        logoImageView.contentMode = .scaleAspectFit
        logoImageView.widthAnchor.constraint(equalTo: logoImageView.heightAnchor, multiplier: 1).isActive = true
        return logoImageView
    }()
    
    let logoText : UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 25.0)
        label.text = "VIEWS"
        label.translatesAutoresizingMaskIntoConstraints = true
        label.clipsToBounds = true
        label.textColor = UIColor.white
        
        return label
    }()
    
     let stack : UIStackView = {
        let s = UIStackView()
        s.axis = .vertical
        s.distribution = .fillProportionally
        s.alignment = .center
//        s.clipsToBounds = true
        s.spacing = 0
//        s.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return s
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
        setUpContentViewConstraints()
        stack.addArrangedSubview(self.logoImage)
        stack.addArrangedSubview(self.logoText)
        setUpStackConstraints()
        stack.addbgColor(color: .green)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setUpViews(){
        contentView.addSubview(stack)
        self.addSubview(contentView)
    }
    
    func setUpContentViewConstraints(){
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
//        contentView.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 0).isActive = true
        
        contentView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        
        contentView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.85).isActive = true
        
        contentView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1).isActive = true
        
//        contentView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -(screenSize.width * 0.145)).isActive = true
        
        contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
    }
    
    func setUpStackConstraints(){
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        stack.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 70).isActive = true
        
        stack.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.5).isActive = true
        
        stack.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.3).isActive = true
        
        stack.bottomAnchor.constraint(equalTo: self.contentView.centerYAnchor, constant: -70).isActive = true
    }
 
}

