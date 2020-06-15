//
//  FriendCell.swift
//  iOS_ThirdWeek_Assignment
//
//  Created by 김현기 on 2020/05/13.
//  Copyright © 2020 HyunKi Kim. All rights reserved.
//

import UIKit

//프로토콜 선언
protocol ButtonDelegate {
    func onClickCellButton(in index: Int)
}




class FriendCell: UITableViewCell {
    static let identifier: String = "FriendCell"
    
    @IBOutlet weak var faceImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    @IBOutlet weak var profileImage: UIButton!
    
    //버튼 액션을 대신 처리해줄 객체를 delegate에 넣는다
    var delegate: ButtonDelegate?
    var indexPath: IndexPath?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func setProfile(_ sender: Any) {
        delegate?.onClickCellButton(in: indexPath!.row)
    }
    
    
    func setFriendInformation(faceImageName: String, name: String, status: String){
        
       
        nameLabel.text = name
        statusLabel.text = status
        
        
        if faceImageName == "9573886432601742940168682793295078318145536N" {
            faceImageView.image = UIImage(named: faceImageName)
            //faceImageView.frame.size.height = 60
            //faceImageView.frame.size.width = 60
        }
        else  {
            faceImageView.image = UIImage(named: faceImageName)
            //faceImageView.frame.size.height = 50
            //faceImageView.frame.size.width = 50
        }
        
        
    }

}
