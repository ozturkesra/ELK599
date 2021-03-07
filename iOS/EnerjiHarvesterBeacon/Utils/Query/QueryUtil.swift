//
//  QueryUtil.swift
//  Maksmart
//
//  Created by Esra ÖZTÜRK on 18.06.2019.
//  Copyright © 2019 Esra ÖZTÜRK. All rights reserved.
//

import Foundation

public class QueryUtil {
    
    static func queryStringInserter(to field:String) ->  String{
       return String(format:"\"%@" + "\"" , field)
    }
    
    
}
