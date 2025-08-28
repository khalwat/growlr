<template>
  <div class="flex">
    <div v-if="!isEmptyObject(user)" class="w-2/3">
      <transition name="fade">
        <div v-if="isEmptyObject(pawmate)" class="pl-2">
          <h1 class="text-xl">
            <strong><span v-if="user.fulleName">{{ user.fulleName }}</span><span v-else>Snugglemuffins</span></strong>
            let's find you a pawmate!
          </h1>
          <img v-if="user.photo.url" :src="user.photo.url" class="heart aspect-square object-cover w-full"/>
        </div>
        <div v-else class="pl-2 animate-[pulse_1s_ease-in-out]">
          <h1 class="text-xl">
            Your pawmate is <strong>{{ pawmate.title }}</strong>!
          </h1>
          <img v-if="pawmate.image[0].url" :src="pawmate.image[0].url" class="heart aspect-square object-cover w-full"/>
        </div>
      </transition>
    </div>
    <div class="w-1/3">
      <div class="p-6">
        <AttributeSlider
          v-model="user.affection"
          :marks="{ 0: '🌵', 5: 'Affection', 10: '🧸' }"
          @attribute-slider-changed="attributeSliderChanged"
        />
        <AttributeSlider
          v-model="user.activityLevel"
          :marks="{ 0: '🥔', 5: 'Activity Level', 10: '🏎️' }"
          @attribute-slider-changed="attributeSliderChanged"
        />
        <AttributeSlider
          v-model="user.bodySize"
          :marks="{ 0: '🪰', 5: 'Body Size', 10: '🐳' }"
          @attribute-slider-changed="attributeSliderChanged"
        />
        <AttributeSlider
          v-model="user.hairyness"
          :marks="{ 0: '🎱', 5: 'Hairiness', 10: '🐻' }"
          @attribute-slider-changed="attributeSliderChanged"
        />
        <AttributeSlider
          v-model="user.diet"
          :marks="{ 0: '🌿', 5: 'Diet', 10: '🥩' }"
          @attribute-slider-changed="attributeSliderChanged"
        />
        <AttributeSlider
          v-model="user.attractiveness"
          :marks="{ 0: '🦆', 5: 'Attractiveness', 10: '🦢' }"
          @attribute-slider-changed="attributeSliderChanged"
        />
      </div>

      <div v-show="!expertMode"
           class="flex justify-center p-6">
        <ActionButton
          @find-purrfect-pawmate="debouncedFindPurrfectPawmate"
        />
      </div>
      <div class="flex justify-center p-6">
        <ExpertModeCheckbox
          v-model="expertMode"
        />
      </div>

    </div>
  </div>
</template>

<script lang="ts" setup>
import {executeQuery} from '../js/gql-query';
import {reactive, ref} from "vue";
import {AxiosResponse} from "axios";
import ActionButton from "./ActionButton.vue";
import AttributeSlider from "./AttributeSlider.vue";
import ExpertModeCheckbox from "./ExpertModeCheckbox.vue";
import {debounce} from 'lodash';
import UserQuery from '../gql/user-query.gql?raw';
import PawmateQuery from '../gql/pawmate-query.gql?raw';

const props = defineProps<{
  id: number
}>();
const user = reactive({});
const pawmate = reactive({});
const debouncedFindPurrfectPawmate = debounce(findPurrfectPawmate, 500);
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
