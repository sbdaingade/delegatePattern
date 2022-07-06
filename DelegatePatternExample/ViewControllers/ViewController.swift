//
//  ViewController.swift
//  DelegatePatternExample
//
//  Created by Sachin Daingade on 06/07/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var commentsTableView: UITableView!
    
    private var arrayOfComments = [UserComments]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func AddNewCommentAction(_ sender: Any) {
        
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "CommentsViewController") as! CommentsViewController
        vc.commentDelegate = self
        self.present(vc, animated: true, completion: nil)
    }
}

extension ViewController: UITableViewDataSource, CommentDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfComments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let comment = arrayOfComments[indexPath.row] as UserComments
        cell.textLabel?.text = "\(comment.title)"
        cell.detailTextLabel?.text = "\(comment.description)"
        return cell
    }
    //MARK: did Added New Comnent
    func didAddedNewComnent(newComment: UserComments) {
        debugPrint(newComment)
        arrayOfComments.append(newComment)
        DispatchQueue.main.async { [unowned self] in
            self.commentsTableView.reloadData()
        }
    }

}

