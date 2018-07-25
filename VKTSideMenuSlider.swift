//  MenuViewController.swift
//  MenuSlider
//  Created by vivek on 7/25/18.
//

import UIKit

protocol SlideMenuDelegate: class {
    func dismissMenuView()
}

class MenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //MARK:- Variables
    
    weak var delegate:SlideMenuDelegate?
    
    //MARK:- Outlets
     @IBOutlet weak var menuTableView: UITableView!

    //MARK:- Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Registering cell
        menuTableView.register(MenuTableViewCell.nib, forCellReuseIdentifier: MenuTableViewCell.reuseIdentifier)
        
        menuTableView.estimatedRowHeight = 100
        menuTableView.rowHeight = UITableViewAutomaticDimension
        
        //registering for notification
        NotificationCenter.default.addObserver(self, selector: #selector(dismissNotificationReceived), name: NSNotification.Name("DismissMenuView"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(notificationReceived), name: NSNotification.Name("PresentMenuView"), object: nil)
    }
    
    //removing notification observer
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    //method to be called when notification is received
    @objc func notificationReceived() {

        self.view.alpha = 1.0
        let transition = CATransition()
        transition.duration = 0.35
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromLeft
        transition.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseInEaseOut)
        self.view.layer.add(transition, forKey: kCATransition)
    }
    
    @objc func dismissNotificationReceived()  {
        self.methodToDismissMenuViewController()
    }

    //MARK:- Button Action
    
    @IBAction func onCloseMenuClick(_ button:UIButton!){
        self.methodToDismissMenuViewController()
        self.delegate?.dismissMenuView()
    }
    
    //MARK:- Tableview DataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MenuTableViewCell.reuseIdentifier, for: indexPath) as! MenuTableViewCell
        cell.configCell(indexNumber: indexPath.row)
        return cell
    }
    
    
    func methodToDismissMenuViewController() {
        
        let transition = CATransition()
        transition.duration = 0.35
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromRight
        transition.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseInEaseOut)
        self.view.layer.add(transition, forKey: kCATransition)
        self.view.alpha = 0.0
    }
}
