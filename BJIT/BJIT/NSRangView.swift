//
//  NSRangView.swift
//  BJIT
//
//  Created by Md Zahidul Islam Mazumder on 20/12/22.
//

import SwiftUI

struct NSRangView: View {
    
    let title = "A Swift Blog"
    
    @State var att = ""
    
    var body: some View {
        VStack {
            Text(title)
            Text(att)
        }
        .onAppear {
            let range = title.range(of: "log")!
            let convertedRange = NSRange(range, in: title)
            let attributedString = NSMutableAttributedString(string: title)
            attributedString.setAttributes([NSAttributedString.Key.foregroundColor: UIColor.orange], range: convertedRange)
            print(attributedString)
            
            att = "\(attributedString)"
        }
    }
}

struct NSRangView_Previews: PreviewProvider {
    static var previews: some View {
        NSRangView()
    }
}
