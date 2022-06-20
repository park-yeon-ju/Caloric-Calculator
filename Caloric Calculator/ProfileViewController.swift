//
//  ProfileViewController.swift
//  Caloric Calculator
//
//  Created by 박연주 on 2022/06/13.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var profileImgaeView: UIImageView!
    @IBOutlet weak var age: UITextField!
    @IBOutlet weak var sex: UITextField!
    @IBOutlet weak var height: UITextField!
    @IBOutlet weak var weight: UITextField!
    @IBOutlet weak var goal: UITextField!
    
    
    // 사진: 이미지 피커 컨트롤러 생성
    let pickerImage = UIImagePickerController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerImage.delegate = self

        age.text = "24"
        sex.text = "여"
        height.text = "168"
        weight.text = "56"
        goal.text = "3000"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.addKeyboardNotifications()
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.removeKeyboardNotifications()
    }

    @IBAction func profileImageBtn(_ sender: UIButton) {
        let alert =  UIAlertController()

                let library =  UIAlertAction(title: "사진앨범", style: .default) { (action) in self.openLibrary()

                }
                let camera =  UIAlertAction(title: "카메라", style: .default) { (action) in
                self.openCamera()
                }
                let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)

                alert.addAction(library)
                alert.addAction(camera)
                alert.addAction(cancel)

                present(alert, animated: true, completion: nil)

                }
        func openLibrary(){
              pickerImage.sourceType = .photoLibrary
              present(pickerImage, animated: false, completion: nil)
            }

        func openCamera(){
                if(UIImagePickerController .isSourceTypeAvailable(.camera)){
                    pickerImage.sourceType = .camera
                    present(pickerImage, animated: false, completion: nil)
                }
                else{
                    print("Camera not available")

                }
    }
    
    @IBAction func homeBtn(_ sender: UIButton) {
        let vcName = self.storyboard?.instantiateViewController(withIdentifier: "MainView")
                vcName?.modalPresentationStyle = .fullScreen //전체화면으로 보이게 설정
                vcName?.modalTransitionStyle = .crossDissolve //전환 애니메이션 설정
        dismiss(animated: true, completion: nil)
    }
}

extension ProfileViewController : UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {

            if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
                profileImgaeView.image = image
                profileImgaeView.contentMode = .scaleAspectFill
                profileImgaeView.layer.cornerRadius = profileImgaeView.frame.width / 2
                profileImgaeView.clipsToBounds = true
                }
                dismiss(animated: true, completion: nil)
        }
}
