<template>
  <div>
    <h2>Withdraw cards</h2>
    <div class="withdraw-buttons">
      <!-- TODO: limit min to zero -->
      <button v-on:click="drawCard('knight')">Knight</button>
      <button v-on:click="drawCard('victoryPoint')">Victory Point</button>
      <button v-on:click="drawCard('roadBuilding')">Road Building</button>
      <button v-on:click="drawCard('yearOfPlenty')">Year of Plenty</button>
      <button v-on:click="drawCard('monopoly')">Monopoly</button>
    </div>
    <h2>Left in deck:</h2>
    <ul>
      <li>Knights: {{ cards.knight }}</li>
      <li>Victory Points: {{ cards.victoryPoint }}</li>
      <li>Road Building: {{ cards.roadBuilding }}</li>
      <li>Year of Plenty: {{ cards.yearOfPlenty }}</li>
      <li>Monopoly: {{ cards.monopoly }}</li>
    </ul>
    <h2>Odds of drawing:</h2>
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
export default {
  name: "DevCardTracker",
  data() {
    return {
      cards: {
        knight: 14,
        victoryPoint: 5,
        roadBuilding: 2,
        yearOfPlenty: 2,
        monopoly: 2
      },
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
ul {
  list-style-type: none;
  padding: 0;
}
li {
  display: inline-block;
  margin: 0 10px;
}
.withdraw-buttons > * {
  margin: 0 10px;
}
</style>
