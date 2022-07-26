require 'date'

class DateChecker
  def check_date(date)
    separate(date)
    fail 'Invalid Date' unless valid_date?(date)
    fail 'Invalid Date: must be later than your most recent transaction' unless
      most_recent_date?
    @most_recent_date = Date.new(@year.to_i, @month.to_i, @day.to_i)
  end

  private 

  def valid_date?(date)
    return false if date.include?('-') || @year.length != 4 
    Date.valid_date?(@year.to_i, @month.to_i, @day.to_i) 
  end

  def most_recent_date?
    return true unless @most_recent_date 
    result = @most_recent_date <=> Date.new(@year.to_i, @month.to_i, @day.to_i)
    result != 1 
  end

  def separate(date)
    @day = date[0..1]
    @month = date[3..4]
    @year = date[6..9]
  end
end
