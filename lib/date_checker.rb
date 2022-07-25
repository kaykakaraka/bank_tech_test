class DateChecker
  def check_date(date)
    fail 'Invalid Date' unless valid_date?(date)
    fail 'Invalid Date: must be later than your most recent transaction' unless
      most_recent_date?(date)
    @most_recent_date = Date.new(@year.to_i, @month.to_i, @day.to_i)
  end

  def valid_date?(date)
    if date.include?('-') then return false end
    separate(date)
    if @year.length != 4 then return false end
    return false unless Date.valid_date?(@year.to_i, @month.to_i, @day.to_i)
    return true
  end

  def most_recent_date?(date)
    return true unless @most_recent_date 
    separate(date)
    result = @most_recent_date <=> Date.new(@year.to_i, @month.to_i, @day.to_i)
    result != 1 
  end

  def separate(date)
    @day = date[0..1]
    @month = date[3..4]
    @year = date[6..9]
  end
end