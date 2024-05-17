<template>
  <div id="app">
    <h1>Rick and Morty Characters</h1>
    <FilterForm @applyFilters="applyFilters" />
    <CharacterList :characters="characters" />
    <Pagination
      :page="page"
      :totalPages="totalPages"
      @changePage="changePage"
    />
  </div>
</template>

<script>
import { ref, onMounted } from 'vue';
import axios from 'axios';
import CharacterList from './components/CharacterList.vue';
import Pagination from './components/Pagination.vue';
import FilterForm from './components/FilterForm.vue';

export default {
  name: 'App',
  components: {
    CharacterList,
    Pagination,
    FilterForm
  },
  setup() {
    const characters = ref([]);
    const page = ref(1);
    const totalPages = ref(1);
    const filters = ref({ name: '', status: '' });

    const fetchCharacters = async () => {
      const { name, status } = filters.value;
      const response = await axios.get('https://rickandmortyapi.com/api/character', {
        params: { page: page.value, name, status }
      });
      characters.value = response.data.results;
      totalPages.value = response.data.info.pages;
    };

    const applyFilters = (newFilters) => {
      filters.value = newFilters;
      page.value = 1;
      fetchCharacters();
    };

    const changePage = (newPage) => {
      page.value = newPage;
      fetchCharacters();
    };

    onMounted(() => {
      fetchCharacters();
    });

    return {
      characters,
      page,
      totalPages,
      applyFilters,
      changePage
    };
  }
};
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  text-align: center;
  margin-top: 20px;
}

h1 {
  color: #42b983;
}

.pagination,
.filter-form {
  margin-bottom: 20px;
}
</style>
