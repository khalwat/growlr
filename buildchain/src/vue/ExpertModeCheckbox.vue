<template>
  <div class="flex justify-center p-6">
    <div class="flex items-center mb-4">
      <input
        id="default-checkbox"

        v-model="model"
        class="w-4 h-4 text-blue-600 bg-gray-100 border-gray-300 rounded-sm focus:ring-blue-500 dark:focus:ring-blue-600 dark:ring-offset-gray-800 focus:ring-2 dark:bg-gray-700 dark:border-gray-600"
        type="checkbox"
        value="">
      <label class="ms-2 text-sm font-medium text-gray-900 dark:text-gray-300" for="default-checkbox">Enable Expert
        Mode</label>
    </div>
  </div>
</template>

<script lang="ts" setup>

const model = defineModel();
</script>
