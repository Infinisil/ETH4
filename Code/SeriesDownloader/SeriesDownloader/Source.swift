//
//  Source.swift
//  SeriesDownloader
//
//  Created by Silvan Mosberger on 03.03.17.
//    Copyright © 2017 Silvan Mosberger. All rights reserved.
//

import Foundation

typealias XPath = String

struct Source {
	let name: String
	let url: URL
	let xPaths: [(String, XPath)]
}


