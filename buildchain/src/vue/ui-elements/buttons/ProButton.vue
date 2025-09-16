<template>
  <div class="flex justify-center p-3">
    <button
      class="text-white bg-blue-500 hover:bg-blue-800 font-medium rounded-full text-xl px-5 py-2.5 me-2 mb-2 dark:bg-blue-600 dark:hover:bg-blue-700"
      type="button"
      @click="handleClick">
      <span>{{ buttonName }}</span>
    </button>
    <ConfirmModal
      v-model="show"
      buttonTitle="UPGRADE"
      modalTitle="UPGRADE TO PRO"
      @confirm="confirm"
    >
      <template #message>
        <p>Upgrade to the Pro version of Growlr now for just $19.99 per month!</p>
        <p>You get cool features like:</p>
        <ul class="list-disc pl-8">
          <li>Advanced charts</li>
          <li>Unlimited matches</li>
          <li>Rate your pawmate!</li>
        </ul>
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
const buttonName = ref('Upgrade to PRO');
const emit = defineEmits(['upgrade-to-pro']);

function confirm() {
  show.value = false;
  updateButton();
  emit('upgrade-to-pro');
}

function handleClick() {
  if (buttonName.value === 'Upgrade to PRO') {
    show.value = true;
  } else {
    updateButton();
    emit('upgrade-to-pro');
  }
}

function updateButton() {
  buttonName.value = (buttonName.value === 'Upgrade to PRO') ? 'Downgrade' : 'Upgrade to PRO';
}
</script>
