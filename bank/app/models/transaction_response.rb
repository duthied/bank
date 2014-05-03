class TransactionResponse

    attr_reader :error
    attr_reader :balance

    def initialize(success, balance, error = nil)
      @success = success
      @error = error
      @balance = balance
    end

    def success?
      @success
    end

  end