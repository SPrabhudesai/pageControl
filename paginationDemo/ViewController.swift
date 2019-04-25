//
//  LoginVC.swift
//  paginationDemo
//
//  Created by Shailesh on 25/04/19.
//  Copyright © 2019 Shailesh. All rights reserved.
//


import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var skipButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
     }
    
    
    fileprivate func updateUI() {
      startButton.isHidden = true
      self.navigationController?.navigationBar.isHidden = true
      self.scrollView.frame =  CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height+70)
      let scrollViewWidth = self.scrollView.frame.width
      let scrollViewHeight = self.scrollView.frame.height
      textView.textAlignment = .center
      textView.text = "The moment I have realized God sitting in the temple of every human body, the moment I stand in reverence before every human being and see God in him - that moment I am free from bondage, everything that binds vanishes, and I am free."
       textView.textColor = .black
       startButton.layer.cornerRadius = 4.0
        let imgOne = UIImageView(frame: CGRect(x:0, y:0,width:scrollViewWidth, height:scrollViewHeight))
        imgOne.image = UIImage(named: "1.jpg")
        let imgTwo = UIImageView(frame: CGRect(x:scrollViewWidth, y:0,width:scrollViewWidth, height:scrollViewHeight))
        imgTwo.image = UIImage(named: "2.jpg")
        let imgThree = UIImageView(frame: CGRect(x:scrollViewWidth*2, y:0,width:scrollViewWidth, height:scrollViewHeight))
        imgThree.image = UIImage(named: "3.jpg")
//        let imgFour = UIImageView(frame: CGRect(x:scrollViewWidth*3, y:0,width:scrollViewWidth, height:scrollViewHeight))
//        imgFour.image = UIImage(named: "4.jpg")
        self.scrollView.addSubview(imgOne)
        self.scrollView.addSubview(imgTwo)
        self.scrollView.addSubview(imgThree)
        //self.scrollView.addSubview(imgFour)
        //4
        self.scrollView.contentSize = CGSize(width:self.scrollView.frame.width * 3, height:self.scrollView.frame.height)
        self.scrollView.delegate = self
        self.pageControl.currentPage = 0
        
        Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(moveToNextPage), userInfo: nil, repeats: true)
    }
    
    @objc func moveToNextPage (){
        
        let pageWidth:CGFloat = self.scrollView.frame.width
        let maxWidth:CGFloat = pageWidth * 3
        let contentOffset:CGFloat = self.scrollView.contentOffset.x
        
        let slideToX = contentOffset + pageWidth
        
        // if  contentOffset + pageWidth == maxWidth
        //{
        // slideToX = 0
        //}
        self.scrollView.scrollRectToVisible(CGRect(x:slideToX, y:0, width:pageWidth, height:self.scrollView.frame.height), animated: true)
    }
    
    @IBAction func onClickedSkipButton(_ sender: Any) {
       let vc = storyboard?.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
       self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
}

extension ViewController:UIScrollViewDelegate {
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView){
        // Test the offset and calculate the current page after scrolling ends
        let pageWidth:CGFloat = scrollView.frame.width
        let currentPage:CGFloat = floor((scrollView.contentOffset.x-pageWidth/2)/pageWidth)+1
        // Change the indicator
        self.pageControl.currentPage = Int(currentPage);
        // Change the text accordingly
        if Int(currentPage) == 0{
            skipButton.isHidden = false
            textView.text = "Sweettutos.com is your blog of choice for Mobile tutorials"
        }else if Int(currentPage) == 1{
            textView.text = "I write mobile tutorials mainly targeting iOS"
        }else {
            textView.text = "And sometimes I write games tutorials about Unity"
//        }else{
//            textView.text = "Keep visiting sweettutos.com for new coming tutorials, and don't forget to subscribe to be notified by email :)"
//            // Show the "Let's Start" button in the last slide (with a fade in animation)
            startButton.isHidden = false
            skipButton.isHidden = true
            UserDefaults.standard.set(true, forKey: "pageUser")
            UIView.animate(withDuration: 1.0, animations: { () -> Void in
                self.startButton.alpha = 1.0
            })
        }
    }
}
