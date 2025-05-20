# Cashier Operations Testing

This directory contains tests for the cashier operations in the POS system.

## Overview

The cashier operations include:

1. **Viewing incoming orders** - Cashiers need to see orders from waiters to prepare bills
2. **Printing customer bills** - Generating and printing bills for customers
3. **Splitting bills** - Dividing a bill by item or amount for separate payments
4. **Applying discounts** - Adding discounts or coupons to bills
5. **Voiding transactions** - Canceling transactions with manager approval
6. **Processing payments** - Handling different payment types (cash, card, e-wallet)
7. **Reprinting receipts** - Generating duplicate receipts for customers
8. **Issuing refunds** - Processing returns with proper authorization
9. **Closing registers** - End-of-day reporting and register closure
10. **Secure login/logout** - Authentication for cashiers
11. **Viewing transactions** - Seeing pending and completed transactions
12. **Marking bills as paid** - Updating bill status after payment
13. **Receiving waiter notes** - Getting special instructions from waiters

## Files

- **cashierOperations.ts** - Contains all the database operations for cashier functions
- **cashierOperations.test.ts** - Contains tests for all cashier operations

## Running Tests

To run all cashier tests:

```bash
npx jest src/lib/database/cashier/cashierOperations.test.ts
```

To run a specific test:

```bash
npx jest src/lib/database/cashier/cashierOperations.test.ts -t "should process a cash payment successfully"
```

## Test Coverage

The tests cover the following user stories:

### 1. Viewing Incoming Orders
- As a cashier, I want to view incoming orders from waiters so I can prepare bills accordingly.

### 2. Printing Customer Bills
- As a cashier, I want to print customer bills so they can be paid at the counter.

### 3. Splitting Bills
- As a cashier, I want to split a bill by item or amount so customers can pay separately.

### 4. Applying Discounts
- As a cashier, I want to apply discounts or coupons to a bill so that I can reflect promos.

### 5. Voiding Transactions
- As a cashier, I want to void or cancel a transaction with manager approval to fix errors.

### 6. Processing Payments
- As a cashier, I want to process multiple payment types (cash, card, e-wallet) for flexibility.

### 7. Reprinting Receipts
- As a cashier, I want to reprint receipts for customers who request them.

### 8. Issuing Refunds
- As a cashier, I want to issue refunds or returns with proper authorization.

### 9. Closing Registers
- As a cashier, I want to close out my register and generate end-of-day reports.

### 10. Secure Login/Logout
- As a cashier, I want to log in and out securely so my activity is tracked.

### 11. Viewing Transactions
- As a cashier, I want to view a list of pending and completed transactions.

### 12. Marking Bills as Paid
- As a cashier, I want to mark bills as paid so they don't show in the pending list.

### 13. Receiving Waiter Notes
- As a cashier, I want to receive notes from waiters about special instructions or comped items.

## Database Tables Used

The tests interact with the following database tables:

- `total_sales` - Stores all sales transactions
- `que_orders` - Stores orders from waiters
- `user-staff` - Stores user information for authentication
- `return_orders` - Stores refund information
- `remit_sales` - Stores end-of-day reports

## Mock Testing Approach

All tests use Jest's mocking capabilities to simulate database operations without requiring a real database connection. This approach:

1. Mocks the `query` function from `testUtils.ts`
2. Sets up expected return values for each test case
3. Verifies that the functions call the database with the correct queries and parameters
4. Checks that the functions return the expected results

This allows for fast, reliable testing that doesn't depend on the state of the database.

## Adding New Tests

To add a new test:

1. Identify the cashier operation you want to test
2. Add a new test case in the appropriate describe block in `cashierOperations.test.ts`
3. Mock the database responses needed for your test
4. Call the function you're testing
5. Verify that the function calls the database correctly and returns the expected result
