//
//  BaseCellP.swift
//  Views
//
//  Created by Anofienam Isioma on 13/11/2018.
//  Copyright © 2018 com.chuck. All rights reserved.
//

import Foundation

class BaseCellP: UICollectionViewCell{
    
    let containerView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.clear
        return view
    }()
    
    let holder : UIView = {
        let view = UIView()
        return view
    }()
    
    let holderIcon1 : UIImageView = {
        let img = UIImageView()
        img.clipsToBounds = true
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFit
        img.image = UIImage(named: "heart_icon")
        return img
    }()
    
    let holderLabel1 : UILabel = {
        let tit = UILabel()
        tit.font = UIFont(name:"HelveticaNeue-Thin"  , size: 15.0)
        tit.translatesAutoresizingMaskIntoConstraints = false
        tit.clipsToBounds = true
        tit.textColor = .black
        tit.text = "1"
        return tit
    }()
    
    let holderIcon2 : UIImageView = {
        let img = UIImageView()
        img.clipsToBounds = true
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFit
        img.image = UIImage(named: "comment_icon")
        return img
    }()
    
    let holderLabel2 : UILabel = {
        let tit = UILabel()
        tit.font = UIFont(name: "HelveticaNeue-Thin", size: 15.0)
        tit.translatesAutoresizingMaskIntoConstraints = false
        tit.clipsToBounds = true
        tit.textColor = .black
        tit.text = "2"
        return tit
    }()
    
    let title : UILabel = {
        let tit = UILabel()
        tit.font = UIFont.boldSystemFont(ofSize: 18.0)
        tit.translatesAutoresizingMaskIntoConstraints = false
        tit.clipsToBounds = true
        tit.textColor = .black
        return tit
    }()
    
    let image : UIImageView = {
       let img = UIImageView()
       img.clipsToBounds = true
       img.translatesAutoresizingMaskIntoConstraints = false
       img.contentMode = .scaleAspectFill
       return img
    }()
    
    let preview : UILabel = {
        let tit = UILabel()
        tit.font = UIFont.boldSystemFont(ofSize: 12.0)
        tit.translatesAutoresizingMaskIntoConstraints = false
        tit.clipsToBounds = true
        tit.textColor = .gray
        tit.numberOfLines = 2
        return tit
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        
    }
    
    func addViews(){
        contentView.addSubview(containerView)
        containerView.addSubview(title)
        containerView.addSubview(holder)
        containerView.addSubview(image)
        containerView.addSubview(preview)
        containerViewConstraint()
        addHolderViews()
        holderConstraints()
    }
    
    func addHolderViews(){
        holder.addSubview(holderIcon1)
        holder.addSubview(holderLabel1)
        holder.addSubview(holderIcon2)
        holder.addSubview(holderLabel2)
    }

    func holderConstraints(){
        holder.translatesAutoresizingMaskIntoConstraints = false
        holder.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        holder.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.5).isActive = true
        holder.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 5).isActive = true
        holder.bottomAnchor.constraint(equalTo: image.topAnchor, constant: -5).isActive = true
        
        holderLabel2.trailingAnchor.constraint(equalTo: holder.trailingAnchor).isActive = true
        holderLabel2.centerYAnchor.constraint(equalTo: holder.centerYAnchor).isActive = true
        
        holderIcon2.trailingAnchor.constraint(equalTo: holderLabel2.leadingAnchor, constant: -4).isActive = true
        holderIcon2.centerYAnchor.constraint(equalTo: holder.centerYAnchor).isActive = true
        
        
        holderLabel1.trailingAnchor.constraint(equalTo: holderIcon2.leadingAnchor, constant: -10).isActive = true
        holderLabel1.centerYAnchor.constraint(equalTo: holder.centerYAnchor).isActive = true
        
        holderIcon1.trailingAnchor.constraint(equalTo: holderLabel1.leadingAnchor, constant: -4).isActive = true
        holderIcon1.centerYAnchor.constraint(equalTo: holder.centerYAnchor).isActive = true
    }
    
    func containerViewConstraint(){
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10 ).isActive = true
        containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        
        containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true

        title.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 5).isActive = true
        title.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.5).isActive = true
        title.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        title.bottomAnchor.constraint(equalTo: image.topAnchor, constant: -5).isActive = true
        
        
        image.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        image.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
//        image.topAnchor.constraint(equalTo: title.bottomAnchor).isActive = true
        image.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 0.7).isActive = true
        image.widthAnchor.constraint(equalTo: containerView.widthAnchor ).isActive = true
        
        preview.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 5).isActive = true
        preview.widthAnchor.constraint(equalTo: containerView.widthAnchor).isActive = true
        preview.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
