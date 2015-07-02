//
//  ViewController.swift
//  AlarmClock
//
//  Created by Fumiya Yamanaka on 2015/06/22.
//  Copyright (c) 2015年 Fumiya Yamanaka. All rights reserved.
//

import UIKit
import AVFoundation

class AlarmViewController: UIViewController , AVAudioPlayerDelegate {
    
    var appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    var soundName: NSString!
    
    let myButton0 = UIButton(frame: CGRectMake(0,0,90,90))
    let myButton1 = UIButton(frame: CGRectMake(0,0,90,90))
    let myButton2 = UIButton(frame: CGRectMake(0,0,90,90))
    let myButton3 = UIButton(frame: CGRectMake(0,0,90,90))
    let myButton4 = UIButton(frame: CGRectMake(0,0,90,90))
    let myButton5 = UIButton(frame: CGRectMake(0,0,90,90))
    let myButton6 = UIButton(frame: CGRectMake(0,0,90,90))
    let myButton7 = UIButton(frame: CGRectMake(0,0,90,90))
    let myButton8 = UIButton(frame: CGRectMake(0,0,90,90))
    
    var random:Int = 0
    var correctAnser:Int = 0
    var myAudioPlayer: AVAudioPlayer!    //変数宣言

    func colorChange() {
        random = Int(arc4random()%9) //0~8(9つ)の乱数発生
        switch random {
        case 0:
            myButton0.layer.borderColor = UIColor.greenColor().CGColor
            myButton0.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
            myButton0.backgroundColor = UIColor.greenColor()
            myButton0.setTitle("Push", forState: UIControlState.Normal)
        case 1:
            myButton1.layer.borderColor = UIColor.greenColor().CGColor
            myButton1.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
            myButton1.backgroundColor = UIColor.greenColor()
            myButton1.setTitle("Push", forState: UIControlState.Normal)
        case 2:
            myButton2.layer.borderColor = UIColor.greenColor().CGColor
            myButton2.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
            myButton2.backgroundColor = UIColor.greenColor()
            myButton2.setTitle("Push", forState: UIControlState.Normal)
        case 3:
            myButton3.layer.borderColor = UIColor.greenColor().CGColor
            myButton3.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
            myButton3.backgroundColor = UIColor.greenColor()
            myButton3.setTitle("Push", forState: UIControlState.Normal)
        case 4:
            myButton4.layer.borderColor = UIColor.greenColor().CGColor
            myButton4.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
            myButton4.backgroundColor = UIColor.greenColor()
            myButton4.setTitle("Push", forState: UIControlState.Normal)
        case 5:
            myButton5.layer.borderColor = UIColor.greenColor().CGColor
            myButton5.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
            myButton5.backgroundColor = UIColor.greenColor()
            myButton5.setTitle("Push", forState: UIControlState.Normal)
        case 6:
            myButton6.layer.borderColor = UIColor.greenColor().CGColor
            myButton6.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
            myButton6.backgroundColor = UIColor.greenColor()
            myButton6.setTitle("Push", forState: UIControlState.Normal)
        case 7:
            myButton7.layer.borderColor = UIColor.greenColor().CGColor
            myButton7.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
            myButton7.backgroundColor = UIColor.greenColor()
            myButton7.setTitle("Push", forState: UIControlState.Normal)
        case 8:
            myButton8.layer.borderColor = UIColor.greenColor().CGColor
            myButton8.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
            myButton8.backgroundColor = UIColor.greenColor()
            myButton8.setTitle("Push", forState: UIControlState.Normal)
        default :
            break
        }
    }
    func colorDefault() {
        switch random {
        case 0:
            myButton0.layer.borderColor = UIColor.blueColor().CGColor
            myButton0.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
            myButton0.backgroundColor = UIColor.blueColor()
            myButton0.setTitle("", forState: UIControlState.Normal)
        case 1:
            myButton1.layer.borderColor = UIColor.blueColor().CGColor
            myButton1.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
            myButton1.backgroundColor = UIColor.blueColor()
            myButton1.setTitle("", forState: UIControlState.Normal)
        case 2:
            myButton2.layer.borderColor = UIColor.blueColor().CGColor
            myButton2.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
            myButton2.backgroundColor = UIColor.blueColor()
            myButton2.setTitle("", forState: UIControlState.Normal)
            
        case 3:
            myButton3.layer.borderColor = UIColor.blueColor().CGColor
            myButton3.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
            myButton3.backgroundColor = UIColor.blueColor()
            myButton3.setTitle("", forState: UIControlState.Normal)
        case 4:
            myButton4.layer.borderColor = UIColor.blueColor().CGColor
            myButton4.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
            myButton4.backgroundColor = UIColor.blueColor()
            myButton4.setTitle("", forState: UIControlState.Normal)
        case 5:
            myButton5.layer.borderColor = UIColor.blueColor().CGColor
            myButton5.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
            myButton5.backgroundColor = UIColor.blueColor()
            myButton5.setTitle("", forState: UIControlState.Normal)
        case 6:
            myButton6.layer.borderColor = UIColor.blueColor().CGColor
            myButton6.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
            myButton6.backgroundColor = UIColor.blueColor()
            myButton6.setTitle("", forState: UIControlState.Normal)
        case 7:
            myButton7.layer.borderColor = UIColor.blueColor().CGColor
            myButton7.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
            myButton7.backgroundColor = UIColor.blueColor()
            myButton7.setTitle("", forState: UIControlState.Normal)
        case 8:
            myButton8.layer.borderColor = UIColor.blueColor().CGColor
            myButton8.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
            myButton8.backgroundColor = UIColor.blueColor()
            myButton8.setTitle("", forState: UIControlState.Normal)
        default :
            break
        }
    }
    
