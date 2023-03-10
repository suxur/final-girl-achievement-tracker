const defaultTheme = require("tailwindcss/defaultTheme");

module.exports = {
  content: [
    "./public/*.html",
    "./app/**/*.{rb,erb}",
    "./app/javascript/**/*.js",
    "./app/views/**/*.{erb,haml,html,slim}",
  ],
  theme: {
    extend: {
      fontFamily: {
        display: ["Creepster", ...defaultTheme.fontFamily.sans],
        sans: ["Golos Text", ...defaultTheme.fontFamily.sans],
      },
      'colors': {
        'primary': '#ec2027',
      }
    },
  },
  plugins: [
    require("@tailwindcss/forms"),
    require("@tailwindcss/aspect-ratio"),
    require("@tailwindcss/typography"),
  ],
};
