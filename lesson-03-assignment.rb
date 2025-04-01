# 1. What tables do you need to add? Decide on table names and their associations to each other and any existing tables/models.
# Tables: topics, lessons_topics
# Associations:
# - Topic can be associated with many Lessons through the lessons_topics join table.
# - lessons_topics table connects Lesson to Topic, so it belongs to both Lesson and Topic.
# - Lesson can have many Topics because a lesson can cover multiple topics, and this is managed through the lessons_topics table.


# 2. What columns are necessary for the associations you decided on?
# For the lessons_topics join table we need at least two columns: lesson_id and topic_id


# 3. What other columns (if any) need to be included on the tables? What other data needs to be stored?
# For the topics table we will need the column title, which is a string that holds the name of the topic. This column is required because every topic must have a name, such as 'JavaScript,' 'CSS,' etc.


# 4. Write out each table's name and column names with data types.

# Table: topics
# Columns: id(integer), title (string, required), timestamps such as created_at and updated_at(datetime 6)

# Table: lessons_topics
# Columns: id(integer), lesson_id (integer, references lessons), topic_id (integer, references topics), timestamps such as created_at and updated_at (datetime 6)


# 5. Determine the generator command you'll need to create the migration file and run the command to generate the empty migration file.
# rails g migration create_topics

# 13. Open the console and test your new models by creating the topics above and adding them to some lessons.
Topic.create(title: "Javascript")
lesson = Lesson.find(1) 
topic1 = Topic.find_by(title: "Javascript") 
lesson.topics << topic1