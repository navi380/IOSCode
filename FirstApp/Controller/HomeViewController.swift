//
//  HomeViewController.swift
//  FirstApp
//
//  Created by Navi on 7/23/21.
//

import UIKit
class HomeViewController: UIViewController {
  
    @IBOutlet weak var postTableView: UITableView!
   
    var postData = [Postmodel]()


    //first way of simple di with mvc for injection
    //    private var data: postApiProtocol?
    //    func setService(data: postApiProtocol){
    //        self.data = data
    //    }
//    let postApiService1 = postApiService.shared
//
//    var postApiCall: PostAPi?
    
    
    //second way of doing using mvvm
    var  postdataViewModel = Injection.provide.postApiProtocolUsingVideo()
    
//    var networkManager = Injection.provide.postApiProtocolUsingVideo()
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//            if segue.identifier == "formSegue" {
//                guard let detailViewController = segue.destination as? DetailViewController else{ return }
//                detailViewController.postData = tableview
//
//            }
//            }
//
    
    override func viewDidLoad() {
        super.viewDidLoad()
        postdataViewModel.getPostListData { posts in
            self.postData = posts
            DispatchQueue.main.async {
                self.postTableView.reloadData()
            }
        }
        
        //second way of doing using mvvm
//        postdataViewModel.vc = self
//        postdataViewModel.callin()
        //        setService(data: postApiService1)
        navigationItem.setHidesBackButton(true, animated: false)
        configureItems()
        
        //        data?.getPostList { posts in
        //            self.postData = posts
                    
        //        }
        
        
        //calling the initapicall function
//        initApiCall()
        
    }
    
    
    
//    //first way of mvvm with di
//    func initApiCall(){
//        //observer k sath ka code with di
//                networkManager.posts.observe = { posts in
//                    self.postData = posts
//                    DispatchQueue.main.async {
//                        self.postTableView.reloadData()
//                    }
//                }
//                networkManager.getPostList()
//    }
//
    
    
    @objc func logout(){
        UserDefaults.standard.setLoggedIn(value: false)
//                navigationController?.popToRootViewController(animated: true)
                let rootVc =  self.storyboard?.instantiateViewController(withIdentifier: "startNav") as! UINavigationController
                (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(rootVc)
    }
    
    
    
    private func configureItems(){
        navigationController?.navigationBar.tintColor = .label
        self.navigationItem.rightBarButtonItems = [
            //                       UIBarButtonItem(
            //                            barButtonSystemItem: .add, target: self, action: nil
            //                        ),
            UIBarButtonItem(image: UIImage(systemName: "gear"), style: .done, target: self, action: #selector(logout))
        ]
        
        //        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
        //            barButtonSystemItem: .add, target: self, action: nil
        //        )
        //        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gear"), style: .done, target: self, action: nil)
    }
}

extension HomeViewController :  UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        postData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.assignData = postData[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       let vc = storyboard?.instantiateViewController(identifier: "DetailViewController") as! DetailViewController
        vc.postData = postData[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}
