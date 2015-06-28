//
//  AlarmWaitViewController.swift
//  AlarmClock
//
//  Created by Fumiya Yamanaka on 2015/06/28.
//  Copyright (c) 2015年 Fumiya Yamanaka. All rights reserved.
//

import Foundation
import UIKit

class AlarmWaitViewController: UIViewController {
    var hour2:Int!
    var hour1:Int!
    var minute2:Int!
    var minute1:Int!
    var second2:Int!
    var second1:Int!
    
    var hour2ImageView: UIImageView!
    var hour1ImageView: UIImageView!
    var minute2ImageView: UIImageView!
    var minute1ImageView: UIImageView!
    var second2ImageView: UIImageView!
    var second1ImageView: UIImageView!
    var colon1ImageView: UIImageView!
    var colon2ImageView: UIImageView!
    
    var image0:UIImage! = UIImage(named: "0.png")
    var image1:UIImage! = UIImage(named: "1.png")
    var image2:UIImage! = UIImage(named: "2.png")
    var image3:UIImage! = UIImage(named: "3.png")
    var image4:UIImage! = UIImage(named: "4.png")
    var image5:UIImage! = UIImage(named: "5.png")
    var image6:UIImage! = UIImage(named: "6.png")
    var image7:UIImage! = UIImage(named: "7.png")
    var image8:UIImage! = UIImage(named: "8.png")
    var image9:UIImage! = UIImage(named: "9.png")
    
    var timer:NSTimer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.blackColor()
        
        
        
        self.timeLabel()
        
        //AppDelegateのインスタンスを取得
        var appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        // 設定した時刻を代入
        timeSetLabel.text = appDelegate.message1
        
        //下2行で現在時刻の表示
        self.time2()
        timer=NSTimer.scheduledTimerWithTimeInterval(1.0,target: self,
                                                        selector: Selector("time"),
                                                        userInfo: nil,
                                                        repeats: true)
        
//        self.alarmTimeLabelFunc()
        println(timeSetLabel.text)
//        if timeSetLabel.text == alarmTimeLabel.text {
//            println("aaaa")
//        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    var timeSetLabel: UILabel = UILabel(frame: CGRectMake(50, 50, 250, 200))
    
    func timeLabel() {
        timeSetLabel.textAlignment = NSTextAlignment.Center
        timeSetLabel.textColor = UIColor.purpleColor()
        timeSetLabel.backgroundColor = UIColor.clearColor()
        timeSetLabel.font = UIFont.systemFontOfSize(40)
        timeSetLabel.layer.masksToBounds = true
        timeSetLabel.layer.position = CGPoint(x: self.view.frame.width/2, y: 350)
        self.view.addSubview(timeSetLabel)
    }
    
//    var alarmTimeLabel: UILabel = UILabel(frame: CGRectMake(50, 50, 250, 200))
//    
//    func alarmTimeLabelFunc() {
//        alarmTimeLabel.textAlignment = NSTextAlignment.Center
//        alarmTimeLabel.text = "\(self.getNowTime())"
//        alarmTimeLabel.textColor = UIColor.purpleColor()
//        alarmTimeLabel.backgroundColor = UIColor.clearColor()
//        alarmTimeLabel.font = UIFont.systemFontOfSize(40)
//        alarmTimeLabel.layer.masksToBounds = true
//        alarmTimeLabel.layer.position = CGPoint(x: self.view.frame.width/2, y: 50)
//        
//        self.view.addSubview(alarmTimeLabel)
//    }
//    // 現在時刻取得
//    func getNowTime() ->NSString {
//        let now = NSDate()
//        let dateFormatter = NSDateFormatter()
//        dateFormatter.locale = NSLocale(localeIdentifier: "ja_JP") // ロケールの設定
//        dateFormatter.dateFormat = "MM/dd HH:mm" // 日付フォーマットの設定
//        var thisDate = dateFormatter.stringFromDate(now)
//        return thisDate
//    }
//    
    
    
    
