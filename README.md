# Setup

## Environments

Create .env file in root directory with following format.

> DB_NAME=db  
> DB_HOST=localhost  
> DB_USER=postgres  
> DB_PSW =123456  
> DB_PORT=5432

These are just arbitrary values I choose for local developing and they are not supposed to be used in a production project.

Make sure **.env** is listed in **.gitignore**

## Dependencies

Install dependencies with npm.

> `npm i`

## Database

Execute following commands in cli.

> `docker-compose up`

Schema and seeds will run automatically.

## Reset

Here are some scenarios that one might possibly have to rest the app.

- Mess up schemas after experimenting things in schema.ts
- Schema parser generates faulty code.

If anything anything goes wrong execute the following command in cli.

> `docker-compose down --volumes`  
> `docker-compose up`

<br/>
<br/>

# Exercises

### 1. Try using "Introspect / Pull" functionality from Drizzle Kit.

- Just give it a try and see what it dose.

### 2. Create an ActorService with following methods.

- getAll( ) - Returns all actors.
- getOne( id : number ) - Returns an actor with specified id.
- update( id : number ) - Updates an actor with specified id.
- delete( id : number ) - Deletes an actor with specified id.

#### and these are extra mehtods

- findMorgans( ) - Returns actors whose first name is MORGAN.
- catlizeMorgan( ) - Change an actor's first name to "貓貓".
- removeWholeFamily( lastName : string) - Delete all actors that have that last name.
- mostCommonLastName( ) - Returns the most used last name and exactly how many actors have that last name . ( eg. { lastName: "ELOHSSA" ,counts : 4 } )

### 3. Design an ActorController that

- Provides endpoints for frontend developers to do CRUD for Actors ( one of many ).
