<template>
  <div>
    <h2>Development Card Tracker</h2>
    <!-- Buttons to draw/return cards -->
    <h3>Draw cards</h3>
    <div class="draw-buttons">
      <ul>
        <li v-for="cardType in cardTypes" :key="cardType">
          <dev-card-draw-button :cardType="cardType" v-on:draw="drawCard" v-on:undo="undoDraw" />
        </li>
      </ul>
    </div>
    <!-- Count of each card left in deck -->
    <h3>Left in deck:</h3>
    <ul>
      <li
        v-for="cardType in cardTypes"
        :key="cardType"
      >{{cardType | pluralize | title}}: {{cards[cardType]}}</li>
    </ul>
    <!-- Probability of drawing each card -->
    <h3>Odds of drawing:</h3>
    <ul>
      <li
        v-for="cardType in cardTypes"
        :key="cardType"
      >{{cardType | title}}: {{ cards[cardType]/totalCards | probability }}</li>
    </ul>
  </div>
</template>

<script>
import { DEFAULT_DEV_CARDS } from "../constants/defaults";
import DevCardDrawButton from "./DevCardDrawButton";
import { capitalCase } from "change-case";

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
    },
    pluralize(text) {
      // only pluralise 'knights' and 'victory points'
      return ["knight", "victorypoint"].indexOf(text.toLowerCase()) > -1
        ? text + "s"
        : text;
    },
    title(text) {
      return capitalCase(text);
    }
  }
};
</script>

<style scoped>
.draw-buttons > * {
  margin: 10px;
}
</style>
