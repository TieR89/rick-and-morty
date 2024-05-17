<template>
  <div class="pagination">
    <button @click="prevPage" :disabled="page === 1">Previous</button>
    <span>Page {{ page }} of {{ totalPages }}</span>
    <button @click="nextPage" :disabled="page === totalPages">Next</button>
  </div>
</template>

<script>
export default {
  name: 'Pagination',
  props: {
    page: {
      type: Number,
      required: true
    },
    totalPages: {
      type: Number,
      required: true
    }
  },
  emits: ['changePage'],
  methods: {
    prevPage() {
      if (this.page > 1) {
        this.$emit('changePage', this.page - 1);
      }
    },
    nextPage() {
      if (this.page < this.totalPages) {
        this.$emit('changePage', this.page + 1);
      }
    }
  }
};
</script>

<style>
.pagination {
  display: flex;
  justify-content: center;
  align-items: center;
  gap: 10px;
  margin-top: 20px;
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

button:disabled {
  background-color: #cfcfcf;
  cursor: not-allowed;
}

button:not(:disabled):hover {
  background-color: #368b72;
}

span {
  font-size: 16px;
}
</style>
