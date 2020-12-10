Assignment 10:
<p>
    For this assignment we had to add a autocomplete to all the search field. This is done under the tag __*search utilites*__. We achieved this by using the autocomplete() function in the script tags as observed in the files.
</p>
<p>
    To achieve the above mentioned goal we had to put an php script inside the tags list. First we had to add a php to sent the query to the database. After achieveing the results in a rows variable we added the php in the tags to iterate and echo the value to the list. This gave us the ability to pull the content for the field from the database. This was the simple the goal of this assignment was done.
</p>
<p>
    However this method is not scalable at all as we load in all the possible emails (in our case) or matches to the var tags list. A more efficient approach to the porblem would be to have a java script to send the query once a key is pressed. This is done in the file scripts.js and auto_complete.php. You can find all the related code in the Advancements.
</p>
<pre>
    Webpage to find where autocompele is implimented : http://clabsql.clamv.jacobs-university.de/~avats/search_pages.php
    Some samples from the database to help:
    emails                  websites (can also be obtained by using)
    albus@mail.com          www.vimeo.com , www.theguardian.com , www.msoffice.com
    harry@gomail.com        www.msoffice.com , www.myVPN.com, www.spotify.com
    horatio@dbmail.com      www.google.com/google-play, www.netflix.com, www.theguardian.com	
    jacob@mail.com          www.google.com/google-play
    rob@mmail.com           www.apple.com/apple-music, www.expressvpn.com, www.netflix.com
    cattycat@bingmail.com   www.economist.com, www.google.com/google-play, www.nytimes.com
</pre>
<p>
    The functionality of the webpage could be improved by additionally parsing the data we get from the query to only obtain the name of the website (e.g. insted of having www.google.com just have google) find in the comment on the file view_account_details.php.
</p>
