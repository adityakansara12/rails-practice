class HomeController < ApplicationController
  def index
    @name = "Aditya"
    @dob = "01/11/2001"
    @hobbies = ['Binge Watching', 'Playing Guitar' , 'Computer Games']
    @college = "L. D. College of Engineering"
  end
end
