# -*- coding: UTF-8 -*-
#
# Copyright 2013 whiteleaf. All rights reserved.
#

require_relative "../helper"

module Command
  class Folder < CommandBase
    def initialize
      super("<target> [<target2> ...]")
      @opt.separator <<-EOS

  ・指定した小説の保存フォルダを開きます。

  Example:
    narou folder n9669bk
    narou folder musyoku
      EOS
    end

    def execute(argv)
      super
      if argv.empty?
        puts @opt.help
        return
      end
      argv.each do |target|
        dir = Downloader.get_novel_data_dir_by_target(target)
        puts dir
        Helper.open_directory_by_os_filer(dir)
      end
    end

    def oneline_help
      "小説の保存フォルダを開きます"
    end
  end
end
