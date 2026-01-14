package {{package_name}}.{{feature_name.snakeCase()}}

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.flow.update
import kotlinx.coroutines.launch

class {{feature_name.pascalCase()}}ViewModel : ViewModel() {

    private val _uiState = MutableStateFlow({{feature_name.pascalCase()}}UiState())
    val uiState = _uiState.asStateFlow()

    fun fetchData() {
        viewModelScope.launch {
            _uiState.update { it.copy(isLoading = true) }
            try {
                // Simulate network call
                val result = "Fetched data for {{feature_name.pascalCase()}}"
                _uiState.update { it.copy(isLoading = false, data = result) }
            } catch (e: Exception) {
                _uiState.update { it.copy(isLoading = false, error = e.message) }
            }
        }
    }
}