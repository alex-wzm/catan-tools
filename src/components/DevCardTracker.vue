<template>
  <div>
    <h2>Left in deck:</h2>
    <ul>
      <li>Knights: {{ cards.knights }}</li>
      <li>Victory Points: {{ cards.victoryPoints }}</li>
      <li>Road Building: {{ cards.roadBuilding }}</li>
      <li>Year of Plenty: {{ cards.yearOfPlenty }}</li>
      <li>Monopoly: {{ cards.monopoly }}</li>
    </ul>
  </div>
</template>

<script>
export default {
  name: "DevCardTracker",
  data() {
    return {
      cards: {
        knights: 14,
        victoryPoints: 5,
        roadBuilding: 2,
        yearOfPlenty: 2,
        monopoly: 2
      }
    };
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
</style>
