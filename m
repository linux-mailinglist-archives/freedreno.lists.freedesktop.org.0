Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F25B2EEECC
	for <lists+freedreno@lfdr.de>; Fri,  8 Jan 2021 09:54:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9FAB6E7DA;
	Fri,  8 Jan 2021 08:54:37 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1D3C6E7F1
 for <freedreno@lists.freedesktop.org>; Fri,  8 Jan 2021 08:54:35 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id i9so8216699wrc.4
 for <freedreno@lists.freedesktop.org>; Fri, 08 Jan 2021 00:54:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=QuR+JC6c/wr5a0vkmt1t5u+qCj+GkMz9/HxZNyt+DCY=;
 b=KEf3i2omZZwrv0pr+7ro9gc/I89DER1jlACD56wRz+nifPEPj/IDE1iVZjK6PfEWRp
 T2Yp7xx77cl1Rkn9p9GNx3ycylyqogHS2bd3s7GAyh3B47HzMJgsYbdhoQ3oO83UK6oy
 t0Dh4CL5Im4j98rEF4M9bSpgiysANPmfWfh6E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QuR+JC6c/wr5a0vkmt1t5u+qCj+GkMz9/HxZNyt+DCY=;
 b=gxsiq9pKd6z7Q0BtcH1xEOrfPYwElbwiKWLDZbek1PloJ18qO16kpTzXEU02QQldhI
 3KI6wheLvbjo5g6hq/4PWkwMX0rw8X7t5N6jWIBG3UGqQfjVhx0z+SNopWgNPI5Wj6ZE
 G/0hE9EfY1/pqEdk+R0+/0ta3CleB/n8JeJhJ1RPsaQljEE8OKRI9NghmqHKdom8s0Re
 J22tZLj26BLzbIhPuo3MnRFUGSeqUm0ysGVfKbbFMoxIIhTK9cpu6Ecs6hJwjZUVQ2A4
 d0AWi0UAmykrpPYV9y97bkPQfeqLrMYnUM2jKeF4zfleI8Wo/fHZBWp33A5xYXoOK8JD
 YPvw==
X-Gm-Message-State: AOAM533S1uoKCjrBGkRDuLROoX5Yv7trr5eT5GlckCjqoiXTmQHUWh43
 ofXsUhVo/iqd5q3W0MLqsN0oQQ==
X-Google-Smtp-Source: ABdhPJyNbFAVIbTd+XR5DzXliuhYX2RzBzptCc19XAuMuO9iVGMPScn3uS27BR0GrpdpehHcfqNU7Q==
X-Received: by 2002:adf:f58a:: with SMTP id f10mr2697031wro.338.1610096074512; 
 Fri, 08 Jan 2021 00:54:34 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l11sm12317188wrt.23.2021.01.08.00.54.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 00:54:33 -0800 (PST)
Date: Fri, 8 Jan 2021 09:54:31 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Rob Clark <robdclark@gmail.com>
Message-ID: <X/gdxzT+o8BcsoY9@phenom.ffwll.local>
References: <CAF6AEGtWMhzyD6kejmViZeZ+zfJxRvfq-R2t_zA+DcDiTxsYRQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAF6AEGtWMhzyD6kejmViZeZ+zfJxRvfq-R2t_zA+DcDiTxsYRQ@mail.gmail.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Subject: Re: [Freedreno] [pull] drm/msm: drm-msm-fixes-2021-01-07
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, Dave Airlie <airlied@gmail.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, Jan 07, 2021 at 01:54:59PM -0800, Rob Clark wrote:
> Hi Dave,
> 
> A few misc fixes
> 
> The following changes since commit e319a1b956f785f618611857cd946dca2bb68542:
> 
>   drm/msm: add IOMMU_SUPPORT dependency (2020-12-05 08:25:52 -0800)
> 
> are available in the Git repository at:
> 
>   https://gitlab.freedesktop.org/drm/msm.git drm-msm-fixes-2021-01-07

Applied, thanks.
-Daniel

> 
> for you to fetch changes up to 00fd44a1a4700718d5d962432b55c09820f7e709:
> 
>   drm/msm: Only enable A6xx LLCC code on A6xx (2021-01-07 09:23:05 -0800)
> 
> ----------------------------------------------------------------
> Craig Tatlor (1):
>       drm/msm: Call msm_init_vram before binding the gpu
> 
> Iskren Chernev (3):
>       drm/msm: Fix null dereference in _msm_gem_new
>       drm/msm: Ensure get_pages is called when locked
>       drm/msm: Add modparam to allow vram carveout
> 
> Konrad Dybcio (1):
>       drm/msm: Only enable A6xx LLCC code on A6xx
> 
> Kuogee Hsieh (1):
>       drm/msm/dp: postpone irq_hpd event during connection pending state
> 
> Rob Clark (1):
>       drm/msm: Fix WARN_ON() splat in _free_object()
> 
>  drivers/gpu/drm/msm/adreno/a2xx_gpu.c      |  6 ++++--
>  drivers/gpu/drm/msm/adreno/a3xx_gpu.c      |  6 ++++--
>  drivers/gpu/drm/msm/adreno/a4xx_gpu.c      |  6 ++++--
>  drivers/gpu/drm/msm/adreno/adreno_device.c |  4 ++++
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c    | 21 ++++++++++++---------
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  6 ++++++
>  drivers/gpu/drm/msm/dp/dp_display.c        |  7 +++++++
>  drivers/gpu/drm/msm/dp/dp_panel.c          | 12 +++++++++---
>  drivers/gpu/drm/msm/msm_drv.c              |  8 ++++----
>  drivers/gpu/drm/msm/msm_gem.c              | 13 +++++++++----
>  10 files changed, 63 insertions(+), 26 deletions(-)
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
