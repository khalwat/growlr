<template>
  <div class="flex justify-center p-6">
    <button
      class="text-white bg-blue-500 hover:bg-blue-800 font-medium rounded-full text-xl px-5 py-2.5 me-2 mb-2 dark:bg-blue-600 dark:hover:bg-blue-700"
      type="button"
      @click="handleClick">
      <span>Find my purrfect Pawmate</span><span class="text-xl>"> 🐾 </span>
    </button>
    <ConfirmModal
      v-model="show"
      buttonTitle="I AGREE"
      modalTitle="GROWLR TERMS OF SERVICE"
      @confirm="confirm"
    >
      <template #message>
        <p>By clicking the I AGREE button, you are legally bound to adopt whatever pawmate is chosen for you. There are
          no exceptions. There are no returns. There are no refunds.</p>
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
const emit = defineEmits(['find-purrfect-pawmate']);
const props = defineProps<{
  proMode: boolean,
}>();

function confirm() {
  show.value = false;
  emit('find-purrfect-pawmate');
}

function handleClick() {
  if (props.proMode) {
    confirm()
  } else {
    show.value = true;
  }
}
</script>
