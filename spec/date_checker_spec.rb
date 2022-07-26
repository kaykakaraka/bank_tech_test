require 'date_checker'

RSpec.describe DateChecker do
  before(:each) do
    @date_checker = DateChecker.new
  end

  context 'when the day is not a valid day' do
    it 'fails' do
      expect { @date_checker.check_date('35/07/1994') }.to raise_error 'Invalid Date'
    end
  end

  context 'when the month is not a valid month' do
    it 'fails' do
      expect { @date_checker.check_date('24/15/1996') }.to raise_error 'Invalid Date'
    end
  end

  context 'when the date contains a negative number' do
    it 'fails' do
      expect { @date_checker.check_date('24/-2/2019') }.to raise_error 'Invalid Date'
    end
  end

  context 'when the year is not four characters' do
    it 'fails' do
      expect { @date_checker.check_date('24/-2/20') }.to raise_error 'Invalid Date'
    end
  end

  context 'when the day is a valid day in some months but not in the given month' do
    it 'fails' do
      expect { @date_checker.check_date('30/02/27') }.to raise_error 'Invalid Date'
    end
  end

  context 'when the day is entered as a single character rather than 2 characters' do
    it 'fails' do
      expect { @date_checker.check_date('3/02/2027') }.to raise_error 'Invalid Date'
    end
  end

  context 'when the month is entered as a single character rather than 2 characters' do
    it 'fails' do
      expect { @date_checker.check_date('03/2/2027') }.to raise_error 'Invalid Date'
    end
  end

  context 'when the day is more than two characters' do
    it 'fails' do
      expect { @date_checker.check_date('021/02/2027') }.to raise_error 'Invalid Date'
    end
  end

  context 'when the month is more than two characters' do
    it 'fails' do
      expect { @date_checker.check_date('21/002/2027') }.to raise_error 'Invalid Date'
    end
  end 

  context 'when the year is longer than 4 characters' do
    it 'fails' do
      expect { @date_checker.check_date('21/002/2027') }.to raise_error 'Invalid Date'
    end
  end

  context 'when the date is before the most recent date' do
    it 'fails' do
      @date_checker.check_date('21/04/2022')
      expect { @date_checker.check_date('20/04/2022') }.to raise_error 'Invalid Date: must be later than your most recent transaction'
    end
  end

  context 'when the date is the same as the most recent date' do
    it 'passes' do
      @date_checker.check_date('21/04/2022')
      expect { @date_checker.check_date('21/04/2022') }.to_not raise_error
    end
  end

  context 'when the date is in a valid format' do
    it 'passes' do
      @date_checker.check_date('22/02/2022')
      expect { @date_checker.check_date('21/04/2022') }.to_not raise_error
    end
  end

  context 'when the date is the first date' do
    it 'passes' do
      expect { @date_checker.check_date('21/04/2022') }.to_not raise_error
    end
  end
end
