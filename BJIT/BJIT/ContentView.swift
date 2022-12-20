//
//  ContentView.swift
//  BJIT
//
//  Created by Md Zahidul Islam Mazumder on 19/12/22.
//

import SwiftUI
import UIKit

struct ContentView: View {
    
    let imgUrl = Bundle.main.url(forResource: "abc", withExtension: "png")
    
    var body: some View {
        //SpotlightView()
        VStack {
            Image(uiImage: UIImage(contentsOfFile: imgUrl!.path)!)
            NSRangView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
