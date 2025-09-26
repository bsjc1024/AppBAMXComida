package mx.tec.pantallassinfuncionalidad

import androidx.compose.foundation.background
import androidx.compose.foundation.layout.*
import androidx.compose.material3.Button
import androidx.compose.material3.ButtonDefaults
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp

@Composable
fun HomeScreen() {
    Box(
        modifier = Modifier
            .fillMaxSize()
            .background(Orange)
            .padding(24.dp)
    ) {
        Row(
            Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.SpaceBetween
        ) {
            Text("🍎", fontSize = 28.sp)
            Text("🍆", fontSize = 28.sp)
        }

        Column(
            Modifier.fillMaxSize(),
            horizontalAlignment = Alignment.CenterHorizontally,
            verticalArrangement = Arrangement.Center
        ) {
            Text(
                text = "QUIZ\nDE\nCOMIDA",
                fontSize = 42.sp,
                lineHeight = 44.sp,
                color = White,
                textAlign = TextAlign.Center,
                fontWeight = FontWeight.ExtraBold
            )

            Spacer(Modifier.height(24.dp))

            Button(
                onClick = {  },
                colors = ButtonDefaults.buttonColors(containerColor = Green),
                modifier = Modifier
                    .width(180.dp)
                    .height(52.dp)
            ) { Text("JUGAR", fontSize = 18.sp, fontWeight = FontWeight.Bold, color = White) }
        }

        Row(
            Modifier
                .fillMaxWidth()
                .align(Alignment.BottomStart),
            horizontalArrangement = Arrangement.SpaceBetween
        ) {
            Text("🍕", fontSize = 28.sp)
            Text("🍓", fontSize = 28.sp)
        }

        DotsOverlay()
    }
}

@Preview(showBackground = true, showSystemUi = true)
@Composable
private fun PreviewHome() { MaterialTheme { HomeScreen() } }
