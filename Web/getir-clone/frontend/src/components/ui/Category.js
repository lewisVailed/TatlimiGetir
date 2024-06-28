import React from "react";

export default function Category({ category: { id, name, image } }) {
  return (
    <a
      href="##"
      className="flex flex-col group items-center text-center p-4 gap-y-2 transition hover:bg-purple-50"
    >
      <img
        src={image}
        alt="name"
        className=" w-14 h-14 object-cover rounded-full border border-gray-200"
      />
      <span className="text-md mt-2 font-semibold text-gray-700 group-hover:text-brand-color tracking-tight">
        {name}
      </span>
    </a>
  );
}
