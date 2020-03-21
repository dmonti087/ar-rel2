  require "sinatra"
  require "sinatra/reloader"
  require "sinatra/activerecord"
  set :database, { adapter: "sqlite3", database: "mydb.db" }
  
  require './models/college_class'
  require './models/student'
  require './models/student_class'
  
get '/' do
    erb :main
  end
  
  get '/view_students' do
     @students = Student.all
     erb :view_students
  end
  
  
  get '/student_search/:id' do
     @s = Student.find(params[:id])
      if @s.nil?
         return "No Student Found"
      end
      erb :student_search
  end
  
  get '/view_collegeclasses' do
      @collegeclasses = CollegeClass.all
      erb :view_collegeclasses 
  end
  
  get '/collegeclass_search/:id' do
     @cc = CollegeClass.find(params[:id])
      if @cc.nil?
         return "No College Class Found"
      end
      erb :collegeclass_search
  end