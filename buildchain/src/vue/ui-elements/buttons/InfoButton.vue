<template>
  <div class="flex justify-center p-6">
    <button
      class="w-10 h-10 rounded-full bg-blue-500 hover:bg-blue-800 flex items-center justify-center text-white text-xl font-bold dark:bg-blue-600 dark:hover:bg-blue-700"
      type="button"
      @click="handleClick">
      ?
    </button>
    <ConfirmModal
      v-model="show"
      buttonTitle="Done"
      modalTitle=""
      @confirm="confirm"
    >
      <template #message>
        <PawmateSummary :pawmate="pawmate"/>
      </template>
    </ConfirmModal>

    <ModalsContainer/>
  </div>
</template>

<script lang="ts" setup>
import {ModalsContainer} from 'vue-final-modal'
import ConfirmModal from '../../modals/ConfirmModal.vue'
import PawmateSummary from '../../modals/PawmateSummary.vue'
import {ref} from "vue";

const show = ref(false);
const props = defineProps<{
  pawmate: GrowlrPawmate,
}>();

function confirm() {
  show.value = false;
}

function handleClick() {
  show.value = true;
}
</script>
