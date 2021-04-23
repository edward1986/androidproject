package com.example.recyclerviewfilterable

import android.util.Log
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.Filter
import android.widget.Filterable
import android.widget.TextView
import androidx.recyclerview.widget.RecyclerView
import org.json.JSONObject

class MyAdapter(data: MutableList <MyBean>):
    RecyclerView.Adapter <MyAdapter.MyViewHolder> (), Filterable {

    companion object {
        const val TAG = "ceshi"
    }

    // Existence number
    private var mSourceList = mutableListOf <MyBean> ()

    // Survival filtration
    private var mFilterList = mutableListOf <MyBean> ()


    init {
        mSourceList = data
    }

    override fun onBindViewHolder (holder: MyViewHolder, position: Int) {
        holder.name.text = mFilterList[position].name
        holder.deliverType.text = mFilterList[position].deliverType
    }

    override fun onCreateViewHolder (parent: ViewGroup, viewType: Int): MyViewHolder {
        var view =
            LayoutInflater.from(parent.context).inflate(R.layout.item, parent, false)
        return MyViewHolder(view)
    }

    /**
     * * Note: This is the size of the set after the return
     * */
    override fun getItemCount (): Int {
        Log.i(TAG, "getItemCount: Quantity" + mFilterList.size)
        return mFilterList.size
    }



    inner class MyViewHolder (itemView: View): RecyclerView.ViewHolder (itemView) {
        // Product name
        var name: TextView = itemView.findViewById(R.id.tvName)

        // Delivery method
        var deliverType: TextView = itemView.findViewById(R.id.tvDeliverType)
    }
    /**
     * * Specific filtration operation
     * * Primary of the transmitter and transmitter
     * */
    override fun getFilter (): Filter {
        return object : Filter() {
            // Filtration operation
            override fun performFiltering(charSequence: CharSequence): FilterResults {
                val charString = charSequence.toString()
                Log.i(TAG, "performFiltering: fielding operation, fielding: $ charString")

                val jsonObject = JSONObject(charString)
                // Condition 1
                var condition1 = jsonObject.getString("condition1")
                // Condition 2
                var condition2 = jsonObject.getString("condition2")

                // Temporary use of two individual cities

                // Existence and filtration
                var theFilterList = if (condition1.isEmpty() && condition2.isEmpty()) {
                    // Excessive content, number of sources used
                    mSourceList
                } else if (condition2.isEmpty()) {
                    mSourceList.filter { it.type == condition1 }

                } else if (condition1.isEmpty()) {
                    mSourceList.filter { it.deliverType == condition2 }

                } else {
                    mSourceList.filter { it.type == condition1 && it.deliverType == condition2 }
                }
                val filterResults = FilterResults()
                filterResults.values = theFilterList
                return filterResults
            }

            // Update the parallel progress that can be returned after the filtration
            override fun publishResults(
                charSequence: CharSequence,
                filterResults: FilterResults
            ) {
                mFilterList = filterResults.values  as MutableList <MyBean>
                notifyDataSetChanged()
            }
        }
    }
}
