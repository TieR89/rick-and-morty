<template>
  <div class="character-list">
    <div class="character-card" v-for="character in characters" :key="character.id">
      <h2>{{ character.name }}</h2>
      <p>Status: {{ character.status }}</p>
      <p>Species: {{ character.species }}</p>
    </div>
  </div>
</template>

<script>
export default {
  name: 'CharacterList',
  props: {
    characters: {
      type: Array,
      required: true
    }
  }
};
</script>

<style>
.character-list {
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
  gap: 20px;
  padding: 20px;
}

.character-card {
  background: #fff;
  border-radius: 8px;
  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
  padding: 20px;
  width: 200px;
  text-align: left;
}

.character-card h2 {
  font-size: 18px;
  color: #42b983;
  margin-bottom: 10px;
}

.character-card p {
  margin: 5px 0;
  color: #333;
}
</style>
