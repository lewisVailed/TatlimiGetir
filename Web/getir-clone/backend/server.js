const express = require('express');
const bodyParser = require('body-parser');

const app = express();
app.use(bodyParser.json());

let products = [
    { id: 1, name: 'Supangle', image: '/images/products3.jpg' },
    { id: 2, name: 'Böğürtlenli Dondurma', image: '/images/products2.jpg' },
    { id: 3, name: 'Çikolatalı Kurabiye', image: '/images/products1.jpg' },
];

// Get all products
app.get('/api/products', (req, res) => {
    res.json(products);
});

// Add a new product
app.post('/api/products', (req, res) => {
    const newProduct = req.body;
    newProduct.id = products.length ? products[products.length - 1].id + 1 : 1;
    products.push(newProduct);
    res.status(201).json(newProduct);
});

// Delete a product
app.delete('/api/products/:id', (req, res) => {
    const productId = parseInt(req.params.id, 10);
    products = products.filter(product => product.id !== productId);
    res.status(204).end();
});

// Update a product
app.put('/api/products/:id', (req, res) => {
    const productId = parseInt(req.params.id, 10);
    const updatedProduct = req.body;
    products = products.map(product => 
        product.id === productId ? { ...product, ...updatedProduct } : product
    );
    res.json(updatedProduct);
});

const PORT = process.env.PORT || 5000;
app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
});
