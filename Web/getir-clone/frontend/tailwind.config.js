module.exports = {
  mode: "jit",
  purge: ["./src/**/*.{js,jsx,ts,tsx}", "./public/index.html"],
  darkMode: false, // or 'media' or 'class'
  theme: {
    extend: {
      spacing: {
        0.1: "0.063rem",
      },
      backgroundImage: (theme) => ({
        "mobile-app":
          "url(https://getir.com/_next/static/images/doodle-d659f9f1fd505c811c2331fe3ffddd5f.png)",
      }),
      colors: {
        "brand-color": "#9D27F4",
        "primary-brand-color": "#9736BA",
        "secondary-brand-color": "#7849f7",
        "tertiary-brand-color":"#C350EC" ,
        "quaternary-brand-color": "#D691EF",
        "brand-yellow": "#ffd300",
        "brand-purple":"#5d3ebc",
      },
    },
  },
  variants: {
    extend: {},
  },
  plugins: [],
};
