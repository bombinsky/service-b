# Service B

This is a repository that stores multiple email templates.
It allows to sent an email based on template and delivered payload.


## Required environmental variables

Basic auth credentials
```
SERVICE_B_BASIC_AUTH_USERNAME=service_b
SERVICE_B_BASIC_AUTH_PASSWORD=service_b
```
SMTP settings
```
SMTP_SERVER=smtp_server
SMTP_PORT=smtp_port
SMTP_USERNAME=smtp_username
SMTP_PASSWORD=smtp_password
```

Example of the request

`POST /template_email_deliveries`

```json
{
  "template_email": {
    "from": "bombinsky@gmail.com",
    "to": "bombinsky@gmail.com",
    "headers": { "Reply-To": "reply-to@email.com" },
    "template_name": "external_urls_request_results",
    "template_payload": {
      "nickname": "Bombinsky",
      "request_id": "1234",
      "request_start_time": "2020-07-01 10:45",
      "request_end_time": "2020-07-04 10:45",
      "request_created_at": "2020-07-05 13:45:34",
      "request_updated_at": "2020-07-05 13:55:49",
      "urls": [
        { "page_title": "Page title 1", "url": "https://wp.pl" },
        { "page_title": "Page title 2", "url": "https://amazon.com" },
        { "page_title": "Page title 3", "url": "https://youtube.com" }
      ]
    }
  }
}
```


## Simple running instruction until docker files will be ready

1. Set all required environmental variables the way you prefer. For example you can copy then edit .env using .env.example

    ``` cp .env.example .env ```

2. Setup connection for postgres. You can copy then edit config/database.yml using config/database.yml.example

   ``` cp config/database.yml.example cp config/database.yml ```

3. Setup database with

    ``` rails db:setup ```

4. Run application server

    ``` rails s ```


## Other commands useful during development

1. Run specs

    ``` rspec ```

2. Run specs with code coverage

    ``` COVERAGE=true rspec ```
    ``` open tmp/reports/coverage/index.html ```

3. Launch console if needed

    ``` rails c ```

4. Check new code with cops during development

    ``` pronto run -r=flay rails_best_practices reek rubocop brakeman -c origin/develop ```

5. Run pronto with cops on whole code like

    ```pronto run --commit=$(git log --pretty=format:%H | tail -1)```


## Some screenshots for those who would like to skip application setup :)

#### Final email
<p>
    <img src="readme_images/email.png" width="750" height="900">
</p>

#### Code coverage report
<p>
  <img src="readme_images/code_coverage.png" width="600" height="300">
</p>

#### Rspec output
<p>
  <img src="readme_images/rspec_output.png" width=380" height="90">
</p>
