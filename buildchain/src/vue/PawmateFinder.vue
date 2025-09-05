<template>
  <div class="flex">
    <div v-if="!isEmptyObject(user)" class="w-2/3">
      <transition name="fade">
        <UserProfile
          v-if="isEmptyObject(pawmates)"
          v-model="user"
        />
        <PawmateProfile
          v-else
          v-model="pawmates"
        />
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
import {debounce} from 'lodash-es';
import UserQuery from '../gql/user-query.gql?raw';
import PawmateQuery from '../gql/pawmate-query.gql?raw';
import UserProfile from "./UserProfile.vue";
import PawmateProfile from "./PawmateProfile.vue";

const props = defineProps<{
  id: number
}>();
const user: GrowlrUser = reactive({});
const pawmates: GrowlrPawmate[] = reactive([]);
const expertMode = ref(false);
const debouncedFindPurrfectPawmate = debounce(findPurrfectPawmate, 100);

function isEmptyObject(obj: Object) {
  return Object.keys(obj).length === 0;
}

function attributeSliderChanged() {
  if (expertMode.value) {
    debouncedFindPurrfectPawmate();
  }
}

function findPurrfectPawmate() {
  const vars = {
    affection: user.affection,
    activityLevel: user.activityLevel,
    attractiveness: user.attractiveness,
    bodySize: user.bodySize,
    hairyness: user.hairyness,
    diet: user.diet
  };
  executeQuery(PawmateQuery, vars, (response: AxiosResponse<GrowlrPawmateResponse>) => {
    if (response.data) {
      pawmates.length = 0;
      Object.assign(pawmates, response.data.data.pawmateResolveMatches)
    }
  });
}

executeQuery(UserQuery, {id: props.id}, (response: AxiosResponse<GrowlrUserResponse>) => {
  if (response.data) {
    Object.assign(user, response.data.data.users[0])
  }
});
</script>

<style scoped>
.fade-enter-active,
.fade-leave-active {
  transition: opacity 0.5s ease;
}

.fade-enter-from,
.fade-leave-to {
  opacity: 0;
}
</style>
