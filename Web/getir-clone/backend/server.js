const express = require("express");
const mongoose = require("mongoose");
const jwt = require("jsonwebtoken");
const bcrypt = require("bcrypt");

const app = express();
app.use(express.json());

mongoose
  .connect(
    "mongodb+srv://root:betul123@cluster0.pihnjbx.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0",
    { 
        dbName:'lenslight_tr',
      //  useNewUrlParser: true, 
        //useUnifiedTopology: true
     }
  )
  .then(() => console.log("MongoDB'ye bağlandı"))
  .catch((err) => console.error("MongoDB bağlantı hatası:", err.message));

const categorySchema = new mongoose.Schema({
  name: String,
  image: String,
});
const Category = mongoose.model("Category", categorySchema);

const productSchema = new mongoose.Schema({
  name: String,
  image: String,
  price: Number,
  category: {
    type: mongoose.Schema.Types.ObjectId,
    ref: "Category",
  },
});
const Product = mongoose.model("Product", productSchema);

const userSchema = new mongoose.Schema({
  name: String,
  surname: String,
  email: String,
  password: String,
  profilePicture: String,
  phoneNumber: String,
});

app.post("/api/categories", async (req, res) => {
  try {
    const category = new Category({
      name: req.body.name,
      image: req.body.name,
    });
    await category.save();
    res.status(201).json(category);
  } catch (err) {
    res.status(400).json({ message: err.message });
  }
});


app.post("/api/products", async (req, res) => {
  try {
    const product = new Product({
      name: req.body.name,
      price: req.body.price,
    });
    await product.save();
    res.status(201).json(product);
  } catch (err) {
    res.status(400).json({ message: err.message });
  }
});

app.get("/api/products", async (req, res) => {
  try {
    const products = await Product.find();
    res.json(products);
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
});

app.delete("/api/products/:id", async (req, res) => {
    try {
      const product = await Product.findByIdAndDelete(req.params.id);
      if (!product) return res.status(404).json({ message: "Product not found" });
  
      res.json({ message: "Product deleted successfully" });
    } catch (err) {
      res.status(500).json({ message: err.message });
    }
  });
  
  

  app.put("/api/products/:id", async (req, res) => {
    try {
      const product = await Product.findById(req.params.id);
      if (!product) return res.status(404).json({ message: "Product not found" });
  
      product.name = req.body.name || product.name;
      product.price = req.body.price || product.price;
  
      await product.save();
      res.json(product);
    } catch (err) {
      res.status(400).json({ message: err.message });
    }
  });



app.listen(3001, () => {
  console.log("Server started");
});
