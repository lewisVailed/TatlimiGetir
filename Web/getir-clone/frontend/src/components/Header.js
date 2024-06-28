import React from "react";
import { Link } from 'react-router-dom';


export default function Header() {
  return (
    <div className="bg-brand-color">
      <div className="container mx-auto h-12 flex items-center justify-center md:justify-between">
        <a href="#">


        </a>
        <nav className="hidden md:flex gap-x-8 text-sm font-semibold">
          <button className="bg-brand-yellow h-8 w-20 flex items-center justify-center rounded-md  text-sm font-semibold text-primary-brand-color transition-colors hover:text-brand-yellow hover:bg-tertiary-brand-color">
          <Link to={"/admin"}>
             <a
              href="#"
              className="flex items-center gap-x-2 transition-all text-opacity-80 hover:text-opacity-100">
              Admin
            </a>
          </Link>
          </button>
          <a
            href="#"
            className="flex items-center gap-x-2 text-white transition-all text-opacity-80 hover:text-opacity-100"
          >
            {/* <BiGlobe size={20} /> */}
            TatlımıGetir'de Satış Yap
          </a>
          <a
            href="#"
            className="flex items-center gap-x-2 text-white transition-all text-opacity-80 hover:text-opacity-100"
          >
            {/* <RiUserFill size={20} /> */}
           Hakkımızda
          </a>
          <a
            href="#"
            className="flex items-center gap-x-2 text-white transition-all text-opacity-80 hover:text-opacity-100"
          >
            {/* <RiUserAddFill size={20} /> */}
            Yardım & Destek
          </a>
        </nav>
      </div>
    </div>
  );
}
