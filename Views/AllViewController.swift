//
//  AllViewController.swift
//  Views
//
//  Created by Anofienam Isioma on 15/11/2018.
//  Copyright © 2018 com.chuck. All rights reserved.
//

import Foundation
import XLPagerTabStrip

class AllViewController: BaseViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        navigationController?.hide(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
         return IndicatorInfo(title: "All")
    }
    
}
