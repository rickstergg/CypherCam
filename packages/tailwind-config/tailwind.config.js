/** @type {import('tailwindcss').Config} */
module.exports = {
  content: {
    relative: true,
    files: ['../ui/src/**/*.{ts,tsx}', '../../apps/web/app/**/*.{ts,tsx}'],
    exclude: ['**/node_modules/**'],
  },
  theme: {},
  plugins: [require('tailwindcss-animate')],
};
