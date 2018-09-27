CREATE user 'springuser'@'localhost' identified by 'ThePassword'; -- Creates the user
GRANT all on db_example.* to 'springuser'@'localhost'; -- Gives all the privileges