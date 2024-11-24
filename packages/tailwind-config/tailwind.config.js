const defaultTheme = require('tailwindcss/defaultTheme');

/** @type {import('tailwindcss').Config} */
module.exports = {
  darkMode: ['class'],
  content: [
    '../../apps/web/**/*.{js,ts,jsx,tsx}',
    '../../packages/ui/**/*.{js,ts,jsx,tsx}', // Add the ui package
  ],
  theme: {
    screens: {
      xs: '280px',
      '2xl': '1400px',
      ...defaultTheme.screens,
    },
    container: {
      center: true,
      padding: {
        DEFAULT: '2rem',
        xs: '1rem',
        sm: '1rem',
      },
    },
  },
  plugins: [require('tailwindcss-animate')],
};