# Question 1 

# create a new spring trimester
spring2026 = Trimester.create(year: '2026', term: 'Spring', application_deadline: '2026-02-15', start_date: "2026-03-01", end_date: "2026-06-30")

# For each CodingClass, create a new Course record for that class in the Spring 2026 trimester.
CodingClass.all.each do |coding_class|
    Course.create(coding_class_id: coding_class.id, trimester_id: spring2026.id, max_enrollment: 25)
end

# Question 2
# Create a new student record and enroll the student in the Intro to Programming course for the Spring 2026 trimester.
new_student = Student.create(first_name: 'Harry', last_name: 'Potter', email: 'harrypotter@owl.post')
trimester = Trimester.find_by(year: '2026', term: 'Spring') 
coding_class = CodingClass.find_by(title: 'Intro to Programming')
course = Course.find_by(coding_class_id: coding_class.id, trimester_id: trimester.id)
enrollment = Enrollment.create(course_id: course.id, student_id: new_student.id)

# Find a mentor with no more than 2 students (enrollments) assigned and assign that mentor to your new student's enrollment.
mentor = MentorEnrollmentAssignment
  .group(:mentor_id)
  .having('COUNT(enrollment_id) <= 2')
  .limit(1)
  .pluck(:mentor_id)
if mentor.present?
    MentorEnrollmentAssignment.create(mentor_id: mentor.first, enrollment_id: enrollment.id)
end

# Question 3 - Describe your project
Book Worms Society is a collaborative blogging platform for book lovers. It provides a space for users to share posts about books, literary discussions, and reading experiences. 
Key features include:
- Users can create posts on various literary topics, such as book reviews, author highlights, and reading challenges.
- Users can engage in conversations through comments, reply to others, and participate in in-depth discussions.
- Posts and comments can be liked.
- Users can bookmark posts for later.
- Users can follow others to stay updated on their latest posts and interact more closely.
- Users can create a personalized profile with a bio and avatar, enhancing their presence in the community.
- Posts can be tagged with relevant keywords, allowing for easy discovery of topics related to specific books, genres, or themes.
- Users can follow tags to stay updated on posts related to specific topics or interests.

# Question 4 - Design the data model for your project
# Look at the image in the root of the project.