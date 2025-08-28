// Import our CSS

import {createApp} from 'vue';
import PawmateFinder from '@/vue/PawmateFinder.vue';

// App main
const main = async () => {
  // Create our vue instance
  const app = createApp({});
  // Register our components globally so they can be used in our Twig code
  app.component('pawmate-finder', PawmateFinder);
  // Mount the app
  const root = app.mount('#pawmate-finder-container');

  return root;
};

// Execute async function
main().then(() => {
  console.log('pawmate-finder mounted');
});
