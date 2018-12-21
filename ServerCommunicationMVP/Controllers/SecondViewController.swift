
import UIKit

class SecondViewController: UIViewController, ArticlePresenterProtocol {
   
    var articlePresenter: ArticlePresenter?
    var article: [Article]?
    
    
    
    @IBOutlet weak var descTextField: UITextField!
    @IBOutlet weak var titleTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        articlePresenter = ArticlePresenter()
        articlePresenter?.delegate = self
       
    }
    
    
    @IBAction func didSave(_ sender: Any) {
        var article = Article()
        
        article.title = titleTextField.text
        article.des = descTextField.text
        
        articlePresenter?.addArticle(article: article)
        
        self.navigationController?.popViewController(animated: true)
        
    
        
    }
    
    func didResponseArticle(article: [Article]) {
        
    }
    
    func didResponseMessage(msg: String) {
        print("add success")
    }
    

   
}
