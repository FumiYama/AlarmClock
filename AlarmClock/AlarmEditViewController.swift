//
//  AlarmEditViewController.swift
//  AlarmClock
//
//  Created by Fumiya Yamanaka on 2015/06/22.
//  Copyright (c) 2015年 Fumiya Yamanaka. All rights reserved.
//

import UIKit

class AlarmEditViewController: UIViewController {
    
    var delegate: MainViewControllerDelegate!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.alarmSetButton()
        self.alarmCancelButton()
        self.myDatePicker()
        self.timeSettingLabel()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // OKボタンの作成
    func alarmSetButton(){
        let alarmSetButton = UIButton(frame: CGRectMake(self.view.frame.width/2, 500, 100, 60))
        alarmSetButton.setTitle("OK", forState: UIControlState.Normal)
        alarmSetButton.setTitleColor(UIColor.greenColor(), forState: UIControlState.Normal)
        alarmSetButton.layer.position = CGPoint(x: 300, y: 100)
        alarmSetButton.backgroundColor = UIColor.clearColor()
        alarmSetButton.layer.cornerRadius = 10
        alarmSetButton.layer.borderWidth = 2
        alarmSetButton.layer.borderColor = UIColor.greenColor().CGColor
        alarmSetButton.layer.position = CGPoint(x: self.view.frame.width*3/4, y: 70)
        alarmSetButton.addTarget(self, action: "timeSubmit", forControlEvents: .TouchUpInside)
        
        self.view.addSubview(alarmSetButton)
    }
    // Backボタンの作成
    func alarmCancelButton(){
        
        let alarmCancelButton = UIButton(frame: CGRectMake(0, 500, 100, 60))
        alarmCancelButton.setTitle("Back", forState: UIControlState.Normal)
        alarmCancelButton.setTitleColor(UIColor.greenColor(), forState: UIControlState.Normal)
//        alarmCancelButton.backgroundColor = UIColor(red: 0.7, green: 0.2, blue: 0.2, alpha: 0.2)
        alarmCancelButton.layer.position = CGPoint(x: 70, y: 100)
        alarmCancelButton.layer.cornerRadius = 10
        alarmCancelButton.layer.borderWidth = 2
        alarmCancelButton.layer.borderColor = UIColor.greenColor().CGColor
        alarmCancelButton.layer.position = CGPoint(x: self.view.frame.width/4, y: 70)
        alarmCancelButton.addTarget(self, action: "onClickMainMyButton:", forControlEvents: .TouchUpInside)
       
        self.view.addSubview(alarmCancelButton)
    }
    // 画面遷移(Back)のための処理
    internal func onClickMainMyButton(sender: UIButton) {
        let mainMyViewController = mainViewController()
        mainMyViewController.modalTransitionStyle = UIModalTransitionStyle.CrossDissolve
        self.presentViewController(mainMyViewController, animated: true, completion: nil)
    }
    
    // DatePickerの作成
    func myDatePicker() {
        let myDatePicker: UIDatePicker = UIDatePicker()
        myDatePicker.frame = CGRectMake(0, self.view.bounds.height/4, 0, 0)
        myDatePicker.timeZone = NSTimeZone.localTimeZone()
        myDatePicker.backgroundColor = UIColor.groupTableViewBackgroundColor()
        myDatePicker.layer.cornerRadius = 5.0
        myDatePicker.addTarget(self, action: Selector("datePickerChanged:"), forControlEvents: UIControlEvents.ValueChanged)
        
        self.view.addSubview(myDatePicker)
    }
    // クラス内どこでも使えるようになるので、グローバル変数としてtimeSetLabelを宣言。ローカルだとそのメソッド内でしか使うことができない。
    let timeSetLabel = UILabel(frame: CGRectMake(50, 50, 200, 40))
    
    func timeSettingLabel() {
        
        var nowTime = self.getDate()
       
        timeSetLabel.textAlignment = NSTextAlignment.Center
        timeSetLabel.text = "\(nowTime)"
        timeSetLabel.layer.borderColor = UIColor.purpleColor().CGColor
        timeSetLabel.layer.borderWidth = 2
        timeSetLabel.layer.cornerRadius = 10
        timeSetLabel.layer.position = CGPoint(x: self.view.bounds.width/2,y: self.view.bounds.height - 250);
        
        self.view.addSubview(timeSetLabel)
    }
    
    // 現在時刻取得
    func getDate() ->NSString {
        let now = NSDate()
        let dateFormatter = NSDateFormatter()
        dateFormatter.locale = NSLocale(localeIdentifier: "ja_JP") // ロケールの設定
        dateFormatter.dateFormat = "MM/dd HH:mm" // 日付フォーマットの設定
        var thisDate = dateFormatter.stringFromDate(now)
        return thisDate
    }
    // pickerを動かした時のラベルへの処理
    func datePickerChanged(datePicker: UIDatePicker) {
        // フォーマットを生成
        let myDateFormatter = NSDateFormatter()
        myDateFormatter.dateFormat = "MM/dd HH:mm"
        // 日付をフォーマットに則って取得.
        let mySelectedDate = myDateFormatter.stringFromDate(datePicker.date)
        timeSetLabel.text = mySelectedDate as String
    }
    
    // OKボタンのaction,
    func timeSubmit() {
//        self.delegate.timeSet(self.timeSetLabel.text!)
//        self.dismissViewControllerAnimated(true, completion: nil)
        self.dismissViewControllerAnimated(true, completion: {self.delegate.timeSet(self.timeSetLabel.text!)})
    }
}
