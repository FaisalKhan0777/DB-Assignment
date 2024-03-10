CREATE TABLE product
(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    description TEXT,
    SKU VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    inventory_id INT,
    price DECIMAL(10, 2),
    discount_id INT,
    modified_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP
);


CREATE TABLE product_category
(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    discount_id INT,
    deleted_at TIMESTAMP
);


CREATE TABLE product_inventory 
(
    id SERIAL PRIMARY KEY,
    product_id INT,
    quantity INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modified_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP
);



CREATE TABLE discount
(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    description TEXT,
    discount_percent DECIMAL(5, 2),
    active BOOLEAN DEFAULT 1, -- Using 1 to represent true
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modified_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP
);


ALTER TABLE product ADD CONSTRAINT fk_product_inventory FOREIGN KEY (inventory_id) REFERENCES product_inventory(id);
ALTER TABLE product ADD CONSTRAINT fk_product_discount FOREIGN KEY (discount_id) REFERENCES discount(id);
ALTER TABLE product_category ADD CONSTRAINT fk_category_discount FOREIGN KEY (discount_id) REFERENCES discount(id);
ALTER TABLE product_inventory ADD CONSTRAINT fk_inventory_product FOREIGN KEY (product_id) REFERENCES product(id);
