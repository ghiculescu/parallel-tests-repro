Running tests in singular passes:

```
rails db:reset test
Dropped database 'db/development.sqlite3'
Dropped database 'db/test.sqlite3'
Created database 'db/development.sqlite3'
Created database 'db/test.sqlite3'
Running 1 tests in a single process (parallelization threshold is 2)
Run options: --seed 43534

# Running:

.

Finished in 0.004150s, 240.9639 runs/s, 240.9639 assertions/s.
1 runs, 1 assertions, 0 failures, 0 errors, 0 skips
```

Running tests in parallel; the `users` table is truncated before tests run but after static data is loaded:

```
TESTS=3 rails db:reset test
Dropped database 'db/development.sqlite3'
Dropped database 'db/test.sqlite3'
Created database 'db/development.sqlite3'
Created database 'db/test.sqlite3'
Running 3 tests in parallel using 6 processes
Run options: --seed 29508

# Running:

F

Failure:
UserTest#test_static_data_is_created_in_test_helper.rb_-_2 [/Users/alex/Code/parallel-tests-repro/test/models/user_test.rb:6]:
Expected: 10
  Actual: 0


rails test test/models/user_test.rb:5

F

Failure:
UserTest#test_static_data_is_created_in_test_helper.rb_-_1 [/Users/alex/Code/parallel-tests-repro/test/models/user_test.rb:6]:
Expected: 10
  Actual: 0


rails test test/models/user_test.rb:5

F

Failure:
UserTest#test_static_data_is_created_in_test_helper.rb_-_0 [/Users/alex/Code/parallel-tests-repro/test/models/user_test.rb:6]:
Expected: 10
  Actual: 0


rails test test/models/user_test.rb:5
```
