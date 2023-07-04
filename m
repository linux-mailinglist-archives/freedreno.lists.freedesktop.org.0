Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC5D747424
	for <lists+freedreno@lfdr.de>; Tue,  4 Jul 2023 16:31:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A99EC10E1A7;
	Tue,  4 Jul 2023 14:31:41 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EE9210E1A7
 for <freedreno@lists.freedesktop.org>; Tue,  4 Jul 2023 14:31:39 +0000 (UTC)
Received: by mail-yb1-xb2b.google.com with SMTP id
 3f1490d57ef6-c5c8d00ced3so937316276.2
 for <freedreno@lists.freedesktop.org>; Tue, 04 Jul 2023 07:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688481098; x=1691073098;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1s6tpBIxe1xSBXEGUtkN8A1uCRjZ4iIBmxQ5Zab/0ts=;
 b=h1+Ji1dk99JXP0SJEIr4WQDv+OH/RqJXdQXeWtmbPo2Vi07bG3ZBHjZwatELYy0NAv
 aW+nDri+PgzfWSq3QPU2zRABhWwvwm9PePw01btSEgUMqDMyoPbfllVLQPfwvs0OiECs
 jGSwATHuHSqKd6QsHO65cB8nvbQPprQpOEJmDj5g5B91/V64WBzrchU0AL4/LW/TyAdB
 JIQycADRd+qOtc/n5p1NcEzJ0YcpPNgOSt7UwUqwjF+Mou5YMBdBiseWufpEYVRZrGSD
 zQYS1zIYGvajsNGJ5iPXoeIW1hRnFu44N2H0JYpwPEwkvEM0U1V4awCOIbVa0ni2rFn8
 /75w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688481098; x=1691073098;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1s6tpBIxe1xSBXEGUtkN8A1uCRjZ4iIBmxQ5Zab/0ts=;
 b=DEY6XMU/j42ovEVZcAK1IHkgc7qA1HYa4NEKvuqH+4lm0TJIaczwXkgPulW6TPyK+b
 td0MfhY+TkdWa2zcHxBOZqiZkNUFBBQ38JGk+T16CTASq+WzQXHa3ZxHMF+kZs+I3FwG
 7Zdr/h6UVE34FvkOXTI0MUV9S0mpuUSWdsrf21fFaMCRht4FI9Wq9uBdHB26L51KlvhO
 QJQ2dXke6wWF0DTpA3nd4IR87HAB2Ir7VfGIMpZIjoY2HKvMnitol9Nf8ZlR6RASwIkz
 yzRHSoiX6KXYOby1KylDzxCQBbT0OwnzguTqSApO/lX+MM5+9YXAK1Cgwr2Wy/h2Fh84
 szPg==
X-Gm-Message-State: ABy/qLa/7dSiiZ4hhLSpk0cff/gF+8flEQGD35/VIhzTyuzanmwyk4Hr
 D12nWLR8Q7gHwS0OblA4r29gwBLo5AKI7sHJflkNVg==
X-Google-Smtp-Source: APBJJlH/CeZw84d35IUxjgDJRQ19GnRGx63FhS41w8DcaINF8V6ZeDXzlG59lhcA54EoqS/uvdnhXQ1uwfKpLMe8QK8=
X-Received: by 2002:a25:dbd0:0:b0:c11:3daf:7c47 with SMTP id
 g199-20020a25dbd0000000b00c113daf7c47mr11111491ybf.63.1688481097965; Tue, 04
 Jul 2023 07:31:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230620000846.946925-1-dmitry.baryshkov@linaro.org>
 <20230620000846.946925-8-dmitry.baryshkov@linaro.org>
 <b2499f3d-46d4-216e-9142-87d73e26781e@quicinc.com>
 <CAA8EJpq43fKi=L11cyfBddcP+n994bhFchHcNprnR=Vu823BiA@mail.gmail.com>
 <9c13ecf8-c093-e145-3a79-d0686fc5d6e7@quicinc.com>
In-Reply-To: <9c13ecf8-c093-e145-3a79-d0686fc5d6e7@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 4 Jul 2023 17:31:26 +0300
Message-ID: <CAA8EJpo9kUWvh=HeWG_MF77ExeMA+8z1=mBRwB36886zK27E2Q@mail.gmail.com>
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

On Tue, 4 Jul 2023 at 03:19, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 7/3/2023 3:59 PM, Dmitry Baryshkov wrote:
> > On Tue, 4 Jul 2023 at 01:57, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>
> >>
> >>
> >> On 6/19/2023 5:08 PM, Dmitry Baryshkov wrote:
> >>> This function does nothing, just clears several data pointers. Drop it
> >>> now.
> >>>
> >>
> >> This will undo what dpu_core_perf_init() did when an error happens.
> >>
> >> Why can we drop that?
> >
> > Because nothing will use this data in an error case. There is no need
> > to clean it.
> >
>
> Usage is one thing for sure but I am still inclined to keep it symmetric
> with dpu_core_perf_init().

Through the last several years the kernel was more and more inclined
to asymmetry here. For example, consider all the demv_ functions. We
have been removing cleanup and _remove functions all over the place.
So, I think, I will reiterate this patch.

>
> >>
> >>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>> ---
> >>>    drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 12 ------------
> >>>    drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h |  6 ------
> >>>    drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  1 -
> >>>    3 files changed, 19 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> >>> index 78a7e3ea27a4..f779ad544347 100644
> >>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> >>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> >>> @@ -394,18 +394,6 @@ int dpu_core_perf_debugfs_init(struct dpu_kms *dpu_kms, struct dentry *parent)
> >>>    }
> >>>    #endif
> >>>
> >>> -void dpu_core_perf_destroy(struct dpu_core_perf *perf)
> >>> -{
> >>> -     if (!perf) {
> >>> -             DPU_ERROR("invalid parameters\n");
> >>> -             return;
> >>> -     }
> >>> -
> >>> -     perf->max_core_clk_rate = 0;
> >>> -     perf->core_clk = NULL;
> >>> -     perf->dev = NULL;
> >>> -}
> >>> -
> >>>    int dpu_core_perf_init(struct dpu_core_perf *perf,
> >>>                struct drm_device *dev,
> >>>                const struct dpu_perf_cfg *perf_cfg,
> >>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
> >>> index e8a7916b6f71..e1198c104b5e 100644
> >>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
> >>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
> >>> @@ -69,12 +69,6 @@ int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
> >>>     */
> >>>    void dpu_core_perf_crtc_release_bw(struct drm_crtc *crtc);
> >>>
> >>> -/**
> >>> - * dpu_core_perf_destroy - destroy the given core performance context
> >>> - * @perf: Pointer to core performance context
> >>> - */
> >>> -void dpu_core_perf_destroy(struct dpu_core_perf *perf);
> >>> -
> >>>    /**
> >>>     * dpu_core_perf_init - initialize the given core performance context
> >>>     * @perf: Pointer to core performance context
> >>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> >>> index 6e62606e32de..4439147d2c35 100644
> >>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> >>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> >>> @@ -1162,7 +1162,6 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
> >>>        return 0;
> >>>
> >>>    drm_obj_init_err:
> >>> -     dpu_core_perf_destroy(&dpu_kms->perf);
> >>>    hw_intr_init_err:
> >>>    perf_err:
> >>>    power_error:
> >
> >
> >



-- 
With best wishes
Dmitry
