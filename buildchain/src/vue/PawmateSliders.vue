<template>
  <div v-if="user" class="pr-12 text-shadow-sm text-shadow-grey-50">
    <h2 class="text-xl font-semibold mb-4">What are you looking for?</h2>
    <div class="shadow-lg rounded-lg px-12 py-6"
         style="backdrop-filter: blur(2px) brightness(80%) saturate(50%);">
      <AttributeSlider
        v-model="user.affection"
        :marks="{ 0: '🌵', 5: 'Affection', 10: '🧸' }"
        @attribute-slider-changed="emit('attribute-slider-changed')"
      />
      <AttributeSlider
        v-model="user.activityLevel"
        :marks="{ 0: '🥔', 5: 'Activity Level', 10: '🏎️' }"
        @attribute-slider-changed="emit('attribute-slider-changed')"
      />
      <AttributeSlider
        v-model="user.bodySize"
        :marks="{ 0: '🪰', 5: 'Body Size', 10: '🐳' }"
        @attribute-slider-changed="emit('attribute-slider-changed')"
      />
      <AttributeSlider
        v-model="user.hairyness"
        :marks="{ 0: '🎱', 5: 'Hairiness', 10: '🐻' }"
        @attribute-slider-changed="emit('attribute-slider-changed')"
      />
      <AttributeSlider
        v-model="user.diet"
        :marks="{ 0: '🌿', 5: 'Diet', 10: '🥩' }"
        @attribute-slider-changed="emit('attribute-slider-changed')"
      />
      <AttributeSlider
        v-model="user.attractiveness"
        :marks="{ 0: '🦆', 5: 'Attractiveness', 10: '🦢' }"
        @attribute-slider-changed="emit('attribute-slider-changed')"
      />
    </div>
  </div>
</template>

<script lang="ts" setup>
import AttributeSlider from "./AttributeSlider.vue";

const emit = defineEmits(['attribute-slider-changed']);
const user = defineModel<GrowlrUser>();
</script>
