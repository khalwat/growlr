<template>
  <button
    class="text-white bg-blue-700 hover:bg-blue-800 font-medium rounded-lg text-xl px-5 py-2.5 me-2 mb-2 dark:bg-blue-600 dark:hover:bg-blue-700"
    type="button"
    @click="handleClick">
    <span>Find my purrfect Pawmate</span><span class="text-xl>"> 🐾 </span>
  </button>
  <ModalsContainer/>
</template>

<script lang="ts" setup>
import {ModalsContainer, useModal} from 'vue-final-modal'
import ModalConfirm from './TOSModal.vue'
import {defineEmits} from "vue";

const emit = defineEmits(['find-purrfect-pawmate']);

const {open, close} = useModal({
  component: ModalConfirm,
  attrs: {
    onConfirm() {
      close();
      emit('find-purrfect-pawmate');
    },
  },
})

function handleClick() {
  open();
}
</script>
