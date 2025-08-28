<template>
  <dropdown-menu class="custom-style" direction="right" transition="zoom">
    <template #trigger>
      <button class="pt-3 px-2"><img height="auto" src="/img/dog-nose.png" width="32px"></button>
    </template>

    <template #header> Pick a Human</template>

    <template #body>
      <ul>
        <li v-for="user in users" :key="user.username">
          <a :href="'/users/' + user.id">{{ user.username }}</a>
        </li>
      </ul>
    </template>

    <template #footer></template>
  </dropdown-menu>
</template>

<script lang="ts" setup>
import DropdownMenu from 'v-dropdown-menu';
import {executeQuery} from '../js/gql-query';
import {reactive} from "vue";
import {AxiosResponse} from "axios";

const usersQuery =
  `
  query searchQuery($limit: Int) {
    users(limit: $limit) {
      id
      username
    }
  }
`;

const users = reactive({});

executeQuery(usersQuery, {limit: null}, (response: AxiosResponse) => {
  if (response.data) {
    Object.assign(users, response.data.data.users)
  }
  if (response.errors) {
    console.log(response.errors);
  }
});

</script>
