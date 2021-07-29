Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E218E3D9A34
	for <lists+freedreno@lfdr.de>; Thu, 29 Jul 2021 02:46:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 321486E372;
	Thu, 29 Jul 2021 00:46:02 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 603566E50B
 for <freedreno@lists.freedesktop.org>; Thu, 29 Jul 2021 00:35:44 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 l34-20020a05600c1d22b02902573c214807so166378wms.2
 for <freedreno@lists.freedesktop.org>; Wed, 28 Jul 2021 17:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=A91VsRhxCCDIXtkfswtebSEJGkGdWMGW8PkmZnFfEqA=;
 b=SvncO4Q5IeNq+bdgnrabIUmkNm8M0cS+oXjh52oWxM6ucE1MgJgrpPpRzS6DfOWLhK
 +UMuvIZp8L1pAIpoWX3lcrSdQL7TGpie938D0Kjg2uk3YBltmP4EnEYvWXhbAuFEPL90
 UW28LH6i40CmJ1nj7nzsyo6pVgJ8l0Qwtb/R5I8vJ76DZy/cHvkZaTFRtcC5636j+ZF/
 kyn5krxJNmHzfoFc8O7PcVLenwCgWvpQc5f3dTWnZZb9M5FjqsK/ULvV/X8lxOSI0Uwa
 +7yWsSJwVSQ/WxXuBuD7EXFCFbHWsUWPYRXVsV4g4XnygTCYCMq2uGgRLMG4JtxaErII
 ysDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=A91VsRhxCCDIXtkfswtebSEJGkGdWMGW8PkmZnFfEqA=;
 b=dgti7TeYzGCQ+yJSYohtO1hiNHl590DaVQP4h+cQN8WgCNz4eY0uZgBfDDw0/sSpfo
 Xg9mR+P7TiGevKFbLtGJkaOq2ab2BTsmzDs6WcP0KLr5TKRmMfV0wS9EC9vG/pmqdtMB
 CzVe49KvjLy6YfTFSrDkBaJcoOuySD0U/VpgfquzjjJsoxCZwco6OfghDj9WjCXz/tDC
 1tyuKbYLCWCt05Sr0Ynlm25h5MJMmFB4qddtpttkV0X2hTWOng6DkpCk1GWPRYR2BcbG
 nTk9//cxUMjrD8TuPoK7IiZl7TabaTjntpx0yByazQZ4eqL4OAEGO+zqL4QItbvWXa79
 7mEg==
X-Gm-Message-State: AOAM5339zs0AJcD5ze2pi0QcLeOeSXYfA2TEgEogKJLdTxJRHoejKiix
 Of8P5962w+tM6unN+r2gH3FBbg==
X-Google-Smtp-Source: ABdhPJxNnhr67/krO6Od73KqvFm2SWsrllggrEWrmt1dtZmyIJrwfJHmKsNApbDqElBq2VnfEKWdXw==
X-Received: by 2002:a1c:f40a:: with SMTP id z10mr2073824wma.119.1627518942865; 
 Wed, 28 Jul 2021 17:35:42 -0700 (PDT)
Received: from [192.168.1.12] (host-80-41-121-59.as13285.net. [80.41.121.59])
 by smtp.gmail.com with ESMTPSA id
 p5sm1628396wrd.25.2021.07.28.17.35.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Jul 2021 17:35:42 -0700 (PDT)
To: Rob Clark <robdclark@gmail.com>, Dave Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <SKuAxGshCZFzlguCiEJOU0kAFCJ9WDGK_qCmPESnrghqei0-VIp4DD5vL58OEJCq2B-AkvF1az0EedzkGjSNLQ==@protonmail.internalid>
 <CAF6AEGumRk7H88bqV=H9Fb1SM0zPBo5B7NsCU3jFFKBYxf5k+Q@mail.gmail.com>
From: Caleb Connolly <caleb.connolly@linaro.org>
Message-ID: <7553f3cd-61c8-3ece-14ec-6c0cf4ae0296@linaro.org>
Date: Thu, 29 Jul 2021 01:35:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAF6AEGumRk7H88bqV=H9Fb1SM0zPBo5B7NsCU3jFFKBYxf5k+Q@mail.gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 29 Jul 2021 00:46:01 +0000
Subject: Re: [Freedreno] [early pull] drm/msm: drm-msm-next-2021-07-28 for
 v5.15
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
Cc: linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi Rob,

This series causes a fatal crash on my Oneplus 6, the device goes to 
Qualcomm crashdump mode shortly after reaching UI with the following errors:

https://paste.ubuntu.com/p/HvjmzZYtgw/

