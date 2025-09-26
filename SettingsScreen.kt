package mx.tec.pantallassinfuncionalidad

import androidx.compose.foundation.background
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.ArrowForward
import androidx.compose.material.icons.filled.Settings
import androidx.compose.material3.Icon
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Surface
import androidx.compose.material3.Switch
import androidx.compose.material3.SwitchDefaults
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.layout.layout
import androidx.compose.ui.text.PlatformTextStyle
import androidx.compose.ui.text.font.FontFamily
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import kotlin.math.roundToInt

@Composable
fun SettingsScreen() {
    val orange = Color(0xFFFF8A2A)
    val white = Color.White
    val gearYellow = Color(0xFFFACC15)
    val green = Color(0xFF22C55E)

    var soundOn by remember { mutableStateOf(true) }
    var darkOn by remember { mutableStateOf(false) }

    Box(
        modifier = Modifier
            .fillMaxSize()
            .background(orange)
    ) {
        Text(
            text = "🥦",
            fontSize = 22.sp,
            modifier = Modifier
                .statusBarsPadding()
                .padding(start = 14.dp, top = 8.dp)
                .align(Alignment.TopStart)
        )
        Icon(
            imageVector = Icons.Filled.Settings,
            contentDescription = null,
            tint = gearYellow,
            modifier = Modifier
                .statusBarsPadding()
                .padding(end = 14.dp, top = 8.dp)
                .align(Alignment.TopEnd)
        )

        Text(
            text = "CONFIGURACIÓN",
            color = white,
            fontSize = 20.sp,
            fontWeight = FontWeight.ExtraBold,
            letterSpacing = 0.4.sp,
            style = MaterialTheme.typography.titleLarge.copy(
                platformStyle = PlatformTextStyle(includeFontPadding = false),
                fontFamily = FontFamily.SansSerif
            ),
            maxLines = 1,
            overflow = TextOverflow.Ellipsis,
            modifier = Modifier
                .align(Alignment.TopCenter)
                .statusBarsPadding()
                .padding(top = 8.dp)
        )

        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(horizontal = 20.dp)
        ) {
            Spacer(Modifier.weight(0.42f))

            Column(
                verticalArrangement = Arrangement.spacedBy(26.dp),
                horizontalAlignment = Alignment.Start
            ) {
                SettingRow(
                    label = "Sonido",
                    checked = soundOn,
                    onCheckedChange = { soundOn = it },
                    green = green
                )
                SettingRow(
                    label = "Modo Oscuro",
                    checked = darkOn,
                    onCheckedChange = { darkOn = it },
                    green = green
                )
                LanguageRow(
                    label = "Idioma",
                    language = "Español",
                    green = green
                )
            }

            Spacer(Modifier.weight(0.18f))
        }

        Text(
            text = "🍎",
            fontSize = 34.sp,
            modifier = Modifier
                .align(Alignment.BottomEnd)
                .navigationBarsPadding()
                .padding(end = 18.dp, bottom = 18.dp)
        )
    }
}

@Composable
private fun SettingRow(
    label: String,
    checked: Boolean,
    onCheckedChange: (Boolean) -> Unit,
    green: Color
) {
    Row(
        modifier = Modifier.fillMaxWidth(),
        horizontalArrangement = Arrangement.SpaceBetween,
        verticalAlignment = Alignment.CenterVertically
    ) {
        Text(
            text = label,
            color = Color.White,
            fontSize = 18.sp,
            fontWeight = FontWeight.SemiBold
        )
        Switch(
            checked = checked,
            onCheckedChange = onCheckedChange,
            modifier = Modifier
                .padding(end = 4.dp)
                .scaleSwitch(1.25f),
            colors = SwitchDefaults.colors(
                checkedThumbColor = Color.White,
                checkedTrackColor = green,
                uncheckedThumbColor = Color.White,
                uncheckedTrackColor = green.copy(alpha = 0.45f),
                checkedBorderColor = Color.Transparent,
                uncheckedBorderColor = Color.Transparent
            )
        )
    }
}

@Composable
private fun LanguageRow(
    label: String,
    language: String,
    green: Color
) {
    Row(
        modifier = Modifier.fillMaxWidth(),
        horizontalArrangement = Arrangement.SpaceBetween,
        verticalAlignment = Alignment.CenterVertically
    ) {
        Text(
            text = label,
            color = Color.White,
            fontSize = 18.sp,
            fontWeight = FontWeight.SemiBold
        )

        Surface(
            color = green,
            shape = RoundedCornerShape(50),
            shadowElevation = 0.dp
        ) {
            Row(
                modifier = Modifier.padding(horizontal = 12.dp, vertical = 8.dp),
                verticalAlignment = Alignment.CenterVertically,
                horizontalArrangement = Arrangement.spacedBy(10.dp)
            ) {
                Box(
                    modifier = Modifier
                        .size(22.dp)
                        .clip(CircleShape)
                        .background(Color.White.copy(alpha = 0.15f)),
                    contentAlignment = Alignment.Center
                ) {
                    Text(
                        text = "A",
                        color = Color.White,
                        fontSize = 12.sp,
                        fontWeight = FontWeight.Bold
                    )
                }
                Text(
                    text = language,
                    color = Color.White,
                    fontSize = 16.sp,
                    fontWeight = FontWeight.Medium
                )
                Icon(
                    imageVector = Icons.Filled.ArrowForward,
                    contentDescription = null,
                    tint = Color.White
                )
            }
        }
    }
}

private fun Modifier.scaleSwitch(scale: Float) = this.then(
    Modifier.layout { measurable, constraints ->
        val p = measurable.measure(constraints)
        val w = (p.width * scale).roundToInt()
        val h = (p.height * scale).roundToInt()
        layout(w, h) {
            val x = ((w - p.width) / 2f).roundToInt()
            val y = ((h - p.height) / 2f).roundToInt()
            p.placeRelative(x, y)
        }
    }
)
