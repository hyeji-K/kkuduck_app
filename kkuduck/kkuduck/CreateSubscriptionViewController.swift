//
//  CreateSubscriptionViewController.swift
//  kkuduck
//
//  Created by minimani on 2021/10/26.
//

import UIKit
import SDWebImage


class CreateSubscriptionViewController: UIViewController {
    
    
    var subService: NSArray?
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // NAVIGATION bar custom
        navigationController?.isNavigationBarHidden = true
        navigationController?.navigationBar.barTintColor = UIColor(hex: "#FDAC53ff")
        navigationController?.navigationBar.shadowImage = UIImage()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        // 기존에 있는 SubService 목록을 가지고 나열해줌 (읽기전용)
        if let path = Bundle.main.path(forResource: "subservice", ofType: "plist") {
            self.subService = NSArray(contentsOfFile: path)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = false
    }
    

//
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//
//
//    }
    

}

extension CreateSubscriptionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "subCell", for: indexPath) as? CustomCollectionViewCell else {return UICollectionViewCell()}
        
        // cell round 조정
        cell.contentView.layer.cornerRadius = 15
        cell.contentView.layer.borderWidth = 1
        cell.contentView.layer.borderColor = UIColor.clear.cgColor
        cell.contentView.layer.masksToBounds = true

        // cell shadow 추가
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOffset = CGSize(width: 1, height: 2)
        cell.layer.shadowRadius = 10
        cell.layer.shadowOpacity = 0.2
        cell.layer.masksToBounds = false
        
        
        // 데이터 뿌려주기
        guard let subService = self.subService,
              let item = subService[indexPath.row] as? [String:Any]
        else { return cell }
        
        cell.lblSubTitle.text = item["subName"] as? String
//        imageView.sd_setImage(with: URL(string: "http://www.domain.com/path/to/image.jpg"), placeholderImage: UIImage(named: "placeholder.png"))
        guard let thumImage = item["img"] as? String else {return cell}
        cell.imageSubThum.sd_setImage(with: URL(string: thumImage), placeholderImage: UIImage(named: "placeholder.png"))
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        switch indexPath.row {
        case 11:
            guard let homeVC = self.storyboard?.instantiateViewController(withIdentifier: "moreInfoNew") as? MoreInfoNewViewController else { return }
              self.navigationController?.pushViewController(homeVC, animated: true)
        default:
            guard let homeVC = self.storyboard?.instantiateViewController(identifier: "moreInfoService") as? MoreInfoServiceViewController,
                  let subService = subService
            else { return }
            let subInfo = subService[indexPath.row] as? [String:Any]
            homeVC.subInfo = subInfo
            self.navigationController?.pushViewController(homeVC, animated: true)
      
            
            
        }
    }
    
    func protocolData(dataSent: [String:Any]) {
    
    }

}
