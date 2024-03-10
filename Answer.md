1.) Explain the relationship between the "Product" and "Product_Category" entities from the above diagram ?

Ans : 

Product Entity: This entity represents individual products that are being managed within the system. Each product will have attributes with unique identifier  such as product ID, name, description, category , inventory , price, discount and other relevant information like created ,deleted and modified  product date  and  times or   manufacturer details.

Product_Category Entity: This entity represents the categories to which products belong. Categories help organize products into logical groupings, making it easier for users to browse and search for items. Categories might include things like footwear, clothing, books, etc. Each category may have attributes such as a unique identifier category ID, name, description and other possibly hierarchical relationships like subcategories.

The "Product" and "Product_Category" entities likely represent a relationship between products and their respective categories in a database schema, often used in product_inventory management systems.

*	Foreign Key: Typically, this relationship is implemented using a foreign key in the "Product" entity that references the primary key of the "Product_Category" entity. In the "Product" table, there would be a column (e.g., "category_id") that stores the identifier of the category to which the product belongs. This establishes the link between products and their respective categories.

* Referential Integrity: The foreign key constraint ensures referential integrity, meaning that the values in the "category_id" column of the "Product" table must correspond to valid category IDs present in the "Product_Category" table. This prevents orphaned records and maintains data consistency.


Hence, the "Product" and "Product_Category" entities are related through a one-to-many relationship, where each product belongs to one category, and each category can have multiple products associated with it. This relationship is typically implemented using foreign keys and ensures data integrity within the database schema.

--------------------------------------------------------------------------------------------------------------------------------------------------------------------
====================================================================================================================================================================

2.How could you ensure that each product in the "Product" table has a valid category assigned to it?
Ans :

1.)  To ensure that each product in the "Product" table has a valid category assigned to it, We can enforce this constraint at the database level using a foreign key relationship between the "Product" and "Product_Category" tables.
Foreign Key Constraint : We  Create a foreign key constraint in the "Product" table that references the primary key of the "Product_Category" table. This constraint ensures that every value in the "category_id" column of the "Product" table corresponds to a valid category ID in the "Product_Category" table.

For e.g : SQL syntax for creating a foreign key constraint:

--------------------------------------------
ALTER TABLE Product
ADD CONSTRAINT FK_Product_Category
FOREIGN KEY (category_id)
REFERENCES Product_Category(category_id);
-------------------------------------------

With this foreign key constraint in place, whenever we try to insert or update a row in the "Product" table, the database will automatically verify that the value in the "category_id" column exists in the "Product_Category" table. If the category ID does not exist, the operation will fail and ensuring that each product has a valid category assigned to it.

2.) NOT NULL Constraint: Make the "category_id" column in the "Product" table a NOT NULL column. This guarantees that every product must have a category assigned to it, preventing the insertion of NULL values.
--------------------------------------
ALTER TABLE Product
MODIFY category_id INT NOT NULL
--------------------------------------




