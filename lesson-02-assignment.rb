# Question 1 

# create a new spring trimester
spring2026 = Trimester.create(year: '2026', term: 'Spring', application_deadline: '2026-02-15', start_date: "2026-03-01", end_date: "2026-06-30")

# For each CodingClass, create a new Course record for that class in the Spring 2026 trimester.
CodingClass.all.each do |coding_class|
    Course.create(coding_class_id: coding_class.id, trimester_id: spring2026.id, max_enrollment: 25)
end