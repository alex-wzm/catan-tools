<template>
  <div>
    <div class="draw-button-pair">
      <button @click="draw()">{{cardType | title}}</button>
      <button @click="undo()">
        <i class="fas fa-undo"></i>
      </button>
    </div>
  </div>
</template>

<script>
import { capitalCase } from "change-case";

export default {
  name: "DevCardDrawButton",
  props: {
    cardType: String
  },
  methods: {
    draw() {
      this.$emit("draw", this.cardType);
    },
    undo() {
      this.$emit("undo", this.cardType);
    }
  },
  filters: {
    title(text) {
      return capitalCase(text);
    }
  }
};
</script>

<style scoped>
.draw-button-pair > * {
  display: inline-block;
  border: none;
  background-color: #eceff1;
  font-size: 1em;
}
</style>