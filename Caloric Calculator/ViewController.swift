//
//  ViewController.swift
//  Caloric Calculator
//
//  Created by 박연주 on 2022/05/16.
//

import UIKit
import Photos
import AVFoundation

class ViewController: UIViewController{
    @IBOutlet weak var dateTF: UILabel!
    @IBOutlet weak var leftCal: UILabel!
    @IBOutlet weak var addCal: UILabel!
    @IBOutlet weak var minusCal: UILabel!
    
    @IBOutlet weak var item2: UIImageView!
    @IBOutlet weak var item2Txt1: UILabel!
    @IBOutlet weak var item2Txt2: UILabel!
    @IBOutlet weak var item2Txt3: UILabel!
    @IBOutlet weak var item2Img: UIImageView!
    
    @IBOutlet weak var item3: UIImageView!
    @IBOutlet weak var item3Txt1: UILabel!
    @IBOutlet weak var item3Txt2: UILabel!
    @IBOutlet weak var item3Txt3: UILabel!
    @IBOutlet weak var item3Img: UIImageView!
    
    
    var lC: String = "2513"
    var aC: String = "487"
    var mC: String = "0"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        todaysDate()
        
        self.leftCal.text = lC
        self.addCal.text = aC
        
        if leftCal.text == "2513"
        {
            item2.layer.isHidden = true
            item2Txt1.layer.isHidden = true
            item2Txt2.layer.isHidden = true
            item2Txt3.layer.isHidden = true
            item2Img.layer.isHidden = true
            
            item3.layer.isHidden = true
            item3Txt1.layer.isHidden = true
            item3Txt2.layer.isHidden = true
            item3Txt3.layer.isHidden = true
            item3Img.layer.isHidden = true
        }
        else if leftCal.text == "2200"
        {
            item2.layer.isHidden = false
            item2Txt1.layer.isHidden = false
            item2Txt2.layer.isHidden = false
            item2Txt3.layer.isHidden = false
            item2Img.layer.isHidden = false
            
            item3.layer.isHidden = true
            item3Txt1.layer.isHidden = true
            item3Txt2.layer.isHidden = true
            item3Txt3.layer.isHidden = true
            item3Img.layer.isHidden = true
        }
        else
        {
            item3.layer.isHidden = false
            item3Txt1.layer.isHidden = false
            item3Txt2.layer.isHidden = false
            item3Txt3.layer.isHidden = false
            item3Img.layer.isHidden = false
        }
    }
    
    //오늘 날짜 받아와서 MainView 날짜 갱신
    func todaysDate(){
        let date = Date()
        let calendar = Calendar.current //켈린더 객체 생성
        let year = calendar.component(.year, from: date) //년
        let month = calendar.component(.month, from: date) //월
        let day = calendar.component(.day, from: date) //일
        dateTF.text = "\(year)년 \(month)월 \(day)일"
    }
    
    func showItem2(){
        
        item2.layer.isHidden = false
        item2Txt1.layer.isHidden = false
        item2Txt2.layer.isHidden = false
        item2Txt3.layer.isHidden = false
        item2Img.layer.isHidden = false
    }
    
    
    //MainView에서 플러스 버튼으로 카메라 및 갤러리 선택 팝업 띄우는 메소드
    @IBAction func photoPopupBtn(_ sender: UIButton) {
        /*let alert = self.storyboard?.instantiateViewController(withIdentifier: "PhotoPopupView") as! PhotoPopupView
         alert.modalPresentationStyle = .overCurrentContext
         present(alert, animated: false, completion: nil)*/
        
        let vcName = self.storyboard?.instantiateViewController(withIdentifier: "CheckView")
                vcName?.modalPresentationStyle = .fullScreen //전체화면으로 보이게 설정
                vcName?.modalTransitionStyle = .crossDissolve //전환 애니메이션 설정
                self.present(vcName!, animated: true, completion: nil)

    }
    
    //MainView에서 마이페이지 가는 메소드
    @IBAction func MyPageBtn(_ sender: UIButton) {
        let vcName = self.storyboard?.instantiateViewController(withIdentifier: "MypageView")
                vcName?.modalPresentationStyle = .fullScreen //전체화면으로 보이게 설정
                vcName?.modalTransitionStyle = .crossDissolve //전환 애니메이션 설정
                self.present(vcName!, animated: true, completion: nil)
    }
    
    
}

