//
//  ChoicePopupView.swift
//  Caloric Calculator
//
//  Created by 박연주 on 2022/06/14.
//

import UIKit

class ChoicePopupView: UIViewController {

    @IBOutlet weak var popupView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        popupView.layer.cornerRadius = 20
    }

    @IBAction func bgTouchBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func okBtn(_ sender: UIButton) {
        let vcName = self.storyboard?.instantiateViewController(withIdentifier: "MainView")
                vcName?.modalPresentationStyle = .fullScreen //전체화면으로 보이게 설정
                vcName?.modalTransitionStyle = .crossDissolve //전환 애니메이션 설정
                self.present(vcName!, animated: true, completion: nil)
    }
}
