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
conding_class=CodingClass.find_by(title: 'Intro to Programming')
course=Course.find_by(coding_class_id: coding_class.id, trimester_id: trimester.id)
enrollment=Enrollment.create(course_id: course.id, student_id: new_student.id)

# Find a mentor with no more than 2 students (enrollments) assigned and assign that mentor to your new student's enrollment.
mentor=MentorEnrollmentAssignment
  .group(:mentor_id)
  .having('COUNT(mentor_id)<=2')
  .limit(1)
  .pluck(:mentor_id)
if mentor.present?
    MentorEnrollmentAssignment.create(mentor_id: mentor.first, enrollment_id: enrollment.id)
end