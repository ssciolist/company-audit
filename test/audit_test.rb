require './test/test_helper'
require './lib/audit'

class AuditTest < Minitest::Test
  def test_instantiation
    audit = Audit.new

    assert_instance_of Audit, audit
  end

  def test_load_company
    audit = Audit.new
    company = Company.new
    result = audit.load_company(company)

    assert_instance_of Company, result
  end

  def test_were_invalid_days_worked
    audit = Audit.new
    company = Company.new
    result = audit.were_invalid_days_worked

    assert result.include?("Invalid Days Worked:")
    assert result.include?("John Smith worked on Widgets on 2016-02-20")
  end
end
