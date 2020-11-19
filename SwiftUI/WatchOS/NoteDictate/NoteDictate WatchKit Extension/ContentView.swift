//
//  ContentView.swift
//  NoteDictate WatchKit Extension
//
//  Created by N on 2020/11/18.
//

import SwiftUI

struct ContentView: View {
    @State private var notes = [Note]()
    @State private var text = ""
    @AppStorage("lineCount") var lineCount = 1
    
    var body: some View {
        VStack {
            HStack {
                TextField("Add new note", text: $text)
                
                Button {
                    guard text.isEmpty == false else { return }
                    
                    let note = Note(id: UUID(), text: text)
                    notes.append(note)
                    text = ""
                    save()
                } label: {
                    Image(systemName: "plus")
                        .padding()
                }
                .fixedSize()
            
            }
            
            List {
                ForEach(0..<notes.count, id: \.self) { i in
                    
//                    Button("Lines: \(lineCount)") {
//                        lineCount += 1
//
//                        if lineCount == 4 {
//                            lineCount = 1
//                        }
//                    }
                    
                    NavigationLink(destination: DetailView(index: i, note: notes[i])) {
                        Text(notes[i].text)
                            .lineLimit(1)
                    }
                }
                .onDelete(perform: delete)
            }
        }
        .onAppear(perform: load)
    }
    
    func delete(offset: IndexSet) {
        withAnimation {
            notes.remove(atOffsets: offset)
            save()
        }
    }
    
    func getDocumnetsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func save() {
        do {
            let data = try JSONEncoder().encode(notes)
            let url = getDocumnetsDirectory().appendingPathComponent("notes")
            try data.write(to: url)
        } catch {
            print("Save failed")
        }
    }
    
    func load() {
        DispatchQueue.main.async {
            do {
                let url = getDocumnetsDirectory().appendingPathComponent("notes")
                let data = try Data(contentsOf: url)
                notes = try JSONDecoder().decode([Note].self, from: data)
            } catch {
                // do nothing
            }
        }
    }
}






struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
