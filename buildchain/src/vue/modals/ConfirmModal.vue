<template>
  <VueFinalModal
    class="flex justify-center items-center"
    content-class="flex flex-col max-w-xl mx-4 p-4 bg-white dark:bg-gray-900 border dark:border-gray-700 rounded-lg space-y-2"
  >
    <div class="dark:text-white">
      <h1 class="text-3xl font-bold">
        {{ modalTitle }}
      </h1>
      <p class="text-lg py-8">
        <slot name="message"/>
      </p>
      <div class="flex justify-right items-right">
        <button
          class="text-white bg-blue-500 hover:bg-blue-800 font-medium rounded-full text-xl px-5 py-2.5 me-2 mb-2 dark:bg-blue-600 dark:hover:bg-blue-700"
          @click="emit('confirm')"
        >
          {{ buttonTitle }}
        </button>
      </div>
    </div>
  </VueFinalModal>
</template>

<script lang="ts" setup>
import {VueFinalModal} from 'vue-final-modal'

defineProps<{
  modalTitle?: string,
  buttonTitle?: string
}>()
const emit = defineEmits<{
  (e: 'confirm'): void
}>()
</script>
