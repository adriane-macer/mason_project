package {{package_name}}.{{feature_name.snakeCase()}}

data class {{feature_name.pascalCase()}}UiState(
val isLoading: Boolean = false,
val data: String? = null,
val error: String? = null
)