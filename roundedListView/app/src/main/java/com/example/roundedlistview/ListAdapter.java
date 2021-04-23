package com.example.roundedlistview;

import android.content.Context;
import android.widget.BaseAdapter;

public class ListAdapter extends BaseAdapter {
    private List<ListBean> mList;
    private Context mContext;
    public ListAdapter(Context mContext,List<ListBean> mList) {
        this.mList = mList;
        this.mContext = mContext.getApplicationContext();
    }
    @Override
    public int getCount() {
        return this.mList.size();
    }
    @Override
    public Object getItem(int position) {
        return this.mList.get(position);
    }
    @Override
    public long getItemId(int position) {
        return position;
    }
    @Override
    public int getItemViewType(int position) {
// TODO Auto-generated method stub
        return super.getItemViewType(position);
    }
    @Override
    public int getViewTypeCount() {
// TODO Auto-generated method stub
        return super.getViewTypeCount();
    }
    @Override
    public View getView(int position, View convertView, ViewGroup parent) {
        ViewHolder holder = null;
        if (convertView == null) {
            holder = new ViewHolder();
            convertView = LayoutInflater.from(this.mContext).inflate(
                    R.layout.listview_item, null, false);
            holder.textView = (TextView) convertView
                    .findViewById(R.id.listview_item_textview);
            holder.imageView = (ImageView) convertView
                    .findViewById(R.id.listview_item_imageview);
            convertView.setTag(holder);
        } else {
            holder = (ViewHolder) convertView.getTag();
        }
        if(position==0){
            if(position == getCount()-1){ //只有一项
                convertView.setBackgroundResource(R.drawable.app_list_corner_round);
            }else{ //第一项
                convertView.setBackgroundResource(R.drawable.app_list_corner_round_top);
            }
        }else if(position == getCount()-1){
            convertView.setBackgroundResource(R.drawable.app_list_corner_round_bottom);
        }else{
            convertView.setBackgroundResource(R.drawable.app_list_corner_round_center);
        }
        ListBean lb = mList.get(position);
        holder.textView.setText(lb.getKey());
        return convertView;
    }
    static class ViewHolder {
        TextView textView;
        ImageView imageView;
    }
}