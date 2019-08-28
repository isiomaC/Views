//
//  BaseViewController.swift
//  Views
//
//  Created by Anofienam Isioma on 29/10/2018.
//  Copyright © 2018 com.chuck. All rights reserved.
//

import Foundation
import XLPagerTabStrip

class BaseViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, IndicatorInfoProvider{
    
    var collectionView : UICollectionView!
    
    let padding: CGFloat = 10.0
    
    var placeholder : [CollectionViewStub]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initializePlaceHolderData()
        setUpCollectionView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        initializePlaceHolderData()
        setUpCollectionView()
    }
    
    
    func initializePlaceHolderData(){
        placeholder = [
            CollectionViewStub(title: createLabel(), img: createImgView(), preview: createPreviewLable(text:"This is a story about how the hongkong blah blah blah, did this to blah blah blah to get what they deserverd") ),
            CollectionViewStub(title: createLabel(text: "New title for days"), img: createImgView(), preview: createPreviewLable(text:"Will you get the necessary benefits to another story about how the new title was displayed and blah blah blah, did this to blah blah blah to get what they deserverd...") ) ]
    }
    
    func createLabel(text: String? = "Hong Kong Get AI") -> UILabel{
        let lab = UILabel()
        lab.text = text
        lab.font = UIFont.boldSystemFont(ofSize: lab.font.pointSize)
        lab.translatesAutoresizingMaskIntoConstraints = false
        lab.clipsToBounds = true
        return lab
    }
    
    func createPreviewLable(text: String) -> UILabel{
        let lab = UILabel()
        lab.text = text
        lab.font = lab.font.withSize(5)
        lab.translatesAutoresizingMaskIntoConstraints = false
        lab.clipsToBounds = true
        return lab
    }
    
    func createImgView() -> UIImageView{
        let imageV = UIImageView()
        imageV.image = UIImage(named: "test")
        imageV.clipsToBounds = true
        imageV.contentMode = .center
        imageV.translatesAutoresizingMaskIntoConstraints = false
        return imageV
    }
    
    func setUpCollectionView(){
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: view.frame.width - padding, height: 200)
        layout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)
        layout.minimumLineSpacing = 40
        
        collectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        
//        collectionView.register(UINib(nibName: "BaseCell", bundle: Bundle.main), forCellWithReuseIdentifier: "BaseCell")
        
        collectionView.register(BaseCellP.self, forCellWithReuseIdentifier: "BaseCellP")
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        view.addSubview(collectionView)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return placeholder!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BaseCellP", for: indexPath) as! BaseCellP

        cell.title.text = placeholder?[indexPath.row].title?.text
        cell.preview.text = placeholder?[indexPath.row].preview?.text
        cell.image.image = placeholder?[indexPath.row].img?.image
        
        cell.holderIcon1.isUserInteractionEnabled = true
        cell.holderIcon1.tag = indexPath.row
        cell.holderIcon1.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(likeAction(_:))))
        
        cell.holderIcon2.isUserInteractionEnabled = true
        cell.holderIcon2.tag = indexPath.row
        cell.holderIcon2.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(commentAction(_:))))

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Cell \(indexPath.row) was tapped")
    }
    
    @objc func likeAction(_ sender: AnyObject){
        print("heart tapped")
    }
    
    @objc func commentAction(_ sender: AnyObject){
        print("comment tapped")
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title:"Base")
    }
    
}
