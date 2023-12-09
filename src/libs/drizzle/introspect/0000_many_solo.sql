-- Current sql file was generated after introspecting the database
-- If you want to run this migration please uncomment this code before executing migrations
/*
DO $$ BEGIN
 CREATE TYPE "mpaa_rating" AS ENUM('NC-17', 'R', 'PG-13', 'PG', 'G');
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "actor" (
	"actor_id" integer PRIMARY KEY DEFAULT nextval('actor_actor_id_seq'::regclass) NOT NULL,
	"first_name" varchar(45) NOT NULL,
	"last_name" varchar(45) NOT NULL,
	"last_update" timestamp DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "actor_info" (
	"actor_id" integer,
	"first_name" varchar(45),
	"last_name" varchar(45),
	"film_info" text
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "customer_list" (
	"id" integer,
	"name" text,
	"address" varchar(50),
	"zip code" varchar(10),
	"phone" varchar(20),
	"city" varchar(50),
	"country" varchar(50),
	"notes" text,
	"sid" smallint
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "film_list" (
	"fid" integer,
	"title" varchar(255),
	"description" text,
	"category" varchar(25),
	"price" numeric(4, 2),
	"length" smallint,
	"rating" "mpaa_rating",
	"actors" text
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "nicer_but_slower_film_list" (
	"fid" integer,
	"title" varchar(255),
	"description" text,
	"category" varchar(25),
	"price" numeric(4, 2),
	"length" smallint,
	"rating" "mpaa_rating",
	"actors" text
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "film" (
	"film_id" integer PRIMARY KEY DEFAULT nextval('film_film_id_seq'::regclass) NOT NULL,
	"title" varchar(255) NOT NULL,
	"description" text,
	"release_year" "year",
	"language_id" smallint NOT NULL,
	"original_language_id" smallint,
	"rental_duration" smallint DEFAULT 3 NOT NULL,
	"rental_rate" numeric(4, 2) DEFAULT 4.99 NOT NULL,
	"length" smallint,
	"replacement_cost" numeric(5, 2) DEFAULT 19.99 NOT NULL,
	"rating" "mpaa_rating" DEFAULT 'G',
	"last_update" timestamp DEFAULT now() NOT NULL,
	"special_features" text[],
	"fulltext" "tsvector" NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "payment_p2007_02" (
	"payment_id" integer DEFAULT nextval('payment_payment_id_seq'::regclass) NOT NULL,
	"customer_id" smallint NOT NULL,
	"staff_id" smallint NOT NULL,
	"rental_id" integer NOT NULL,
	"amount" numeric(5, 2) NOT NULL,
	"payment_date" timestamp NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "payment_p2007_03" (
	"payment_id" integer DEFAULT nextval('payment_payment_id_seq'::regclass) NOT NULL,
	"customer_id" smallint NOT NULL,
	"staff_id" smallint NOT NULL,
	"rental_id" integer NOT NULL,
	"amount" numeric(5, 2) NOT NULL,
	"payment_date" timestamp NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "payment_p2007_04" (
	"payment_id" integer DEFAULT nextval('payment_payment_id_seq'::regclass) NOT NULL,
	"customer_id" smallint NOT NULL,
	"staff_id" smallint NOT NULL,
	"rental_id" integer NOT NULL,
	"amount" numeric(5, 2) NOT NULL,
	"payment_date" timestamp NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "payment_p2007_05" (
	"payment_id" integer DEFAULT nextval('payment_payment_id_seq'::regclass) NOT NULL,
	"customer_id" smallint NOT NULL,
	"staff_id" smallint NOT NULL,
	"rental_id" integer NOT NULL,
	"amount" numeric(5, 2) NOT NULL,
	"payment_date" timestamp NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "payment_p2007_06" (
	"payment_id" integer DEFAULT nextval('payment_payment_id_seq'::regclass) NOT NULL,
	"customer_id" smallint NOT NULL,
	"staff_id" smallint NOT NULL,
	"rental_id" integer NOT NULL,
	"amount" numeric(5, 2) NOT NULL,
	"payment_date" timestamp NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "sales_by_film_category" (
	"category" varchar(25),
	"total_sales" numeric
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "payment_p2007_01" (
	"payment_id" integer DEFAULT nextval('payment_payment_id_seq'::regclass) NOT NULL,
	"customer_id" smallint NOT NULL,
	"staff_id" smallint NOT NULL,
	"rental_id" integer NOT NULL,
	"amount" numeric(5, 2) NOT NULL,
	"payment_date" timestamp NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "address" (
	"address_id" integer PRIMARY KEY DEFAULT nextval('address_address_id_seq'::regclass) NOT NULL,
	"address" varchar(50) NOT NULL,
	"address2" varchar(50),
	"district" varchar(20) NOT NULL,
	"city_id" smallint NOT NULL,
	"postal_code" varchar(10),
	"phone" varchar(20) NOT NULL,
	"last_update" timestamp DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "category" (
	"category_id" integer PRIMARY KEY DEFAULT nextval('category_category_id_seq'::regclass) NOT NULL,
	"name" varchar(25) NOT NULL,
	"last_update" timestamp DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "city" (
	"city_id" integer PRIMARY KEY DEFAULT nextval('city_city_id_seq'::regclass) NOT NULL,
	"city" varchar(50) NOT NULL,
	"country_id" smallint NOT NULL,
	"last_update" timestamp DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "country" (
	"country_id" integer PRIMARY KEY DEFAULT nextval('country_country_id_seq'::regclass) NOT NULL,
	"country" varchar(50) NOT NULL,
	"last_update" timestamp DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "customer" (
	"customer_id" integer PRIMARY KEY DEFAULT nextval('customer_customer_id_seq'::regclass) NOT NULL,
	"store_id" smallint NOT NULL,
	"first_name" varchar(45) NOT NULL,
	"last_name" varchar(45) NOT NULL,
	"email" varchar(50),
	"address_id" smallint NOT NULL,
	"activebool" boolean DEFAULT true NOT NULL,
	"create_date" date DEFAULT ''now'::text' NOT NULL,
	"last_update" timestamp DEFAULT now(),
	"active" integer
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "inventory" (
	"inventory_id" integer PRIMARY KEY DEFAULT nextval('inventory_inventory_id_seq'::regclass) NOT NULL,
	"film_id" smallint NOT NULL,
	"store_id" smallint NOT NULL,
	"last_update" timestamp DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "language" (
	"language_id" integer PRIMARY KEY DEFAULT nextval('language_language_id_seq'::regclass) NOT NULL,
	"name" char(20) NOT NULL,
	"last_update" timestamp DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "rental" (
	"rental_id" integer PRIMARY KEY DEFAULT nextval('rental_rental_id_seq'::regclass) NOT NULL,
	"rental_date" timestamp NOT NULL,
	"inventory_id" integer NOT NULL,
	"customer_id" smallint NOT NULL,
	"return_date" timestamp,
	"staff_id" smallint NOT NULL,
	"last_update" timestamp DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "staff" (
	"staff_id" integer PRIMARY KEY DEFAULT nextval('staff_staff_id_seq'::regclass) NOT NULL,
	"first_name" varchar(45) NOT NULL,
	"last_name" varchar(45) NOT NULL,
	"address_id" smallint NOT NULL,
	"email" varchar(50),
	"store_id" smallint NOT NULL,
	"active" boolean DEFAULT true NOT NULL,
	"username" varchar(16) NOT NULL,
	"password" varchar(40),
	"last_update" timestamp DEFAULT now() NOT NULL,
	"picture" "bytea"
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "sales_by_store" (
	"store" text,
	"manager" text,
	"total_sales" numeric
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "staff_list" (
	"id" integer,
	"name" text,
	"address" varchar(50),
	"zip code" varchar(10),
	"phone" varchar(20),
	"city" varchar(50),
	"country" varchar(50),
	"sid" smallint
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "store" (
	"store_id" integer PRIMARY KEY DEFAULT nextval('store_store_id_seq'::regclass) NOT NULL,
	"manager_staff_id" smallint NOT NULL,
	"address_id" smallint NOT NULL,
	"last_update" timestamp DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "payment" (
	"payment_id" integer PRIMARY KEY DEFAULT nextval('payment_payment_id_seq'::regclass) NOT NULL,
	"customer_id" smallint NOT NULL,
	"staff_id" smallint NOT NULL,
	"rental_id" integer NOT NULL,
	"amount" numeric(5, 2) NOT NULL,
	"payment_date" timestamp NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "film_actor" (
	"actor_id" smallint NOT NULL,
	"film_id" smallint NOT NULL,
	"last_update" timestamp DEFAULT now() NOT NULL,
	CONSTRAINT film_actor_pkey PRIMARY KEY("actor_id","film_id")
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "film_category" (
	"film_id" smallint NOT NULL,
	"category_id" smallint NOT NULL,
	"last_update" timestamp DEFAULT now() NOT NULL,
	CONSTRAINT film_category_pkey PRIMARY KEY("film_id","category_id")
);
--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "idx_actor_last_name" ON "actor" ("last_name");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "film_fulltext_idx" ON "film" ("fulltext");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "idx_fk_language_id" ON "film" ("language_id");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "idx_fk_original_language_id" ON "film" ("original_language_id");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "idx_title" ON "film" ("title");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "idx_fk_payment_p2007_02_customer_id" ON "payment_p2007_02" ("customer_id");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "idx_fk_payment_p2007_02_staff_id" ON "payment_p2007_02" ("staff_id");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "idx_fk_payment_p2007_03_customer_id" ON "payment_p2007_03" ("customer_id");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "idx_fk_payment_p2007_03_staff_id" ON "payment_p2007_03" ("staff_id");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "idx_fk_payment_p2007_04_customer_id" ON "payment_p2007_04" ("customer_id");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "idx_fk_payment_p2007_04_staff_id" ON "payment_p2007_04" ("staff_id");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "idx_fk_payment_p2007_05_customer_id" ON "payment_p2007_05" ("customer_id");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "idx_fk_payment_p2007_05_staff_id" ON "payment_p2007_05" ("staff_id");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "idx_fk_payment_p2007_06_customer_id" ON "payment_p2007_06" ("customer_id");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "idx_fk_payment_p2007_06_staff_id" ON "payment_p2007_06" ("staff_id");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "idx_fk_payment_p2007_01_customer_id" ON "payment_p2007_01" ("customer_id");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "idx_fk_payment_p2007_01_staff_id" ON "payment_p2007_01" ("staff_id");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "idx_fk_city_id" ON "address" ("city_id");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "idx_fk_country_id" ON "city" ("country_id");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "idx_fk_address_id" ON "customer" ("address_id");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "idx_fk_store_id" ON "customer" ("store_id");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "idx_last_name" ON "customer" ("last_name");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "idx_store_id_film_id" ON "inventory" ("film_id","store_id");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "idx_fk_inventory_id" ON "rental" ("inventory_id");--> statement-breakpoint
CREATE UNIQUE INDEX IF NOT EXISTS "idx_unq_rental_rental_date_inventory_id_customer_id" ON "rental" ("rental_date","inventory_id","customer_id");--> statement-breakpoint
CREATE UNIQUE INDEX IF NOT EXISTS "idx_unq_manager_staff_id" ON "store" ("manager_staff_id");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "idx_fk_customer_id" ON "payment" ("customer_id");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "idx_fk_staff_id" ON "payment" ("staff_id");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "idx_fk_film_id" ON "film_actor" ("film_id");--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "film" ADD CONSTRAINT "film_original_language_id_fkey" FOREIGN KEY ("original_language_id") REFERENCES "language"("language_id") ON DELETE restrict ON UPDATE cascade;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "film" ADD CONSTRAINT "film_language_id_fkey" FOREIGN KEY ("language_id") REFERENCES "language"("language_id") ON DELETE restrict ON UPDATE cascade;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "payment_p2007_02" ADD CONSTRAINT "payment_p2007_02_customer_id_fkey" FOREIGN KEY ("customer_id") REFERENCES "customer"("customer_id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "payment_p2007_02" ADD CONSTRAINT "payment_p2007_02_rental_id_fkey" FOREIGN KEY ("rental_id") REFERENCES "rental"("rental_id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "payment_p2007_02" ADD CONSTRAINT "payment_p2007_02_staff_id_fkey" FOREIGN KEY ("staff_id") REFERENCES "staff"("staff_id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "payment_p2007_03" ADD CONSTRAINT "payment_p2007_03_customer_id_fkey" FOREIGN KEY ("customer_id") REFERENCES "customer"("customer_id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "payment_p2007_03" ADD CONSTRAINT "payment_p2007_03_rental_id_fkey" FOREIGN KEY ("rental_id") REFERENCES "rental"("rental_id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "payment_p2007_03" ADD CONSTRAINT "payment_p2007_03_staff_id_fkey" FOREIGN KEY ("staff_id") REFERENCES "staff"("staff_id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "payment_p2007_04" ADD CONSTRAINT "payment_p2007_04_customer_id_fkey" FOREIGN KEY ("customer_id") REFERENCES "customer"("customer_id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "payment_p2007_04" ADD CONSTRAINT "payment_p2007_04_rental_id_fkey" FOREIGN KEY ("rental_id") REFERENCES "rental"("rental_id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "payment_p2007_04" ADD CONSTRAINT "payment_p2007_04_staff_id_fkey" FOREIGN KEY ("staff_id") REFERENCES "staff"("staff_id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "payment_p2007_05" ADD CONSTRAINT "payment_p2007_05_customer_id_fkey" FOREIGN KEY ("customer_id") REFERENCES "customer"("customer_id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "payment_p2007_05" ADD CONSTRAINT "payment_p2007_05_rental_id_fkey" FOREIGN KEY ("rental_id") REFERENCES "rental"("rental_id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "payment_p2007_05" ADD CONSTRAINT "payment_p2007_05_staff_id_fkey" FOREIGN KEY ("staff_id") REFERENCES "staff"("staff_id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "payment_p2007_06" ADD CONSTRAINT "payment_p2007_06_customer_id_fkey" FOREIGN KEY ("customer_id") REFERENCES "customer"("customer_id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "payment_p2007_06" ADD CONSTRAINT "payment_p2007_06_rental_id_fkey" FOREIGN KEY ("rental_id") REFERENCES "rental"("rental_id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "payment_p2007_06" ADD CONSTRAINT "payment_p2007_06_staff_id_fkey" FOREIGN KEY ("staff_id") REFERENCES "staff"("staff_id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "payment_p2007_01" ADD CONSTRAINT "payment_p2007_01_customer_id_fkey" FOREIGN KEY ("customer_id") REFERENCES "customer"("customer_id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "payment_p2007_01" ADD CONSTRAINT "payment_p2007_01_rental_id_fkey" FOREIGN KEY ("rental_id") REFERENCES "rental"("rental_id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "payment_p2007_01" ADD CONSTRAINT "payment_p2007_01_staff_id_fkey" FOREIGN KEY ("staff_id") REFERENCES "staff"("staff_id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "address" ADD CONSTRAINT "address_city_id_fkey" FOREIGN KEY ("city_id") REFERENCES "city"("city_id") ON DELETE restrict ON UPDATE cascade;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "city" ADD CONSTRAINT "city_country_id_fkey" FOREIGN KEY ("country_id") REFERENCES "country"("country_id") ON DELETE restrict ON UPDATE cascade;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "customer" ADD CONSTRAINT "customer_address_id_fkey" FOREIGN KEY ("address_id") REFERENCES "address"("address_id") ON DELETE restrict ON UPDATE cascade;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "customer" ADD CONSTRAINT "customer_store_id_fkey" FOREIGN KEY ("store_id") REFERENCES "store"("store_id") ON DELETE restrict ON UPDATE cascade;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "inventory" ADD CONSTRAINT "inventory_film_id_fkey" FOREIGN KEY ("film_id") REFERENCES "film"("film_id") ON DELETE restrict ON UPDATE cascade;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "inventory" ADD CONSTRAINT "inventory_store_id_fkey" FOREIGN KEY ("store_id") REFERENCES "store"("store_id") ON DELETE restrict ON UPDATE cascade;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "rental" ADD CONSTRAINT "rental_customer_id_fkey" FOREIGN KEY ("customer_id") REFERENCES "customer"("customer_id") ON DELETE restrict ON UPDATE cascade;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "rental" ADD CONSTRAINT "rental_inventory_id_fkey" FOREIGN KEY ("inventory_id") REFERENCES "inventory"("inventory_id") ON DELETE restrict ON UPDATE cascade;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "rental" ADD CONSTRAINT "rental_staff_id_fkey" FOREIGN KEY ("staff_id") REFERENCES "staff"("staff_id") ON DELETE restrict ON UPDATE cascade;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "staff" ADD CONSTRAINT "staff_address_id_fkey" FOREIGN KEY ("address_id") REFERENCES "address"("address_id") ON DELETE restrict ON UPDATE cascade;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "staff" ADD CONSTRAINT "staff_store_id_fkey" FOREIGN KEY ("store_id") REFERENCES "store"("store_id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "store" ADD CONSTRAINT "store_address_id_fkey" FOREIGN KEY ("address_id") REFERENCES "address"("address_id") ON DELETE restrict ON UPDATE cascade;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "store" ADD CONSTRAINT "store_manager_staff_id_fkey" FOREIGN KEY ("manager_staff_id") REFERENCES "staff"("staff_id") ON DELETE restrict ON UPDATE cascade;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "payment" ADD CONSTRAINT "payment_customer_id_fkey" FOREIGN KEY ("customer_id") REFERENCES "customer"("customer_id") ON DELETE restrict ON UPDATE cascade;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "payment" ADD CONSTRAINT "payment_rental_id_fkey" FOREIGN KEY ("rental_id") REFERENCES "rental"("rental_id") ON DELETE set null ON UPDATE cascade;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "payment" ADD CONSTRAINT "payment_staff_id_fkey" FOREIGN KEY ("staff_id") REFERENCES "staff"("staff_id") ON DELETE restrict ON UPDATE cascade;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "film_actor" ADD CONSTRAINT "film_actor_actor_id_fkey" FOREIGN KEY ("actor_id") REFERENCES "actor"("actor_id") ON DELETE restrict ON UPDATE cascade;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "film_actor" ADD CONSTRAINT "film_actor_film_id_fkey" FOREIGN KEY ("film_id") REFERENCES "film"("film_id") ON DELETE restrict ON UPDATE cascade;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "film_category" ADD CONSTRAINT "film_category_category_id_fkey" FOREIGN KEY ("category_id") REFERENCES "category"("category_id") ON DELETE restrict ON UPDATE cascade;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "film_category" ADD CONSTRAINT "film_category_film_id_fkey" FOREIGN KEY ("film_id") REFERENCES "film"("film_id") ON DELETE restrict ON UPDATE cascade;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;

*/