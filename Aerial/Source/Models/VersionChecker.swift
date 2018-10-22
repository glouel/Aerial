//
//  VersionChecker.swift
//  Aerial
//
//  Created by Guillaume Louel on 22/10/2018.
//  Copyright © 2018 John Coates. All rights reserved.
//

import Cocoa

class VersionChecker: NSObject, XMLParserDelegate {
    static let sharedInstance = VersionChecker()
    
    func onlineCheck() {
        
        let url = URL(string: "https://github.com/JohnCoates/Aerial/releases.atom")
        
        if #available(OSX 10.10, *) {
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: url!) {
                    let parser = XMLParser(data:data)
                    parser.delegate = self
                    parser.shouldProcessNamespaces = false
                    parser.shouldReportNamespacePrefixes = false
                    parser.shouldResolveExternalEntities = false
                    parser.parse()
 
                
                }

            }
        } else {
            // Fallback on earlier versions
        }
    }

    // MARK: - 
    private func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {

        // instantiate feed properties
        if elementName == "entry" {
            print("entry")
        }
    }
}
