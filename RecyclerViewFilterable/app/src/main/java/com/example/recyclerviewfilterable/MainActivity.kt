package com.example.recyclerviewfilterable

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import android.view.View
import android.widget.AdapterView
import androidx.recyclerview.widget.LinearLayoutManager
import kotlinx.android.synthetic.main.activity_main.*
import org.json.JSONObject

class MainActivity : AppCompatActivity() {

    companion object {
        const val TAG = "TAG: "
        const val CONDITION1 = "condition1"
        const val CONDITION2 = "condition2"
    }

    //Filter condition 1
    var condition1 = ""

    //Filter condition 2
    var condition2 = ""

    //Total filter conditions
    var jsonObject = JSONObject()

    private var dataList = mutableListOf<MyBean>()
    var myAdapter = MyAdapter(dataList)

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)


        jsonObject.put(CONDITION1, condition1)
        jsonObject.put(CONDITION2, condition2)

        initData()
        mRecyclerView.layoutManager = LinearLayoutManager(this)
        mRecyclerView.adapter = myAdapter

        /**
         * * Commodity type selection
         * */
        mSpinner1.onItemSelectedListener = object : AdapterView.OnItemSelectedListener {
            override fun onNothingSelected(p0: AdapterView<*>?) {
                myAdapter.filter.filter("")
                Log.i(TAG, "onNothingSelected: Filter 1 no selection")
            }

            override fun onItemSelected(
                parent: AdapterView<*>?,
                view: View?,
                position: Int,
                id: Long) {
                when (position) {
                    //0 will be selected by default
                    0 -> {
                        condition1 = ""
                    }
                    1 -> {
                        condition1 = "type1"
                    }
                    2 -> {
                        condition1 = "type2"
                    }
                    3 -> {
                        condition1 = "type3"
                    }
                    4 -> {
                        condition1 = "type4"
                    }
                }
                jsonObject.put(CONDITION1, condition1)
                myAdapter.filter.filter(jsonObject.toString())
            }
        }

        /**
         * * Delivery method selection
         * */
        mSpinner2.onItemSelectedListener = object : AdapterView.OnItemSelectedListener {
            override fun onNothingSelected(p0: AdapterView<*>?) {
                myAdapter.filter.filter("")
                Log.i(TAG, "onNothingSelected: Filter 2 not selected")
            }

            override fun onItemSelected(
                    parent: AdapterView<*>?,
                    view: View?,
                    position: Int,
                    id: Long) {
                when (position) {
                    0 -> {
                        condition2 = ""
                    }
                    1 -> {
                        condition2 = "Same city delivery"
                    }
                    2 -> {
                        condition2 = "Ordinary express"
                    }
                }
                jsonObject.put(CONDITION2, condition2)
                myAdapter.filter.filter(jsonObject.toString())
            }
        }

    }



    /**
     * * Initialization data
     * */
    private fun initData() {
        dataList.add(MyBean("type1", "strawberry", "Same city delivery"))
        dataList.add(MyBean("type1", "banana", "Normal express"))
        dataList.add(MyBean("type1", "watermelon", "Same city delivery"))
        dataList.add(MyBean("type1", "Grapefruit", "Normal Express"))
        dataList.add(MyBean("type1", "pear", "Same city delivery"))
        dataList.add(MyBean("type2", "green onion", "normal express"))
        dataList.add(MyBean("type2", "tomato", "Same city delivery"))
        dataList.add(MyBean("type2", "Potato", "Normal Express"))
        dataList.add(MyBean("type2", "pumpkin", "Same city delivery"))
        dataList.add(MyBean("type2", "carrot", "normal express"))
        dataList.add(MyBean("type3", "Pepsi", "Same city delivery"))
        dataList.add(MyBean("type3", "Vitality Forest", "Ordinary express"))
        dataList.add(MyBean("type3", "Sprite", "Same city delivery"))
        dataList.add(MyBean("type3", "Juice", "Ordinary express"))
        dataList.add(MyBean("type3", "food3", "Same city Delivery"))
        dataList.add(MyBean("type4", "melon seeds", "Ordinary express"))
        dataList.add(MyBean("type4", "food", "Same city Delivery"))
        dataList.add(MyBean("type4", "food 2", "Ordinary express"))
        dataList.add(MyBean("type4", "Fresh Shrimp Stick", "Same city Delivery"))
        dataList.add(MyBean("type4", "Gluten", "Ordinary express"))
    }


}
