import UIKit
import Foundation

/*
Strong reference cycle example
 */

class Tutorial {
    let title: String
    var editor: Editor?
    
    init(title: String) {
        self.title = title
    }
    
    deinit {
        print("Goodbye tutorial \(title)!")
    }
    
}

class Editor {
    let name: String
    var tutorials: [Tutorial] = []
    
    init(name: String) {
        self.name = name
    }
    
    deinit {
        print("Goodbye editor \(name)!")
    }
}

do {
  let tutorial = Tutorial(title: "Memory management")
  let editor = Editor(name: "Ray")
  tutorial.editor = editor
  editor.tutorials.append(tutorial)
}


//To break above reference cycle, we would use weak reference
//    weak var editor: Editor?


// Example of weak and unowned reference


class Tutorial2 {
    let title: String
    unowned let author: Author
    weak var editor: Editor2?
    init(title: String, author: Author) {
        self.title = title
        self.author = author
    }
    deinit {
        print("Goodbye tutorial \(title)!")
    }
}

class Editor2 {
    let name: String
    var tutorials: [Tutorial2] = []
    
    init(name: String) {
        self.name = name
    }
    
    deinit {
        print("Goodbye editor \(name)!")
    }
}

class Author {
    let name: String
    var tutorials: [Tutorial2] = []
    init(name: String) {
        self.name = name
    }
    
    deinit {
        print("Goodbye author \(name)!")
    }
}

do {
    let author = Author(name: "Cosmin")
    let tutorial2 = Tutorial2(title: "Memory management", author: author)
    let editor2 = Editor2(name: "Ray")
    
    author.tutorials.append(tutorial2)
    tutorial2.editor = editor2
    editor2.tutorials.append(tutorial2)
}


//Example of escaping closure

final class FunctionKeeper {
    private let function: () -> Void
    
    init(function: @escaping () -> Void) { // 2
        self.function = function
    }
    
    func run() {
        function() }
    
}

let f = FunctionKeeper {
    print("Hello, world")
}
f.run()

