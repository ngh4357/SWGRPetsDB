# SWGRPetsDB
This is a database designed for Star Wars Galaxies Restoration.  The data has been reverse engineered from SWGPets.com.  The Database has been developed using MySQL 8.0.42.

The repository currently includes 3 files:
swg_pets_restoration.png :  This is an ER diagram of the database.
swgr_pets-schema-beta.sql is a database schema-only file.
swgr_pets_with-data-beta.sql is the full database, including data.

At this time, the schema includes all needed foreign keys in order to incorporate data normalization.  However, referential integrity between related tables has not been configured.  This has been done on purpose as we validate the data and database schema.
