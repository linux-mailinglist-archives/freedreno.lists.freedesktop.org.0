Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D5F55BBE6
	for <lists+freedreno@lfdr.de>; Mon, 27 Jun 2022 22:06:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1477511B570;
	Mon, 27 Jun 2022 20:05:59 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com
 [IPv6:2607:f8b0:4864:20::f2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC1CD11B4E7
 for <freedreno@lists.freedesktop.org>; Mon, 27 Jun 2022 20:05:57 +0000 (UTC)
Received: by mail-qv1-xf2c.google.com with SMTP id q4so16657611qvq.8
 for <freedreno@lists.freedesktop.org>; Mon, 27 Jun 2022 13:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=t/YNIIo1OfJZKBOf0su0gdSWMRajt9bfTLqLNeOeO4Y=;
 b=v0xAz+DZeFRyWeSKh+7LCrjx3NjVWydYH4Jjniy060BfBvCJ++TFGpNNnMMGMZmJL8
 ZETVJOqNENRp5YzTaPPF23EjOwQMsIKvJjDwt0v+xJgwdkTBJmwJr6NAadZr7HFSuPDb
 9bTuOwn03ON3kbc9rcwGxJE9ebcyH9sCzXyLMnLCeYfKIoSgr1TGsHcN170aUsspQ0bK
 WjmibuGKw1anaRM7too1lWzRIGIFnsne3c2NgMnkNDefryjg8wMCQsXMcp4HSIR9eB/T
 nhYqlcLL4IG/ZZaXaeRQYWH2nMFljQK+kU9+Bd8YRgYgcvpTYAwvJD4Fs2zAMh+mnVQE
 dW3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=t/YNIIo1OfJZKBOf0su0gdSWMRajt9bfTLqLNeOeO4Y=;
 b=jOPDKYy4dgwyY4XPe97XRHE4Il7lNHn8uhZ6Gb4oKX9Q7MMevJm70WV2eskIQxksel
 512ELBStCjnqfIth38eJqIybxGwT6s6CqLiU6I5CabgKWRhFMAo3IDre8z+FJvaRl79k
 BFYxA7WWoNjD95nHnO9NOSyPlDIafRJ/ATWTSI5d5JM3E+Bz2hKIS4n35S7VxRQAKnAh
 HWgsQMq6ThANtKfLUO0dAxGW5xiIlT5sbLUdnok480Eku5VN0booU/aH77G4yfdd4Fgh
 eImwDHM+zHtffrJbch43K7W7vepr6567HgRvwDT4od8rgwNsxK8b863Nmp2YSdG1da45
 Qs5Q==
X-Gm-Message-State: AJIora/1331ejqHEXH0KHLNaL2kracvZsK7wegdqQzfrE3NpNmEYDc9L
 8AJc7dfH4L8bVZVyLap4Wt2CpGRKWSd2yyFOXz3UXw==
X-Google-Smtp-Source: AGRyM1t8TUCoMm1sgNDxPUTsFBn9RdMMW4h/okgLyvJyGwbpiRC4mQQKp1jppN6JlrTCD13/QPtdnx+/ags1m87CMTs=
X-Received: by 2002:ad4:596d:0:b0:470:7f34:fa13 with SMTP id
 eq13-20020ad4596d000000b004707f34fa13mr1030321qvb.55.1656360356878; Mon, 27
 Jun 2022 13:05:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220627165413.657142-1-dmitry.baryshkov@linaro.org>
 <9f82dd3f-5ecc-4e1d-6cce-0749b8316d49@quicinc.com>
In-Reply-To: <9f82dd3f-5ecc-4e1d-6cce-0749b8316d49@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 27 Jun 2022 23:05:45 +0300
Message-ID: <CAA8EJprR23ugdi926BDtGOGdGEqvWBgOQfekyJjD_OFE3yx0Aw@mail.gmail.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH] drm/msm/dp: use ARRAY_SIZE for calculating
 num_descs
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Mon, 27 Jun 2022 at 22:26, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
>
> On 6/27/2022 9:54 AM, Dmitry Baryshkov wrote:
> > If for some reason the msm_dp_config::descs array starts from non-zero
> > index or contains the hole, setting the msm_dp_config::num_descs might
> > be not that obvious and error-prone. Use ARRAY_SIZE to set this field
> > rather than encoding the value manually.
> >
> > Reported-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/dp/dp_display.c | 46 +++++++++++++++++------------
> >   1 file changed, 27 insertions(+), 19 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> > index f87fa3ba1e25..6fed738a9467 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_display.c
> > +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> > @@ -131,35 +131,43 @@ struct msm_dp_config {
> >       size_t num_descs;
> >   };
> >
> > +static const struct msm_dp_desc sc7180_dp_descs[] = {
> > +     [MSM_DP_CONTROLLER_0] = { .io_start = 0x0ae90000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
> > +};
> > +
> >   static const struct msm_dp_config sc7180_dp_cfg = {
> > -     .descs = (const struct msm_dp_desc[]) {
> > -             [MSM_DP_CONTROLLER_0] = { .io_start = 0x0ae90000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
> > -     },
> > -     .num_descs = 1,
> > +     .descs = sc7180_dp_descs,
> > +     .num_descs = ARRAY_SIZE(sc7180_dp_descs),
> > +};
> > +
>
> why you want to do that?
>
> It is very clear only one entry, why you want to make it 2 entry here?
>
> can you just embedded MSM_DP_COTROLLER_x into struct msm_dp_config?

Because we had enough stories of using a manually set 'number of
something' field. So I'd prefer to have it done automatically.
Also using the indexed array spares us from 'look for the DP
controller number N' functions. You can just get it.

>
> > +static const struct msm_dp_desc sc7280_dp_descs[] = {
> > +     [MSM_DP_CONTROLLER_0] = { .io_start = 0x0ae90000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_en = true },
> > +     [MSM_DP_CONTROLLER_1] = { .io_start = 0x0aea0000, .connector_type = DRM_MODE_CONNECTOR_eDP, .wide_bus_en = true },
> >   };
> >
> >   static const struct msm_dp_config sc7280_dp_cfg = {
> > -     .descs = (const struct msm_dp_desc[]) {
> > -             [MSM_DP_CONTROLLER_0] = { .io_start = 0x0ae90000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_en = true },
> > -             [MSM_DP_CONTROLLER_1] = { .io_start = 0x0aea0000, .connector_type = DRM_MODE_CONNECTOR_eDP, .wide_bus_en = true },
> > -     },
> > -     .num_descs = 2,
> > +     .descs = sc7280_dp_descs,
> > +     .num_descs = ARRAY_SIZE(sc7280_dp_descs),
> > +};
> > +
> > +static const struct msm_dp_desc sc8180x_dp_descs[] = {
> > +     [MSM_DP_CONTROLLER_0] = { .io_start = 0x0ae90000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
> > +     [MSM_DP_CONTROLLER_1] = { .io_start = 0x0ae98000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
> > +     [MSM_DP_CONTROLLER_2] = { .io_start = 0x0ae9a000, .connector_type = DRM_MODE_CONNECTOR_eDP },
> >   };
> >
> >   static const struct msm_dp_config sc8180x_dp_cfg = {
> > -     .descs = (const struct msm_dp_desc[]) {
> > -             [MSM_DP_CONTROLLER_0] = { .io_start = 0x0ae90000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
> > -             [MSM_DP_CONTROLLER_1] = { .io_start = 0x0ae98000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
> > -             [MSM_DP_CONTROLLER_2] = { .io_start = 0x0ae9a000, .connector_type = DRM_MODE_CONNECTOR_eDP },
> > -     },
> > -     .num_descs = 3,
> > +     .descs = sc8180x_dp_descs,
> > +     .num_descs = ARRAY_SIZE(sc8180x_dp_descs),
> > +};
> > +
> > +static const struct msm_dp_desc sm8350_dp_descs[] = {
> > +     [MSM_DP_CONTROLLER_0] = { .io_start = 0x0ae90000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
> >   };
> >
> >   static const struct msm_dp_config sm8350_dp_cfg = {
> > -     .descs = (const struct msm_dp_desc[]) {
> > -             [MSM_DP_CONTROLLER_0] = { .io_start = 0x0ae90000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
> > -     },
> > -     .num_descs = 1,
> > +     .descs = sm8350_dp_descs,
> > +     .num_descs = ARRAY_SIZE(sm8350_dp_descs),
> >   };
> >
> >   static const struct of_device_id dp_dt_match[] = {



-- 
With best wishes
Dmitry
