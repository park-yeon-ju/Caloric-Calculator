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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        todaysDate()
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

