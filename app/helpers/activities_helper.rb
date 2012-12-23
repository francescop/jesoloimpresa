module ActivitiesHelper
  def display_date(input_date)
    return input_date.strftime("%d/%m/%Y")
  end
end
