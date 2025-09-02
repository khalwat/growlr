<template>
  <div v-if="user" class="p-6">
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
</template>

<script lang="ts" setup>
import AttributeSlider from "./AttributeSlider.vue";

const emit = defineEmits(['attribute-slider-changed']);
const user = defineModel<GrowlrUser>();
</script>
