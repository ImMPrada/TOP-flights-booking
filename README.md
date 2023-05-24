# README

## Local Setup Instructions

Clone the repo
`git clone git@github.com:ImMPrada/TOP-flights-booking.git`
Install ruby. rbenv is recommended
`rbenv install 3.2.2`

Install ruby dependencies
`bundle install`

Set up the DB
`rails db:create`
`rails db:migrate`
please run the seeds, to have some basic db data
`rails db:seed`

Build tailwind styles:
`rails tailwindcss:build`
or instead of that, you can observe changes you make to styles with:
`rails tailwindcss:watch`

Start a server:
`rails s`
