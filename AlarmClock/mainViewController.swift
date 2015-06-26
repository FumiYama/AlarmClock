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
    
    var delegate: AlarmViewConrtrollerDelegate!
    
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
        //        self.view.bounds.size.width
        
        timeSetLabel.textAlignment = NSTextAlignment.Center
        timeSetLabel.textColor = UIColor.whiteColor()
        timeSetLabel.backgroundColor = UIColor.purpleColor()
        timeSetLabel.layer.masksToBounds = true
        timeSetLabel.layer.cornerRadius = 10
        //        timeSettingLabel.layer.borderColor = CGColor
        //        timeSettingLabel.layer.borderWidth = 1.0
        timeSetLabel.layer.position = CGPoint(x: self.view.frame.width/2, y: 350)
        
        self.view.addSubview(timeSetLabel)
        
    }
    // Editボタンの作成
    func alarmEditButton(){
        let alarmEditButton = UIButton(frame: CGRectMake(self.view.frame.width/2, 500, 100, 60))
        alarmEditButton.setTitle("Edit", forState: UIControlState.Normal)
        alarmEditButton.setTitleColor(UIColor.greenColor(), forState: UIControlState.Normal)
//        alarmEditButton.backgroundColor = UIColor(red: 0.7, green: 0.2, blue: 0.2, alpha: 0.2)
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
        let sleepViewController = AlarmViewController()
//        sleepViewController.delegate = self
        println(timeSetLabel.text)
        
        self.delegate.alarmText(self.timeSetLabel.text!)
        println(timeSetLabel.text)
        
        self.presentViewController(sleepViewController, animated: true, completion: nil)
    }
    
    // delegate で使用するメソッドの中身を記述
    func timeSet(text: String) {
        timeSetLabel.text = text
    }
    
    
    
    
    
}

