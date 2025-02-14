
CREATE TABLE Orders (
    order_id VARCHAR(10) PRIMARY KEY,
    placement_date DATETIME NOT NULL
);


CREATE TABLE OrderItems (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id VARCHAR(10),
    item_id VARCHAR(10),
    quantity INT NOT NULL,
    item_price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (item_id) REFERENCES Items(item_id)
);


CREATE TABLE Items (
    item_id VARCHAR(10) PRIMARY KEY,
    item_name VARCHAR(100) NOT NULL,
    item_category VARCHAR(100) NOT NULL,
    item_size VARCHAR(10) NOT NULL,
    item_price DECIMAL(10, 2) NOT NULL
);


CREATE TABLE Ingredients (
    ingredient_id VARCHAR(10) PRIMARY KEY,
    ingredient_name VARCHAR(200) NOT NULL,
    measurement VARCHAR(20) NOT NULL,
    ingredient_price DECIMAL(5, 2) NOT NULL
);


CREATE TABLE ItemIngredients (
    item_id VARCHAR(10),
    ingredient_id VARCHAR(10),
    quantity_required INT NOT NULL,
    PRIMARY KEY (item_id, ingredient_id),
    FOREIGN KEY (item_id) REFERENCES Items(item_id),
    FOREIGN KEY (ingredient_id) REFERENCES Ingredients(ingredient_id)
);


CREATE TABLE Inventory (
    inventory_id INT AUTO_INCREMENT PRIMARY KEY,
    item_id VARCHAR(10),
    ingredient_id VARCHAR(10),
    quantity INT NOT NULL,
    FOREIGN KEY (item_id) REFERENCES Items(item_id),
    FOREIGN KEY (ingredient_id) REFERENCES Ingredients(ingredient_id)
);


