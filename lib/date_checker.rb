class DateChecker
  def is_valid_date?(date)
    if date.include?('-') then return false end
    separate(date)
    if @year.length != 4 then return false end
    Date.valid_date?(@year.to_i, @month.to_i, @day.to_i)
  end

  def separate(date)
    @day = date[0..1]
    @month = date[3..4]
    @year = date[6..9]
  end
end