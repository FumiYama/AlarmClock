//
//  MusicSettingViewController.swift
//  AlarmClock
//
//  Created by Fumiya Yamanaka on 2015/06/30.
//  Copyright (c) 2015年 Fumiya Yamanaka. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class MusicSettingViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource,   AVAudioPlayerDelegate {
    
    var soundPicker: UIPickerView!
    var soundAudioPlayer: AVAudioPlayer!    //変数宣言
    var soundArray: NSArray = ["Bike_Rides", "Blue_Skies", "How_it_Began", "If_I_Had_a_Chicken", "Piano","Side_Path", "Spring_In_My_Step", "The_Drive", "なんでしょう"]
    var soundName: NSString! = "Bike_Rides"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        musicSettingCancelButton()
        musicSettingButton()
        
        self.mySoundPicker()

        self.audio()
    }
    //pickerViewの作成
    func mySoundPicker() {
        soundPicker = UIPickerView()
        soundPicker.frame = CGRectMake(0, self.view.bounds.height/4, 0, 0)
        soundPicker.backgroundColor = UIColor.groupTableViewBackgroundColor()
        soundPicker.delegate = self
        soundPicker.dataSource = self
        
        self.view.addSubview(soundPicker)
        
    }
    // pickerに表示する列数を返すデータソースメソッド. (実装必須)
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    // pickerに表示する行数を返すデータソースメソッド.
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return soundArray.count
    }
    // pickerに表示する値を返すデリゲートメソッド.
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String {
        return soundArray[row] as! String
    }
    // pickerが選択された際に呼ばれるデリゲートメソッド.
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // 音楽を止めて
        soundAudioPlayer.pause()
        // soundNameに選択された音楽を代入
        soundName = soundArray[row] as! String
        // 改めて再生
        audio()
    }
    
    func audio() {
        //再生する音源のURLを生成
        let soundFilePath = NSBundle.mainBundle().pathForResource("\(soundName)", ofType: "mp3")!
        let fileURL : NSURL = NSURL(fileURLWithPath: soundFilePath as String)!
        // AVAudioPlayerのインスタンス化
        soundAudioPlayer = AVAudioPlayer(contentsOfURL: fileURL, error: nil)
        soundAudioPlayer.volume = 0.2
        soundAudioPlayer.play()
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // OKボタンの作成
    func musicSettingButton(){
        let musicSetButton = UIButton(frame: CGRectMake(self.view.frame.width/2, 500, 100, 100))
        let img = UIImage(named: "Entypo_2713(2)_128.png") as UIImage?
        musicSetButton.setImage(img, forState: .Normal)
        musicSetButton.layer.position = CGPoint(x: self.view.frame.width*3/4, y: self.view.frame.width/4)
        musicSetButton.addTarget(self, action: "musicSubmit", forControlEvents: .TouchUpInside)
        
        self.view.addSubview(musicSetButton)
    }
    // OKボタンのaction,
    func musicSubmit() {
        soundAudioPlayer.pause()
        let myMainViewController = mainViewController()
        self.presentViewController(myMainViewController, animated: true, completion: nil)
        //AppDelegateのインスタンスを取得
        var appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        //appDelegateの変数を操作
        appDelegate.messageS = soundName as String
    }
    
    // Backボタンの作成
    func musicSettingCancelButton(){
        
        let alarmCancelButton = UIButton(frame: CGRectMake(0, 500, 100, 100))
        let img = UIImage(named: "Entypo_e712(1)_128.png") as UIImage?
        alarmCancelButton.setImage(img, forState: .Normal)
        alarmCancelButton.layer.position = CGPoint(x: self.view.frame.width/4, y: self.view.frame.width/4)
        alarmCancelButton.addTarget(self, action: "onClickMainMyButton:", forControlEvents: .TouchUpInside)
        
        self.view.addSubview(alarmCancelButton)
    }
    // 画面遷移(Back)のための処理
    internal func onClickMainMyButton(sender: UIButton) {
        soundAudioPlayer.pause()
        let mainMyViewController = mainViewController()
        mainMyViewController.modalTransitionStyle = UIModalTransitionStyle.CrossDissolve
        self.presentViewController(mainMyViewController, animated: true, completion: nil)
    }
    
    
    
    
    
}

