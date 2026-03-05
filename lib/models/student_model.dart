class StudentModel {
// These are the pieces of data we track
final String name; // Student's name
final String currentSubject; // Currently selected subject
final List<String> subjects; // All available subjects
final int currentIndex; // Which subject is selected
// Constructor - how we CREATE a StudentModel
StudentModel({
required this.name,
required this.currentSubject,
required this.subjects,
required this.currentIndex,
});
// copyWith - how we "UPDATE" data (creates a new copy with changes)
StudentModel copyWith({
String? name,
String? currentSubject,
List<String>? subjects,
int? currentIndex,
}) {
return StudentModel(
name: name ?? this.name,
currentSubject: currentSubject ?? this.currentSubject,
subjects: subjects ?? this.subjects,
currentIndex: currentIndex ?? this.currentIndex,
);
}
}