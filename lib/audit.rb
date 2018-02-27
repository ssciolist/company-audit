class Audit
  attr_reader :company
  def initialize
  end

  def load_company(company)
    @company = company
  end
end
