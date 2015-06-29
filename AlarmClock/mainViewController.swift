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
    var timeSetLabel: UILabel = UILabel(frame: CGRectMake(50, 50, 150, 60))

    func timeSettingLabel(){
        timeSetLabel.text = ""
        timeSetLabel.textAlignment = NSTextAlignment.Center
        timeSetLabel.textColor = UIColor.whiteColor()
        timeSetLabel.backgroundColor = UIColor.purpleColor()
        timeSetLabel.layer.masksToBounds = true
        timeSetLabel.layer.cornerRadius = 30
        timeSetLabel.layer.position = CGPoint(x: self.view.frame.width/2, y: self.view.frame.height/2)
        timeSetLabel.font = UIFont.systemFontOfSize(30)
        self.view.addSubview(timeSetLabel)
        
    }
    // Editボタンの作成
    func alarmEditButton(){
        let imgEdit = UIImage(named: "Entypo_e79a(0)_128.png") as UIImage?
        let alarmEditButton = UIButton(frame: CGRectMake(self.view.frame.width/2, 0, 100, 100))
        alarmEditButton.setImage(imgEdit, forState: .Normal)
//        alarmEditButton.setTitle("Edit", forState: UIControlState.Normal)
////        alarmEditButton.setTitleColor(UIColor.greenColor(), forState: UIControlState.Normal)
//        alarmEditButton.setTitleColor(UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), forState: UIControlState.Normal)
//        alarmEditButton.layer.cornerRadius = 10
//        alarmEditButton.layer.borderWidth = 2
//        alarmEditButton.layer.borderColor = UIColor.greenColor().CGColor
        alarmEditButton.layer.position = CGPoint(x: self.view.frame.width/2, y: self.view.frame.height - 80)
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
        let img = UIImage(named: "Entypo_263d(0)_128.png") as UIImage?
        let sleepButton = UIButton(frame: CGRectMake(self.view.frame.width*3/4, 70, 100, 100))
        sleepButton.setImage(img, forState: .Normal)
        sleepButton.layer.borderColor = UIColor.greenColor().CGColor
        sleepButton.layer.position = CGPoint(x: self.view.frame.width*3/4, y: self.view.frame.width/4)
        sleepButton.addTarget(self, action: "wakeUpTimeSubmit:", forControlEvents: .TouchUpInside)
        
        self.view.addSubview(sleepButton)
    }
    //sleepボタンのアクション
    internal func wakeUpTimeSubmit(sender: UIButton) {
        if timeSetLabel.text == ""  {
            let alert = UIAlertView()
            alert.title = "ERROR"
            alert.message = "Edit Alarm Time!"
            alert.addButtonWithTitle("OK")
            alert.show()
        } else {
            //AppDelegateのインスタンスを取得
            var appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            //appDelegateの変数を操作
            appDelegate.message1 = timeSetLabel.text
            
            let sleepViewController = AlarmWaitViewController()
            self.presentViewController(sleepViewController, animated: true, completion: nil)
        }
    }
        // delegate で使用するメソッドの中身を記述
    func timeSet(text: String) {
        timeSetLabel.text = text
    }
    
}

