Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B29141276
	for <lists+freedreno@lfdr.de>; Fri, 17 Jan 2020 21:48:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AEFA6F91B;
	Fri, 17 Jan 2020 20:48:12 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-vk1-xa41.google.com (mail-vk1-xa41.google.com
 [IPv6:2607:f8b0:4864:20::a41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E6746F91D
 for <freedreno@lists.freedesktop.org>; Fri, 17 Jan 2020 20:48:11 +0000 (UTC)
Received: by mail-vk1-xa41.google.com with SMTP id u6so7013352vkn.13
 for <freedreno@lists.freedesktop.org>; Fri, 17 Jan 2020 12:48:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0kvYoN4fXranoTX+Qa5a0sJ3/lj3Hn7yx+pDCue4/XE=;
 b=k5d/i0E8CkSojnVTZut2knWfj21OwOXmdo8M42Tg7VctwZXbTz4V/giKwj5QPWrtND
 5lOgNmPuGjz/W9R+Rgl1Ed1GeyFLknOE8yyOucUTpUTfCFTa0Ej0N3Uu52sgf5B5uFF0
 LKSmm921h73ejQAO7KNBMDsqVHZBI0Bgkn5e82q3JZPCa2904XduX8eOA3UXQ0o0Iolz
 fwNhnpiaNL2MTEsqW9Pq05ZTmOEeKXEHpihRitgcsMhci1bd9WdzZmsBhwW198PAtMU1
 dGgPKK4Ac2bpqOVnmEAMbh+abS13iZ5jFWrhOzktZdlFDOombq44J05cjnUbE/RgQpz1
 6D7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0kvYoN4fXranoTX+Qa5a0sJ3/lj3Hn7yx+pDCue4/XE=;
 b=VTTHAYEkUBaGvoehkfHk/mkMNzR0Bv0ynvxrRcImkKPd07uMO41aqqDBfzdQjvxoSg
 UOuJaC175qocXwPKlsw3r2lbx6t73jDfvKZ3dLofzcEhWr/Mt0qnn/UIOZK5f+j6AS6P
 U+LVZ8ZPekeA3j6cuCVKOOGUPnthh4WVYQOE+ECGVnk+QNKuUgzoZb16JCbsN5ESQvkp
 vkuzEDBSVp7yGJ3zW4yArH/VOBO/oY3Bu0qYMlbl6bHUwtsPw7WDvOGfCRD5EU/ElG/h
 HHxpA3BK3RqI6w1JvZbRtGiWFVsJGxdrGfO0fzT+UkvlGTElWgyQs8YgLkJhuiGGyON2
 LZ/g==
X-Gm-Message-State: APjAAAXVTm/HSJ3WopMinevu7Hi9u8nII0USJHgnkQjgX2SStjE5AI4C
 76L8FgRqs1Y3ueQP/pE2whtJhcHy6cm0ADtONoRCcQ==
X-Google-Smtp-Source: APXvYqz+kmGzGuNvOvVxhPATYhmcnsL6GJHTgKQ9ubRXxPOlN1Q7ZFiZ1Z8r9MVbFsMAsMjwDFzboW2Vqzv8b8zV5ew=
X-Received: by 2002:a1f:5e54:: with SMTP id s81mr25168776vkb.78.1579294090074; 
 Fri, 17 Jan 2020 12:48:10 -0800 (PST)
MIME-Version: 1.0
References: <20200115205649.12971-1-brian@brkho.com>
In-Reply-To: <20200115205649.12971-1-brian@brkho.com>
From: Kristian Kristensen <hoegsberg@google.com>
Date: Fri, 17 Jan 2020 12:47:58 -0800
Message-ID: <CAOPc6T=bfEt3=VbzAQGtFi01oDgcxgrZLkMb4QWO1WWEou3_Ww@mail.gmail.com>
To: Brian Ho <brian@brkho.com>
Subject: Re: [Freedreno] [PATCH v2 0/2] drm/msm: Add the MSM_WAIT_IOVA ioctl
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 jcrouse@codeaurora.org, hoegsberg <hoegsberg@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Wed, Jan 15, 2020 at 12:57 PM Brian Ho <brian@brkho.com> wrote:
>
> This patch set implements the MSM_WAIT_IOVA ioctl which lets
> userspace sleep until the value at a given iova reaches a certain
> condition. This is needed in turnip to implement the
> VK_QUERY_RESULT_WAIT_BIT flag for vkGetQueryPoolResults.
>
> First, we add a GPU-wide wait queue that is signaled on all IRQs.
> We can then wait on this wait queue inside MSM_WAIT_IOVA until the
> condition is met.
>
> The corresponding merge request in mesa can be found at:
> https://gitlab.freedesktop.org/mesa/mesa/merge_requests/3279
>
> Changes in v2:
>     * Updated cleanup logic on error
>     * Added a mask
>     * 32 bit values by default

For the series:

Reviewed-by: Kristian H. Kristensen <hoegsberg@google.com>

> Brian Ho (2):
>   drm/msm: Add a GPU-wide wait queue
>   drm/msm: Add MSM_WAIT_IOVA ioctl
>
>  drivers/gpu/drm/msm/msm_drv.c | 61 +++++++++++++++++++++++++++++++++--
>  drivers/gpu/drm/msm/msm_gpu.c |  4 +++
>  drivers/gpu/drm/msm/msm_gpu.h |  3 ++
>  include/uapi/drm/msm_drm.h    | 14 ++++++++
>  4 files changed, 80 insertions(+), 2 deletions(-)
>
> --
> 2.25.0.rc1.283.g88dfdc4193-goog
>
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
