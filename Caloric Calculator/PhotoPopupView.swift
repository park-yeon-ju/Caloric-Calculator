//
//  PhotoPopupView.swift
//  Caloric Calculator
//
//  Created by 박연주 on 2022/06/14.
//

import UIKit

class PhotoPopupView: UIViewController {

    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var menu: UILabel!
    @IBOutlet weak var weight: UILabel!
    @IBOutlet weak var calorie: UILabel!
    
    let pickerImage = UIImagePickerController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerImage.delegate = self
        
    }

    @IBAction func backBtn(_ sender: UIButton) {
        self.presentingViewController?.dismiss(animated:true)
    }
    @IBAction func addPhotoBtn(_ sender: UIButton) {
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
    
    
    @IBAction func rightBtn(_ sender: UIButton) {
        let vcName = self.storyboard?.instantiateViewController(withIdentifier: "ChoicePopupView")
                vcName?.modalPresentationStyle = .overCurrentContext //전체화면으로 보이게 설정
                vcName?.modalTransitionStyle = .crossDissolve //전환 애니메이션 설정
        
                self.present(vcName!, animated: true, completion: nil)
    }
    
    @IBAction func wrongBtn(_ sender: UIButton) {
        let vcName = self.storyboard?.instantiateViewController(withIdentifier: "RecordView")
                vcName?.modalPresentationStyle = .fullScreen //전체화면으로 보이게 설정
                vcName?.modalTransitionStyle = .crossDissolve //전환 애니메이션 설정
                self.present(vcName!, animated: true, completion: nil)
    }
    
    
    func showInfo(){
        if(photoView != nil){
            print("it works")
            menu.text = "쌀밥 1공기"
            weight.text = "210g"
            calorie.text = "313kcal"
        }
        
    }
    
}

extension PhotoPopupView : UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {

            if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
                photoView.image = image
                photoView.contentMode = .scaleAspectFill
                photoView.clipsToBounds = true
                }
        showInfo()
                dismiss(animated: true, completion: nil)
        }
    
    
}
