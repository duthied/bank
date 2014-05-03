Bank
==============

[![Code Climate](https://codeclimate.com/github/duthied/yolo-octo-lana.png)](https://codeclimate.com/github/duthied/yolo-octo-lana) [![Test Coverage](https://codeclimate.com/github/duthied/yolo-octo-lana/coverage.png)](https://codeclimate.com/github/duthied/yolo-octo-lana)

This is a simple Bank server written in Ruby on Rails (v.4.0.4).

### Prepration and Execution
Ensure you are running a Postgres database server.
The database settings are in config/database.yml

To prepare the sample data, execute 
```
rake db:reset
```

Install the gems:
```
bundle install
```

Start the server
```
rails server
```

### Interfaces
#### Web-Client
The only user-facing interface is provided by ActiveAdmin.  This interface provides CRUD access to the models:
- Admin User
- User
- Account
- Transaction Log

The admin interface can be accessed by visiting the root of the site and providing a username of "admin@example.com" and a password of "password".

#### API
##### Withdraw: 
A POST to `/api/account/{id}/withdraw` passing a param of 'amount'
The response will be something like:
```
{
  "response":
    {
      "result":false,
      "error":"Insufficient balance for this request.  Available balance: 9992.63",
      "balance":"9992.63"
    }
}
```
When the balance of the account is not sufficient for the withdraw request.

This is the response when there is a sufficient balance:
```
{
  "response":
    {
      "result":true,
      "error":null,
      "balance":"9992.63"
    }
}
```

##### Balance Inquiry
A GET to `/api/account/1/balance`
Response:
```
{
  "account":
  {
    "balance":"9892.4"
  }
}
```

### Audit Logging
When a balance is changed on an account an audit log entry is created with a record of the Account, User, Balance before the transaction, the Balance after the transaction and a date stamp.  These audit logs are found in the Admin Interface in the Transaction Log menu item.

### Authentication
TBD
