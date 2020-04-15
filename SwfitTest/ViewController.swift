//
//  ViewController.swift
//  SwfitTest
//
//  Created by kiss on 2020/3/31.
//  Copyright © 2020 kiss. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        typealias SwfitBlock = (String,Any) -> Void
        
        var testBlock :SwfitBlock?
        
//        testBlock?("dd","ffff")
//        { [weak self] (a,b) in
//
//            print(a)
//            print(b)
//        }
        requestData { (data) in
            let str: String = data as! String //因为data是Any类型的付值给String类型的就需要做类型匹配 ,用as!要确保类型一致且不为nil

            print(str)
        }
        
        SingleTest.shared.aValue = "aaa"
        print("SingleTest.shared.aValue =\(SingleTest.shared.aValue ?? "kong")")
        
         let aa = "aaaa"
        let stringMetaType: String.Type = String.self
        let stringInstanceType: String.Type = type(of: aa)
        
          print("stringMetaType = \(stringMetaType)")
         print("stringInstanceType = \(stringInstanceType)")
        
        let  classs = TestClas()
        classs.testFunc()
        

        let obj = MyClass()
        obj.necessaryMethod() // Implemented in Class3
        
        let v = MyView.init(param: "111")
        v.backgroundColor = .red
        v.frame = CGRect.init(x: 100, y: 200, width: 100, height: 100)
        self.view.addSubview(v)
        print(v)
        
        let size = (width: 10,height :10)
        print("\(size.0)")
        print("\(size.width)")
        
        let str = "Hello"
        let test = "A"..."Z"
        for c in str {
            if test.contains(String(c)) {
                print("\(c)是大写字母")
            }
        }
        
        let arrar = ["addsfdsdsas","asdasfsd","wqeeweq"]
        
        let arrar11 =
        arrar.sorted(by: makeSortRule(str1:str2:))
        print(arrar11)
        print(addTwoInts(Int1: 2, Int2: 3))
        
        
        
        
    }
    
    func addTwoInts(Int1:Int,Int2:Int) -> Int {
        return Int1 + Int2
    }
    
    let a = {(int12 : Int, int22 : Int) -> Int in
        return int12 + int22
    }
    
   
    
    func makeSortRule(str1:String,str2:String) -> Bool {
        return str1 < str2
    }
    
    
    
    func test(clousure:() ->Void) {
        print("111是clousure")
    }
    private func requestData (success:@escaping (Any) -> Void){
        DispatchQueue.global().async {
             DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3, execute: {
                        success("data") //3秒后才执行闭包success
                    })

        }
    }
    
    class SingleTest{
        var aValue: NSString?
        var bValue: NSString?
        static let shared = SingleTest()
        private init(){}//一定要加private防止外部通过init直接创建实例
    }
    
    class TestClas: TestProtocol {
        var testVar: Int = 0
        
        func testFunc() {
            print("一定要实现的函数")
        }
    }
    
}

protocol TestProtocol {
    var testVar: Int { get set}
    func testFunc()
}

protocol OptionalProtocol {
    func optionalMethod()        // 可选
    func necessaryMethod()       // 必须
    func anotherOptionalMethod() // 可选
}
extension OptionalProtocol {
    func optionalMethod() {
        print("Implemented in extension")
    }

    func anotherOptionalMethod() {
        print("Implemented in extension")
    }
}
class MyClass: OptionalProtocol {
    func necessaryMethod() {
        print("Implemented in Class3")
    }

    func optionalMethod() {
        print("Implemented in Class3")
    }
}

enum BlogStyle {
    case default1
    case colors
}
