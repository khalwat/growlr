<template>
  <div class="flex justify-center p-6">
    <button
      class="text-white bg-blue-500 hover:bg-blue-800 font-medium rounded-lg text-xl px-5 py-2.5 me-2 mb-2 dark:bg-blue-600 dark:hover:bg-blue-700"
      type="button"
      @click="handleClick">
      <span>Find my purrfect Pawmate</span><span class="text-xl>"> 🐾 </span>
    </button>
    <ModalsContainer/>
  </div>
</template>

<script lang="ts" setup>
import {ModalsContainer, useModal} from 'vue-final-modal'
import ConfirmModal from './ConfirmModal.vue'
import {defineEmits} from "vue";

const emit = defineEmits(['find-purrfect-pawmate']);

const {open, close} = useModal({
  component: ConfirmModal,
  attrs: {
    modalTitle: 'GROWLR TERMS OF SERVICE',
    buttonTitle: 'I AGREE',
    onConfirm() {
      close();
      emit('find-purrfect-pawmate');
    },
  },
  slots: {
    message: 'By clicking the I AGREE button, you are legally bound to adopt whatever pawmate is chosen for you. There are no exceptions. There are no returns. There are no refunds.',
  },
})

function handleClick() {
  open();
}
</script>
