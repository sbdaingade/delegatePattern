//
//  CommentDelegate.swift
//  DelegatePatternExample
//
//  Created by Sachin Daingade on 06/07/22.
//

import Foundation

protocol CommentDelegate: AnyObject {
    func didAddedNewComnent(newComment: UserComments)
}
