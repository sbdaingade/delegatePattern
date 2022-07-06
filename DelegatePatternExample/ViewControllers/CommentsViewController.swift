//
//  CommentsViewController.swift
//  DelegatePatternExample
//
//  Created by Sachin Daingade on 06/07/22.
//

import UIKit

class CommentsViewController: UIViewController {
 
    @IBOutlet weak var txtTitle: UITextField!
    @IBOutlet weak var txtViewDescription: UITextView!
    
    weak var commentDelegate: CommentDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        tapGesture.cancelsTouchesInView = true
        view.addGestureRecognizer(tapGesture)
    }

    @objc func hideKeyboard() {
        view.endEditing(true)
    }
   
    @IBAction func AddNewComment(_ sender: Any) {
       
        guard let title = txtTitle.text, title != "" else {
               print("Title is empty")
               return
           }
        guard let desc = txtViewDescription.text, desc != "" else {
               print("Description is empty")
               return
           }
        
        commentDelegate?.didAddedNewComnent(newComment: UserComments(title: title, description: desc))
        dismiss(animated: true)
    }
    
    deinit {
        debugPrint("deinit Comments ViewController")
    }
}

extension CommentsViewController: UITextFieldDelegate {
    
    internal func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        for textField in self.view.subviews where textField is UITextField {
            textField.resignFirstResponder()
        }
        return true
    }
}
