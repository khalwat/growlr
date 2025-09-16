<template>
  <div class="flex justify-center p-6">
    <button
      class="w-10 h-10 rounded-full bg-red-500 hover:bg-red-800 flex items-center justify-center text-white text-xl font-bold dark:bg-red-600 dark:hover:bg-red-700"
      type="button"
      @click="handleClick">
      !
    </button>
    <ConfirmModal
      v-model="show"
      :modalTitle="togetherTitle"
      buttonTitle="Done"
      @confirm="confirm"
    >
      <template #message>
        <img :src="togetherUrl"/>
      </template>
    </ConfirmModal>

    <ModalsContainer/>
  </div>
</template>

<script lang="ts" setup>
import {ModalsContainer} from 'vue-final-modal'
import ConfirmModal from '../../modals/ConfirmModal.vue'
import {ref} from "vue";

const show = ref(false);
const props = defineProps<{
  togetherTitle: string,
  togetherUrl: string,
}>();

function confirm() {
  show.value = false;
}

function handleClick() {
  show.value = true;
}
</script>
