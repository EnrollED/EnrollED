class ApplicationChoicePolicy < BasePolicy

  def index?
    true
  end

  def pdf_export?
    true
  end
end