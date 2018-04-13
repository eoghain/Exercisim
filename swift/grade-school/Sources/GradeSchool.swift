import Foundation

class GradeSchool {
    
    fileprivate (set) var roster: [Int:[String]] = [:]
    
    var sortedRoster: [Int:[String]] {
        var sorted = [Int:[String]]()
        self.roster.forEach { sorted[$0.0] = $0.1.sorted() }
        return sorted;
    }
    
    func addStudent(_ name: String, grade: Int) {
        var students = studentsInGrade(grade)
        students.append(name)
        self.roster[grade] = students
    }
    
    func studentsInGrade(_ grade: Int) -> [String] {
        return self.roster[grade] ?? []
    }
}
