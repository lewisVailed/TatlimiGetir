import React from 'react';

const AdminPanel = () => {
  return (
    <div className="container mx-auto mt-8">
      <h2 className="text-lg font-semibold mb-4">Admin Paneli</h2>
      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4 w-[800px] h-[300px]">
        {/* Ürün 1 */}
        <div className="bg-white p-3 rounded-lg shadow-md ">
          <img src="/images/products3.jpg" alt="Ürün Resmi" className="object-cover rounded-lg mb-4 w-[200px] h-[160px]" />
          <h3 className="text-md font-semibold mb-2">Supangle</h3>
          <div className="flex justify-between items-center">
            <button className="bg-red-600 text-white px-4 py-2 rounded-md hover:bg-red-700  w-[60px] h-[60px] text-sm">Ürünü Sil</button>
            <button className="bg-blue-600 text-white px-4 py-2 rounded-md hover:bg-blue-700 w-[80px] h-[60px] text-sm">Ürünü Güncelle</button>
          </div>
        </div>
        {/* Ürün 2 */}
        <div className="bg-white p-3 rounded-lg shadow-md">
          <img src="/images/products2.jpg" alt="Ürün Resmi" className="object-cover rounded-lg mb-4 w-[200px] h-[150px]" />
          <h3 className="text-md font-semibold mb-2">Böğürtlenli Dondurma</h3>
          <div className="flex justify-between items-center">
            <button className="bg-red-600 text-white px-4 py-2 rounded-md hover:bg-red-700  w-[60px] h-[60px] text-sm">Ürünü Sil</button>
            <button className="bg-blue-600 text-white px-4 py-2 rounded-md hover:bg-blue-700  w-[80px] h-[60px] text-sm">Ürünü Güncelle</button>
          </div>
        </div>
        {/* Ürün 3 */}
        <div className="bg-white p-3 rounded-lg shadow-md">
          <img src="/images/products1.jpg" alt="Ürün Resmi" className="object-cover rounded-lg mb-4 w-[200px] h-[150px]" />
          <h3 className="text-md font-semibold mb-2">Çikolatalı Kurabiye</h3>
          <div className="flex justify-between items-center">
            <button className="bg-red-600 text-white px-4 py-2 rounded-md hover:bg-red-700  w-[60px] h-[60px] text-sm">Ürünü Sil</button>
            <button className="bg-blue-600 text-white px-4 py-2 rounded-md hover:bg-blue-700 w-[80px] h-[60px] text-sm">Ürünü Güncelle</button>
          </div>
        </div>
      
        {/* Diğer Ürünler */}

        {/* İhtiyacınıza göre istediğiniz kadar ürün ekleyebilirsiniz */}
      </div>
  <button className="bg-brand-purple h-10 w-40 mt-8 flex items-center justify-center rounded-md  text-sm font-semibold text-primary-brand-color transition-colors hover:text-brand-yellow hover:bg-tertiary-brand-color">
            <a
              href="#"
              className=" text-white rounded-md text-sm">
              Ürün Ekle
            </a>
          </button>
    </div>

  );


};

export default AdminPanel;

