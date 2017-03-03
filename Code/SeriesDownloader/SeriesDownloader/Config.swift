//
//  Config.swift
//  SeriesDownloader
//
//  Created by Silvan Mosberger on 03.03.17.
//    Copyright © 2017 Silvan Mosberger. All rights reserved.
//

import Foundation

protocol Config {
	var sources: [Source] { get }
}

struct HardCodedConfig : Config {
	let sources: [Source] = [
		Source(name: <#T##String#>, url: <#T##URL#>, xPaths: <#T##[(String, XPath)]#>)
		//Source(name: <#T##String#>, url: <#T##URL#>, xPaths: <#T##[(String, XPath)]#>)
	]
}
