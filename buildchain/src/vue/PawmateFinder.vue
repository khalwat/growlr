<template>
  <div class="flex">
    <div class="w-2/3">
      <div class="pl-2">
        <h1 class="text-xl">
          <strong><span v-if="user.fulleName">{{ user.fulleName }}</span><span v-else>Snugglemuffins</span></strong>
          let's find you a pawmate!
        </h1>
        <img v-if="user.photo.url" class="w-full h-auto" :src="user.photo.url"/>
      </div>
    </div>
    <div class="w-1/3">
      <div class="p-6">
        <AttributeSlider
          v-model="user.affection"
          :marks="{ 0: '🌵', 5: 'Affection', 10: '🧸' }"
        />
        <AttributeSlider
          v-model="user.activityLevel"
          :marks="{ 0: '🥔', 5: 'Activity Level', 10: '🏎️' }"
        />
        <AttributeSlider
          v-model="user.bodySize"
          :marks="{ 0: '🪰', 5: 'Body Size', 10: '🐳' }"
        />
        <AttributeSlider
          v-model="user.hairyness"
          :marks="{ 0: '🎱', 5: 'Hairiness', 10: '🐻' }"
        />
        <AttributeSlider
          v-model="user.diet"
          :marks="{ 0: '🌿', 5: 'Diet', 10: '🥩' }"
        />
        <AttributeSlider
          v-model="user.attractiveness"
          :marks="{ 0: '🦆', 5: 'Attractiveness', 10: '🦢' }"
        />
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import {executeQuery} from '../js/gql-query';
import {reactive, defineProps} from "vue";
import {AxiosResponse} from "axios";
import VueSlider from "vue-3-slider-component";
import AttributeSlider from "./AttributeSlider.vue";

const props = defineProps<{
  id: number
}>();

const userQuery =
  `
  query searchQuery($id: [QueryArgument]) {
    users(limit: 1, id: $id) {
    ... on User {
      id
      username
      fullName
      photo {
        url
      }
      affection
      activityLevel
      bodySize
      hairyness
      diet
      attractiveness
      }
    }
  }
`;

const user = reactive({});

executeQuery(userQuery, {id: props.id}, (response: AxiosResponse) => {
  if (response.data) {
    Object.assign(user, response.data.data.users[0])
  }
  if (response.errors) {
    console.log(response.errors);
  }
});
</script>
