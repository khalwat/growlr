<template>
  <div class="min-h-screen h-full">
    <div v-if="!isEmptyObject(user)" class="flex pt-8">
      <div class="w-2/3">
        <div v-if="appState === 'proMode'">
          <PawmateCharts v-model="allPawmates"/>
        </div>
        <div v-else>
          <UserProfile
            v-if="appState === 'userProfile'"
            v-model="user"
          />
          <div v-if="appState === 'spinningWheel' || appState === 'pawmate'"
               :class="{ flipped: appState === 'pawmate' }"
               class="flip-container">
            <div class="flipper">
              <div class="front w-full">
                <SpinningWheel
                  v-if="appState === 'spinningWheel'"
                  v-model:pawmates="allPawmates"
                  v-model:spinning="spinning"
                />
              </div>
              <div class="back w-full">
                <PawmateProfile
                  v-if="appState === 'pawmate'"
                  v-model="pawmates"
                  :expert-mode="expertMode"
                  :user="user"
                />
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="w-1/3">
        <PawmateSliders
          v-model="user"
          @attribute-slider-changed="attributeSliderChanged"
        />
        <ActionButton
          v-show="!expertMode"
          :pro-mode="proMode"
          @find-purrfect-pawmate="debouncedFindPurrfectPawmate"
        />
        <UpgradeToProButton
          @upgrade-to-pro="debouncedFindPurrfectPawmate(); proMode = !proMode;"
        />
        <ExpertModeCheckbox
          v-model="expertMode"
        />
      </div>
    </div>
  </div>
</template>

<script lang="ts" setup>
import {executeQuery} from '../js/gql-query';
import {computed, reactive, ref} from "vue";
import {AxiosResponse} from "axios";
import PawmateSliders from "./views/PawmateSliders.vue";
import ActionButton from "./ui-elements/buttons/ActionButton.vue";
import UpgradeToProButton from "./ui-elements/buttons/UpgradeToProButton.vue";
import ExpertModeCheckbox from "./ui-elements/ExpertModeCheckbox.vue";
import {debounce} from 'lodash-es';
import UserQuery from '../gql/user-query.gql?raw';
import PawmateBestQuery from '../gql/pawmate-best-query.gql?raw';
import PawmateAllQuery from '../gql/pawmate-all-query.gql?raw';
import UserProfile from "./views/UserProfile.vue";
import PawmateProfile from "./views/PawmateProfile.vue";
import PawmateCharts from "./views/PawmateCharts.vue"
import SpinningWheel from "./views/SpinningWheel.vue";

const props = defineProps<{
  id: number
}>();
const expertMode = ref(false);
const proMode = ref(false);
const spinning = ref(false);
const debouncedFindPurrfectPawmate = debounce(findPurrfectPawmate, 50);
let user: GrowlrUser = reactive({});
let pawmates: GrowlrPawmate[] = reactive([]);
let allPawmates: GrowlrPawmate[] = reactive([]);
const appState = computed(() => {
  if (proMode.value) {
    return 'proMode';
  }
  if (expertMode.value) {
    return 'pawmate';
  }
  if (spinning.value && !isEmptyObject(allPawmates)) {
    return 'spinningWheel';
  }
  if (!isEmptyObject(pawmates)) {
    return 'pawmate';
  }
  return 'userProfile';
});

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
  executeQuery(PawmateBestQuery, vars, (response: AxiosResponse<GrowlrPawmateBestResponse>) => {
    if (response.data) {
      pawmates.length = 0;
      Object.assign(pawmates, response.data.data.pawmateBestMatches)
    }
  });
  executeQuery(PawmateAllQuery, vars, (response: AxiosResponse<GrowlrPawmateAllResponse>) => {
    if (response.data) {
      allPawmates.length = 0;
      Object.assign(allPawmates, response.data.data.pawmateAllMatches)
      spinning.value = true;
    }
  });
}

executeQuery(UserQuery, {id: props.id}, (response: AxiosResponse<GrowlrUserResponse>) => {
  if (response.data) {
    Object.assign(user, response.data.data.users[0])
  }
});
</script>
