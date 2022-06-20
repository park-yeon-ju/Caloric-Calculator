//
//  ListView.swift
//  Caloric Calculator
//
//  Created by 박연주 on 2022/06/14.
//

import UIKit
import Foundation
import simd

class ListView: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    //아이템 추가
    var foodList: [String] = []
    
    var filteredData: [String]! //검색 바를 위한 필요 변수
    var location_name_array = [String]() //위치정보를 가지고 있는 배열
    
    let cellReuseIdentifier = "foods" //UITableViewCell의 id가 된다.//
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        foodList = readTxtFile()
        
        //DataSource delegate를 ViewController로 설정
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.searchBar.delegate = self
        
        self.filteredData = self.foodList //필터링 배열에 원본 데이터 배열을 등록
        
    }
    
    @IBAction func backBtn(_ sender: UIButton) {
        self.presentingViewController?.dismiss(animated:true)
    }
    
    func readTxtFile() -> Array<String> {
            // [텍스트 파일 내용을 저장할 변수]
            var result = ""
            var foodLists: [String] = []
            
            // [저장된 텍스트 파일 경로 지정 실시]
            let paths = Bundle.main.path(forResource: "food.txt", ofType: nil)
            //guard paths != nil else { return }
            
            // [텍스트 파일 내용 확인 실시]
            do {
                result = try String(contentsOfFile: paths!, encoding: .utf8)
                foodLists = result.components(separatedBy: "\n")
            }
            catch let error as NSError {
                //필요 없음
                print("텍스트 파일 내용 확인 실패")
                print("catch :: ", error.localizedDescription)
                 //return*/
                
            }
        print("텍스트 파일 내용 확인 성공")
        /*print("result :: ", result)
     print(foodLists.first as Any) //Array<String>*/
            
        return foodLists
        }
    

    
}
extension ListView : UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate{
 func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     //아이템 수 반환
     return self.filteredData.count
 }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        //각 테이블 뷰의 섹션을 나눈다.
        return 1
    }
 
    //리스트뷰 데이터 초기화 부분
 func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell:FoodTableCell = self.tableView.dequeueReusableCell(withIdentifier: self.cellReuseIdentifier) as! FoodTableCell
     let row = indexPath.row
     
     cell.label?.text = self.filteredData[row]
     cell.button?.tag = row //태그등록//
     
     return cell
 }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell number \((indexPath as NSIndexPath).row).") //클릭이벤트
        
        let vcName = self.storyboard?.instantiateViewController(withIdentifier: "RecordView") as? RecordView
         vcName?.modalPresentationStyle = .fullScreen //전체화면으로 보이게 설정
         vcName?.modalTransitionStyle = .crossDissolve //전환 애니메이션 설정
        vcName?.menu = filteredData[((indexPath as NSIndexPath).row)]
        self.present(vcName!, animated: true, completion: nil)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredData = searchText.isEmpty ? foodList : foodList.filter({(dataString:String) -> Bool in
            return dataString.range(of: searchText, options: .caseInsensitive) != nil
        })
        
        tableView.reloadData() //필터링 된 데이터를 기준으로 다시 테이블뷰를 설정
    }
    
    //검색 바에서 입력하기 시작할 경우
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        self.searchBar.showsCancelButton = true //취소버튼 보이기
    }
    
    //취소버튼 클릭 시 키보드 닫히기, 검색어 초기화
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.searchBar.showsCancelButton = false
        self.searchBar.text = ""
        self.searchBar.resignFirstResponder()
    }
    
    //키보드에서 검색버튼 눌렀을 경우
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
     print("search text: ", self.searchBar.text!)
     
     let refreshAlert = UIAlertController(title: "검색결과", message: self.searchBar.text!, preferredStyle: UIAlertController.Style.alert)
        
        refreshAlert.addAction(UIAlertAction(title: "확인", style: .default, handler: {(action:UIAlertAction!) in print("검색확인")
            
            self.searchBar.showsCancelButton = false
            self.searchBar.text = ""
            self.searchBar.resignFirstResponder()
        }))
        
        present(refreshAlert, animated: true, completion: nil)
    }
    
    /*//스토리보드 이동(Modal방식,Push방식)
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
         //개빡치네 왜 안될까
         //이동할 스토리보드의 id저장.값이 변할 수 있는 것은 가변타입(var)로 한다. 고정값(상수)이면 let
          var segue_id : String = ""
          segue_id = segue.identifier!
          
          //identifier값으로 비교한다.//
          print("segue id : [",segue_id+"] id")
                  
          //스토리보드의 id값을 가지고 이동할 스토리보드를 선택한다.//
          if(segue_id == "RecordView")
          {
              let button = sender as? UIButton //현재 UIButton의 프로토콜로 왔으니 sender를 UIButton으로 캐스팅한다.//
              let cell_position = button?.tag //버튼의 tag값을 가져온다.(tag: 선택된 셀의 row값)//
                      
              //UINavigation에서의 값 전달도 일반적으로 destination을 설정해서 한다.//
              let destination = segue.destination as! RecordView //이동할 스토리보드를 정의//
                  
              print("move sotryboard...")
                      
              //이동할 스토리보드에 있는 값을 받을 변수설정(안드로이드에서는 해당 기능을 인텐트로 구현)//
              //필터링 배열을 가지고 이용//
              destination.menu = self.filteredData[cell_position!]}
     }*/
    
    
    override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(true)
        }
    
}

