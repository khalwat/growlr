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
      :modalTitle="props.pawmate.title"
      buttonTitle="Done"
      @confirm="confirm"
    >
      <template #message>
        <p class="text-xl">
          {{ pawmate.shortDescription }}
        </p>
        <p class="py-8 text-2xl font-bold text-center">
          Match: {{ pawmate.matchPercentage }}%!
        </p>
        <div class="flex justify-center px-2">
          <table class="table-auto">
            <tbody>
            <tr>
              <td class="text-right px-2">Affection:</td>
              <td class="text-left px-2">{{ pawmate.affection }}</td>
            </tr>
            <tr>
              <td class="text-right px-2">Activity Level:</td>
              <td class="text-left px-2">{{ pawmate.activityLevel }}</td>
            </tr>
            <tr>
              <td class="text-right px-2">Body Size:</td>
              <td class="text-left px-2">{{ pawmate.bodySize }}</td>
            </tr>
            <tr>
              <td class="text-right px-2">Hairyness:</td>
              <td class="text-left px-2">{{ pawmate.hairyness }}</td>
            </tr>
            <tr>
              <td class="text-right px-2">Diet:</td>
              <td class="text-left px-2">{{ pawmate.diet }}</td>
            </tr>
            <tr>
              <td class="text-right px-2">Attractiveness:</td>
              <td class="text-left px-2">{{ pawmate.attractiveness }}</td>
            </tr>
            </tbody>
          </table>
        </div>
      </template>
    </ConfirmModal>

    <ModalsContainer/>
  </div>
</template>

<script lang="ts" setup>
import {ModalsContainer} from 'vue-final-modal'
import ConfirmModal from './ConfirmModal.vue'
import {defineProps, ref} from "vue";

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
