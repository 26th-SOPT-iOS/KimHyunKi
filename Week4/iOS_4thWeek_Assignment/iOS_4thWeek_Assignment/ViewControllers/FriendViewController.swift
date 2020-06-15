//
//  FriendViewController.swift
//  iOS_ThirdWeek_Assignment
//
//  Created by 김현기 on 2020/05/11.
//  Copyright © 2020 HyunKi Kim. All rights reserved.
//

import UIKit

class FriendViewController: UIViewController {
    //아이폰 카메라 & 갤러리에 접근
    private var pickerController = UIImagePickerController()
    
    @IBOutlet weak var friendTableView: UITableView!
  
    
    
    private var meProfile: [Friends] = [] //내 얼굴 만들기
    private var friendsProfile: [Friends] = [] //친구 목록 만들기
    
    private let sections: [String] = ["친구", "나"] //section 설정하기
    var numberofFriendLabel  = UILabel()
    
       
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //테이블뷰 기본 줄 없애기
        friendTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        
        setFriendList()
        
        friendTableView.delegate = self
        friendTableView.dataSource = self
            
        pickerController.delegate = self
        
        
        //self.friendTableView.sectionFooterHeight = 1;
        
        
    
    }
    
    @IBAction func buttonAction(_ sender: Any){
        
        
        let alert = UIAlertController(title: nil, message: nil , preferredStyle: UIAlertController.Style.actionSheet)
        
        
        let actionDefault = UIAlertAction(title: "친구관리", style: .default, handler: nil)
        let actionDefault2 = UIAlertAction(title: "전체 설정", style: .default, handler: nil)
        let cancel = UIAlertAction(title: "취소", style: .cancel, handler : nil)

        
        alert.addAction(actionDefault)
        alert.addAction(actionDefault2)
        
        alert.addAction(cancel)

        
        present(alert, animated: true, completion: nil)

    
    }
    
    
    
    
    
    private func setFriendList(){
        
        let data = Friends(profile: "9573886432601742940168682793295078318145536N", name: "이솝트", status: "")
        
        meProfile = [data]
            
        let data1 = Friends(profile: "profile1Img", name: "박섭트", status: "왈왈!! 멍멍ㅇ머머!왊멍!")
        let data2 = Friends(profile: "profile2Img", name: "시튜시튜", status: "몽몽")
        let data3 = Friends(profile: "profile3Img", name: "뽀림이", status: "뽀림이빼꼬미")
        let data4 = Friends(profile: "profile4Img", name: "이솝트", status: "총총ㅊ오종초조옻오종")
        let data5 = Friends(profile: "profile5Img", name: "강솝트", status: "강솝트멀바")
        let data6 = Friends(profile: "profile6Img", name: "옴뇸이", status: "아~")
        let data7 = Friends(profile: "profile7Img", name: "룰루랄라", status: "룰루랄라빼액")
        let data8 = Friends(profile: "profile8Img", name: "왕망이", status: "애옹애옹애용왕망이")
        let data9 = Friends(profile: "profile9Img", name: "할레루야", status: "카아야아아아아악")
            
        friendsProfile = [data1, data2, data3, data4, data5, data6, data7, data8, data9]
        
    }
    
    
    //스와이프 투 딜리트
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            
            if editingStyle == UITableViewCell.EditingStyle.delete{
                friendsProfile.remove(at: indexPath.row) //데이터 삭제
                tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic) //테이블에서 삭제
                
                
                numberofFriendLabel.text = "친구 \(friendsProfile.count)"
            }
        }
    
    
    //푸터 설정
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView()
        
        if section == 0 {
            let separatorView = UIView(frame: CGRect(x: tableView.separatorInset.left, y:
                footerView.frame.height, width: tableView.frame.width -
                    tableView.separatorInset.right - tableView.separatorInset.left - 14.5,
                height: 1
            ))
            
            separatorView.backgroundColor = UIColor.lightGray
            footerView.addSubview(separatorView)
            
            
           
            numberofFriendLabel.frame = CGRect.init(x: 16, y: 9.5, width: tableView.bounds.size.width, height: 17)
            numberofFriendLabel.textColor = UIColor.lightGray
            numberofFriendLabel.text = "친구 \(friendsProfile.count)"
            numberofFriendLabel.font = UIFont.systemFont(ofSize: 12)
            numberofFriendLabel.sizeToFit()
            
            footerView.addSubview(numberofFriendLabel)
            
        }
        
        return footerView
    }
    
}


