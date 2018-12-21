
import Foundation

protocol ArticlePresenterProtocol {
    func didResponseArticle(article: [Article])
    func didResponseMessage(msg: String)
}

class ArticlePresenter: ArticleServiceProtocol {
    
    var delegate: ArticlePresenterProtocol?
    var articleService: ArticleService?
    
    init(){
        self.articleService = ArticleService()
        self.articleService?.delegate = self
    }
    
    func getArticle(withPage: Int, withLimitation: Int){
        self.articleService?.getArticle(withPage: withPage, withLimitation: withLimitation)
    }
    
    func addArticle(article: Article){
        self.articleService?.addArticle(article: article)
    }
    
    
    func didResponseArticle(article: [Article]) {
        self.delegate?.didResponseArticle(article: article)
    }
    
    func didResponseMessage(msg: String) {
        self.delegate?.didResponseMessage(msg: msg)
    }
    
    
}
