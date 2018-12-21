
import Foundation
import Alamofire

protocol ArticleServiceProtocol {
    func didResponseArticle(article: [Article])
    func didResponseMessage(msg: String)
}

class ArticleService{
    var delegate: ArticleServiceProtocol?
    
    var article_get_url = "http://ams.chhaileng.com:8080/v1/api/articles"
    let header = [
        "Authorization": "Basic QU1TQVBJQURNSU46QU1TQVBJUEBTU1dPUkQ=",
        "Accept": "application/json",
        "Content-Type": "application/json"
    ]
    
    
    func getArticle(withPage: Int, withLimitation: Int){
        
        var article =  [Article]()
        
        Alamofire.request("\(article_get_url)?page=\(withPage)&limit=\(withLimitation)", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: header).responseJSON { (response) in
            if response.result.isSuccess {
                
                if let json = try? JSONSerialization.jsonObject(with: response.data!, options: .allowFragments) as! [String: Any]{
                    let object = json["DATA"] as! NSArray
                    for obj in object{
                        article.append(Article(JSON: obj as! [String:Any])!)
                    }
                    self.delegate?.didResponseArticle(article: article)
                    
                    
                }
                
            }else{
                
            }
        }
        
    }
    
    func addArticle(article: Article){
        let newData = [
            "TITLE": article.title,
            "DESCRIPTION": article.des
            
        ]
        
        Alamofire.request(article_get_url, method: .post, parameters: newData, encoding: JSONEncoding.default, headers: header).responseJSON { (response) in
            if response.result.isSuccess{
                print("success add in service")
                self.delegate?.didResponseMessage(msg: "Add Success")
            }else{
                print("slow internet")
            }
        }
    }
}
