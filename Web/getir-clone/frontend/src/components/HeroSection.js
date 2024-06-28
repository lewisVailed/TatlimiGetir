import React, { useState } from "react";
import ReactFlagsSelect from "react-flags-select";
import { useWindowWidth } from "@react-hook/window-size";
import Modal from "react-modal";
// import { auth, provider } from "../firebase";


Modal.setAppElement('#root'); // Modal bileşenini kök element ile ilişkilendirin

export default function HeroSection() {
//   const login= () =>{
// auth.signInWithPopup(provider).catch((error)=>alert(error.message));
//   }

  const [selected, setSelected] = useState("TR");
  const windowWith = useWindowWidth();
  const phones = {
    US: "+1",
    DE: "+50",
    TR: "+90",
    IT: "+7",
  };
  const settings = {
    dots: false,
    infinite: true,
    speed: 500,
    autoplay: true,
    autoplaySpeed: 2000,
    arrows: false,
    slidesToShow: 1,
    slidesToScroll: 1,
  };

  const [isSignupModalOpen, setIsSignupModalOpen] = useState(false);
  const [isLoginModalOpen, setIsLoginModalOpen] = useState(false);
  const openSignupModal = () => {
    setIsSignupModalOpen(true);
    setIsLoginModalOpen(false); // Giriş yap modalını kapat
  };

  const closeSignupModal = () => {
    setIsSignupModalOpen(false);
  };
  const openLoginModal = () => {
    setIsLoginModalOpen(true);
    setIsSignupModalOpen(false); // Kayıt ol modalını kapat
  };

  const closeLoginModal = () => {
    setIsLoginModalOpen(false);
  };

  const customStyles = {
    overlay: {
      backgroundColor: 'rgba(0, 0, 0, 0.75)', // Arka planı yarı saydam yap
      zIndex: 1000, // Z-index değeri ile öne çıkar
    },
    content: {
      top: '50%',
      left: '50%',
      right: 'auto',
      bottom: 'auto',
      marginRight: '-50%',
      transform: 'translate(-50%, -50%)',
      width: '90%',
      maxWidth: '400px',
      border: 'none',
      borderRadius: '8px',
      padding: '20px',
      maxHeight: '90vh', // Modal içeriğini ekran yüksekliğine sınırlamak
      overflow: 'hidden', // Taşan içeriği gizle
    },
  };

  return (
    <div className="relative h-auto md:h-[470px] before:bg-gradient-to-r before:from-quaternary-brand-color before:to-transparent before:absolute before:inset-0 before:w-full before:h-full before:z-10">
      {windowWith >= 768 && (
        <div>
          <img
            className="w-full h-[470px] object-cover"
            src="https://i.pinimg.com/564x/99/9b/c5/999bc517c877ec79007ef7669a91978e.jpg"
          />
        </div>
      )}
      <div className="md:container flex justify-end items-center relative md:absolute top-0 left  md:left-1/2 translate-x-0 md:-translate-x-1/2 h-full z-20">
        <div className="hidden md:block">
        </div>
        <div className="w-full md:w-[400px] md:roundedlg bg-purple-100 p-6">
          <h4 className="text-primary-brand-color text-center font-semibold mb-4">
            Giriş yap
          </h4>
          <div className="grid gap-y-3">
            <div className="flex gap-x-2">
              <ReactFlagsSelect
                countries={Object.keys(phones)}
                customLabels={phones}
                onSelect={(code) => setSelected(code)}
                selected={selected}
                className="flag-select"
              />
              <label className="flex-1 relative group block cursor-pointer">
                <input
                  required
                  className=" h-[46px] px-4 border-2 border-gray-200 rounded w-full transition-colors group-hover:border-primary-brand-color outline-none focus:border-primary-brand-color text-sm pt-2 peer"
                />
               <span className="absolute top-0 left-0 h-full px-4 flex items-center text-sm text-gray-500 peer-focus:h-7 transition-all peer-focus:text-primary-brand-color peer-focus:text-xs peer-valid:h-7 tra peer-valid:text-primary-brand-color peer-valid:text-xs">
                  Telefon Numarası
                </span>
              </label>
            </div>
           <button
             className="bg-brand-yellow h-12 flex items-center justify-center rounded-md mt-2 w-full text-sm font-semibold text-primary-brand-color transition-colors hover:text-brand-yellow hover:bg-primary-brand-color">
               Telefon numarası ile devam et 
            </button>
            <hr className="h-[1px] bg-gray300 mt-3"></hr>
            <div
              className=" h-12 flex items-center justify-center rounded-md w-full text-[14px] font-semibold transition-colors">
              <span className="text-gray-700 ">
                Hala kayıt olmadın mı?&nbsp;
              </span>
              <div kind="transparent" className="text-primary-brand-color hover:text-brand-yellow">
                <button type="button" onClick={openSignupModal}>Kayıt Ol</button>
              </div>
            </div>
          </div>
        </div>

        <Modal
          isOpen={isLoginModalOpen}
          onRequestClose={closeLoginModal}
          style={customStyles}
        >
          <div className="w-full md:w-[400px] md:roundedlg bg-gray-50 p-6">
            <h4 className="text-primary-brand-color text-center font-semibold mb-4">
              Giriş yap
            </h4>
            <div className="grid gap-y-3">
              <div className="flex gap-x-2">
                <ReactFlagsSelect
                  countries={Object.keys(phones)}
                  customLabels={phones}
                  onSelect={(code) => setSelected(code)}
                  selected={selected}
                  className="flag-select"
                />
                <label className="flex-1 relative group block cursor-pointer">
                  <input
                    required
                    className=" h-[46px] px-4 border-2 border-gray-200 rounded w-full transition-colors group-hover:border-primary-brand-color outline-none focus:border-primary-brand-color text-sm pt-2 peer"
                  />
                  <span className="absolute top-0 left-0 h-full px-4 flex items-center text-sm text-gray-500 peer-focus:h-7 transition-all peer-focus:text-primary-brand-color peer-focus:text-xs peer-valid:h-7 tra peer-valid:text-primary-brand-color peer-valid:text-xs">
                    Telefon Numarası
                  </span>
                </label>
              </div>
              <button className="bg-brand-yellow h-12 flex items-center justify-center rounded-md mt-2 w-full text-sm font-semibold text-primary-brand-color transition-colors hover:text-brand-yellow hover:bg-primary-brand-color">
                Telefon numarası ile devam et
              </button>
              <hr className="h-[1px] bg-gray300 mt-3"></hr>
              <div
                className=" h-12 flex items-center justify-center rounded-md w-full text-[14px] font-semibold transition-colors">
                <span className="text-gray-700 ">
                  Hala kayıt olmadın mı?&nbsp;
                </span>
                <div kind="transparent" className="text-primary-brand-color hover:text-brand-yellow">
                  <button type="button" onClick={openSignupModal}>Kayıt Ol</button>
                </div>
              </div>
            </div>
          </div>
        </Modal>

        <Modal
          isOpen={isSignupModalOpen}
          onRequestClose={closeSignupModal}
          style={customStyles}
        >
          <div className="w-full md:w-[400px] md:roundedlg bg-gray-50 p-6">
            <h4 className="text-brand-purple text-center font-semibold mb-4">
              Kayıt Ol
            </h4>
            <div className="grid gap-y-3">
              <div className="flex gap-x-2">
                <ReactFlagsSelect
                  countries={Object.keys(phones)}
                  customLabels={phones}
                  onSelect={(code) => setSelected(code)}
                  selected={selected}
                  className="flag-select"
                />
                <label className="flex-1 relative group block cursor-pointer">
                  <input
                    required
                    className=" h-[46px] px-4 border-2 border-gray-200 rounded w-full transition-colors group-hover:border-primary-brand-color outline-none focus:border-primary-brand-color text-sm pt-2 peer"
                  />
                  <span className="absolute top-0 left-0 h-full px-4 flex items-center text-sm text-gray-500 peer-focus:h-7 transition-all peer-focus:text-primary-brand-color peer-focus:text-xs peer-valid:h-7 tra peer-valid:text-primary-brand-color peer-valid:text-xs">
                    Telefon Numarası
                  </span>
                </label>
              </div>
              <div className="flex gap-x-2">
                <label className="flex-1 relative group block cursor-pointer">
                  <input
                    required
                    className=" h-[46px] px-4 border-2 border-gray-200 rounded w-full transition-colors group-hover:border-primary-brand-color outline-none focus:border-primary-brand-color text-sm pt-2 peer"
                  />
                  <span className="absolute top-0 left-0 h-full px-4 flex items-center text-sm text-gray-500 peer-focus:h-7 transition-all peer-focus:text-primary-brand-color peer-focus:text-xs peer-valid:h-7 tra peer-valid:text-primary-brand-color peer-valid:text-xs">
                    Ad Soyad
                  </span>
                </label>
              </div>
              <div className="flex gap-x-2">
                <label className="flex-1 relative group block cursor-pointer">
                  <input
                    required
                    className=" h-[46px] px-4 border-2 border-gray-200 rounded w-full transition-colors group-hover:border-primary-brand-color outline-none focus:border-primary-brand-color text-sm pt-2 peer"
                  />
                  <span className="absolute top-0 left-0 h-full px-4 flex items-center text-sm text-gray-500 peer-focus:h-7 transition-all peer-focus:text-primary-brand-color peer-focus:text-xs peer-valid:h-7 tra peer-valid:text-primary-brand-color peer-valid:text-xs">
                    E-Posta
                  </span>
                </label>
              </div>
              <div
                className=" h-12 flex items-center justify-center rounded-md w-full text-[14px] font-semibold transition-colors">
                <span className="text-gray-700 ">
                  Giriş yapmadıysanız &nbsp;
                </span>
                <div kind="transparent" className="text-primary-brand-color hover:text-brand-yellow">
                  <button type="button" onClick={openLoginModal}>Giriş Yap</button>
                </div>
              </div>
            </div>
          </div>
        </Modal>
      </div>
    </div>
  );
}
 