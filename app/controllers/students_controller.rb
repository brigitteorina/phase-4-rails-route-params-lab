class StudentsController < ApplicationController

  def index
    students = Student.all
    render json: students
  end

  def grades
    students = Student.order(grade: :desc)
    render json: students
  end

  def highest_grade
    student = Student.order(grade: :desc).first
    render json: student
  end


  #The user is able to go to a URL with the student's ID (i.e. /students/2) to receive information on the student.
  #The application should render the values from the student record with the corresponding ID in the database.
  def show
    student = Student.find(params[:id])
    render json: student
  end


  #Use query params in the index action to return a list of all students whose first or last name matches the query parameter
  def index
    if params[:name]
      students = Student.where("first_name LIKE ? OR last_name LIKE ?", "%#{params[:name]}%", "%#{params[:name]}%")
    else
      students = Student.all
    end
    render json: students
  end


end
