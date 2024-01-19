package dev.logickoder.data_over_ble

import android.content.Context
import android.os.ParcelUuid
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.cancellable
import kotlinx.coroutines.flow.catch
import kotlinx.coroutines.flow.map
import no.nordicsemi.android.kotlin.ble.advertiser.BleAdvertiser
import no.nordicsemi.android.kotlin.ble.advertiser.callback.BleAdvertisingEvent
import no.nordicsemi.android.kotlin.ble.core.ServerDevice
import no.nordicsemi.android.kotlin.ble.core.advertiser.BleAdvertisingConfig
import no.nordicsemi.android.kotlin.ble.core.advertiser.BleAdvertisingData
import no.nordicsemi.android.kotlin.ble.core.advertiser.BleAdvertisingSettings
import no.nordicsemi.android.kotlin.ble.scanner.BleScanner
import no.nordicsemi.android.kotlin.ble.scanner.aggregator.BleScanResultAggregator
import java.util.UUID

object BleService {

    /**
     * Scan for BLE devices and return a list of [ServerDevice]s
     */
    fun scan(context: Context): Flow<List<ServerDevice>> {
        //Create aggregator which will concat scan records with a device
        val aggregator = BleScanResultAggregator()
        return BleScanner(context).scan()
            .map { aggregator.aggregateDevices(it) } //Add new device and return an aggregated list
    }

    fun advertise(context: Context): Flow<BleAdvertisingEvent> {
        val advertiser = BleAdvertiser.create(context)
        val advertiserConfig = BleAdvertisingConfig(
            settings = BleAdvertisingSettings(
                deviceName = "My Server" // Advertise a device name
            ),
            advertiseData = BleAdvertisingData(
                serviceUuid = ParcelUuid(SERVICE_UUID),
                includeDeviceName = true,
            )
        )

        return advertiser.advertise(advertiserConfig) //Start advertising
            .cancellable()
            .catch { it.printStackTrace() }
    }

    private const val BASE_UUID = "8a27292e-6624-4fb2-8f80-773e66c2d5bd"

    private val SERVICE_UUID = UUID.fromString(BASE_UUID)
}