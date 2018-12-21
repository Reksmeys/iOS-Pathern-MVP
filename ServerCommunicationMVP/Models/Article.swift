
import Foundation
import ObjectMapper

class Article: Mappable{
    var title: String?
    var des: String?
    
    init(){
        
    }
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        title   <- map["TITLE"]
        des     <- map["DESCRIPTION"]
    }
    
   
}
