//
//  MyView.swift
//  SwfitTest
//
//  Created by kiss on 2020/3/31.
//  Copyright © 2020 kiss. All rights reserved.
//

import UIKit

class MyView: UIView {

    private var testvar: String?
     //自己的指定初始化函数
    
    override init(frame: CGRect) {
        //父类的指定初始化函数
        super.init(frame: frame)
       
    }
    
    convenience init(param:String) {
        //便利初始化函数中调用自己的指定初始化函数
           self.init(frame: CGRect.zero)
            
        
           //赋值
            testvar = param
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