extension FriendViewController: UITableViewDataSource {
    //section의 수를 두 개로 만들어준다.
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    //테이블에 표시할 총 배열 수를 반환한다.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // section이 0인 부분일 때 --> meProfile의 data 수
        if section == 0{
            return meProfile.count
        } else if section == 1{
            return friendsProfile.count
        } else {
            return 0
        }
    }
    
    //섹션별 높이조절
    /*
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 88
        } else {
            return 77
        }
    }
    */
    
    /*
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        
        let num = String(friendsProfile.count)
        let FriendCount = sections[section] + num
        
        if section == 0 {
            return FriendCount
        } else {
            return nil
        }
        
        
        //let footerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 50))
        //return footerView
    }
    */
    
    
    /*
    //header 없애기, 제목 주기
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        let num = String(friendsProfile.count)
        let FriendCount = sections[section] + num
        
        if section == 0 {
            return nil
        } else {
            return FriendCount
        }
    }
    */
    /*
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.font = UIFont(name: "System", size: 3)
    }
    */
    
    //func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        //let myLabel = UILabel()
        //myLabel.frame = CGRect(x: 20, y: 8, width: 320, height: 20)
        //myLabel.font = UIFont.boldSystemFont(ofSize: 8)
        //myLabel.text = self.tableView(tableView, titleForHeaderInSection: section)
        
        //return myLabel
        //let headerView = UIView()
        //headerView.addSubview(myLabel)

       // return headerView
    //}
    
    
    //cell에 값을 넣어주는 코드
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FriendCell.identifier, for: indexPath) as? FriendCell else{ return UITableViewCell()}
        
        
        cell.indexPath = indexPath
        cell.delegate = self
        
        
        if indexPath.section == 0 {
            
            cell.setFriendInformation(faceImageName: meProfile[indexPath.row].profileImg, name: meProfile[indexPath.row].name, status: meProfile[indexPath.row].statusMsg)
        
        } else if indexPath.section == 1 {
            cell.setFriendInformation(faceImageName: friendsProfile[indexPath.row].profileImg, name: friendsProfile[indexPath.row].name, status: friendsProfile[indexPath.row].statusMsg)
        } else {
            return UITableViewCell()
        }
        return cell
    }
    
    //수정할 section 선택
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        if indexPath.section == 0 {
            return false
        }
        return true
    }
    
    
    /*
    //Swipe로 데이터 삭제하기
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCell.EditingStyle.delete{
            friendsProfile.remove(at: indexPath.row) //데이터 삭제
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic) //테이블에서 삭제
        }
    }
 */
}



extension FriendViewController: UITableViewDelegate {
    
    /*
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         return 80
     }
    */
    
    
    //섹션의 헤더 높이 줄여주기
    /*
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0
        }
        else {
            return 1.5
        }
    }
 */
    
    /*
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 1))
        footerView.backgroundColor = UIColor.lightGray
        return footerView
    }
    
    */
    
    /*
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {

        if (section == 0) {

            return 0

        } else {

            return 1

        }

    }
    */
    
    //footer 줄 주기 왜인지 모르겠는데 이친구 안먹어 살려줘도
    
    
    /*
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {

        if (section == 0) {
            //view.tintColor = UIColor.lightGray
            return 10

        } else {

            return 0

        }
ㅁㄴㅇㄹㅁㅇㄴㄹㅁㄴㄹㅁㄴㅇㄹ
    }
 */
    
