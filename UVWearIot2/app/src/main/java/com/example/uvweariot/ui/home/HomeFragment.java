package com.example.uvweariot.ui.home;

import android.app.AlertDialog;
import android.app.Service;
import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothClass;
import android.bluetooth.BluetoothDevice;
import android.bluetooth.BluetoothGatt;
import android.bluetooth.BluetoothManager;
import android.bluetooth.BluetoothSocket;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.AsyncTask;
import android.os.Build;
import android.os.Bundle;
import android.os.IBinder;
import android.os.ParcelUuid;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.ListView;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;

import com.example.uvweariot.R;

import java.io.IOException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Set;
import java.util.UUID;

import static android.content.ContentValues.TAG;

public class HomeFragment extends Fragment{

    private HomeViewModel homeViewModel;
    BluetoothAdapter bluetoothAdapter = BluetoothAdapter.getDefaultAdapter();
    private final static int REQUEST_ENABLE_BT = 1;
    public boolean isConnected = false;
    public TextView lbl_connected, lbl_pulseValue, lbl_UvValue;
    public Button btnConnect;
    public View root;
    public static String EXTRA_ADDRESS = "device_address";
    static final UUID mUUID = UUID.fromString("00000000-0000-1000-8000-00805f9b34fb");
    public BluetoothSocket bluetoothSocket ;
    public static  BluetoothDevice bluetoothDevice;

    public View onCreateView(@NonNull LayoutInflater inflater,
                             ViewGroup container, Bundle savedInstanceState) {

        root = inflater.inflate(R.layout.fragment_home, container, false);
        btnConnect = (Button) root.findViewById(R.id.btn_connect);
        lbl_pulseValue = (TextView) root.findViewById(R.id.txt_pulse);
        lbl_connected = (TextView) root.findViewById(R.id.lbl_Connected);


        //region btn connect event
        btnConnect.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                //region Bluetooth
                ListView lv = null;
                final ArrayList<String> BTAddress = new ArrayList<String>();
                if (!bluetoothAdapter.isEnabled()) {
                    Intent enableBtIntent = new Intent(BluetoothAdapter.ACTION_REQUEST_ENABLE);
                    startActivityForResult(enableBtIntent, REQUEST_ENABLE_BT);
                } else {
                    Set<BluetoothDevice> pairedDevices = bluetoothAdapter.getBondedDevices();
                    if(pairedDevices.size() > 0)
                    {
                        for(BluetoothDevice device : pairedDevices)
                        {
                            System.out.println(device.getName());
                            if(device.getName().equals("HC-05"))
                            {
                                bluetoothDevice = device;
                                break;
                            }
                        }
                    }

                    if (bluetoothDevice != null){
                        System.out.println( "device name: " +bluetoothDevice.getName());
                        new Thread(new Runnable() {
                            @Override
                            public void run() {
                                try {
                                    bluetoothSocket = createBluetoothSocket(bluetoothDevice);
                                    bluetoothAdapter.cancelDiscovery();
                                    bluetoothSocket.connect();
                                    System.out.println(bluetoothSocket.isConnected());
                                } catch (IOException e) {
                                    e.printStackTrace();
                                }
                            }
                        }).start();

                    }






//
//
//                    Set<BluetoothDevice> pairedDevices = bluetoothAdapter.getBondedDevices();
//                    ArrayList<String> BTList = new ArrayList<String>();
//
//                    for (BluetoothDevice bt : pairedDevices) {
//                        BTList.add(bt.getName());
//                        BTAddress.add(bt.getAddress());
//                    }
//                    final ArrayAdapter adapter = new ArrayAdapter(getActivity(), android.R.layout.simple_list_item_1, BTList);
//
//                    AlertDialog.Builder alertDialog = new AlertDialog.Builder(getActivity());
//                    LayoutInflater inflater = getLayoutInflater();
//                    View convertView = (View) inflater.inflate(R.layout.bt_list, null);
//                    alertDialog.setView(convertView);
//                    alertDialog.setTitle("Paired Devices");
//                    lv = (ListView) convertView.findViewById(R.id.BTList);
//                    lv.setAdapter(adapter);
//                    alertDialog.show();
                }
//                lv.setOnItemClickListener(new AdapterView.OnItemClickListener() {
//                    @Override
//                    public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
//                        final BluetoothDevice bluetoothDevice = bluetoothAdapter.getRemoteDevice(BTAddress.get(position));
//                        BluetoothConnect connectThread = new BluetoothConnect(bluetoothDevice);
//                        connectThread.execute();
//                    }
//                });
//                lv.setOnItemClickListener(myListClickListener);
                //endregion
            }
        });
        //endregion

        //<editor-fold desc="HomeviewModel">
        //        homeViewModel.getText().observe(getViewLifecycleOwner(), new Observer<String>() {
