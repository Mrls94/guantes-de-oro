module Countable
  def increment_with_sql!(attribute, by = 1)
    raise ArgumentError("Invalid attribute: #{attribute}") unless attribute_names.include?(attribute.to_s)
    original_value_sql = "CASE WHEN #{attribute} IS NULL THEN 0 ELSE #{attribute} END"
    self.class.where(id: id).update_all("#{attribute} = #{original_value_sql} + #{by.to_i}")
    reload
  end

  def decrement_with_sql!(attribute, by = 1)
    raise ArgumentError("Invalid attribute: #{attribute}") unless attribute_names.include?(attribute.to_s)
    original_value_sql = "CASE WHEN #{attribute} IS NULL THEN 0 ELSE #{attribute} END"
    self.class.where(id: id).update_all("#{attribute} = #{original_value_sql} - #{by.to_i}")
    reload
  end
end