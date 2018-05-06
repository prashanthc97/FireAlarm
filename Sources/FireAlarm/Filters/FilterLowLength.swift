//
//  FilterLowLength.swift
//  FireAlarm
//
//  Created by Ashish Ahuja on 06/05/18.
//

import Foundation
import SwiftStack
import SwiftChatSE
import Dispatch

class FilterLowLength: Filter {
    required init(reporter: Reporter) {}
    
    func check(_ post: Post, site: Site) -> FilterResult? {
        //Filter weight; increase this is the filter is very accurate, decrease otherwise. Will get subtracted from Naive Bayes difference.
        var reasonWeight = 0
        
        if post.body!.count < 100 {
            reasonWeight = 10
        } else if post.body!.count < 150 {
            reasonWeight = 5
        }
        
        if reasonWeight > 0 {
            let header = "Low length"
            let details = header + " (weight \(reasonWeight))"
            return FilterResult (
                type: .customFilterWithWeight(filter: self, weight: reasonWeight),
                header: header,
                details: details
            )
        } else {
            return nil
        }
    }
    
    func save() throws {}
}
