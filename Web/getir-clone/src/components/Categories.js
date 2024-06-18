import React, { useEffect, useState } from "react";
import categoryData from "../api/categories.json";
import Category from "./ui/Category";
import Title from "./ui/Title";

export default function Categories() {
  const [categories, setCategories] = useState([]);

  useEffect(() => {
    setCategories(categoryData);
  }, []);
  return (
    <div className="bg-white py-4">
      <div className="container mx-auto">
        <h1 className="flex flex-col group items-center text-center mt-8 mb-10 font-semibold text-gray-900 text-lg">Kategoriler</h1>
        <div className="mt-5 grid grid-cols-3 md:grid-cols-3 lg:grid-cols-5 xl:grid-cols-8 2xl:grid-cols-8 gap-0.1 bg-white rounded-lg overflow-hidden">
          {categories &&
            categories.map((category, index) => (
              <Category key={index} category={category} />
            ))}
        </div>
      </div>
    </div>
  );
}
