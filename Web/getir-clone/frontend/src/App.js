import React from 'react';
import Categories from "./components/Categories";
import Favorites from "./components/Favorites";
import Footer from "./components/Footer";
import Header from "./components/Header";
import HeroSection from "./components/HeroSection";
import MobileApp from "./components/MobileApp";
import { useWindowWidth } from "@react-hook/window-size";
import { Routes, Route } from "react-router-dom";
import AdminPanel from './components/AdminPanel';


function App() {
  const windowWith = useWindowWidth();

  return (
    <div className="App">
      <Header />
      <Routes>
        <Route path="/admin" element={<AdminPanel />} />
      
        <Route 
          path="/" 
          element={
            <>
              <HeroSection />
              <Categories />
              <div className="container mx-auto grid gap-y-6 pt-8">
                <Favorites />
                <MobileApp />
              </div>
              <Footer />
            </>
          }
        />
      </Routes>
    </div>
  );
}

export default App;
