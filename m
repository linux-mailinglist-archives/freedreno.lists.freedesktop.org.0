Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 479A24AE307
	for <lists+freedreno@lfdr.de>; Tue,  8 Feb 2022 22:22:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC28410E412;
	Tue,  8 Feb 2022 21:21:59 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com
 [IPv6:2607:f8b0:4864:20::c36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D809710E51B
 for <freedreno@lists.freedesktop.org>; Tue,  8 Feb 2022 21:21:58 +0000 (UTC)
Received: by mail-oo1-xc36.google.com with SMTP id
 u47-20020a4a9732000000b00316d0257de0so174517ooi.7
 for <freedreno@lists.freedesktop.org>; Tue, 08 Feb 2022 13:21:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=G+16pFLyoDjUk+Y4RyeEFgCd+ZLbIuV/huyW3D4ToLM=;
 b=pqHdCkcx0F7v7R1xaCV98jjODFOBkFoEnhEWcvskdzHws4NXwd3J0gxbK+C/RFybcw
 b9efcOJ0wQm/skfsuWvaBXxlDmyc6Xj9z9re0sE/X/nxs7Th/io7WM5pCnjIQzgPdAEd
 4gU0LvZZ9yusrgKQul4g85O8DmZCsszKhNE+cjAFrDfAV8D+E2a7cMQ6JeeQ48Y3RWVf
 mYZitpw7ejIuuATswWfsFC+mg5FHwB902JS+HKX6HuC1mWs+vsOTeHkNK/nGpw0YmwdN
 aOVMXaunHl8585yj99v5cZdaZInOKczzgPiv3VMi+xm3Q5kvryp1egmpmQsOVlADhWQE
 91KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=G+16pFLyoDjUk+Y4RyeEFgCd+ZLbIuV/huyW3D4ToLM=;
 b=WtOkFxpZs0RrawIT/vwzuB5WrXPmY361BsBj8c3BVcEuu+qcj/9d8acZk47AS4bcAs
 rYQbJO3gamjcJNs0BTmh3R/3AQ4KXzK9nhQkAksnARAGtRaHb+WD7GFXc8hvQihr87mU
 M8O+qeOg690tNXJcVk/L9AemmL/fW2XHKKTF+fYfCbR6SItY6E/QZQNoeng8XQ8OLvHB
 0nqnznirdAsLfWjQFnIUtan1jTLRJcQxN4/MD2uzSweA6gcmaoB2Z8qNw4pT+QYo7QXf
 9SQbYm2Ry/1jZ/nH42fBYLouI2AetWtl0zWpZ1tmxAkwwa+GUBZ92GYef4xW+zzmnq3B
 imzA==
X-Gm-Message-State: AOAM530cMqr1COjS5fr/oTNrJ52mzZosZUqFH+U+cgCRJTFPIcblkETE
 NVkKQuu0xisUQg1/LgEOt23bUQ==
X-Google-Smtp-Source: ABdhPJwiQWSyP6fnaWDrhUVfiCiTGOPN0N5YxVLMDgEZSyjmDyKQCDgO4ODxz4etyu3+zg0YFk8UHA==
X-Received: by 2002:a05:6870:118c:: with SMTP id
 12mr1002048oau.93.1644355317946; 
 Tue, 08 Feb 2022 13:21:57 -0800 (PST)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
 by smtp.gmail.com with ESMTPSA id l22sm5823162otj.44.2022.02.08.13.21.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 13:21:57 -0800 (PST)
Date: Tue, 8 Feb 2022 13:24:15 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <YgLff2ZFjEN3I3M2@ripper>
References: <20211228045934.1524865-1-bjorn.andersson@linaro.org>
 <176fb0bc-2f09-df3b-86be-ef69b8e6cea8@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <176fb0bc-2f09-df3b-86be-ef69b8e6cea8@linaro.org>
Subject: Re: [Freedreno] [PATCH] drm/msm/dp: Add DisplayPort controller for
 SM8350
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
Cc: freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Wed 19 Jan 15:14 PST 2022, Dmitry Baryshkov wrote:

> On 28/12/2021 07:59, Bjorn Andersson wrote:
> > The Qualcomm SM8350 platform comes with a single DisplayPort controller,
> > add support for this in the DisplayPort driver.
> > 
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 

I don't see this in linux-next, would it be possible to pick it up now
that we're past the merge window etc?

Regards,
Bjorn

> > ---
> >   .../devicetree/bindings/display/msm/dp-controller.yaml    | 1 +
> >   drivers/gpu/drm/msm/dp/dp_display.c                       | 8 ++++++++
> >   2 files changed, 9 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> > index 5457612ab136..cd05cfd76536 100644
> > --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> > +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> > @@ -21,6 +21,7 @@ properties:
> >         - qcom,sc7280-edp
> >         - qcom,sc8180x-dp
> >         - qcom,sc8180x-edp
> > +      - qcom,sm8350-dp
> >     reg:
> >       items:
> > diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> > index 8d9c19dbf33e..fd0fd03f8fed 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_display.c
> > +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> > @@ -143,10 +143,18 @@ static const struct msm_dp_config sc7280_dp_cfg = {
> >   	.num_descs = 2,
> >   };
> > +static const struct msm_dp_config sm8350_dp_cfg = {
> > +	.descs = (const struct msm_dp_desc[]) {
> > +		[MSM_DP_CONTROLLER_0] = { .io_start = 0x0ae90000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
> > +	},
> > +	.num_descs = 1,
> > +};
> > +
> >   static const struct of_device_id dp_dt_match[] = {
> >   	{ .compatible = "qcom,sc7180-dp", .data = &sc7180_dp_cfg },
> >   	{ .compatible = "qcom,sc7280-dp", .data = &sc7280_dp_cfg },
> >   	{ .compatible = "qcom,sc7280-edp", .data = &sc7280_dp_cfg },
> > +	{ .compatible = "qcom,sm8350-dp", .data = &sm8350_dp_cfg },
> >   	{}
> >   };
> 
> 
> -- 
> With best wishes
> Dmitry
