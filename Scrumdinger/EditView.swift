//
//  EditView.swift
//  Scrumdinger
//
//  Created by Lenny Cheng on 2021/1/7.
//

import SwiftUI

struct EditView: View {
    @State private var scrumData:DailyScrum.Data = DailyScrum.Data()
    @State private var newAttendee:String = ""
    var body: some View {
        List{
            Section(header: Text("Meeting info")) {
                TextField("Title", text: $scrumData.title)
                HStack{
                    Slider(value: $scrumData.lengthInMinutes, in: 5...30, step: 1.0) {
                        Text("Length")
                    }
                    .accessibilityValue("\(scrumData.lengthInMinutes) minutes")
                    Spacer()
                    Text("\(Int(scrumData.lengthInMinutes)) minutes")
                        .accessibilityHidden(true)
                }
                ColorPicker("Color", selection: $scrumData.color)
                    .accessibilityLabel(Text("Color picker"))
            }
            Section(header: Text("Attendees")) {
                ForEach(scrumData.attendees, id: \.self){
                    attendee in
                        Text(attendee)
                }
                .onDelete { (indices) in
                    scrumData.attendees.remove(atOffsets: indices)
                }
                HStack{
                    TextField("New attendee", text: $newAttendee)
                    Button(action: {
                        withAnimation {
                            scrumData.attendees.append(newAttendee)
                            newAttendee = ""
                        }
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .accessibilityLabel(Text("Add attendee"))
                    }.disabled(newAttendee.isEmpty)
                }
            }
        }
        .listStyle(InsetListStyle())
    }
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditView()
    }
}
