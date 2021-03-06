# Zotero快速上手

## 1.Zotero简介

这是一款文献管理软件，三大平台都有。自行安装。

[官网地址](https://www.zotero.org/)

## 2.云端同步

Zotero的云端只提供了100MB的空间（远远不够），因此建议搭配坚果云进行扩容。

[注册坚果云账号](https://www.jianguoyun.com/)

[注册Zotero账号](https://www.zotero.org/user/register)

打开坚果云的网页端→（右上角）用户名处→账户信息→安全选项→第三方应用管理→添加应用

之后会自动生成一串密码

之后打开Zotero，编辑→首选项→同步→（下半部分）文件同步→选择WebDav，地址账户密码都在刚刚的坚果云中存在了，直接照抄即可。

如果提示需要新建“Zotero”文件，则建立即可。

## 3.管理文献

Zotero可以批量添加文献，并进行文献的分类整理。最简单的批量添加方式是在资源管理器中选中需要添加的文献，随后拖动至Zotero中，即可完成添加。添加过后的文献会以“条目”的方式加入本地的库中。这个库实际上并不在Zotero的安装位置中，而是在系统文件夹中，即C:\User\zotero，相当于将添加的文献复制在了这个文件夹中，复制后的文件夹名是随机生成的。换句话说，Zotero自行建立了一个本地的复制，其中每一个随机生成的文件夹都是一篇文献的“条目”。这个本地复制的文件夹位置可以在设置中修改，在“编辑→首选项→高级→文件和文件夹”中可以找到相关的设置。

### 3.1 重命名文献

选中一篇文献（单击），在Zotero界面的右边会出现文献的相关信息，双击相关信息中文件名上方的文献名，即可重命名。

注意，这里对文献的重命名仅对Zotero的本地库（在C盘）中复制后的文献有效，对文献的原文件（添加到Zotero前的文件）无改变。与此同一原理的还有对文献的修改，比如在 文献.pdf 中高亮了某一行，则修改的是本地库中的文献文件，而并非文献的原文件。

除此以外，建议使用Zotero配套的插件[Zotfile](http://zotfile.com/index.html#changelog)进行文件的批量处理。下载Zotfile后，在Zotero中打开 工具→插件，将Zotfile的.xpi文件拖入到对话框中安装即可。

#### 3.1.1 Zotfile批量重命名

安装好Zotfile之后，可以在Zotero→工具→Zotfile Preference 中进行相关设置。重命名的相关操作在“Renaming Rules”中的“Renaming Format”进行设置。调整好相关的内容后，保存设置，在Zotero界面中右键选择需要重新命名的文件，在弹出的对话框中选择“Manage Attachments”→”Rename Attachments“即可。

### 3.2 文献关联

选中一篇文献（单击），还是在Zotero界面的右边的相关信息，有“相关的[点击此处]”选项，单击选择相关的文献，即可关联多篇文献。同时，被关联的文献也会有相应的关联显示。

### 3.3 条目

通常添加文献到文献库中，Zotero会自动生成包括该文献（并以该文献命名）的条目，这个条目是可以更改的，并且与文献相似，可以重命名条目、关联不同条目或文献，除此之外还可以添加标签（文献也可以添加标签）和笔记（条目的笔记有单独的页面，并且可以添加多条，文献的笔记没有单独页面，但是添加起来更方便）

## 4.参考资料

[Zotero操作指南](https://zhuanlan.zhihu.com/p/98428625?from_voters_page=true)，来源：知乎

[Zotero官方开源](https://github.com/zotero/zotero)，来源：GitHub