    /*
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {

        if section == 0 {
            return 0
        } else {
            return 20
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        let view = UIView.init(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 30))

        let headerLabel = UILabel()
        let numberOfFriendLabel = UILabel()

        headerLabel.text = "친구 "
        headerLabel.font = UIFont.systemFont(ofSize: 12)
        headerLabel.frame = CGRect.init(x: 15, y: 0, width: 50, height: 30)

        numberOfFriendLabel.text = "\(friendsProfile.count)"
        numberOfFriendLabel.font = UIFont.systemFont(ofSize: 12)
        numberOfFriendLabel.frame = CGRect.init(x: 40, y: 0, width: 50, height: 30)

        view.addSubview(headerLabel)
        view.addSubview(numberOfFriendLabel)

        return view
    }
    */
    /*
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView()
        
        let headerLabel = UILabel()
        let numberOfFriendLabel = UILabel()
        
        if section == 0 {
            let separatorView = UIView(frame: CGRect(x: tableView.separatorInset.left, y:
                footerView.frame.height, width: tableView.frame.width -
                    tableView.separatorInset.right - tableView.separatorInset.left - 14.5,
                height: 1
            ))
            
            separatorView.backgroundColor = UIColor.lightGray
            footerView.addSubview(separatorView)
            
            headerLabel.text = "친구 "
            headerLabel.font = UIFont.systemFont(ofSize: 12)
            headerLabel.frame = CGRect.init(x: 16, y:186, width: tableView.bounds.size.width, height: 17)
            headerLabel.sizeToFit()
            
            numberOfFriendLabel.text = "\(friendsProfile.count)"
            numberOfFriendLabel.font = UIFont.systemFont(ofSize: 12)
            numberOfFriendLabel.frame = CGRect.init(x: 40, y: 186, width: tableView.bounds.size.width, height: 17)
            numberOfFriendLabel.sizeToFit()
            
            view.addSubview(headerLabel)
            view.addSubview(numberOfFriendLabel)
            
        }
        
        return footerView
    }
    */
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
          if indexPath.section == 0 {
              return 88
          } else {
              return 77
          }
      }
}




extension FriendViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func openLibrary(){
        pickerController.sourceType = .photoLibrary
        self.present(pickerController, animated: true, completion: nil)
    }
    
    func openCamera(){
        pickerController.sourceType = .camera
        self.present(pickerController, animated: true, completion: nil)
    }
    
   func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage, let url = info[UIImagePickerController.InfoKey.imageURL] as? URL {
            
            guard let token = UserDefaults.standard.object(forKey: "token") as? String else { return }
            UploadService.shared.uploadImage(token, image, url.lastPathComponent) { networkResult in
                switch networkResult {
                case .success(let profileData):
                    guard let profileData = profileData as? [UserProfile] else { return }
                    print(profileData[0].profile)
                    guard let profileCell = self.friendTableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? FriendCell else { return }
                    profileCell.profileImage.setImage(image: UIImage) = image
                case .requestErr(let failMessage):
                    guard let message = failMessage as? String else { return }
                    print(message)
                case .pathErr:
                    print("pathErr")
                case .serverErr:
                    print("serverErr")
                case .networkFail:
                    print("networkFail")
                }
            }
        }
        dismiss(animated: true, completion: nil)
    }
}



extension FriendViewController: ButtonDelegate { func onClickCellButton(in index: Int) {
    let alertController = UIAlertController(title: "사진 선택", message: "가져올 곳을 선택하세요", preferredStyle: .actionSheet)
    let galleryAction = UIAlertAction(title: "사진앨범", style: .default) { action in self.openLibrary()
}
    
    let photoAcgtion = UIAlertAction(title: "카메라", style: .default) { action in self.openCamera()
}
    
    let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
    alertController.addAction(galleryAction)
    alertController.addAction(photoAcgtion)
    alertController.addAction(cancelAction)
    self.present(alertController, animated: true, completion: nil) }
}


