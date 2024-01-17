# Sweater Weather API Project

This API-based application provides the back-end data to provide weather information related to your travel needs. 

## Getting Started

1. Clone the project repository to your local machine.

3. Navigate to the project directory and install the required gems:

   ```bash
   bundle install
   ```

4. Set up the database and run migrations:

   ```bash
   rails db:create
   rails db:migrate
   ```

5. Obtain API keys:
   - You will need API keys for [MapQuest's Geocoding API](https://developer.mapquest.com/documentation/) and a [Weather API](https://www.weatherapi.com/signup.aspx) provider.

6. Configure your API keys:
   - Run `$ EDITOR="code --wait" rails credentials:edit` and add it to the .yml file. Save the file and close it
```
    mapquest:
      key: YOUR KEY

    weather:
      key: YOUR KEY

    yelp:
       key: Bearer YOUR KEY
```

## Project Features

### 1. Application Landing Page

This is the request that you would use to get the weather information for a specific city. 

- **Retrieve Weather for a City:**

   - **Endpoint:** `GET /api/v0/forecast?location=<city>,<state>`
   - **Request Headers:**
     - `Content-Type: application/json`
     - `Accept: application/json`

  The response data will need to contain the following attributes:

     - `id` (always set to null)
     - `type` (always set to "forecast")
     - `attributes` (an object containing weather information)

### 2. User Registration

The will include a new user page. Use this as the request:

   - **Endpoint:** `POST /api/v0/users`
   - **Request Headers:**
     - `Content-Type: application/json`
     - `Accept: application/json`
   - **Request Body:**

     ```json
     {
       "email": "your_email@example.com",
       "password": "your_password",
       "password_confirmation": "your_password"
     }
     ```

   - **Response:**

     - Expect a 201, created status
     - The response body should be a JSON object containing the user's data and API key.

### 3. Login

The project includes a login feature. Your API should expose the following endpoint:
This is the request
   - **Endpoint:** `POST /api/v0/sessions`
   - **Request Headers:**
     - `Content-Type: application/json`
     - `Accept: application/json`
   - **Request Body:**

     ```json
     {
       "email": "your_email@example.com",
       "password": "your_password"
     }
     ```

Expect a status 200 response with a JSON object containing the user email and API key

### 4. Road Trip Planning

The project includes a feature for planning road trips. Use this request to return the weather information for your estimated time of arrival at your location

   - **Endpoint:** `POST /api/v0/road_trip`
   - **Request Headers:**
     - `Content-Type: application/json`
     - `Accept: application/json`
   - **Request Body:**

     ```json
     {
       "origin": "Origin City, State",
       "destination": "Destination City, State",
       "api_key": "user_api_key"
     }
     ```

     The response should contain information about the road trip, including travel time and weather at the destination.


### Learning Goals

The primary goal of this project is building an API that consolidates data from multiple external APIs. 
This also utilizes authentication tokens for the user registration and login for security and privacy. 