    var timeSetLabel: UILabel = UILabel(frame: CGRectMake(50, 50, 300, 200))
    func timeLabel() {
        timeSetLabel.textAlignment = NSTextAlignment.Center
        timeSetLabel.font = UIFont(name: "Chalkduster", size:60.0)
        timeSetLabel.textColor = UIColor.groupTableViewBackgroundColor()
        timeSetLabel.layer.masksToBounds = true
        timeSetLabel.layer.position = CGPoint(x: self.view.frame.width/2, y: 150)
        
        self.view.addSubview(timeSetLabel)
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.timeLabel()
        
        timeSetLabel.text = appDelegate.message1
        
        println(soundName)
        
        self.myButtonAction0()
        self.myButtonAction1()
        self.myButtonAction2()
        self.myButtonAction3()
        self.myButtonAction4()
        self.myButtonAction5()
        self.myButtonAction6()
        self.myButtonAction7()
        self.myButtonAction8()
        
        self.audio()
        
        self.colorChange()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func audio() {
        if soundName != nil {
            soundName = appDelegate.messageS
        } else {
            soundName = "Bike_Rides"
        }
        
        //再生する音源のURLを生成
        let soundFilePath = NSBundle.mainBundle().pathForResource("\(soundName)", ofType: "mp3")!
        let fileURL : NSURL = NSURL(fileURLWithPath: soundFilePath as String)!
        // AVAudioPlayerのインスタンス化
        myAudioPlayer = AVAudioPlayer(contentsOfURL: fileURL, error: nil)
        myAudioPlayer.volume = 0.2
        myAudioPlayer.play()
    }
    func audioLabel() {
        
        
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
    
    //soundボタンがタップされた時に呼ばれるメソッド.
    func onClickSoundStopButton(sender: UIButton) {
        if correctAnser < 4 {
            if random == sender.tag {
                correctAnser++
            } else {
                var volume = myAudioPlayer.volume + 0.3
                myAudioPlayer.volume = volume
            }
            colorDefault()
            colorChange()
        } else if correctAnser == 4 {
            if random == sender.tag {
                myAudioPlayer.pause()
                colorDefault()
                let alert = UIAlertView()
                alert.title = "これであなたも脳みそ全開！"
                alert.message = "おはようございます♪"
                alert.addButtonWithTitle("OK")
                alert.show()
                
                let myMainViewController: UIViewController = mainViewController()
                myMainViewController.modalTransitionStyle = UIModalTransitionStyle.PartialCurl
                self.presentViewController(myMainViewController, animated: true, completion: nil)
            } else {
                var volume = myAudioPlayer.volume + 0.3
                myAudioPlayer.volume = volume
                colorDefault()
                colorChange()
            }
        }
    }
    func myButtonAction0() {
        myButton0.backgroundColor = UIColor.blueColor()
        myButton0.frame = CGRectMake(0, 0, self.view.bounds.width/4, self.view.bounds.width/4)
        myButton0.layer.position = CGPoint(x: self.view.bounds.width/4,y: self.view.bounds.height  - 100 - self.view.bounds.width*2/4)
        myButton0.layer.masksToBounds = true
        myButton0.layer.cornerRadius = 100
        myButton0.layer.borderWidth = 5
        myButton0.layer.borderColor = UIColor.blueColor().CGColor
        myButton0.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        myButton0.tag = 0
        myButton0.addTarget(self, action: "onClickSoundStopButton:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(myButton0)
    }
    func myButtonAction1() {
        myButton1.backgroundColor = UIColor.blueColor()
        myButton1.frame = CGRectMake(0, 0, self.view.bounds.width/4, self.view.bounds.width/4)
        myButton1.layer.position = CGPoint(x: self.view.bounds.width/2,y: self.view.bounds.height  - 100 - self.view.bounds.width*2/4)
        myButton1.layer.masksToBounds = true
        myButton1.layer.cornerRadius = 100
        myButton1.layer.borderWidth = 5
        myButton1.layer.borderColor = UIColor.blueColor().CGColor
        myButton1.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        myButton1.tag = 1
        myButton1.addTarget(self, action: "onClickSoundStopButton:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(myButton1)
    }
    func myButtonAction2() {
        myButton2.backgroundColor = UIColor.blueColor()
        myButton2.frame = CGRectMake(0, 0, self.view.bounds.width/4, self.view.bounds.width/4)
        myButton2.layer.position = CGPoint(x: self.view.bounds.width*3/4,y: self.view.bounds.height - 100 - self.view.bounds.width*2/4)
        myButton2.layer.masksToBounds = true
        myButton2.layer.cornerRadius = 100
        myButton2.layer.borderWidth = 5
        myButton2.layer.borderColor = UIColor.blueColor().CGColor
        myButton2.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        myButton2.tag = 2
        myButton2.addTarget(self, action: "onClickSoundStopButton:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(myButton2)
    }
    func myButtonAction3() {
        myButton3.backgroundColor = UIColor.blueColor()
        myButton3.frame = CGRectMake(0, 0, self.view.bounds.width/4, self.view.bounds.width/4)
        myButton3.layer.position = CGPoint(x: self.view.bounds.width/4,y: self.view.bounds.height - 100 - self.view.bounds.width/4)
        myButton3.layer.masksToBounds = true
        myButton3.layer.cornerRadius = 100
        myButton3.layer.borderWidth = 5
        myButton3.layer.borderColor = UIColor.blueColor().CGColor
        myButton3.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        myButton3.tag = 3
        myButton3.addTarget(self, action: "onClickSoundStopButton:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(myButton3)
    }
    func myButtonAction4() {
        myButton4.backgroundColor = UIColor.blueColor()
        myButton4.frame = CGRectMake(0, 0, self.view.bounds.width/4, self.view.bounds.width/4)
        myButton4.layer.position = CGPoint(x: self.view.bounds.width/2,y: self.view.bounds.height - 100 - self.view.bounds.width/4)
        myButton4.layer.masksToBounds = true
        myButton4.layer.cornerRadius = 100
        myButton4.layer.borderWidth = 5
        myButton4.layer.borderColor = UIColor.blueColor().CGColor
        myButton4.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        myButton4.tag = 4
        myButton4.addTarget(self, action: "onClickSoundStopButton:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(myButton4)
    }
    func myButtonAction5() {
        myButton5.backgroundColor = UIColor.blueColor()
        myButton5.frame = CGRectMake(0, 0, self.view.bounds.width/4, self.view.bounds.width/4)
        myButton5.layer.position = CGPoint(x: self.view.bounds.width*3/4,y: self.view.bounds.height - 100 - self.view.bounds.width/4)
        myButton5.layer.masksToBounds = true
        myButton5.layer.cornerRadius = 100
        myButton5.layer.borderWidth = 5
        myButton5.layer.borderColor = UIColor.blueColor().CGColor
        myButton5.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        myButton5.tag = 5
        myButton5.addTarget(self, action: "onClickSoundStopButton:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(myButton5)
    }
    func myButtonAction6() {
        myButton6.backgroundColor = UIColor.blueColor()
        myButton6.frame = CGRectMake(0, 0, self.view.bounds.width/4, self.view.bounds.width/4)
        myButton6.layer.position = CGPoint(x: self.view.bounds.width/4, y: self.view.bounds.height - 100)
        myButton6.layer.masksToBounds = true
        myButton6.layer.cornerRadius = 100
        myButton6.layer.borderWidth = 5
        myButton6.layer.borderColor = UIColor.blueColor().CGColor
        myButton6.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        myButton6.tag = 6
        myButton6.addTarget(self, action: "onClickSoundStopButton:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(myButton6)
    }
    func myButtonAction7() {
        myButton7.backgroundColor = UIColor.blueColor()
        myButton7.frame = CGRectMake(0, 0, self.view.bounds.width/4, self.view.bounds.width/4)
        myButton7.layer.position = CGPoint(x: self.view.bounds.width/2,y: self.view.bounds.height - 100)
        myButton7.layer.masksToBounds = true
        myButton7.layer.cornerRadius = 100
        myButton7.layer.borderWidth = 5
        myButton7.layer.borderColor = UIColor.blueColor().CGColor
        myButton7.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        myButton7.tag = 7
        myButton7.addTarget(self, action: "onClickSoundStopButton:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(myButton7)
    }
    func myButtonAction8() {
        myButton8.backgroundColor = UIColor.blueColor()
        myButton8.frame = CGRectMake(0, 0, self.view.bounds.width/4, self.view.bounds.width/4)
        myButton8.layer.position = CGPoint(x: self.view.bounds.width*3/4,y: self.view.bounds.height - 100)
        myButton8.layer.masksToBounds = true
        myButton8.layer.cornerRadius = 100
        myButton8.layer.borderWidth = 5
        myButton8.layer.borderColor = UIColor.blueColor().CGColor
        myButton8.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        myButton8.tag = 8
        myButton8.addTarget(self, action: "onClickSoundStopButton:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(myButton8)
    }
    
    
}

