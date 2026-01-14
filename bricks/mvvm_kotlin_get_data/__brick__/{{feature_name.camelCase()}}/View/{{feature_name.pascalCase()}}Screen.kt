package {{package_name}}.{{feature_name.snakeCase()}}

import androidx.compose.foundation.layout.*
import androidx.compose.material.*
import androidx.compose.runtime.*
import androidx.compose.ui.Modifier
import androidx.lifecycle.viewmodel.compose.viewModel

@Composable
fun {{feature_name.pascalCase()}}Screen(
viewModel: {{feature_name.pascalCase()}}ViewModel = viewModel { {{feature_name.pascalCase()}}ViewModel() }
) {
    val state by viewModel.uiState.collectAsState()

    Column(modifier = Modifier.fillMaxSize()) {
        Button(onClick = { viewModel.fetchData() }) {
            Text("Fetch {{feature_name.pascalCase()}}")
        }

        if (state.isLoading) {
            CircularProgressIndicator()
        }

        state.data?.let {
            Text("Result: $it")
        }

        state.error?.let {
            Text("Error: $it", color = MaterialTheme.colors.error)
        }
    }
}