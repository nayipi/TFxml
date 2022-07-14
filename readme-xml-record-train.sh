
https://blog.csdn.net/RobotFutures/article/details/124745966

labelimg标注得到xml文件和jpg 检测猫狗，实际只有一个分类 raccoon

xml to record

# images 中jpg和xml 复制分开到 train test 中
python 0partition_dataset.py -x -i images/ -r 0.1
# -x 表明输入文件格式是xml文件
# -i 指定图像文件所在目录
# -r 指定训练集、评估集切分比例，0.1代表评估集占比10%

annotations/label_map.pbtxt
item {
  id: 1
  name: 'raccoon'
}



# train 和 test中的文件 转record 到 annotations
python 1generate_tfrecord.py -x images/train -l annotations/label_map.pbtxt -o annotations/train.record

python 1generate_tfrecord.py -x images/val -l annotations/label_map.pbtxt -o annotations/val.record

