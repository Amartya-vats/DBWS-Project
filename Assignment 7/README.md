Assignment 7: We are required to implement a page where the select queries implemented in Assignment 4 can be run along with that main page we should also have each row produced by the output to be shown on a different page

To achieve the above goal we chose the following select queries which will be useful for user in the future:

    - SELECT * from @subscription_type X WHERE X.email = @general_account_email AND X.website = $the_chosen website;

    - SELECT * FROM subs_account S, related_account R, general_account G WHERE G.email = R.email_g and S.email = R.email_s and S.email = @360_user_email and R.website = G.website;

    - SELECT GAPD.updates_and_messages, AD.deletion_link, DU.terms_cond_last_updates, DU.link_relevant_page
        FROM general_account_payment_details GAPD, account_deletion AD, data_usage DU
        WHERE GAPD.detail_id IN (select AD.detail_id
                                FROM account_details AD, general_account GA
                                WHERE AD.email = GA.email and AD.website = GA.website and AD.email = '{$email_g}' and AD.website = '{$website}') 
                                and AD.detail_id IN (select AD.detail_id
                                                    FROM account_details AD, general_account GA
                                                    WHERE AD.email = GA.email and AD.website = GA.website and AD.email = '{$email_g}' and AD.website = '{$website}')
                                                    and DU.detail_id IN (select AD.detail_id
                                                                        FROM account_details AD, general_account GA
                                                                        WHERE AD.email = GA.email and AD.website = GA.website and AD.email = '{$email_g}' and AD.website = '{$website}');

Link to webpages : 
    - http://clabsql.clamv.jacobs-university.de/~avats/Info_for_sub_type.php
    - http://clabsql.clamv.jacobs-university.de/~avats/show_general_accounts.php
    - http://clabsql.clamv.jacobs-university.de/~avats/view_account_details.php

In addition: There are some problem with the database as we dont let the user set the account details in our previous assigment due to there being issues with providing a user lock allow an easy point for hacks our last query only work for the pre-defined data we origionally had in our database such as 

    - rattytytat@ratratrat.com
    - rob@mmail.com
    - robinson@dbmail.com
    - jamiebond@bingmail.com
    - horatio@dbmail.com

and others that can be found in the populate_tables.sql in assignment 4