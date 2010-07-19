Feature: Manage Posts
In order to make a blog
As an author
I want to create and manage posts

Scenario: Posts List
Given	  I have a list of posts titled ReWork,Linchpin
When 	  I go to the list of posts
Then 	  I should see "ReWork"

Scenario: Logging in
Given	  a user is logged in as "markEmark"

