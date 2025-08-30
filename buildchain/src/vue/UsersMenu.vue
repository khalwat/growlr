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
import {reactive} from 'vue';
import {AxiosResponse} from 'axios';
import AllUsersQuery from '../gql/all-users-query.gql?raw';

const users: GrowlrUser[] = reactive([]);

executeQuery(AllUsersQuery, {limit: null}, (response: AxiosResponse<GrowlrUserResponse>) => {
  if (response.data) {
    Object.assign(users, response.data.data.users)
  }
});
</script>
