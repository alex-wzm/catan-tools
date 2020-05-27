<template>
  <div>
    <h2>Development Card Tracker</h2>
    <h3>Draw cards</h3>
    <div class="draw-buttons">
      <ul>
        <li v-for="cardType in cardTypes" :key="cardType">
          <dev-card-draw-button :cardType="cardType" v-on:draw="drawCard" v-on:undo="undoDraw" />
        </li>
      </ul>
    </div>
    <h3>Left in deck:</h3>
    <ul>
      <li>Knights: {{ cards.knight }}</li>
      <li>Victory Points: {{ cards.victoryPoint }}</li>
      <li>Road Building: {{ cards.roadBuilding }}</li>
      <li>Year of Plenty: {{ cards.yearOfPlenty }}</li>
      <li>Monopoly: {{ cards.monopoly }}</li>
    </ul>
    <h3>Odds of drawing:</h3>
    <ul>
      <li>Knight: {{ cards.knight/totalCards | probability }}</li>
      <li>Victory Point: {{ cards.victoryPoint/totalCards | probability }}</li>
      <li>Road Building: {{ cards.roadBuilding/totalCards | probability }}</li>
      <li>Year of Plenty: {{ cards.yearOfPlenty/totalCards | probability }}</li>
      <li>Monopoly: {{ cards.monopoly/totalCards | probability }}</li>
    </ul>
  </div>
</template>

<script>
import { DEFAULT_DEV_CARDS } from "../constants/defaults";
import DevCardDrawButton from "./DevCardDrawButton";

export default {
  name: "DevCardTracker",
  components: { DevCardDrawButton },
  data() {
    return {
      cards: { ...DEFAULT_DEV_CARDS }, // shallow copy
      cardTypes: Object.keys(DEFAULT_DEV_CARDS),
      total: 25
    };
  },
  computed: {
    totalCards() {
      return Object.values(this.cards).reduce((sum, current) => sum + current);
    }
  },
  methods: {
    drawCard(card) {
      this.cards[card] = Math.max(this.cards[card] - 1, 0);
    },
    undoDraw(card) {
      this.cards[card] = Math.min(
        this.cards[card] + 1,
        DEFAULT_DEV_CARDS[card]
      );
    }
  },
  filters: {
    probability(value) {
      return `${(value * 100).toFixed()}%`;
    }
  }
};
</script>

<style scoped>
.draw-buttons > * {
  margin: 10px;
}
</style>
