//
//  ApiService.swift
//  SupermarketListApp
//
//  Created by Rodrigo Ventura on 15/05/23.
//

import Foundation

class ApiService {
    
    private var dataTask: URLSessionDataTask?
    
    //MARK: APIs Auth
    func addNewUser(requestItems: CreateNewUserRequest, completion: @escaping ([String: Any]? ,Error?) -> Void) {
        let baseURL = "\(Endpoints.baseURL.rawValue)\(Endpoints.addUser.rawValue)"
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
                    Helper.shared.userID = data.user.id
                    completion(.success(data))
                    
                } catch let error {
                    completion(.failure(error))
                }
            }
        })
        dataTask?.resume()
    }
    
    //MARK: APIs Categories
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
    
    //MARK: APIs List
    
    func addNewList(nameList: String, completion: @escaping (Result<String, Error>) -> Void) {
        let baseURL = "\(Endpoints.baseURL.rawValue)\(Endpoints.addList.rawValue)"
        guard let url = URL(string: baseURL) else { return }
        var request = URLRequest(url: url)
        let parameters: [String : Any] = ["user_id": Helper.shared.userID,
                                          "nameList": nameList,
                                          "itemsList":  Helper.shared.itemsAdded.map({ item in
                                            [
                                                "itemTitle": item.itemTitle,
                                                "itemDetail": [
                                                    "itemBrand": item.itemDetal?.itemBrand ?? "",
                                                    "itemPrice": item.itemDetal?.itemPrice ?? 0.0,
                                                    "itemQuantitity": item.itemDetal?.itemQuantitity ?? 0,
                                                    "itemType": item.itemDetal?.itemType ?? ""
                                                ]]})]
        DispatchQueue.main.async {
            do  {
                let bodyData = try JSONSerialization.data(withJSONObject: parameters, options: [])
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
                            completion(.failure(error))
                        }
                    }
                }
                self.dataTask?.resume()
            } catch let error {
                completion(.failure(error))
            }
        }
    }
    
    func getCreatedLists(userID: Int, completion: @escaping(Result<[SaveListResponse], Error>) -> Void) {
        let baseURL = "\(Endpoints.baseURL.rawValue)\(Endpoints.getCreatedList.rawValue)\(userID)"
        guard let url = URL(string: baseURL) else { return }
        let parameters = ["user_id": 23]
        var request = URLRequest(url: url)
        
        DispatchQueue.main.async {
            do  {
                let bodyData = try JSONSerialization.data(withJSONObject: parameters, options: [])
                request.setValue("application/json", forHTTPHeaderField: "accept")
                request.setValue( "Bearer \(Helper.shared.authToken)", forHTTPHeaderField: "Authorization")
                request.httpMethod = "GET"
                request.httpBody = bodyData
            } catch let error {
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
                    let data = try JSONDecoder().decode([SaveListResponse].self, from: data)
                    completion(.success(data))                    
                } catch let error {
                    completion(.failure(error))
                }
            }
        }
        dataTask?.resume()
    }
}
