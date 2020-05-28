//
//  MyPageViewController.swift
//  NaverBand_Design
//
//  Created by 김현기 on 2020/05/28.
//  Copyright © 2020 HyunKi Kim. All rights reserved.
//

import UIKit

class MyPageViewController: UIViewController {
    
    private var newTableInformations: [NewTableInformation] = []
    
    @IBOutlet weak var NewTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.NewTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        
        setnewTableInformations()
        NewTableView.dataSource = self
        NewTableView.delegate = self
        
        
        // Do any additional setup after loading the view.
    }
    
    private func setnewTableInformations(){
           
           let cell1 = NewTableInformation(image: .cell1, title: "순위로 보는 요즘 핫한 맛집과 카페", subtitle: "내마음속에 저장각!")
           let cell2 = NewTableInformation(image: .cell2, title: "바름이의 힐링되는 미소", subtitle: "귀엽고 깜찍한 무료 스티커가 잔뜩~")
           let cell3 = NewTableInformation(image: .cell3, title: "생일날은 케익은 필수", subtitle: "더 맛있는 부드러운 치즈케이크")
           
           newTableInformations = [cell1, cell2, cell3]
       }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension MyPageViewController: UITableViewDelegate, UITableViewDataSource{
    
    //section의 행의 개수 지정
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newTableInformations.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let NewTableCell = tableView.dequeueReusableCell(withIdentifier: NewTableCell.identifier, for:
            indexPath) as? NewTableCell else { return UITableViewCell() }
        NewTableCell.setnewTableInformations(ImageName:newTableInformations[indexPath.row].image.getImageName(),title: newTableInformations[indexPath.row].title, subtitle: newTableInformations[indexPath.row].subtitle)
        return NewTableCell }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {return 102 }
}
