//
//  ViewController.swift
//  ReservationDrink
//
//  Created by 世明 on 2018/5/15.
//  Copyright © 2018年 世明. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var segSugar: UISegmentedControl!
    @IBOutlet weak var segIce: UISegmentedControl!
    @IBOutlet weak var segSize: UISegmentedControl!
    @IBOutlet weak var tfExtra: UITextField!
    
    var drinksArray = [String]()
    
    func getArray() -> Array<String> {
        if let urlDrinks = Bundle.main.url(forResource: "迷克夏", withExtension: "txt"), let poem = try? String(contentsOf: urlDrinks){
            let aString = poem.split(separator: "\n")
            for a in 0...aString.count - 1{
                if Int(aString[a]) != nil{
                    print("金額數字")
                }else{
                    drinksArray.append(String(aString[a]))
                }
            }
        }
        return drinksArray
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://sheetdb.io/api/v1/5afb8e44503be")
        var urlRequest = URLRequest(url: url!)
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        // Do any additional setup after loading the view, typically from a nib.
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return getArray().count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return getArray()[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("飲料陣列\(getArray()[row])")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

