//
//  ApiViewController.swift
//  AssessmentDay2
//
//  Created by P090MMCTSE008 on 18/10/23.
//

import UIKit
import Alamofire
private let registerCell="RegisterCell"
class ApiViewController: UIViewController {
    @IBOutlet weak var apiTableView: UITableView!
    
    // let dataRegister = Register(
    //     name: "John",
    //     age: 24,
    //     salary:"1231231231"
        
    // )
    
    // let registerTypeOrder = [
    //     RegisterType.name,
    //     RegisterType.age,
    //     RegisterType.salary
    //     ]
    
    var apiReturn = [dataHandler]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // apiTableView.register(
        //     UINib(
        //         nibName: "TableViewCell",
        //         bundle: nil
        // ),
        // forCellReuseIdentifier: registerCell
        // )
        AF.request("https://dummy.restapiexample.com/api/v1/employees").response{
            response in
            switch response.status {
            case .success(let data):
                do{
                    print("masuk DO")
                    self.apiReturn = try JSONDecoder().decode([dataHandler].self, from: data!)
                    print("dapet return api")
                    print(self.apiReturn)
                    DispatchQueue.main.async {
                        self.apiTableView.reloadData()
                    }

                }catch{
                    print("error in catch")
                }               
            default:
            print("error fetching api")
                
            }            
            debugPrint(response)
        }
        
        // Do any additional setup after loading the view.
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


extension ApiViewController:UITableViewDataSource,
                         UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return apiReturn.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =
        apiTableView.dequeueReusableCell(withIdentifier: registerCell,for: indexPath) as! TableViewCell
//        for each loop isi dengan return dari api
        let res = apiReturn[indexPath.row] 
        cell.nameText.text = res.employee_name
        cell.ageText.text = res.employee_age
        cell.salaryText.text = res.employee_salary
        
//        let cellData: [(RegisterType, String)] = [
//            (registerTypeOrder[0],dataRegister.name),
//            (registerTypeOrder[1],String(dataRegister.age)),
//            (registerTypeOrder[2],dataRegister.salary)
//            ]
//        cell.setValue(type: cellData[indexPath.row].0, value: cellData[indexPath.row].1)
//        cell.setValue(type: cellData[indexPath.row].0, value: cellData[indexPath.row].1)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    
}
