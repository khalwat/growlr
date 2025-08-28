// Import our CSS

import {createApp} from 'vue';
import PawmateFinder from '@/vue/PawmateFinder.vue';
import 'vue-final-modal/style.css';
import {createVfm} from 'vue-final-modal';

// App main
const main = async () => {
  // Create our vue instance
  const app = createApp({});
  // Register our components globally so they can be used in our Twig code
  app.component('pawmate-finder', PawmateFinder);
  // Create the Vue final modal
  const vfm = createVfm();
  // Mount the app
  const root = app.use(vfm).mount('#pawmate-finder-container');

  return root;
};

// Execute async function
main().then(() => {
  console.log('pawmate-finder mounted');
});
