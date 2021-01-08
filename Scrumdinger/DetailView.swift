//
//  DetailView.swift
//  Scrumdinger
//
//  Created by Lenny Cheng on 2021/1/6.
//

import SwiftUI

struct DetailView: View {
    let scrum:DailyScrum
    @State private var isPresented = false
    
    var body: some View {
        List{
            Section(header: Text("Meeting info")) {
                NavigationLink(destination:MeetingView()) {
                    Label("Start meeting", systemImage: "timer")
                        .foregroundColor(.accentColor)
                        .font(.headline)
                        .accessibilityLabel(Text("Start meeting"))
                }
                HStack{
                    Label("Length", systemImage: "clock")
                        .accessibilityLabel(Text("Meeting length"))
                    Spacer()
                    Text("\(scrum.lengthInMinutes) minutes")
                }
                HStack{
                    Label("Color", systemImage: "paintpalette")
                    Spacer()
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(scrum.color)
                }
                .accessibilityElement(children: .ignore)
            }
            Section(header: Text("Attendees")) {
                ForEach(scrum.attendees, id: \.self) {
                    attendee in
                    Label(attendee, systemImage: "person")
                        .accessibilityLabel(Text("Person"))
                        .accessibilityValue(Text(attendee))
                }
            }
        }
        .listStyle(SidebarListStyle())
        .navigationTitle(scrum.title)
        .navigationBarItems(trailing: Button("Edit") {
            isPresented = true
        })
        .fullScreenCover(isPresented: $isPresented) {
            NavigationView{
                EditView()
                    .navigationTitle(scrum.title)
                    .navigationBarItems(leading: Button("cancel") {
                        isPresented = false
                    }, trailing: Button("done") {
                        isPresented = false
                    })
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailView(scrum: DailyScrum.data[0])
        }
    }
}
