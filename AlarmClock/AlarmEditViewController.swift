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
        let alarmSetButton = UIButton(frame: CGRectMake(self.view.frame.width/2, 500, 100, 100))
        let img = UIImage(named: "Entypo_2713(2)_128.png") as UIImage?
        alarmSetButton.setImage(img, forState: .Normal)
        alarmSetButton.layer.position = CGPoint(x: self.view.frame.width*3/4, y: self.view.frame.width/4)
        alarmSetButton.addTarget(self, action: "timeSubmit", forControlEvents: .TouchUpInside)
        
        self.view.addSubview(alarmSetButton)
    }
    // Backボタンの作成
    func alarmCancelButton(){
        
        let alarmCancelButton = UIButton(frame: CGRectMake(0, 500, 100, 100))
        let img = UIImage(named: "Entypo_e712(1)_128.png") as UIImage?
        alarmCancelButton.setImage(img, forState: .Normal)
        alarmCancelButton.layer.position = CGPoint(x: self.view.frame.width/4, y: self.view.frame.width/4)
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
//        myDatePicker.font = UIFont(name: "Chalkduster")
//        myDatePicker.textColor = UIColor.groupTableViewBackgroundColor()
        myDatePicker.datePickerMode = UIDatePickerMode.Time
        myDatePicker.addTarget(self, action: Selector("datePickerChanged:"), forControlEvents: UIControlEvents.ValueChanged)
        
        self.view.addSubview(myDatePicker)
    }
    // クラス内どこでも使えるようになるので、グローバル変数としてtimeSetLabelを宣言。ローカルだとそのメソッド内でしか使うことができない。
    let timeSetLabel = UILabel(frame: CGRectMake(50, 50, 250, 70))
    var alarmTime :String?
    
    func timeSettingLabel() {
        timeSetLabel.textAlignment = NSTextAlignment.Center
        timeSetLabel.text = "\(self.getDate())"
        timeSetLabel.font = UIFont(name: "Chalkduster", size:60.0)
        timeSetLabel.textColor = UIColor.groupTableViewBackgroundColor()
        timeSetLabel.layer.position = CGPoint(x: self.view.bounds.width/2,y: self.view.bounds.height - 150)
        self.view.addSubview(timeSetLabel)
    }
    
    // 現在時刻取得
    func getDate() ->NSString {
        let now = NSDate()
        let dateFormatter = NSDateFormatter()
        dateFormatter.locale = NSLocale(localeIdentifier: "ja_JP") // ロケールの設定
        dateFormatter.dateFormat = "HH:mm" // 日付フォーマットの設定
//        myDateFormatter.timeStyle = .ShortStyle
        var thisDate = dateFormatter.stringFromDate(now)
        return thisDate
    }
    // pickerを動かした時のラベルへの処理
    func datePickerChanged(datePicker: UIDatePicker) {
        // フォーマットを生成
        let myDateFormatter = NSDateFormatter()
        myDateFormatter.dateFormat = "HH:mm"
        let myDate2Formatter = NSDateFormatter()
        myDate2Formatter.dateFormat = "HH:mm:00"
        // 日付をフォーマットに則って取得.
        let mySelectedDate = myDateFormatter.stringFromDate(datePicker.date)
        timeSetLabel.text = mySelectedDate as String
        let mySelectedDate2 = myDate2Formatter.stringFromDate(datePicker.date)
        alarmTime = mySelectedDate2
    }
    
    // OKボタンのaction,
    func timeSubmit() {
        self.delegate.timeSet(self.timeSetLabel.text!)
        self.dismissViewControllerAnimated(true, completion: nil)
//        self.dismissViewControllerAnimated(true, completion: {self.delegate.timeSet(self.timeSetLabel.text!)})
        var appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegate.messageD = alarmTime
    }
}
