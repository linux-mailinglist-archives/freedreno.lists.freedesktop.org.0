Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F56534E2AD
	for <lists+freedreno@lfdr.de>; Tue, 30 Mar 2021 10:04:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEE0689D79;
	Tue, 30 Mar 2021 08:04:28 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com
 [IPv6:2607:f8b0:4864:20::f31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EDED89C6E
 for <freedreno@lists.freedesktop.org>; Tue, 30 Mar 2021 08:04:26 +0000 (UTC)
Received: by mail-qv1-xf31.google.com with SMTP id o19so7757124qvu.0
 for <freedreno@lists.freedesktop.org>; Tue, 30 Mar 2021 01:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0hXTX8IXseXWS6sQ5v0psd9jBHZ3jQktmk6VWJvrFnY=;
 b=AvdkhgznJpxH1Y85tc0K2FisAYU02f2ExRqH01ZlXjycjuvlr/ijazyhskTfgxv6z/
 V2NuyyG79EEi+2rzN+aDLK493ag+xU/jBsSvNsF7rpVlukSgCkraSUKfLiakUcYfPqQb
 Q+l+vEbwokSA1ovQLLaPmPE2t2VN3QkAIMZjkR/GiNfdn8jez1YBMn9b7LMDxqy9xwoS
 XitJxW7dohNEtaBno1G7qsnTNuEivNHlDLd7AfnsmUdJXLw7uiO9Rp9KMk7YhaEUJfdP
 VI0WITXd33/bkpCsR27neG9UVD+HaMNA9376YHZlbnO/M3mHlPd+E+KFzdVQLsinmW7u
 4tvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0hXTX8IXseXWS6sQ5v0psd9jBHZ3jQktmk6VWJvrFnY=;
 b=EMB9ehYBJfFf3HNNXKhNBh/9Ss3ZCGotIDNA0tTkLRPFkUApS9fx23I7EOXPpCW09D
 sBeUrVaYO/zu3r6EKoUqmxOPDQah5TBEVBNB5AS/aVsRChIzs0aJx+X+I0cfqs3zvpe7
 vWi8CTV/BCWnLKHFXgwXeRhuVOyxgggOu5omvwqMsxnK3OB9sUOICz/2bKS0GFG6aygd
 N5wLIFObzfj+htD65MXd7RYureYwQuNJwsUd/kBjukrNxQWJ43F/g9l+WnswdfHYXUsm
 lxA8/NV4XF3gNV71wGK1MGZ165hlmuyHjoJ73wiCPRD92bsnSaa+ljR7pBB9+YOD3fU9
 bEnA==
X-Gm-Message-State: AOAM532dytV/tDDJQ4VC3ZOsJ5Nd7YdWd/FGYz702z5lRkN6yK+tsw86
 RT32ZxsYrB3HAohOhcM3IcQppB+UuLv5LvZ1qsQ4nQ==
X-Google-Smtp-Source: ABdhPJzODMwi5bI8/2BWHi0LOLZBUGzb2dOjHsDIuxM7K/fV9heoh5dmZ3joJPfWrl2fM7ixxIx6Ll+z2dooy8ho1Ss=
X-Received: by 2002:a0c:a425:: with SMTP id w34mr28728433qvw.2.1617091465670; 
 Tue, 30 Mar 2021 01:04:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210329120051.3401567-1-dmitry.baryshkov@linaro.org>
 <20210329120051.3401567-4-dmitry.baryshkov@linaro.org>
 <YGKYDzCzwz+1pxOi@builder.lan>
In-Reply-To: <YGKYDzCzwz+1pxOi@builder.lan>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 30 Mar 2021 11:04:14 +0300
Message-ID: <CAA8EJppuRyFk5arkjFAuHjeHpVrLiVpXPnXciOxkE1Y0OjKFSQ@mail.gmail.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [Freedreno] [PATCH v4 3/4] drm/msm: add compatibles for
 sm8150/sm8250 display
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
 Jonathan Marek <jonathan@marek.ca>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Andy Gross <agross@kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue, 30 Mar 2021 at 06:16, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Mon 29 Mar 07:00 CDT 2021, Dmitry Baryshkov wrote:
>
> > From: Jonathan Marek <jonathan@marek.ca>
> >
> > The driver already has support for sm8150/sm8250, but the compatibles were
> > never added.
> >
> > Also inverse the non-mdp4 condition in add_display_components() to avoid
> > having to check every new compatible in the condition.
> >
> > Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 2 ++
> >  drivers/gpu/drm/msm/msm_drv.c           | 6 +++---
> >  2 files changed, 5 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > index 5a8e3e1fc48c..fff12a4c8bfc 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > @@ -1219,6 +1219,8 @@ static const struct dev_pm_ops dpu_pm_ops = {
> >  static const struct of_device_id dpu_dt_match[] = {
> >       { .compatible = "qcom,sdm845-dpu", },
> >       { .compatible = "qcom,sc7180-dpu", },
> > +     { .compatible = "qcom,sm8150-dpu", },
> > +     { .compatible = "qcom,sm8250-dpu", },
> >       {}
> >  };
> >  MODULE_DEVICE_TABLE(of, dpu_dt_match);
> > diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> > index 94525ac76d4e..928f13d4bfbc 100644
> > --- a/drivers/gpu/drm/msm/msm_drv.c
> > +++ b/drivers/gpu/drm/msm/msm_drv.c
> > @@ -1185,9 +1185,7 @@ static int add_display_components(struct device *dev,
> >        * Populate the children devices, find the MDP5/DPU node, and then add
> >        * the interfaces to our components list.
> >        */
> > -     if (of_device_is_compatible(dev->of_node, "qcom,mdss") ||
> > -         of_device_is_compatible(dev->of_node, "qcom,sdm845-mdss") ||
> > -         of_device_is_compatible(dev->of_node, "qcom,sc7180-mdss")) {
> > +     if (!of_device_is_compatible(dev->of_node, "qcom,mdp4")) {
>
> Please consider reviewing my proposed alternative solution for this
> hunk:
>
> https://lore.kernel.org/linux-arm-msm/20210317025634.3987908-1-bjorn.andersson@linaro.org/

I'd slightly prefer Jonathan's approach, as it seems simpler, but no
strong preference towards one or another.

>
> For the rest
>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>
> Regards,
> Bjorn
>
> >               ret = of_platform_populate(dev->of_node, NULL, NULL, dev);
> >               if (ret) {
> >                       DRM_DEV_ERROR(dev, "failed to populate children devices\n");
> > @@ -1320,6 +1318,8 @@ static const struct of_device_id dt_match[] = {
> >       { .compatible = "qcom,mdss", .data = (void *)KMS_MDP5 },
> >       { .compatible = "qcom,sdm845-mdss", .data = (void *)KMS_DPU },
> >       { .compatible = "qcom,sc7180-mdss", .data = (void *)KMS_DPU },
> > +     { .compatible = "qcom,sm8150-mdss", .data = (void *)KMS_DPU },
> > +     { .compatible = "qcom,sm8250-mdss", .data = (void *)KMS_DPU },
> >       {}
> >  };
> >  MODULE_DEVICE_TABLE(of, dt_match);
> > --
> > 2.30.2
> >



-- 
With best wishes
Dmitry
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
