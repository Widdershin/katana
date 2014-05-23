class Assert
  def self.equal(expected_value, actual_value)
    if expected_value != actual_value
      raise "Expected #{expected_value}, got #{actual_value}"
    end
  end
end
# Assert.equal(6,10/2)
