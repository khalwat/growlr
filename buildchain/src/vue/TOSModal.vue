<template>
  <VueFinalModal
    class="flex justify-center items-center"
    content-class="flex flex-col max-w-xl mx-4 p-4 bg-white dark:bg-gray-900 border dark:border-gray-700 rounded-lg space-y-2"
  >
    <div class="text-white">
      <h1 class="text-xl">
        GROWLR TERMS OF SERVICE
      </h1>
      <p class="text-lg py-8">
        By clicking the I AGREE button, you are legally bound to adopt whatever pawmate is chosen for you.
        There are no exceptions. There are no returns. There are no refunds.
      </p>
      <slot/>
      <div class="flex justify-right items-right">
        <button class="mt-1 ml-auto px-2 border rounded-lg" @click="emit('confirm')">
          I AGREE
        </button>
      </div>
    </div>
  </VueFinalModal>
</template>

<script lang="ts" setup>
import {VueFinalModal} from 'vue-final-modal'

const emit = defineEmits<{
  (e: 'confirm'): void
}>()
</script>
