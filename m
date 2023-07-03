Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 871577465E7
	for <lists+freedreno@lfdr.de>; Tue,  4 Jul 2023 00:59:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 586DD10E246;
	Mon,  3 Jul 2023 22:59:45 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AC8410E246
 for <freedreno@lists.freedesktop.org>; Mon,  3 Jul 2023 22:59:43 +0000 (UTC)
Received: by mail-yb1-xb29.google.com with SMTP id
 3f1490d57ef6-c50c797c31bso2202439276.0
 for <freedreno@lists.freedesktop.org>; Mon, 03 Jul 2023 15:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688425183; x=1691017183;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Bv0PY9VcAwjIieAMvlnZw/0FpPWp9AXm3TQJRoukoAI=;
 b=dHf9Uh5kfXrxyhNTH7HzArkL3ABEeb/R3ILHnvzBL8BQCiPGhzNmMR6PBLz9QgYoc5
 ag2MtjgyN3KeJrYhw/n8C5COtHsNz8tKcY5hwMnh/gUttDvvVdSELCHLCXldhNslOnRM
 JO8k5LpgLl0zSa0pPdBy518JmB05/bvUuRK+DLOrlEqJPdD7KZJwl+Vx627o08UlOQdF
 kfjEqXe0rU7h4HV9u52CywwH0uyfCJyLo+7hVP9/icjk6tw3P8MXIz6j0tk3Tn6Ugnen
 uFszDJz+tN4ooW4GrL81Y9qBTwSSbWebZ79y6K9yuMqdCqQyM9KE1wV5S7mYHm/PHX/i
 2TsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688425183; x=1691017183;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Bv0PY9VcAwjIieAMvlnZw/0FpPWp9AXm3TQJRoukoAI=;
 b=YNILmH8HP4EQjr9pHUHTgaMajIhYSrXR9eichawcLWIMGc9jRXpjj4qtTrYK6MTb+i
 W7dWVtDOaa/GNEZw9MtMEKFx2MYmwRt/d8xKz7xaU3o4dvwb7wEnn75ai5hCHEgmUEJU
 q3s+tvZCH/9U0c3BdKKG0+AtVtkUI/ckiBJo7sDdnIAuVCJVPiv7h2tfKRH9IknpKl2I
 BZ+v+QqgNbUzVmcwGeu0UnBE6O44Znfn6ueSFCcJa1NwwW8aCo42Dgll5vWuEzLYxCVi
 2yBedX1UrVIoKpCqThnDX1M0Aqb01ZgIcq+W6pC8T+xFNGdjEaVL2150othGgZcb4HU8
 T+1A==
X-Gm-Message-State: ABy/qLZkmovzBkDINtPJJLGfTGUypnpoiUwe/FHko6O3zIqD2B0lqzAQ
 ViEVRCPnJCBS88Q1bHq8+RiCC4K0UWyAbA1KlTYzGQ==
X-Google-Smtp-Source: APBJJlFhmtZqHoSfBbwPxK2jzBuAYgQ+6yNKLgvUh4TGVF1ctE3w979LCDrRMhF86lHf+dAOnxxBeRbSIO9VWg9x0DE=
X-Received: by 2002:a25:1486:0:b0:c15:da0b:15fb with SMTP id
 128-20020a251486000000b00c15da0b15fbmr10121384ybu.62.1688425183131; Mon, 03
 Jul 2023 15:59:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230620000846.946925-1-dmitry.baryshkov@linaro.org>
 <20230620000846.946925-8-dmitry.baryshkov@linaro.org>
 <b2499f3d-46d4-216e-9142-87d73e26781e@quicinc.com>
In-Reply-To: <b2499f3d-46d4-216e-9142-87d73e26781e@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 4 Jul 2023 01:59:32 +0300
Message-ID: <CAA8EJpq43fKi=L11cyfBddcP+n994bhFchHcNprnR=Vu823BiA@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH 7/8] drm/msm/dpu: drop
 dpu_core_perf_destroy()
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, Marijn Suijten <marijn.suijten@somainline.org>,
 Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue, 4 Jul 2023 at 01:57, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 6/19/2023 5:08 PM, Dmitry Baryshkov wrote:
> > This function does nothing, just clears several data pointers. Drop it
> > now.
> >
>
> This will undo what dpu_core_perf_init() did when an error happens.
>
> Why can we drop that?

Because nothing will use this data in an error case. There is no need
to clean it.

>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 12 ------------
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h |  6 ------
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  1 -
> >   3 files changed, 19 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> > index 78a7e3ea27a4..f779ad544347 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> > @@ -394,18 +394,6 @@ int dpu_core_perf_debugfs_init(struct dpu_kms *dpu_kms, struct dentry *parent)
> >   }
> >   #endif
> >
> > -void dpu_core_perf_destroy(struct dpu_core_perf *perf)
> > -{
> > -     if (!perf) {
> > -             DPU_ERROR("invalid parameters\n");
> > -             return;
> > -     }
> > -
> > -     perf->max_core_clk_rate = 0;
> > -     perf->core_clk = NULL;
> > -     perf->dev = NULL;
> > -}
> > -
> >   int dpu_core_perf_init(struct dpu_core_perf *perf,
> >               struct drm_device *dev,
> >               const struct dpu_perf_cfg *perf_cfg,
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
> > index e8a7916b6f71..e1198c104b5e 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
> > @@ -69,12 +69,6 @@ int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
> >    */
> >   void dpu_core_perf_crtc_release_bw(struct drm_crtc *crtc);
> >
> > -/**
> > - * dpu_core_perf_destroy - destroy the given core performance context
> > - * @perf: Pointer to core performance context
> > - */
> > -void dpu_core_perf_destroy(struct dpu_core_perf *perf);
> > -
> >   /**
> >    * dpu_core_perf_init - initialize the given core performance context
> >    * @perf: Pointer to core performance context
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > index 6e62606e32de..4439147d2c35 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > @@ -1162,7 +1162,6 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
> >       return 0;
> >
> >   drm_obj_init_err:
> > -     dpu_core_perf_destroy(&dpu_kms->perf);
> >   hw_intr_init_err:
> >   perf_err:
> >   power_error:



-- 
With best wishes
Dmitry
