--CREATING ALL TABLE FOR ENTITIES with their Attributes
--creating table for subscribee(entity set)
CREATE TABLE subs_account (
    email VARCHAR(50) NOT NULL UNIQUE,
    username CHAR(20),
    sub_pass PASSWORD
    PRIMARY KEY (email)
);

--creating table for premium user(entity set)
CREATE TABLE premium_user (
    email VARCHAR(50) NOT NULL UNIQUE REFERENCES subs_account,
    PRIMARY KEY (email)
);

--creating a table for a regular user
CREATE TABLE regular_user(
    email VARCHAR(50) NOT NULL UNIQUE REFERENCES subs_account,
    number_of_general_accounts INTEGER,
);

--creating table for General_account(entity set)
CREATE TABLE general_account (
    email CHAR(50) NOT NULL UNIQUE, -- the primary cannot be null
    website CHAR(20),
    service_description VARCHAR(1000),
    PRIMARY KEY(email,website)
);

--creating table for details(entity set)
CREATE TABLE details (
    detail_id INTEGER NOT NULL UNIQUE,
    PRIMARY KEY (detail_id)
);

--creating a table for account deletion details
CREATE TABLE account_deletion(
    detail_id INTEGER NOT NULL UNIQUE,
    deletion_link VARCHAR(3000),
    FOREIGN KEY (detail_id) REFERENCES details (detail_id) ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY (detail_id)
);

--creating a table for data usage details
CREATE TABLE data_usage(
    detail_id INTEGER NOT NULL UNIQUE,
    deletion_link VARCHAR(3000),
    FOREIGN KEY (detail_id) REFERENCES details (detail_id) ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY (detail_id)
);

-- CREATE Table ISA with VPN and Magazine
CREATE TABLE music_streaming(
    email CHAR(50) NOT NULL UNIQUE, -- the primary cannot be null
    website CHAR(20) NOT NULL UNIQUE,
    link_to_upcoming_content VARCHAR(3000),
    link_to_latest_releases VARCHAR(3000),
    FOREIGN KEY (email) REFERENCES general_account (email) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (website) REFERENCES general_account (website) ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY (email, website)
);

CREATE TABLE video_streaming(
    email CHAR(50) NOT NULL UNIQUE, -- the primary cannot be null
    website CHAR(20) NOT NULL UNIQUE,
    link_to_upcoming VARCHAR(3000),
    link_to_latest_release VARCHAR(3000),
    max_devices INTEGER,
    No_of_videos INTEGER,
    FOREIGN KEY (email) REFERENCES general_account (email) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (website) REFERENCES general_account (website) ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY (email, website)
);

CREATE TABLE magazine(
    email CHAR(50) NOT NULL UNIQUE, -- the primary cannot be null
    website CHAR(20) NOT NULL UNIQUE,
    sub_type TINYINT, --a variable that gives 0:online ant 1:paper
    link_to_latest_release VARCHAR(3000),
    FOREIGN KEY (email) REFERENCES general_account (email) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (website) REFERENCES general_account (website) ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY (email, website)
);

CREATE TABLE software_suite(
    email CHAR(50) NOT NULL UNIQUE, -- the primary cannot be null
    website CHAR(20) NOT NULL UNIQUE,
    expire_date DATE,
    FOREIGN KEY (email) REFERENCES general_account (email) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (website) REFERENCES general_account (website) ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY (email, website)
);

CREATE TABLE VPN(
    email CHAR(50) NOT NULL UNIQUE, -- the primary cannot be null
    website CHAR(20) NOT NULL UNIQUE,
    locations LOCATION,
    No_of_devices INTEGER,
    FOREIGN KEY (email) REFERENCES general_account (email) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (website) REFERENCES general_account (website) ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY (email, website)
);

--CREATING TABLES FOR THE RELATIONS
/*ON DELETE CASCADE this means when the primary key is removed
in the respective entity the row in the relation table will 
be removed */

--relation related_account
CREATE TABLE related_account (
    email_s VARCHAR(50) NOT NULL UNIQUE,
    email_g CHAR(50) NOT NULL UNIQUE, -- the primary cannot be null
    website CHAR(20),
    FOREIGN KEY (email_s) REFERENCES subs_account (email_s) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (email_g) REFERENCES general_account (email_g) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (website) REFERENCES general_account (website) ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY (email_s, email_g, website)
);

--ISA under details
CREATE TABLE account_details (
    detail_id INTEGER ,
    email CHAR(50),
    website CHAR(20),
    FOREIGN KEY (detail_id) REFERENCES details (detail_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (email) REFERENCES general_account (email) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (website) REFERENCES general_account (website) ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY (detail_id, email, website)
);

CREATE TABLE data_account_details (
    detail_id INTEGER,
    terms_cond_last_updates DATE,
    link_relevant_page VARCHAR(3000),
    FOREIGN KEY (detail_id) REFERENCES details (detail_id) ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY (detail_id)
);

-- Start of Payment section
CREATE TABLE bank_transfer(
    IBAN CHAR(20),
    bank_name VARCHAR(100),
    BIC VARCHAR(11),
    PRIMARY KEY (IBAN)
);

CREATE TABLE credit_card(
    account_owner_name VARCHAR(100),
    credit_card_no VARCHAR(16),
    PRIMARY KEY (credit_card_no)
);

CREATE TABLE paypal(
    email VARCHAR(150),
    PRIMARY KEY (email)
);

CREATE TABLE payment_details(
    entrynumber INTEGER,
    next_payment_date DATE,
    payment_account float(15),
    PRIMARY KEY (entrynumber)
);

--the following is the relation payment_means
CREATE TABLE payment_means(
    entrynumber INTEGER NOT NULL,
    paypal_email VARCHAR(150) ,
    IBAN CHAR(20),
    email VARCHAR(150),
    credit_card_no VARCHAR(16),
    FOREIGN KEY (entrynumber) REFERENCES payment_details (entrynumber) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (IBAN) REFERENCES bank_transfer (IBAN) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (credit_card_no) REFERENCES credit_card (credit_card_no) ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY (entrynumber)
);

CREATE TABLE subs_payment_method(
    email VARCHAR(50) NOT NULL UNIQUE,
    payment_details INTEGER,
    FOREIGN KEY (email) REFERENCES subs_account (email) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (payment_details) REFERENCES payment_details (entrynumber) ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY (email)
);

CREATE TABLE general_account_payment_details(
    updates_and_messages VARCHAR(5000),
    detail_id INTEGER,
    FOREIGN KEY (detail_id) REFERENCES details (detail_id) ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY (detail_id)
);

--creating a table for the relationship payment links
CREATE TABLE payment_links(
    detail_id INTEGER,
    FOREIGN KEY (detail_id) REFERENCES general_account_payment_details (detail_id) ON DELETE CASCADE ON UPDATE CASCADE,
    payment_details_entry INTEGER,
    FOREIGN KEY (payment_details_entry) REFERENCES payment_details (entrynumber) ON DELETE CASCADE ON UPDATE CASCADE
);

-- end of payment section

