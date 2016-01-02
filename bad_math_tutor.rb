require "csv"
# Bad Math Tutor

# Program that generates math problems, and makes fun of you if you didn't get the answer 
# right.

puts "Are you ready for a math quiz?"
# get user input
user_input = gets.chomp
# check that input
if user_input.downcase == "yes"
  question_count = 0
  right_count = 0
  wrong_count = 0
  while question_count < 10
  # start the quiz
  num1 = rand(1..5000)
  num2 = rand(1..5000)
  operation = rand(0..5) 

  # list possible combinations
    answers = [num1 + num2,
               num1 - num2,
               num2 - num1,
               num1 * num2,
      (num1.to_f / num2.to_f).round(1),
      (num2.to_f / num1.to_f).round(1)]
  
  
  # list possible questions
  questions = ["#{num1} + #{num2}",
               "#{num1} - #{num2}",
               "#{num2} - #{num1}",
               "#{num1} * #{num2}",
    "#{num1} / #{num2} (round to nearest tenth)",
    "#{num2} / #{num1} (round to nearest tenth)"]
  
  #ask user the 
    puts "-" * 80
    puts "Question# #{question_count + 1}: "
  print questions[operation] + " = "
  
  #get user input
  
  user_answer = gets.chomp
  
  # check their answer
  if user_answer == answers[operation].to_s
    puts "Good Job"
    right_count += 1
  else
    arr_of_arrs = CSV.read("./sample_submission_null.csv")
    puts "Racist Math tutor says: " + arr_of_arrs.sample[2]
    puts ".............."
    puts "#{answers[operation]} is the right answer."
    wrong_count += 1
  end
  question_count = question_count + 1
  end
end
puts "/" * 80
puts "/" * 80
puts "You got #{right_count} questions right and #{wrong_count} questions wrong."
