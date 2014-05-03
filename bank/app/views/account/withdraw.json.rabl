node do
  {
  :response => 
    { 
      :result => @response.success?, 
      :error => @response.error,
      :balance => @response.balance
    }
  }
end