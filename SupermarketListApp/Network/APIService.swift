//
//  ApiService.swift
//  SupermarketListApp
//
//  Created by Rodrigo Ventura on 15/05/23.
//

import Foundation

class ApiService {
    
    private var dataTask: URLSessionDataTask?
    
    func createNewUser(requestItems: CreateNewUserRequest, completion: @escaping ([String: Any]? ,Error?) -> Void) {
        let baseURL = "\(Endpoints.baseURL.rawValue)\(Endpoints.createUser.rawValue)"
        guard let url = URL(string: baseURL) else { return }
        let session = URLSession.shared
        var request = URLRequest(url: url)
        let parameters = ["name": requestItems.name, "email": requestItems.email, "password": requestItems.password]
        
        do  {
            let bodyData = try JSONSerialization.data(withJSONObject: parameters, options: [])
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpMethod = "POST"
            request.httpBody = bodyData
        } catch let error {
            print(error.localizedDescription)
            completion(nil, error)
        }
        
        let task = session.dataTask(with: request, completionHandler: { data, response, error in
            guard error == nil else {
                completion(nil, error)
                return
            }
            
            guard let data = data else { return }
            DispatchQueue.main.async {
                do {
                    guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else { return }
                    completion(json, nil)
                } catch let error {
                    print(error.localizedDescription)
                    completion(nil, error)
                }
            }
        })
        task.resume()
    }
    
    func loginUser(requestItems: AuthLoginRequest, completion: @escaping ([String: Any]?, Error?) -> Void) {
        let baseURL = "\(Endpoints.baseURL.rawValue)\(Endpoints.loginUser.rawValue)"
        guard let url = URL(string: baseURL) else { return }
        let session = URLSession.shared
        var request = URLRequest(url: url)
        let parameters = ["email": requestItems.email, "password": requestItems.password]
        
        do  {
            let bodyData = try JSONSerialization.data(withJSONObject: parameters, options: [])
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpMethod = "POST"
            request.httpBody = bodyData
        } catch let error {
            print(error.localizedDescription)
            completion(nil, error)
        }
        
        let task = session.dataTask(with: request, completionHandler: { data, response, error in
            guard error == nil else {
                completion(nil, error)
                return
            }
            
            guard let data = data else { return }
            DispatchQueue.main.async {
                do {
                    guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else { return }
                    completion(json, nil)
                } catch let error {
                    print(error.localizedDescription)
                    completion(nil, error)
                }
            }
        })
        task.resume()
    }
    
    func getCategories(completion: @escaping (Result<[ListCategoriesModel], Error>) -> Void) {
        let baseURL = "\(Endpoints.baseURL.rawValue)\(Endpoints.listCategories.rawValue)"
        guard let url = URL(string: baseURL) else { return }
        dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                print("DataTask error \(error.localizedDescription)")
                return
            }
            guard response is HTTPURLResponse else { return print("Empty Response")  }
            guard let data = data else { return print("Empty Data")  }
            
