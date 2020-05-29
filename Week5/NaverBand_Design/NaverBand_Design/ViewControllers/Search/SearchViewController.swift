//
//  SearchViewController.swift
//  NaverBand_Design
//
//  Created by 김현기 on 2020/05/28.
//  Copyright © 2020 HyunKi Kim. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    @IBOutlet var TopicButton: [UIButton]!
    @IBOutlet weak var searchText: UITextField!
    
    @IBOutlet weak var NewCollectionView: UICollectionView!
    
    @IBOutlet weak var PageCollectionView: UICollectionView!
    
    @IBOutlet weak var BandCollectionView: UICollectionView!
    // 데이터 임의로 넣기
    
        private var NewList: [New] = []
        private var PageList: [Page] = []
        private var BandList : [Band] = []
     
    
    override func viewDidLoad() {
            super.viewDidLoad()
            
            addKeyboardObserver()
            searchText.delegate = self
            
            RoundBtn()

            setNewList()
            NewCollectionView.delegate = self
            NewCollectionView.dataSource = self
            
            setPageList()
            PageCollectionView.delegate = self
            PageCollectionView.dataSource = self
            
            setBandList()
            BandCollectionView.delegate = self
            BandCollectionView.dataSource = self
         
        }
        // 버튼 라운드 넣기
        func RoundBtn(){
             
             for btn in TopicButton{
                 
                 btn.layer.cornerRadius = 14
                 btn.layer.masksToBounds = true
             }
        
         }
        
        // 서버 통신X , collection view 데이터 리스트
    
    private func setNewList(){
            let new1 = New(imageName: "imgNewband", title: "남도의들꽃세상")
            let new2 = New(imageName: "imgNewband2", title: "자전거타기")
            let new3 = New(imageName: "imgNewband3", title: "국내, 해외 맛집모음")
            let new4 = New(imageName: "imgNewband4", title: "습관의일상")
            let new5 = New(imageName: "imgNewband5", title: "해외여행 정보나눔")
            let new6 = New(imageName: "imgNewband6", title: "나이키 직구")
    
            NewList = [new1, new2, new3, new4, new5, new6]
        }
        
        private func setPageList(){
            let page1 = Page(imageName: "imgPage", title: "반려동물가이드", subtitle: "동물 좋아하고 정보소통해요")
            let page2 = Page(imageName: "imgPage2", title: "육아휴직툰", subtitle: "육아휴직한 아빠의 일상을 그리고 있습니다.")
            let page3 = Page(imageName: "imgPage3", title: "1일1책 성장읽기", subtitle: "1일 1독, 매일한권의 책을 만나세요!")
            let page4 = Page(imageName: "imgPage4", title: "초보를 위한 포켓몬 공략집", subtitle: "포켓몬 공략 보고 포켓몬마스터 되자!")
            let page5 = Page(imageName: "imgPage5", title: "삐약삐약병아리", subtitle: "병아리 처음 키워보시는 분들 들어오세요")
            let page6 = Page(imageName: "imgPage6", title: "헬스정보나눔", subtitle: "모두 운동합시다")
            
    
            PageList = [page1, page2, page3, page4, page5, page6]
        }
        
        private func setBandList(){
            let band1 = Band(imageName: "btnRecommendimg", title: "강아지를 사랑하는 사람 모여라", number: "멤버 99,999", name: "neymar123")
            let band2 = Band(imageName: "btnRecommend2", title: "너네가 축구를 아니", number: "멤버 1,000", name: "슛 골")
            let band3 = Band(imageName: "btnRecommend3", title: "이케아 좋아", number: "멤버 7,777", name: "호호호")
    
            BandList = [band1, band2, band3]
        }
 
 
    }

