<template>
  <div class="filter-form">
    <input v-model="name" type="text" placeholder="Name" />
    <select v-model="status">
      <option value="">All</option>
      <option value="alive">Alive</option>
      <option value="dead">Dead</option>
      <option value="unknown">Unknown</option>
    </select>
    <button @click="applyFilters">Apply</button>
  </div>
</template>

<script>
import { ref } from 'vue';

export default {
  name: 'FilterForm',
  emits: ['applyFilters'],
  setup(props, { emit }) {
    const name = ref('');
    const status = ref('');

    const applyFilters = () => {
      emit('applyFilters', { name: name.value, status: status.value });
    };

    return {
      name,
      status,
      applyFilters
    };
  }
};
</script>

<style>
.filter-form {
  display: flex;
  justify-content: center;
  align-items: center;
  gap: 10px;
  margin-bottom: 20px;
}

input,
select {
  padding: 10px;
  border: 1px solid #ddd;
  border-radius: 5px;
}

button {
  padding: 10px 20px;
  border: none;
  border-radius: 5px;
  background-color: #42b983;
  color: white;
  cursor: pointer;
  transition: background-color 0.3s ease;
}

button:hover {
  background-color: #368b72;
}
</style>
