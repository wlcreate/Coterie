# Coterie
Coterie is a web application that allows users to join and host virtual meetings to connect people with shared interests.
The inspiration of this app came during the time of COVID where it was difficult for people to gather in-person. Coterie provides a safe space to still meet new people and stay connected.
The word *Coterie*  means a small group of people with shared interests or tastes.

## Features

### Password Authentication
 * Validate users using sessions
 * Authenticate user password with BCrypt

### CRUD Operation
 User (Attendee) can to:
  * log into the application
  * create an account
  * see an error if their account input is wrong
  * register for a meeting
  * view their meetings
  * browse available meetings

 User (Host) will be able to:
  * log into the application
  * create a meeting
  * change their meetings
  * cancel the meeting

### Active Record Associations
 * There are 5 models that have the following associations ```has_many, belongs_to and has_many, through: ```

## Domain Model
 Coming Soon!
 
## Tech Stack
 * Ruby on Rails
 * PostgreSQL
 * HTML/CSS
 * Active Record

## Tools
 * Bootstrap
 * BCrypt

## Build Status
 Work in Progress!

## Next Steps
 * Improve design elements (look of buttons, background image, text manipulation)
 * Create a logo
 * Add About page
 * Utilize API/CSV file for welcome page
 * If a user is a host they can’t be an attendee
 * Allow users to upload a profile picture
 * Add attribute to meeting for url

## Contributors
 * [Anna Kim](https://github.com/iannakim)
 * [Ekaterina Zarudnaya](https://github.com/Elronia)
 * [Waverley Leung](https://github.com/wlcreate)
 
## Acknowledgements
 We would like to thank:
  * Sylwia Vargas
  * Eric Kim
  * Annie Zheng
  * Isabel K. Lee
  * the Code Bender Cohort