/* 서버 파트 진행시
    extension SearchViewController:UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
        
        // 각각의 collection view별로 분기 처리
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            
            if collectionView == self.NewCollectionView{return 2}
            else if collectionView == self.PageCollectionView{return 3}
            
            return 1
        }
        
        
        func numberOfSections(in collectionView: UICollectionView) -> Int {
            if collectionView == self.NewCollectionView{return 3}
            else if collectionView == self.PageCollectionView{return 3}
            
            return 3
        }
        
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
          
            if collectionView == self.NewCollectionView{
             let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewCell.identifier, for: indexPath) as! NewCell
            return cell
            }
            
            else if collectionView == self.PageCollectionView{
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PageCell.identifier, for: indexPath) as! PageCell
                return cell
            }
                
            else {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BandCell.identifier, for: indexPath) as! BandCell
                return cell
            }
            
        }
            
            //UIcollectionViewCell 위치 정하기
            func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
                
                if collectionView == self.NewCollectionView{
                    return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 15)
                }
                
                else if collectionView == self.PageCollectionView{
                    return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 14)
                }
                
                else {
                    return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 20)
                }
            }
            
            func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt
            indexPath: IndexPath) -> CGSize {
                
                if collectionView == self.NewCollectionView{
                return CGSize(width: (collectionView.frame.width - 70) / 2, height: (collectionView.frame.height - 12)/2)
                }
                else if collectionView == self.PageCollectionView{
                   return CGSize(width: (collectionView.frame.width - 44), height: (collectionView.frame.height - 52)/3)
                }
                
                else{
                    return CGSize(width: (collectionView.frame.width - 120), height: (collectionView.frame.height))
                }
            }
        
        
    }
*/



    extension SearchViewController:UITextFieldDelegate {
        
        private func addKeyboardObserver() {
            
            NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
            NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        }
        
        private func closeKeyboardObserver(){
            
            NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
            NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        }
        
        @objc func keyboardWillShow(_ notification: Notification) {
            let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as! Double
            let curve = notification.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as! UInt
            UIView.animate(withDuration: duration, delay: 0, options: .init(rawValue: curve), animations: {
                self.searchText!.transform = .init(translationX: 0, y: 0)
            })
        }
        
        @objc func keyboardWillHide(_ notification: Notification) {
            let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as! Double
            let curve = notification.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as! UInt
            UIView.animate(withDuration: duration, delay: 0, options: .init(rawValue: curve), animations: {
                self.searchText!.transform = .identity
            })
        }
        
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            self.view.endEditing(true)
        }

    }



extension SearchViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case self.NewCollectionView: return 6
        case self.PageCollectionView: return 6
        default: return 3
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case self.NewCollectionView:
            guard let newCell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewCell", for: indexPath) as? NewCell else { return UICollectionViewCell() }
            
            newCell.setNewBandInfo(imageName: NewList[indexPath.row].image, name: NewList[indexPath.row].title)
            return newCell
            
        case self.PageCollectionView:
            guard let pageCell = collectionView.dequeueReusableCell(withReuseIdentifier: "PageCell", for: indexPath) as? PageCell else { return UICollectionViewCell() }
            
            pageCell.setPageInfo(imageName: PageList[indexPath.row].image, title: PageList[indexPath.row].title,subtitle: PageList[indexPath.row].subtitle)
            return pageCell
            
        default:
            guard let bandCell = collectionView.dequeueReusableCell(withReuseIdentifier: "BandCell", for: indexPath) as? BandCell else { return UICollectionViewCell() }
            bandCell.setBandInfo(imageName: BandList[indexPath.row].image, title: BandList[indexPath.row].title, number: BandList[indexPath.row].number, name: BandList[indexPath.row].name)
            return bandCell
        }
    }
    
    // CollectionView ContentInset 지정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        if collectionView == self.NewCollectionView{
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 15)
        }
        
        else if collectionView == self.PageCollectionView{
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 14)
        }
        
        else {
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 20)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt
    indexPath: IndexPath) -> CGSize {
        
        if collectionView == self.NewCollectionView{
        return CGSize(width: (collectionView.frame.width - 70) / 2, height: (collectionView.frame.height - 12)/2)
        }
        else if collectionView == self.PageCollectionView{
           return CGSize(width: (collectionView.frame.width - 44), height: (collectionView.frame.height - 52)/3)
        }
        
        else{
            return CGSize(width: (collectionView.frame.width - 120), height: (collectionView.frame.height))
        }
    }
}
