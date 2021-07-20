Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C9A3CFB90
	for <lists+freedreno@lfdr.de>; Tue, 20 Jul 2021 16:07:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E9B26E3EF;
	Tue, 20 Jul 2021 14:07:30 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9621A6E3EF
 for <freedreno@lists.freedesktop.org>; Tue, 20 Jul 2021 14:07:29 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 l18-20020a1ced120000b029014c1adff1edso1572998wmh.4
 for <freedreno@lists.freedesktop.org>; Tue, 20 Jul 2021 07:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=NhiaQkSCHPQx+ne2ETdlu6yODY4PxPdrO6TLTCHDEvo=;
 b=AbV7T8HvSTYfx7yF5o/wHZ6AbP9cbbnHR6simTxT5F2QgalLEh3Zv7zaCsj+iLKyB+
 Pj86CpN7A4sNSRwvVjPdfaX8QWev0o9Y3SuETieOM3yAYO1hPR17h/6YHdLKCBfpYqOq
 0xanI2HXzwfifg0mxPZDCYmHVwhR3CiSIXtXU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=NhiaQkSCHPQx+ne2ETdlu6yODY4PxPdrO6TLTCHDEvo=;
 b=mz1cEdjNqfoq1QAgpX+U55lb0394JX4rm3Mge3fFKItPhnYWsvTMNM6kLfbl3HV8Bx
 NWbR6oaulp9m33xpQrQdNJPBt3bi9oUDP5LjNkwag33Aot6WFtEAvBJ1seyJEwia8IJ4
 /InG86v2dy66fjiuwzh/bBcxzNEqRtOgWdI5Oo6n0wD4VCSskCX1na7T8xYL1DbntZbX
 FcL/1HcxhgVTaaVTDbURIScIV4h7cU9K/3pA2EtcWU4ZFyMHyUFM8icuU510Xb/EoWgA
 Vc59xmS1NqekzqCTJj5+EX81rslD3uOFOzM4QoBWI7LgS0iRy4CBnjdXPyNsiEopR08x
 oQnw==
X-Gm-Message-State: AOAM530pGulxzexNPuHAbSNQwIfKjGeYapAwYZdeFSlUz7k/cvChqFgw
 IVH85ieOzepik1pZvdYQlb8/Xg==
X-Google-Smtp-Source: ABdhPJympAVWx+89WOJs70xZyzGidYkvS7+zE+nPVH5Jqu38ByIK/jJxawzGearAHIs1mQR4Vm9qng==
X-Received: by 2002:a05:600c:20b:: with SMTP id
 11mr39063501wmi.112.1626790048280; 
 Tue, 20 Jul 2021 07:07:28 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s17sm24408502wrv.2.2021.07.20.07.07.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 07:07:26 -0700 (PDT)
Date: Tue, 20 Jul 2021 16:07:24 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <YPbYnLBin9N4weiC@phenom.ffwll.local>
Mail-Followup-To: Christian =?iso-8859-1?Q?K=F6nig?=
 <ckoenig.leichtzumerken@gmail.com>, 
 Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org,
 Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 open list <linux-kernel@vger.kernel.org>,
 Jonathan Marek <jonathan@marek.ca>, Emma Anholt <emma@anholt.net>,
 Bernard Zhao <bernard@vivo.com>,
 Sharat Masetty <smasetty@codeaurora.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 Douglas Anderson <dianders@chromium.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Zhenzhong Duan <zhenzhong.duan@gmail.com>,
 "Kristian H. Kristensen" <hoegsberg@google.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Lee Jones <lee.jones@linaro.org>, Dave Airlie <airlied@redhat.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
References: <20210717202924.987514-1-robdclark@gmail.com>
 <582b8869-f370-3803-60a8-df31088f8088@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <582b8869-f370-3803-60a8-df31088f8088@gmail.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
