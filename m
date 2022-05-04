Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0BE751B37F
	for <lists+freedreno@lfdr.de>; Thu,  5 May 2022 01:31:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5430410F8E3;
	Wed,  4 May 2022 23:31:07 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com
 [IPv6:2607:f8b0:4864:20::112d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B22D10F8E2
 for <freedreno@lists.freedesktop.org>; Wed,  4 May 2022 23:31:06 +0000 (UTC)
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-2f7d19cac0bso32149267b3.13
 for <freedreno@lists.freedesktop.org>; Wed, 04 May 2022 16:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XlPHrH4AC6yStMEbAlCqpnskyR8Owtsgu3/YV4teEUY=;
 b=orHMgA5BOQmpR/jRiIEwDfh36rnfK1oScGs66gqyt2xzfrP9Bokx0Fcdgdk9xjQWC6
 o0aqWRWrPRU/zNVc3puXiKivPqzgnXJpABq0EtmzOI7lvkn0z+Iu6JxZfEyACntmWlrb
 Y3Fqp9sRdY0THHM0mkotSjGJolZRzgHGNRxOvCwWL+YT6c1j5yb4Pz5pvU8jjEZHuwa9
 oeWlLQA0BfxCewuZl0fjC5bkaaOXpzdI0C1q5L0/Jq2okdMO+FUZMgGFonRloybJqDkL
 LHCBjcp160Al0orGJ73geBtTDKaU5wm2r032c35Bg+S8UGFPtitCQ4gPUq0xSLI85WUM
 eODA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XlPHrH4AC6yStMEbAlCqpnskyR8Owtsgu3/YV4teEUY=;
 b=LG+icOfMB8bvMLGK9HNpLVBeXivw4r9nFLzBBj91lGZJRaW2E3VF+2CXrDGHQukZqP
 4xFMG97lSsUoPXdAPSDYoTb95I42ZCMypDvC2bvlT/6n/rJsQbGxSazxA+bL3L+0g3/+
 NjvZoiJC/SebSKHU0Ip5n/bRiBrzKioaV9fDc31b4d/1EoeEE3n6Jr57P1f5H7NDWXvP
 NZ64HN4a0YT4H3bea9iKaVIDKaedcDi2nemBC070iQAUz9MctccdLzldHVbhYAkKOmIw
 WNoVlFk7gYKvqkBo20fJk7Bi5WCVACBH2EmUTTjqwsrWNmQY6tFiaudtJ8XZpItasvPC
 7qCw==
X-Gm-Message-State: AOAM530bLg36g3FibUnYftqIBDMCUOxkVOGsaahZ4oRPZjpgB1qqeQA1
 MBBPYKr2uicSF2U1hGjXmgtgRvp1h0ChYpyFmmblSA==
X-Google-Smtp-Source: ABdhPJzJlf1XKvfdwe/oPL10CLqi9UrE2lEMIAWF62u74btiTM0zS2Obapju9bCnpkm/NqQla0FcCNYZ9BxitmQUAho=
X-Received: by 2002:a81:492:0:b0:2f7:ce87:c324 with SMTP id
 140-20020a810492000000b002f7ce87c324mr22215000ywe.359.1651707065587; Wed, 04
 May 2022 16:31:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220504154909.1.Iaebd35e60160fc0f2a50fac3a0bf3b298c0637c8@changeid>
 <62426006-b5a1-cbe7-9c3a-16f94334208f@quicinc.com>
In-Reply-To: <62426006-b5a1-cbe7-9c3a-16f94334208f@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 5 May 2022 02:30:54 +0300
Message-ID: <CAA8EJppPqrvA6xz1ufTJf+QqwZ-6dzr4FGHQe+gKp1B8ALhjhg@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH] drm/msm: Fix shutdown
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
Cc: linux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>,
 freedreno@lists.freedesktop.org, Lv Ruyi <lv.ruyi@zte.com.cn>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Xu Wang <vulab@iscas.ac.cn>, Daniel Vetter <daniel@ffwll.ch>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>,
 Vinod Polimera <quic_vpolimer@quicinc.com>, linux-arm-msm@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, 5 May 2022 at 02:29, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 5/4/2022 3:49 PM, Douglas Anderson wrote:
> > When rebooting on my sc7280-herobrine based device, I got a
> > crash. Upon debugging, I found that I was in msm_drv_shutdown() and my
> > "pdev" was the one associated with mdss_probe().
> >
> >  From source, I found that mdss_probe() has the line:
> >    platform_set_drvdata(pdev, mdss);
> > ...where "mdss" is of type "struct msm_mdss *".
> >
> > Also from source, I saw that in msm_drv_shutdown() we have the line:
> >    struct msm_drm_private *priv = platform_get_drvdata(pdev);
> >
> > This is a mismatch and is the root of the problem.
> >
> > Further digging made it apparent that msm_drv_shutdown() is only
> > supposed to be used for parts of the msm display framework that also
> > call msm_drv_probe() but mdss_probe() doesn't call
> > msm_drv_probe(). Let's remove the shutdown functon from msm_mdss.c.
> >
> > Digging a little further, code inspection found that two drivers that
> > use msm_drv_probe() weren't calling msm_drv_shutdown(). Let's add it
> > to them.
> >
> > Fixes: ecb23f2e3009 ("drm/msm: split the main platform driver")
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
> Makes sense to me, and issue should happen everytime we shutdown so not
> sure how it didnt hit?
>
> > ---
> >
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  | 1 +
> >   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 1 +
> >   drivers/gpu/drm/msm/msm_mdss.c           | 1 -
> >   3 files changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > index 143d6643be53..2b9d931474e0 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > @@ -1350,6 +1350,7 @@ MODULE_DEVICE_TABLE(of, dpu_dt_match);
> >   static struct platform_driver dpu_driver = {
> >       .probe = dpu_dev_probe,
> >       .remove = dpu_dev_remove,
> > +     .shutdown = msm_drv_shutdown,
> >       .driver = {
> >               .name = "msm_dpu",
> >               .of_match_table = dpu_dt_match,
> > diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> > index 9b7bbc3adb97..3d5621a68f85 100644
> > --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> > +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> > @@ -1009,6 +1009,7 @@ MODULE_DEVICE_TABLE(of, mdp5_dt_match);
> >   static struct platform_driver mdp5_driver = {
> >       .probe = mdp5_dev_probe,
> >       .remove = mdp5_dev_remove,
> > +     .shutdown = msm_drv_shutdown,
> >       .driver = {
> >               .name = "msm_mdp",
> >               .of_match_table = mdp5_dt_match,
> > diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> > index 20f154dda9cf..0454a571adf7 100644
> > --- a/drivers/gpu/drm/msm/msm_mdss.c
> > +++ b/drivers/gpu/drm/msm/msm_mdss.c
> > @@ -397,7 +397,6 @@ MODULE_DEVICE_TABLE(of, mdss_dt_match);
> >   static struct platform_driver mdss_platform_driver = {
> >       .probe      = mdss_probe,
> >       .remove     = mdss_remove,
> > -     .shutdown   = msm_drv_shutdown,
>
> Question to doug/dmitry:
>
> Now that we removed msm_drv_shutdown, perhaps we should have a
> mdss_shutdown instead and call msm_mdss_destroy() internally?

No need to. msm-mdss driver doesn't really need to be shutdown. It
doesn't setup DMA, it doesn't setup video pipes, etc.

>
> >       .driver     = {
> >               .name   = "msm-mdss",
> >               .of_match_table = mdss_dt_match,



-- 
With best wishes
Dmitry
