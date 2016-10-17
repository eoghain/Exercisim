import Foundation

class GradeSchool {
    
    private (set) var roster: [Int:[String]] = [:]
    
    var sortedRoster: [Int:[String]] {
        var sorted = [Int:[String]]()
        self.roster.forEach { sorted[$0.0] = $0.1.sort() }
        return sorted;
    }
    
    func addStudent(name: String, grade: Int) {
        var students = studentsInGrade(grade)
        students.append(name)
        self.roster[grade] = students
    }
    
    func studentsInGrade(grade: Int) -> [String] {
        return self.roster[grade] ?? []
    }
}