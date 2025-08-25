<template>
  <dropdown-menu>
    <template #trigger>
      <button class="text-2xl">🤦🏻</button>
    </template>

    <template #header> </template>

    <template #body>
      <ul>
        <li v-for="user in users.data" :key="1">
          <a href="">{{ user.username }}</a>
        </li>
      </ul>
    </template>

    <template #footer> </template>
  </dropdown-menu>
</template>

<script setup lang="ts">
import DropdownMenu from 'v-dropdown-menu';
import { executeQuery} from '../js/gql-query';
import { reactive } from "vue";
import {AxiosResponse} from "axios";

const usersQuery =
  `
        {
            users {
                id
                username
            }
        }
        `;

const users = reactive({data:{}});

executeQuery(usersQuery, { limit: 0}, (response: AxiosResponse) => users.data = response.data.data.users);

</script>
