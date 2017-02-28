//
//  main.swift
//  SeriesDownloader
//
//  Created by Silvan Mosberger on 27.02.17.
//    Copyright © 2017 Silvan Mosberger. All rights reserved.
//

import Foundation
import ScriptKit

final class MyScript : Script {
	func setUp(manager: Manager<MyScript>) {
		
	}
	
	func main(manager: Manager<MyScript>, index: Int32, group: DispatchGroup, context: Void?) {
		print("hi")
	}
	
	func tearDown(manager: Manager<MyScript>) {
		
	}
}

MyScript.run()
