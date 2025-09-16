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
        <button class="mt-1 ml-auto px-2 border rounded-lg" @click="emit('confirm')">
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
