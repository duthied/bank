node do
  { 
    :result => @response.success?, 
    :error => @response.error,
    :balance => @response.balance
  }
end