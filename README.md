# Setup

## Environments

Create .env file in root directory with following format.

> DB_NAME=db  
> DB_HOST=localhost  
> DB_USER=postgres  
> DB_PSW =123456  
> DB_PORT=5432

These are just arbitrary values I chose for local development and they are not supposed to be used in a production environment.

Make sure **.env** is listed in **.gitignore**

## Dependencies

Install dependencies with npm.

> `npm i`

## Database

Execute following commands in cli.

Schema will be created and seeds will run automatically.

> `docker-compose up`

Just to give you some context. This is a database about a video tape rental service so your will expect to see entities like Actors, Films, Customers and so ...

Source : https://github.com/morenoh149/postgresDBSamples/tree/master/pagila-0.10.1

## Reset ( You might need this once in a while)

Here are some scenarios that you might want to rest the app.

- Experiment with altering api and database schema get messed up.
- Apply migrations in an incorrect order and database schema get messed up.
- Unknowingly delete Docker volume and all data and schemas are gone.

So if there's any problem related to the database, please follow below steps one by ony in order to reclaim your sanity.

1. Delete **postgres** folder in root directory

2. Run this in cli.
   > `docker-compose down --volumes`
3. Then this.
   > `docker-compose up`

<br/>
<br/>

# Exercises

### 1. Try using "Introspect / Pull" functionality from Drizzle Kit.

- Just give it a try and see what it does.

### 2. Create an ActorService with following methods.

- getAll( ) - Returns all actors.
- getOne( id : number ) - Returns an actor with specified id.
- update( id : number ) - Updates an actor with specified id.
- delete( id : number ) - Deletes an actor with specified id.

#### and these are extra mehtods

- findMorgans( ) - Returns actors whose first name is MORGAN.
- catlizeMorgan( ) - Change an actor's first name to "貓貓" if he/she has MORGAN as first name.
- removeWholeFamily( lastName : string) - Delete all actors that have that last name.
- mostCommonLastName( ) - Returns the most used last name and exactly how many actors have that last name . ( eg. { lastName: "ELOHSSA" ,counts : 4 } )

### 3. Design an ActorController that

- Provides endpoints for frontend developers to do CRUD for Actors ( one of many ).