Subject: Re: [Freedreno] [Linaro-mm-sig] [PATCH 00/11] drm/msm: drm
 scheduler conversion and cleanups
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
Cc: Emma Anholt <emma@anholt.net>, Konrad Dybcio <konrad.dybcio@somainline.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>, dri-devel@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Lee Jones <lee.jones@linaro.org>, Rob Clark <robdclark@chromium.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Jonathan Marek <jonathan@marek.ca>, Bernard Zhao <bernard@vivo.com>,
 Zhenzhong Duan <zhenzhong.duan@gmail.com>, Dave Airlie <airlied@redhat.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Douglas Anderson <dianders@chromium.org>, Rob Clark <robdclark@gmail.com>,
 "Kristian H. Kristensen" <hoegsberg@google.com>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Mon, Jul 19, 2021 at 10:40:57AM +0200, Christian K=F6nig wrote:
> Am 17.07.21 um 22:29 schrieb Rob Clark:
> > From: Rob Clark <robdclark@chromium.org>
> > =

> > Conversion to gpu_scheduler, and bonus removal of
> > drm_gem_object_put_locked()
> =

> Oh yes please!
> =

> If I'm not completely mistaken that was the last puzzle piece missing to
> unify TTMs and GEMs refcount of objects.

Why does drm/msm, a driver not using ttm at all, block ttm refactorings?
We can just check whether the TTM using driver is potentially using locked
final unref and have a special version of
drm_gem_object_put_guaranteed_unlocked or whatever the bikeshed will look
like, which doesn't have the migth_lock.

Anyway, deed is done now :-)
-Daniel

> =

> Only problem is that I only see patch 7 and 9 in my inbox. Where is the
> rest?
> =

> Thanks,
> Christian.
> =

> > =

> > Rob Clark (11):
> >    drm/msm: Docs and misc cleanup
> >    drm/msm: Small submitqueue creation cleanup
> >    drm/msm: drop drm_gem_object_put_locked()
> >    drm: Drop drm_gem_object_put_locked()
> >    drm/msm/submit: Simplify out-fence-fd handling
> >    drm/msm: Consolidate submit bo state
> >    drm/msm: Track "seqno" fences by idr
> >    drm/msm: Return ERR_PTR() from submit_create()
> >    drm/msm: Conversion to drm scheduler
> >    drm/msm: Drop struct_mutex in submit path
> >    drm/msm: Utilize gpu scheduler priorities
> > =

> >   drivers/gpu/drm/drm_gem.c                   |  22 --
> >   drivers/gpu/drm/msm/Kconfig                 |   1 +
> >   drivers/gpu/drm/msm/adreno/a5xx_debugfs.c   |   4 +-
> >   drivers/gpu/drm/msm/adreno/a5xx_gpu.c       |   6 +-
> >   drivers/gpu/drm/msm/adreno/a5xx_power.c     |   2 +-
> >   drivers/gpu/drm/msm/adreno/a5xx_preempt.c   |   7 +-
> >   drivers/gpu/drm/msm/adreno/a6xx_gmu.c       |  12 +-
> >   drivers/gpu/drm/msm/adreno/a6xx_gpu.c       |   2 +-
> >   drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c |   4 +-
> >   drivers/gpu/drm/msm/adreno/adreno_gpu.c     |   6 +-
> >   drivers/gpu/drm/msm/msm_drv.c               |  30 +-
> >   drivers/gpu/drm/msm/msm_fence.c             |  39 ---
> >   drivers/gpu/drm/msm/msm_fence.h             |   2 -
> >   drivers/gpu/drm/msm/msm_gem.c               |  91 +-----
> >   drivers/gpu/drm/msm/msm_gem.h               |  37 ++-
> >   drivers/gpu/drm/msm/msm_gem_submit.c        | 300 ++++++++++++--------
> >   drivers/gpu/drm/msm/msm_gpu.c               |  50 +---
> >   drivers/gpu/drm/msm/msm_gpu.h               |  41 ++-
> >   drivers/gpu/drm/msm/msm_ringbuffer.c        |  70 ++++-
> >   drivers/gpu/drm/msm/msm_ringbuffer.h        |  12 +
> >   drivers/gpu/drm/msm/msm_submitqueue.c       |  49 +++-
> >   include/drm/drm_gem.h                       |   2 -
> >   include/uapi/drm/msm_drm.h                  |  10 +-
> >   23 files changed, 440 insertions(+), 359 deletions(-)
> > =

> =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
