module Administration
  class StudentsController < AdministrationController
    expose(:students) { Student.all }

    def index; end
  end
end