//
//  ContentView.swift
//  CollectionViewMacOS
//
//  Created by Leo Dion on 6/24/20.
//  Copyright © 2020 BrightDigit. All rights reserved.
//

import SwiftUI

struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    let content: (Int, Int) -> Content

    var body: some View {
        VStack {
            ForEach(0 ..< rows, id: \.self) { row in
                HStack {
                    ForEach(0 ..< self.columns, id: \.self) { column in
                        self.content(row, column)
                    }
                }
            }
        }
    }

    init(rows: Int, columns: Int, @ViewBuilder content: @escaping (Int, Int) -> Content) {
        self.rows = rows
        self.columns = columns
        self.content = content
    }
}

struct ContentView: View {
    var body: some View {
      ZStack (alignment: .top){
        Image("HomeScreen").resizable().aspectRatio(nil, contentMode: .fit)
        
      GridStack(rows: 6, columns: 4) { (_, _)  in
        VStack{
          Image("Image").resizable().aspectRatio(1.0, contentMode: .fit).scaledToFit()
          Text("Lorem")
        }
      }.frame(width: 400.0, height: 750.0, alignment: .top).padding(.top, 100.0).opacity(0.7)
        
      }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
      ContentView().previewLayout(.fixed(width: 492, height: 984))
    }
}