I did a git bisect and the patch ("drm/msm: Devfreq tuning") seems to be 
the cause of the crash, reverting it resolves the issue.


On 28/07/2021 21:52, Rob Clark wrote:
> Hi Dave & Daniel,
> 
> An early pull for v5.15 (there'll be more coming in a week or two),
> consisting of the drm/scheduler conversion and a couple other small
> series that one was based one.  Mostly sending this now because IIUC
> danvet wanted it in drm-next so he could rebase on it.  (Daniel, if
> you disagree then speak up, and I'll instead include this in the main
> pull request once that is ready.)
> 
> This also has a core patch to drop drm_gem_object_put_locked() now
> that the last use of it is removed.
> 
> The following changes since commit ff1176468d368232b684f75e82563369208bc371:
> 
>    Linux 5.14-rc3 (2021-07-25 15:35:14 -0700)
> 
> are available in the Git repository at:
> 
>    https://gitlab.freedesktop.org/drm/msm.git drm-msm-next-2021-07-28
> 
> for you to fetch changes up to 4541e4f2225c30b0e9442be9eb2fb8b7086cdd1f:
> 
>    drm/msm/gem: Mark active before pinning (2021-07-28 09:19:00 -0700)
> 
> ----------------------------------------------------------------
> Rob Clark (18):
>        drm/msm: Let fences read directly from memptrs
>        drm/msm: Signal fences sooner
>        drm/msm: Split out devfreq handling
>        drm/msm: Split out get_freq() helper
>        drm/msm: Devfreq tuning
>        drm/msm: Docs and misc cleanup
>        drm/msm: Small submitqueue creation cleanup
>        drm/msm: drop drm_gem_object_put_locked()
>        drm: Drop drm_gem_object_put_locked()
>        drm/msm/submit: Simplify out-fence-fd handling
>        drm/msm: Consolidate submit bo state
>        drm/msm: Track "seqno" fences by idr
>        drm/msm: Return ERR_PTR() from submit_create()
>        drm/msm: Conversion to drm scheduler
>        drm/msm: Drop submit bo_list
>        drm/msm: Drop struct_mutex in submit path
>        drm/msm: Utilize gpu scheduler priorities
>        drm/msm/gem: Mark active before pinning
> 
>   drivers/gpu/drm/drm_gem.c                   |  22 --
>   drivers/gpu/drm/msm/Kconfig                 |   1 +
>   drivers/gpu/drm/msm/Makefile                |   1 +
>   drivers/gpu/drm/msm/adreno/a5xx_debugfs.c   |   4 +-
>   drivers/gpu/drm/msm/adreno/a5xx_gpu.c       |   6 +-
>   drivers/gpu/drm/msm/adreno/a5xx_power.c     |   2 +-
>   drivers/gpu/drm/msm/adreno/a5xx_preempt.c   |   7 +-
>   drivers/gpu/drm/msm/adreno/a6xx_gmu.c       |  12 +-
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c       |   6 +-
>   drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c |   4 +-
>   drivers/gpu/drm/msm/adreno/adreno_gpu.c     |   6 +-
>   drivers/gpu/drm/msm/msm_drv.c               |  30 ++-
>   drivers/gpu/drm/msm/msm_fence.c             |  53 +----
>   drivers/gpu/drm/msm/msm_fence.h             |  44 +++-
>   drivers/gpu/drm/msm/msm_gem.c               |  94 +-------
>   drivers/gpu/drm/msm/msm_gem.h               |  47 ++--
>   drivers/gpu/drm/msm/msm_gem_submit.c        | 344 +++++++++++++++++-----------
>   drivers/gpu/drm/msm/msm_gpu.c               | 220 ++++--------------
>   drivers/gpu/drm/msm/msm_gpu.h               | 139 ++++++++++-
>   drivers/gpu/drm/msm/msm_gpu_devfreq.c       | 203 ++++++++++++++++
>   drivers/gpu/drm/msm/msm_rd.c                |   6 +-
>   drivers/gpu/drm/msm/msm_ringbuffer.c        |  69 +++++-
>   drivers/gpu/drm/msm/msm_ringbuffer.h        |  12 +
>   drivers/gpu/drm/msm/msm_submitqueue.c       |  53 +++--
>   include/drm/drm_gem.h                       |   2 -
>   include/uapi/drm/msm_drm.h                  |  14 +-
>   26 files changed, 865 insertions(+), 536 deletions(-)
>   create mode 100644 drivers/gpu/drm/msm/msm_gpu_devfreq.c
> 

-- 
Kind Regards,
Caleb (they/them)
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
