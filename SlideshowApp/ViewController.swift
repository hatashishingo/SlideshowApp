//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 幡司真吾 on 2020/09/20.
//  Copyright © 2020 shingo.hatashi. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIGestureRecognizerDelegate {

    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var startstopButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    var nowIndex:Int = 0
    
    var timer: Timer!
    
    var imageArray:[UIImage] = [
        UIImage(named: "cherry.jpeg")!,
        UIImage(named: "ocean.jpeg")!,
        UIImage(named: "Colored leaves.jpeg")!,
        UIImage(named: "snow.jpeg")!
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.image = imageArray[nowIndex]
        
        let tapGesture:UITapGestureRecognizer = UITapGestureRecognizer(
             target: self,
             action: #selector(ViewController.tapped(_:)))

        tapGesture.delegate = self

        imageView.addGestureRecognizer(tapGesture)
    }
    
    @objc func tapped(_ sender: UITapGestureRecognizer){
        if sender.state == .ended {
            timer.invalidate()
            timer = nil
            performSegue(withIdentifier: "showSegue", sender: self)
        }
    }
    
    @IBAction func nextButton(_ sender: Any) {
        nowIndex += 1
        if (nowIndex == imageArray.count) {
            nowIndex = 0
        }
        imageView.image = imageArray[nowIndex]
    }
    
    @IBAction func backButton(_ sender: Any) {
        nowIndex -= 1
        if (nowIndex == -1) {
            nowIndex = imageArray.count - 1
        }
        imageView.image = imageArray[nowIndex]
    }
    
    @IBAction func startButton(_ sender: Any) {
        if (timer == nil) {
            nextButton.isEnabled = false
            backButton.isEnabled = false
            timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(changeImage), userInfo: nil, repeats: true)
            
            startstopButton.setTitle("停止", for: .normal)
        }
        else {
            nextButton.isEnabled = true
            backButton.isEnabled = true
            timer.invalidate()
            timer = nil
            startstopButton.setTitle("再生", for: .normal)
        }
    }
    
    @objc func changeImage() {
        nowIndex += 1
        if (nowIndex == imageArray.count) {
            nowIndex = 0
        }
        imageView.image = imageArray[nowIndex]
    }
  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let scaleUpViewController:ScaleUpViewController = segue.destination as! ScaleUpViewController
            scaleUpViewController.x = imageView.image!
    }

    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        nextButton.isEnabled = true
        backButton.isEnabled = true
        startstopButton.setTitle("再生", for: .normal)
    }
}

