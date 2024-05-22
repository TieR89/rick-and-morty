<template>
  <div class="character-list">
    <div class="character-card" v-for="character in characters" :key="character.id">
      <img :src="character.image" alt="character image" />
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
  text-align: left;
  box-sizing: border-box;
  width: 300px;
  display: flex;
  flex-direction: column;
  align-items: center;
  flex: 1 1 calc(30% - 40px); /* 3 колонки */
  max-width: calc(30% - 40px);
}

.character-card img {
  border-radius: 10px;
  width: 150px;
  height: 150px;
  object-fit: cover;
  margin-bottom: 15px;
}

.character-card h2 {
  font-size: 18px;
  color: #42b983;
  margin-bottom: 10px;
  text-align: center;
}

.character-card p {
  margin: 5px 0;
  color: #333;
}

@media (max-width: 799px) {
  .character-card {
    flex: 1 1 calc(50% - 40px); /* 2 колонки */
    max-width: calc(50% - 40px);
  }
}

@media (max-width: 599px) {
  .character-card {
    flex: 1 1 calc(100% - 50px); /* 1 колонка */
    max-width: calc(100% - 50px);
  }
}
</style>