//            @Override
//            public void onChanged(@Nullable String s) {
//                textView.setText(s);
//            }
//        });
        //</editor-fold>

        updateData(root);
        return root;
    }

    private void isBluetoothSupported(){
        // Phone does not support Bluetooth so let the user know and exit.
        if (bluetoothAdapter == null) {
            new  AlertDialog.Builder(getActivity())
                    .setTitle("Not compatible")
                    .setMessage("Your phone does not support Bluetooth")
                    .setPositiveButton("Exit", new DialogInterface.OnClickListener(){
                        public void onClick(DialogInterface dialog, int which) {
                            System.exit(0);
                        }
                    })
                    .setIcon(android.R.drawable.ic_dialog_alert)
                    .show();
        }
    }
    public void updateData(final View view){
        Thread thread =new Thread(){
            @Override
            public void run(){
                while(!isInterrupted()){
                    try {
                        Thread.sleep(1000);  //1000ms = 1 sec
                        getActivity().runOnUiThread(new Runnable() {
                            @Override
                            public void run() {
                                //region ShowHideConnectButton
                                if (isConnected){
                                    btnConnect.setVisibility(view.GONE);
                                    lbl_connected.setVisibility(view.VISIBLE);
                                }
                                //endregion
                            }
                        });
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }
                }
            }
        };
        thread.start();
    }

    private class BluetoothConnect extends AsyncTask{
        private final BluetoothSocket mmSocket;
        private final BluetoothDevice mmDevice;

        private BluetoothConnect(BluetoothDevice device) {
            BluetoothSocket tmp = null;
            mmDevice = device;
            try {
//                bluetoothAdapter.cancelDiscovery();
                tmp = createBluetoothSocket(device);
//                tmp.connect();
            } catch (IOException e) {
                e.printStackTrace();
            }
            mmSocket = tmp;
        }

        @Override
        protected Object doInBackground(Object[] objects) {
            bluetoothAdapter.cancelDiscovery();
            try {
                // Connect to the remote device through the socket. This call blocks
                // until it succeeds or throws an exception.
                mmSocket.connect();
                System.out.println("STATUS: " + mmSocket.isConnected());
            } catch (IOException connectException) {
                // Unable to connect; close the socket and return.
                try {
                    mmSocket.close();
                    Log.e(TAG, "Connect exception", connectException);
                } catch (IOException closeException) {
                    Log.e(TAG, "Could not close the client socket", closeException);
                }
            }
            return null;
        }

    }
    private BluetoothSocket createBluetoothSocket(BluetoothDevice device) throws IOException {
        if(Build.VERSION.SDK_INT >= 10){
            try {
                final Method  m = device.getClass().getMethod("createInsecureRfcommSocketToServiceRecord", new Class[] { UUID.class });
                return (BluetoothSocket) m.invoke(device, mUUID);
            } catch (Exception e) {
                Log.e(TAG, "Could not create Insecure RFComm Connection",e);
            }
        }
        return  device.createRfcommSocketToServiceRecord(mUUID);
    }
}