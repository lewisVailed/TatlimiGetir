/* eslint-disable jsx-a11y/alt-text */
import React from "react";
import { FiPlus } from "react-icons/fi";
export default function ProductItem({ product }) {
  return (
    <div className="bg-white flex flex-col group items-center text-center gap-y-1 relative text-sm font-semibold p-6">
      <button className="w-8 h-8 flex absolute top-0 right-2 border shadow-md rounded-lg border-gray-200 text-purple-700 transition-colors bg-white hover:bg-purple-50 items-center justify-center">
        <FiPlus size={16} />
      </button>
      <img className="w-20 h-20" src={product.image} alt="product.title" />
      <div className=" text-brand-color">{product.price}</div>
      <div className=" text-gray-900">{product.name}</div>
      <div className="text-gray-500">{product.alt}</div>
    </div>
  );
}
