package com.example.navigation

import android.os.Bundle
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.TextView
import androidx.databinding.DataBindingUtil
import com.example.navigation.databinding.FragmentSecondBinding

/**
 * A simple [Fragment] subclass.
 */
class SecondFragment : Fragment() {
private lateinit var binding: FragmentSecondBinding
    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        binding = DataBindingUtil.inflate(inflater,R.layout.fragment_second, container, false)

        var input = requireArguments().getString("user_input")
        binding.textView.text = input.toString()

        return binding.root

    }

}
