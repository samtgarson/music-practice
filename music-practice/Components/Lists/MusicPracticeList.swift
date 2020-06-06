//
//  MusicPracticeList.swift
//  music-practice
//
//  Created by Sam Garson on 02/06/2020.
//  Copyright © 2020 Sam Garson. All rights reserved.
//

import SwiftUI

struct MusicPracticeList<T: RandomAccessCollection, R: View, A: View>: View where T.Element: Hashable {
  var collection: T
  var actionRow: A
  var displayAction: Bool = true
  var render: (T.Element) -> R
  
  var body: some View {
    VStack(spacing: Spacing.tiny) {
      ForEach(collection, id: \.self) { item in self.render(item) }
      if displayAction { actionRow.opacity(Opacity.VeryFaded) }
    }.padding(.horizontal, Spacing.small * -1)
  }
}

struct TestRecord: Hashable {
  var name: String
}

struct MusicPracticeList_Previews: PreviewProvider {
  static var previews: some View {
    let records = [
      TestRecord(name: "Test 1"),
      TestRecord(name: "Test 2"),
      TestRecord(name: "Test 3")
    ]
    
    let action = MusicPracticeRow("This is an action row") {
      Circle().fill(Colors.primary).frame(width: 10, height: 10)
    }
    
    return PageView {
      MusicPracticeList(collection: records, actionRow: action) { record in
        MusicPracticeRow(record.name) { Circle().fill(Color.red).frame(width: 10, height: 10) }
      }.padding(.bottom, 50)
      
      MusicPracticeList(collection: records, actionRow: action, displayAction: false) { record in
        MusicPracticeRow(record.name) { Circle().fill(Color.red).frame(width: 10, height: 10) }
      }
    }
  }
}
