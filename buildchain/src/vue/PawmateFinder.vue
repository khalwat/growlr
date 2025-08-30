<template>
  <div class="flex">
    <div v-if="!isEmptyObject(user)" class="w-2/3">
      <transition name="fade">
        <div v-if="isEmptyObject(pawmate)" class="pl-2">
          <h1 class="text-xl">
            <strong><span v-if="user.fullName">{{ user.fullName }}</span><span v-else>Snugglemuffins</span></strong>
            let's find you a pawmate!
          </h1>
          <img v-if="user.photo" :src="user.photo.url" class="heart aspect-square object-cover w-full"/>
        </div>
        <div v-else class="pl-2 animate-[pulse_1s_ease-in-out]">
          <h1 class="text-xl">
            Your pawmate is <strong>{{ pawmate.title }}</strong>!
          </h1>
          <img v-if="pawmate.image" :src="pawmate.image[0].url" class="heart aspect-square object-cover w-full"/>
        </div>
      </transition>
    </div>
    <div class="w-1/3">
      <PawmateSliders
        v-model="user"
        @attribute-slider-changed="attributeSliderChanged"
      />
      <ActionButton
        v-show="!expertMode"
        @find-purrfect-pawmate="debouncedFindPurrfectPawmate"
      />
      <ExpertModeCheckbox
        v-model="expertMode"
      />
    </div>
  </div>
</template>

<script lang="ts" setup>
import {executeQuery} from '../js/gql-query';
import {reactive, ref} from "vue";
import {AxiosResponse} from "axios";
import PawmateSliders from "./PawmateSliders.vue";
import ActionButton from "./ActionButton.vue";
import ExpertModeCheckbox from "./ExpertModeCheckbox.vue";
import {debounce} from 'lodash';
import UserQuery from '../gql/user-query.gql?raw';
import PawmateQuery from '../gql/pawmate-query.gql?raw';

const props = defineProps<{
  id: number
}>();
const user: GrowlrUser = reactive({});
const pawmate: GrowlrPawmate = reactive({});
const debouncedFindPurrfectPawmate = debounce(findPurrfectPawmate, 100);
const expertMode = ref(false);

function isEmptyObject(obj: Object) {
  return Object.keys(obj).length === 0;
}

function attributeSliderChanged() {
  if (expertMode.value) {
    debouncedFindPurrfectPawmate();
  }
}

function findPurrfectPawmate() {
  console.log("Find purrfect pawmate!");
  executeQuery(PawmateQuery, {id: 7}, (response: AxiosResponse) => {
    if (response.data) {
      Object.assign(pawmate, response.data.data.entries[0])
    }
    if (response.errors) {
      console.log(response.errors);
    }
  });
}

executeQuery(UserQuery, {id: props.id}, (response: AxiosResponse) => {
  if (response.data) {
    Object.assign(user, response.data.data.users[0])
  }
  if (response.errors) {
    console.log(response.errors);
  }
});
</script>

<style>
.fade-enter-active,
.fade-leave-active {
  transition: opacity 0.5s ease;
}

.fade-enter-from,
.fade-leave-to {
  opacity: 0;
}
</style>
