//
//  String+Extension.swift
//  To Do List
//
//  Created by  Apple24 on 08/02/2019.
//  Copyright © 2019  Apple24. All rights reserved.
//

extension String {
    var  name: String {
        return components(separatedBy: "/").last ?? ""
    }
}
