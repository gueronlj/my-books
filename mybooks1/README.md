# README

##Issues:

-  Entering an invalid player id throws a nasty error un-handled by flash.

-  Any user can view other user's show pages by changing the URL.
   User 1 can visit /users/2. NOT GOOD!
   But forms still send from the logged-in user GOOD!

-  The password confirmation is currently not checked for.
   When trying to check for  it, it till throw an error ('no attribute password_confirm').
