class WellcomeController < AuthenticatedController
  expose(:course) { current_user.courses.first }

  def index; end
end