            DispatchQueue.main.async {
                do {
                    let data = try JSONDecoder().decode([ListCategoriesModel].self, from: data)
                    completion(.success(data))
                } catch let error {
                    completion(.failure(error))
                }
            }
        }
        dataTask?.resume()
    }
    
    func getItemsCategory(categoryID: Int, completion: @escaping (Result<ListItemCategory, Error>) -> Void) {
        let baseURL = "\(Endpoints.baseURL.rawValue)\(Endpoints.listItemsByCategoryID.rawValue)\(categoryID)"
        guard let url = URL(string: baseURL) else { return }
        let parameters = ["categories_id": categoryID]
        var request = URLRequest(url: url)
        
        do  {
            let bodyData = try JSONSerialization.data(withJSONObject: parameters, options: [])
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpMethod = "GET"
            request.httpBody = bodyData
        } catch let error {
            print(error.localizedDescription)
            completion(.failure(error))
        }
        
        dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                print("DataTask error \(error.localizedDescription)")
                return
            }
            guard response is HTTPURLResponse else { return print("Empty Response")  }
            guard let data = data else { return print("Empty Data")  }
            DispatchQueue.main.async {
                do {
                    guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? ListItemCategory else { return }
                    completion(.success(json))
                    
                } catch let error {
                    completion(.failure(error))
                }
            }
            
            DispatchQueue.main.async {
                do {
                    let data = try JSONDecoder().decode(ListItemCategory.self, from: data)
                    completion(.success(data))
                    
                } catch let error {
                    completion(.failure(error))
                }
            }
        }
        dataTask?.resume()
    }
    
    func saveList(listData: [SaveListRequest], completion: @escaping ([SaveListRequest]? ,Error?) -> Void) {
        let baseURL = "\(Endpoints.baseURL.rawValue)\(Endpoints.saveList.rawValue)"
        guard let url = URL(string: baseURL) else { return }
        
        var listDataCreate: SaveListRequest?
        var userID = Int()
        var nameList = String()
        var itemTitle = (String)()
        var itemBrand = String()
        var itemPrice = Double()
        var itemQuantitity = Double()
        var itemType = String()
        
        
        listData.forEach { item in
            Helper.shared.itemsAdded.forEach { itemList in
                itemList.itemDetal?.forEach { detailIte  in
                    listDataCreate = (SaveListRequest(userID: item.userID,
                                                          nameList: item.nameList,
                                                          itemsList: [ItemsList(itemTitle: itemList.itemTitle,
                                                                                itemDetal: [ItemDetail(itemBrand: detailIte.itemBrand,
                                                                                                       itemPrice: detailIte.itemPrice,
                                                                                                       itemQuantitity: detailIte.itemQuantitity,
                                                                                                       itemType: detailIte.itemType)])]))
                    print("PRECO: \(detailIte.itemPrice ?? 55.0)")
                }}}
    
    print("LISTDATACREATE: \(listDataCreate)")
    print("HELPER: \(Helper.shared.itemsAdded)")
    print("LISTDATA: \(listData)")
    
    guard let jsonData = try? JSONEncoder().encode(listDataCreate) else {
        print("Error: Trying to convert model to JSON data")
        return
    }
    
    print("JSONDATA: \(jsonData)")
    
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.setValue("application/json", forHTTPHeaderField: "Accept")
    request.httpBody = jsonData
    
    let session = URLSession.shared
    
    let task = session.dataTask(with: request, completionHandler: { data, response, error in
        if let error = error {
            completion(nil,error)
            print("DataTask error \(error.localizedDescription)")
            return
        }
        
        guard let data = data else { return }
        
        DispatchQueue.main.async {
            do {
                let jsonObject = try JSONDecoder().decode([SaveListRequest].self, from: data)
                
                print("JSONOBJECT: \(jsonObject)")
                guard let prettyJsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted) else {
                    print("Error: Cannot convert JSON object to Pretty JSON data")
                    return
                }
                guard let prettyPrintedJson = String(data: prettyJsonData, encoding: .utf8) else {
                    print("Error: Couldn't print JSON in String")
                    return
                }
                completion(jsonObject, nil)
                
            } catch let error {
                completion(nil,error)
            }
        }
    })
    task.resume()
}




































//    func saveList(userID: Int, nameList: String, itemDetail: [String], completion: @escaping ([String: Any]? ,Error?) -> Void) {
//        let baseURL = "\(Endpoints.baseURL.rawValue)\(Endpoints.saveList.rawValue)"
//        guard let url = URL(string: baseURL) else { return }
//        let session = URLSession.shared
//        var request = URLRequest(url: url)
//        let parameters: [String : Any] = ["user_id": userID,
//                                          "nameList": nameList,
//                                          "itemsList": [
//                                            ["itemTitle": itemDetail]
//                                          ]]
//        print("PARA: \(parameters)")
//        let check = JSONSerialization.isValidJSONObject(parameters)
//        print("CHECK: \(check)")
//
//        do  {
//            let bodyData = try JSONSerialization.data(withJSONObject: parameters, options: [])
//            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//            request.httpMethod = "POST"
//            request.httpBody = bodyData
//        } catch let error {
//            print(error.localizedDescription)
//            completion(nil, error)
//        }
//
//        let task = session.dataTask(with: request, completionHandler: { data, response, error in
//            if let error = error {
//                completion(nil,error)
//                print("DataTask error \(error.localizedDescription)")
//                return
//            }
//
//            guard let data = data else { return }
//                        DispatchQueue.main.async {
//                do {
//                    guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else { return }
//                    completion(json, nil)
//
//                } catch let error {
//                    completion(nil,error)
//                }
//            }
//            print(data)
//        })
//        task.resume()
//    }
}
