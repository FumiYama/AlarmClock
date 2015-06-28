//
//  mainViewController.swift
//  AlarmClock
//
//  Created by Fumiya Yamanaka on 2015/06/22.
//  Copyright (c) 2015年 Fumiya Yamanaka. All rights reserved.
//
import UIKit

protocol MainViewControllerDelegate {
    func timeSet(text: String)
}

class mainViewController: UIViewController, MainViewControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.timeSettingLabel()
        self.alarmEditButton()
        self.sleepButton()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // グローバルで宣言
    var timeSetLabel: UILabel = UILabel(frame: CGRectMake(50, 50, 250, 60))

    func timeSettingLabel(){
        timeSetLabel.textAlignment = NSTextAlignment.Center
        timeSetLabel.textColor = UIColor.whiteColor()
        timeSetLabel.backgroundColor = UIColor.purpleColor()
        timeSetLabel.layer.masksToBounds = true
        timeSetLabel.layer.cornerRadius = 10
        timeSetLabel.layer.position = CGPoint(x: self.view.frame.width/2, y: 350)
        timeSetLabel.font = UIFont.systemFontOfSize(30)
        self.view.addSubview(timeSetLabel)
        
    }
    // Editボタンの作成
    func alarmEditButton(){
        let alarmEditButton = UIButton(frame: CGRectMake(self.view.frame.width/2, 500, 100, 60))
        alarmEditButton.setTitle("Edit", forState: UIControlState.Normal)
//        alarmEditButton.setTitleColor(UIColor.greenColor(), forState: UIControlState.Normal)
        alarmEditButton.setTitleColor(UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), forState: UIControlState.Normal)
        alarmEditButton.layer.cornerRadius = 10
        alarmEditButton.layer.borderWidth = 2
        alarmEditButton.layer.borderColor = UIColor.greenColor().CGColor
        alarmEditButton.layer.position = CGPoint(x: self.view.frame.width/2, y: 600)
        alarmEditButton.addTarget(self, action: "openAlarmEditButton:", forControlEvents: .TouchUpInside)
        self.view.addSubview(alarmEditButton)
    }
    // Edit押下時のaction作成
    internal func openAlarmEditButton(sender: UIButton) {
        let myAlarmEditViewController = AlarmEditViewController()
        myAlarmEditViewController.delegate = self
        myAlarmEditViewController.modalTransitionStyle = UIModalTransitionStyle.CrossDissolve
        self.presentViewController(myAlarmEditViewController, animated: true, completion: nil)
    }
    
    // sleepボタンの作成
    func sleepButton(){
        let sleepButton = UIButton(frame: CGRectMake(self.view.frame.width*3/4, 70, 100, 60))
        sleepButton.setTitle("Sleep", forState: UIControlState.Normal)
        sleepButton.setTitleColor(UIColor.greenColor(), forState: UIControlState.Normal)
        sleepButton.layer.cornerRadius = 10
        sleepButton.layer.borderWidth = 2
        sleepButton.layer.borderColor = UIColor.greenColor().CGColor
        sleepButton.layer.position = CGPoint(x: self.view.frame.width*3/4, y: 70)
        sleepButton.addTarget(self, action: "wakeUpTimeSubmit:", forControlEvents: .TouchUpInside)
        
        self.view.addSubview(sleepButton)
    }
    //sleepボタンのアクション
    internal func wakeUpTimeSubmit(sender: UIButton) {
//       NSLog(timeSetLabel.text)
        //AppDelegateのインスタンスを取得
        var appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        //appDelegateの変数を操作
        appDelegate.message1 = timeSetLabel.text
        
        let sleepViewController = AlarmWaitViewController()
        self.presentViewController(sleepViewController, animated: true, completion: nil)
    }
    
    // delegate で使用するメソッドの中身を記述
    func timeSet(text: String) {
        timeSetLabel.text = text
    }
    
    
    
    
    
    
}