    //現在時刻の取得
    func time2() {
        hour2ImageView = UIImageView(frame: CGRectMake(0,0,60,72))
        hour2ImageView.layer.position = CGPoint(x: self.view.frame.width/2 - 135, y: 150.0)
        self.view.addSubview(hour2ImageView)
        hour1ImageView = UIImageView(frame: CGRectMake(0,0,60,72))
        hour1ImageView.layer.position = CGPoint(x: self.view.frame.width/2 - 90, y: 150.0)
        self.view.addSubview(hour1ImageView)
        minute2ImageView = UIImageView(frame: CGRectMake(0,0,60,72))
        minute2ImageView.layer.position = CGPoint(x: self.view.frame.width/2 - 22, y: 150.0)
        self.view.addSubview(minute2ImageView)
        minute1ImageView = UIImageView(frame: CGRectMake(0,0,60,72))
        minute1ImageView.layer.position = CGPoint(x: self.view.frame.width/2 + 25, y: 150.0)
        self.view.addSubview(minute1ImageView)
        second2ImageView = UIImageView(frame: CGRectMake(0,0,60,72))
        second2ImageView.layer.position = CGPoint(x: self.view.frame.width/2 + 90, y: 150.0)
        self.view.addSubview(second2ImageView)
        second1ImageView = UIImageView(frame: CGRectMake(0,0,60,72))
        second1ImageView.layer.position = CGPoint(x: self.view.frame.width/2 + 135, y: 150.0)
        self.view.addSubview(second1ImageView)
        
        
        colon1ImageView = UIImageView(frame: CGRectMake(0,0,60,72))
        colon1ImageView.layer.position = CGPoint(x: self.view.frame.width/2 - 55, y: 150.0)
        colon1ImageView.image = UIImage(named: "コロン.png")
        self.view.addSubview(colon1ImageView)
        colon2ImageView = UIImageView(frame: CGRectMake(0,0,60,72))
        colon2ImageView.layer.position = CGPoint(x: self.view.frame.width/2 + 60, y: 150.0)
        colon2ImageView.image = UIImage(named: "コロン.png")
        self.view.addSubview(colon2ImageView)
    }
    func time(){
        let myDate: NSDate = NSDate()
        //カレンダーを取得.
        let myCalendar: NSCalendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
        //取得するコンポーネントを決める.
        let myComponetns = myCalendar.components(NSCalendarUnit.CalendarUnitYear   |
            NSCalendarUnit.CalendarUnitMonth  |
            NSCalendarUnit.CalendarUnitDay    |
            NSCalendarUnit.CalendarUnitHour   |
            NSCalendarUnit.CalendarUnitMinute |
            NSCalendarUnit.CalendarUnitSecond,
            fromDate: myDate)
        var hour:Int = myComponetns.hour
        var minute:Int = myComponetns.minute
        var second:Int = myComponetns.second
        
        if (hour>9) {
            hour2 = hour/10
            hour1 = hour - (hour/10)*10
        }
        else {
            hour2 = 0
            hour1 = hour
        }
        if (minute>9) {
            minute2 = minute/10
            minute1 = minute - (minute/10)*10
        }
        else {
            minute2 = 0;
            minute1 = minute;
        }
        if (second>9) {
            second2 = second/10;
            second1 = second - (second/10)*10
        }
        else {
            second2 = 0;
            second1 = second;
        }
        draw()
    }
    func draw(){
        switch(hour2){
        case 0:
            hour2ImageView.image = image0
            break
        case 1:
            hour2ImageView.image = image1
            break
        case 2:
            hour2ImageView.image = image2
            break
        case 3:
            hour2ImageView.image = image3
            break
        case 4:
            hour2ImageView.image = image4
            break
        case 5:
            hour2ImageView.image = image5
            break
        case 6:
            hour2ImageView.image = image6
            break
        case 7:
            hour2ImageView.image = image7
            break
        case 8:
            hour2ImageView.image = image8
            break
        case 9:
            hour2ImageView.image = image9
            break
        default:
            break
        }
        switch(hour1){
        case 0:
            hour1ImageView.image = image0
            break
        case 1:
            hour1ImageView.image = image1
            break
        case 2:
            hour1ImageView.image = image2
            break
        case 3:
            hour1ImageView.image = image3
            break
        case 4:
            hour1ImageView.image = image4
            break
        case 5:
            hour1ImageView.image = image5
            break
        case 6:
            hour1ImageView.image = image6
            break
        case 7:
            hour1ImageView.image = image7
            break
        case 8:
            hour1ImageView.image = image8
            break
        case 9:
            hour1ImageView.image = image9
            break
        default:
            break
        }
        switch(minute2){
        case 0:
            minute2ImageView.image = image0
            break
        case 1:
            minute2ImageView.image = image1
            break
        case 2:
            minute2ImageView.image = image2
            break
        case 3:
            minute2ImageView.image = image3
            break
        case 4:
            minute2ImageView.image = image4
            break
        case 5:
            minute2ImageView.image = image5
            break
        case 6:
            minute2ImageView.image = image6
            break
        case 7:
            minute2ImageView.image = image7
            break
        case 8:
            minute2ImageView.image = image8
            break
        case 9:
            minute2ImageView.image = image9
            break
        default:
            break
        }
        switch(minute1){
        case 0:
            minute1ImageView.image = image0
            break
        case 1:
            minute1ImageView.image = image1
            break
        case 2:
            minute1ImageView.image = image2
            break
        case 3:
            minute1ImageView.image = image3
            break
        case 4:
            minute1ImageView.image = image4
            break
        case 5:
            minute1ImageView.image = image5
            break
        case 6:
            minute1ImageView.image = image6
            break
        case 7:
            minute1ImageView.image = image7
            break
        case 8:
            minute1ImageView.image = image8
            break
        case 9:
            minute1ImageView.image = image9
            break
        default:
            break
        }
        switch(second2){
        case 0:
            second2ImageView.image = image0
            break
        case 1:
            second2ImageView.image = image1
            break
        case 2:
            second2ImageView.image = image2
            break
        case 3:
            second2ImageView.image = image3
            break
        case 4:
            second2ImageView.image = image4
            break
        case 5:
            second2ImageView.image = image5
            break
        case 6:
            second2ImageView.image = image6
            break
        case 7:
            second2ImageView.image = image7
            break
        case 8:
            second2ImageView.image = image8
            break
        case 9:
            second2ImageView.image = image9
            break
        default:
            break
        }
        switch(second1){
        case 0:
            second1ImageView.image = image0
            break
        case 1:
            second1ImageView.image = image1
            break
        case 2:
            second1ImageView.image = image2
            break
        case 3:
            second1ImageView.image = image3
            break
        case 4:
            second1ImageView.image = image4
            break
        case 5:
            second1ImageView.image = image5
            break
        case 6:
            second1ImageView.image = image6
            break
        case 7:
            second1ImageView.image = image7
            break
        case 8:
            second1ImageView.image = image8
            break
        case 9:
            second1ImageView.image = image9
            break
        default:
            break
        }
    }
}