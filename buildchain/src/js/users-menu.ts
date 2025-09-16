// Import our CSS
import '@/css/components/v-dropdown-menu.css';
import '@/css/components/dropdown.css';

import App from '@/vue/ui-elements/UsersMenu.vue';
import {createApp} from 'vue';

// App main
const main = async () => {
  // Create our vue instance
  const app = createApp(App);
  // Mount the app
  const root = app.mount('#users-menu-container');

  return root;
};

// Execute async function
main().then(() => {
  console.log('users-menu mounted');
});
