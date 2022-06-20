//
//  RecordView.swift
//  Caloric Calculator
//
//  Created by 박연주 on 2022/06/14.
//

import UIKit

class RecordView: UIViewController {
    @IBOutlet weak var photoCheckView: UIImageView!
    @IBOutlet weak var menuName: UILabel!
    
    var menu: String = ""
    
    // 사진: 이미지 피커 컨트롤러 생성
    let pickerImage = UIImagePickerController()

    override func viewDidLoad() {
        super.viewDidLoad()

        pickerImage.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    //키보드 사용할 때 텍스트 필드 안가리게 해주는 메소드들
    override func viewWillAppear(_ animated: Bool) {
        self.addKeyboardNotifications()
        menuName.text = ":  " + menu
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.removeKeyboardNotifications()
    }
    
    //뒤로가기 버튼
    @IBAction func BackBtnFromPP(_ sender: UIButton) {
        self.presentingViewController?.dismiss(animated:true)
    }
    
    //RecordView 카메라 버튼
    @IBAction func GetImageBtn(_ sender: UIButton) {
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
    
    
    //RecordView에서 메뉴View로 가는 메소드
    @IBAction func SearchMenuBtn(_ sender: UIButton) {
        let vcName = self.storyboard?.instantiateViewController(withIdentifier: "ListView")
                vcName?.modalPresentationStyle = .fullScreen //전체화면으로 보이게 설정
                vcName?.modalTransitionStyle = .crossDissolve //전환 애니메이션 설정
                self.present(vcName!, animated: true, completion: nil)
    }
    
    
    @IBAction func cpltBtn(_ sender: UIButton) {
        
        let vcName = self.storyboard?.instantiateViewController(withIdentifier: "MainView") as? ViewController
            vcName?.modalPresentationStyle = .fullScreen //전체화면으로 보이게 설정
            vcName?.modalTransitionStyle = .crossDissolve //전환 애니메이션 설정
            vcName?.lC = "2020"
            vcName?.aC = "980"
                self.present(vcName!, animated: true, completion: nil)
    }
    
}

extension RecordView : UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {

            if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
                photoCheckView.image = image
                photoCheckView.contentMode = .scaleAspectFill
                photoCheckView.clipsToBounds = true
                }
                dismiss(animated: true, completion: nil)
        }
}


