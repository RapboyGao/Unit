import os
import tkinter as tk
from tkinter import filedialog, messagebox

def summarize_swift_files_to_md(directory, output_md):
    """
    汇总指定目录中所有 .swift 文件的内容到 .md 文件中，忽略 .build 文件夹。
    
    :param directory: 包含 .swift 文件的目录。
    :param output_md: 输出的 .md 文件路径。
    """
    # 打开输出的 .md 文件，使用 UTF-8 编码
    with open(output_md, 'w', encoding='utf-8') as md_file:
        md_file.write("# Summary of .swift files\n\n")  # 写入标题
        
        # 遍历目录中的所有文件
        for root, dirs, files in os.walk(directory):
            # 检查当前路径中是否包含 .build 文件夹
            if '.build' in root.split(os.sep):
                continue
            
            for file in files:
                if file.endswith(".swift"):  # 仅处理 .swift 文件
                    file_path = os.path.join(root, file)  # 获取文件的完整路径
                    relative_path = os.path.relpath(file_path, directory)  # 获取相对路径
                    
                    md_file.write(f"## {relative_path}\n\n")  # 写入文件相对路径
                    md_file.write("```swift\n")
                    
                    # 读取 .swift 文件内容并写入 .md 文件
                    with open(file_path, 'r', encoding='utf-8') as swift_file:
                        content = swift_file.read()
                        md_file.write(content)
                    
                    md_file.write("\n```\n\n")  # 结束代码块

    # 显示成功消息
    messagebox.showinfo("Success", f"Summary of .swift files has been written to {output_md}")

def select_directory():
    """
    打开文件夹选择对话框，选择目标目录。
    """
    directory = filedialog.askdirectory()
    directory_entry.delete(0, tk.END)
    directory_entry.insert(0, directory)

def select_output_file():
    """
    打开保存文件对话框，选择输出的 .md 文件路径。
    """
    output_file = filedialog.asksaveasfilename(defaultextension=".md", filetypes=[("Markdown files", "*.md")])
    output_entry.delete(0, tk.END)
    output_entry.insert(0, output_file)

def run_summary():
    """
    执行汇总操作，检查输入是否有效。
    """
    target_directory = directory_entry.get()
    output_markdown = output_entry.get()
    
    if not target_directory or not output_markdown:
        # 如果没有选择目录或输出文件，显示警告消息
        messagebox.showwarning("Warning", "Please select both a directory and an output file.")
        return
    
    # 调用函数进行汇总
    summarize_swift_files_to_md(target_directory, output_markdown)

# 设置图形用户界面
root = tk.Tk()
root.title("Swift Files Summarizer")

# 创建框架
frame = tk.Frame(root)
frame.pack(padx=10, pady=10)

# 创建标签和输入框，用于选择目标目录
directory_label = tk.Label(frame, text="Target Directory:")
directory_label.grid(row=0, column=0, padx=5, pady=5, sticky=tk.W)
directory_entry = tk.Entry(frame, width=50)
directory_entry.grid(row=0, column=1, padx=5, pady=5)
directory_button = tk.Button(frame, text="Browse", command=select_directory)
directory_button.grid(row=0, column=2, padx=5, pady=5)

# 创建标签和输入框，用于选择输出文件
output_label = tk.Label(frame, text="Output Markdown File:")
output_label.grid(row=1, column=0, padx=5, pady=5, sticky=tk.W)
output_entry = tk.Entry(frame, width=50)
output_entry.grid(row=1, column=1, padx=5, pady=5)
output_button = tk.Button(frame, text="Browse", command=select_output_file)
output_button.grid(row=1, column=2, padx=5, pady=5)

# 创建运行按钮，执行汇总操作
run_button = tk.Button(frame, text="Run", command=run_summary)
run_button.grid(row=2, column=1, pady=10)

# 进入主循环，显示窗口
root.mainloop()
