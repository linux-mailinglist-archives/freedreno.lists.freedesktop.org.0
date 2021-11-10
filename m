Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6268B44C073
	for <lists+freedreno@lfdr.de>; Wed, 10 Nov 2021 13:00:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E25DE6E949;
	Wed, 10 Nov 2021 11:59:59 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F66B6E933;
 Wed, 10 Nov 2021 11:59:58 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10163"; a="256346129"
X-IronPort-AV: E=Sophos;i="5.87,223,1631602800"; d="scan'208";a="256346129"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2021 03:59:57 -0800
X-IronPort-AV: E=Sophos;i="5.87,223,1631602800"; d="scan'208";a="602181096"
Received: from thrakatuluk.fi.intel.com (HELO thrakatuluk) ([10.237.72.185])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2021 03:59:55 -0800
Received: from platvala by thrakatuluk with local (Exim 4.94)
 (envelope-from <petri.latvala@intel.com>)
 id 1mkmFZ-0006OP-BJ; Wed, 10 Nov 2021 13:58:45 +0200
Date: Wed, 10 Nov 2021 13:58:45 +0200
From: Petri Latvala <petri.latvala@intel.com>
To: Rob Clark <robdclark@gmail.com>
Message-ID: <YYuz9dMFO4g/shU4@platvala-desk.ger.corp.intel.com>
References: <20211109180905.590773-1-robdclark@gmail.com>
 <20211109180905.590773-2-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211109180905.590773-2-robdclark@gmail.com>
X-Patchwork-Hint: comment
Subject: Re: [Freedreno] [igt-dev] [PATCH igt 1/3] lib/igt_debugfs: Add
 helper for writing debugfs files
X-BeenThere: freedreno@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Freedreno graphics driver community testing & development
 <freedreno.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno@lists.freedesktop.org>
List-Help: <mailto:freedreno-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=subscribe>
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, igt-dev@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue, Nov 09, 2021 at 10:09:03AM -0800, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  lib/igt_debugfs.c | 16 ++++++++++++++++
>  lib/igt_debugfs.h | 12 ++++++++++++
>  2 files changed, 28 insertions(+)
> 
> diff --git a/lib/igt_debugfs.c b/lib/igt_debugfs.c
> index a5bb95ca..39431068 100644
> --- a/lib/igt_debugfs.c
> +++ b/lib/igt_debugfs.c
> @@ -351,6 +351,22 @@ void __igt_debugfs_read(int fd, const char *filename, char *buf, int size)
>  	close(dir);
>  }
>  
> +/**
> + * __igt_debugfs_write:
> + * @filename: file name
> + * @buf: buffer to be written to the debugfs file
> + * @size: size of the buffer

I see that we have this mistake in __igt_debugfs_read already but no
reason to repeat mistakes: Also document the fd parameter.


> + *
> + * This function opens the debugfs file, writes it, then closes the file.
> + */
> +void __igt_debugfs_write(int fd, const char *filename, const char *buf, int size)
> +{
> +	int dir = igt_debugfs_dir(fd);
> +
> +	igt_sysfs_write(dir, filename, buf, size);
> +	close(dir);
> +}
> +
>  /**
>   * igt_debugfs_search:
>   * @filename: file name
> diff --git a/lib/igt_debugfs.h b/lib/igt_debugfs.h
> index d43ba6c6..249eb56a 100644
> --- a/lib/igt_debugfs.h
> +++ b/lib/igt_debugfs.h
> @@ -40,6 +40,7 @@ int igt_debugfs_pipe_dir(int device, int pipe, int mode);
>  
>  int igt_debugfs_open(int fd, const char *filename, int mode);
>  void __igt_debugfs_read(int fd, const char *filename, char *buf, int size);
> +void __igt_debugfs_write(int fd, const char *filename, const char *buf, int size);
>  int igt_debugfs_simple_read(int dir, const char *filename, char *buf, int size);
>  bool igt_debugfs_search(int fd, const char *filename, const char *substring);
>  
> @@ -54,6 +55,17 @@ bool igt_debugfs_search(int fd, const char *filename, const char *substring);
>  #define igt_debugfs_read(fd, filename, buf) \
>  		__igt_debugfs_read(fd, (filename), (buf), sizeof(buf))
>  
> +/**
> + * igt_debugfs_write:
> + * @filename: name of the debugfs file
> + * @buf: buffer to be written to the debugfs file
> + *
> + * This is just a convenience wrapper for __igt_debugfs_read. See its
> + * documentation.

Same here regarding the fd parameter as above. Also copypaste mistake
with s/debugfs_read/debugfs_write/.


-- 
Petri Latvala


> + */
> +#define igt_debugfs_write(fd, filename, buf) \
> +		__igt_debugfs_write(fd, (filename), (buf), sizeof(buf))
> +
>  /*
>   * Pipe CRC
>   */
> -- 
> 2.31.1
> 
