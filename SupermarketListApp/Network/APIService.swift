//
//  ApiService.swift
//  SupermarketListApp
//
//  Created by Rodrigo Ventura on 15/05/23.
//

import Foundation

class ApiService {
    
    private var dataTask: URLSessionDataTask?
    
    func addNewUser(requestItems: CreateNewUserRequest, completion: @escaping ([String: Any]? ,Error?) -> Void) {
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

    func loginUser(requestItems: AuthLoginRequest, completion: @escaping (Result<AuthLoginResponse, Error>) -> Void) {
        let baseURL = "\(Endpoints.baseURL.rawValue)\(Endpoints.loginUser.rawValue)"
        guard let url = URL(string: baseURL) else { return }
        var request = URLRequest(url: url)
        let parameters = ["email": requestItems.email, "password": requestItems.password]
        
        do  {
            let bodyData = try JSONSerialization.data(withJSONObject: parameters, options: [])
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpMethod = "POST"
            request.httpBody = bodyData
        } catch let error {
            print(error.localizedDescription)
            completion(.failure(error))
        }
        
        dataTask = URLSession.shared.dataTask(with: request, completionHandler: { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard response is HTTPURLResponse else { return print("Empty Response")  }
            guard let data = data else { return print("Empty Data")  }

            DispatchQueue.main.async {
                do {
                    let data = try JSONDecoder().decode(AuthLoginResponse.self, from: data)
                    Helper.shared.authToken = data.authToken
//                    try KeyChainManager.saveToKeyChain(authToken: data.authToken)
                    completion(.success(data))
                    
                } catch let error {
                    print(error)
                    completion(.failure(error))
                }
            }
        })
        dataTask?.resume()
    }
    
    func getCategories(completion: @escaping (Result<[ListCategoriesModel], Error>) -> Void) {
        let baseURL = "\(Endpoints.baseURL.rawValue)\(Endpoints.listCategories.rawValue)"
        guard let url = URL(string: baseURL) else { return }
        var request = URLRequest(url: url)
        do {
            request.setValue("application/json", forHTTPHeaderField: "accept")
            request.setValue( "Bearer \(Helper.shared.authToken)", forHTTPHeaderField: "Authorization")
        } catch let error {
            completion(.failure(error))
        }
        
        dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
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
        
        DispatchQueue.main.async {
            do  {
                let bodyData = try JSONSerialization.data(withJSONObject: parameters, options: [])
                request.setValue("application/json", forHTTPHeaderField: "accept")
                request.setValue( "Bearer \(Helper.shared.authToken)", forHTTPHeaderField: "Authorization")
                request.httpMethod = "GET"
                request.httpBody = bodyData
            } catch let error {
                print(error.localizedDescription)
                completion(.failure(error))
            }
        }
        
        dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
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
    
    func addNewList(userID: Int, nameList: String, completion: @escaping (Result<String, Error>) -> Void) {
        
//        Helper.shared.itemsAdded.forEach({ name in
//            itemName = name.itemTitle
//            
//            name.itemDetal?.forEach { detail in
//                itemBrand = detail.itemBrand ?? ""
//                itemPrice = detail.itemPrice ?? 0
//                itemQuantitity = detail.itemQuantitity ?? 0
//                itemType = detail.itemType ?? ""
//            }
//        })
        
        let baseURL = "\(Endpoints.baseURL.rawValue)\(Endpoints.saveList.rawValue)"
        guard let url = URL(string: baseURL) else { return }
        var request = URLRequest(url: url)
        let parameters: [String : Any] = ["user_id": userID,
                                          "nameList": nameList,
                                          "itemsList":  Helper.shared.itemsAdded.map({ item in
                                                        [
                                                        "itemTitle": item.itemTitle,
                                                        "itemDetail": ""
                                                        ]})]
        DispatchQueue.main.async {
            do  {
                let bodyData = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
                
                request.httpBody = bodyData
                request.httpMethod = "POST"
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                request.setValue("application/json", forHTTPHeaderField: "Accept")
                request.setValue( "Bearer \(Helper.shared.authToken)", forHTTPHeaderField: "Authorization")
                
                self.dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
                    if let error = error {
                        completion(.failure(error))
                        print("DataTask error \(error.localizedDescription)")
                        return
                    }
                    
                    guard let data = data else { return }
                    DispatchQueue.main.async {
                    do {
                        let json = try JSONDecoder().decode(String.self, from: data)
                        completion(.success(json))
                    } catch let error {
                        print(error)
                        completion(.failure(error))
                    }
                }
                }
                self.dataTask?.resume()
            } catch let error {
                print(error.localizedDescription)
                completion(.failure(error))
            }
        }
    }
}
