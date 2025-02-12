Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4409A333B9
	for <lists+freedreno@lfdr.de>; Thu, 13 Feb 2025 00:58:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 817D410E335;
	Wed, 12 Feb 2025 23:58:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="sE8BRhNp";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE38710E335
 for <freedreno@lists.freedesktop.org>; Wed, 12 Feb 2025 23:58:11 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-54508b026d1so158344e87.2
 for <freedreno@lists.freedesktop.org>; Wed, 12 Feb 2025 15:58:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739404690; x=1740009490; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=3BAFGjYw2QJwqRQ3fFZmP6lC2tUfHuW+BgEHuxf/+t0=;
 b=sE8BRhNpOBytqi+I3sNS4+D9O7cY9RLdfI404Mdnwa/d2LO+BqIbJONt+NaATgigue
 h+N6SKbTlsUYSQdi77Ew3p6wYo0t7jt/dO74prULnl/Q7z4LR48MRFXHvpQxPceRfi6v
 BL9jewouO7zexe6E93uk6GNXxlBIIuX2D/zPIf16JchxB++oaOZz4pjRG7B/SueAuumf
 73jhp6vUos+nOVSuOieDNUUkYDVk8/QbewVZpC/+CtId96rPspAL7qTBAuP8nUIo22vu
 FWP2fTLz88jrT3RqftmRnyPKHtJQGFiR1cBd6FqlTvlXvLdfE0/+vUT6ee8zxQiPSARi
 hCMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739404690; x=1740009490;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3BAFGjYw2QJwqRQ3fFZmP6lC2tUfHuW+BgEHuxf/+t0=;
 b=MNz5UOtlo1i+sdeFIkQR3kXG1CVAJNXv8AXQVIcP8wy498eV7A4STYwuYzvcVc2947
 J9cnuQ2UwcbEXAwnr4aH7LxjzFl/aJRg7HAMUCdqM1aStXNQytuTtTGK3RBIRP3o+MU9
 cFemIqaZ5UV8TfGiSCiyEN9F7ag+nP9MBJdPxRYIBc4lltEXs8E7YInR3yyzfQN6Yfve
 /kcC2SrpMBaPuhjMuxiMXHQ8YLXRsI9XqTU9lpcPxvxEKEP7iHyf6D3IHgHr6Ft6OOQi
 WB3AK4Y1vk2u8PXb4Eq28flrIL7eZbP0JGUFEs7YEL4Ea1KmNjmxWndDdaEEmkLYapIc
 BkrA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2dmTU61Lg3/+VZgELZ2Dz+EqUq9L1AuKic8aD3yK0dBNDtNws9/MtznVFHJnUCvxz7L7p7X/cFbc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxUlnsmUfVWZLlkozANHiKuOKp6NyTlPG9Tzn1k9C0vrh3o7DiP
 hAqAJuGNRKgtwitONAeoUk/Oe92eorjhFRXTK4zfuoybA2T+uJHXaqUIB8uBOsU=
X-Gm-Gg: ASbGnctEzAexJt0IMF/94JBAnil2QfXpYi38/s9Qmy2XR/2jfqWAkMcBey/78GFYai+
 r+I0L+rmatSGknQ4bIfqVhj73wtxpGmyzAm0R/0/v+aCZIXhpgO2gk/EEBSgIKdUKwrBnXTAaaI
 FpCM7jPPfu8kUC+jBphTU73ASTca8gjhN+edgKf85IAM/Ax03q9wjspYsihRyUUstY7I4bkGpit
 C0QIqKycGBwN4446alTeg/nDAwXJe1/qiJi/pus2DFqH5o6OYPF1nCChxhe1gc/HBdaK4vvAFZU
 K1LCycRDHG/lIi+5CpwoGH/xDOQArzb+aI48pgEUFgPbPMQghNHQ46/eXU5d/jltV/5Zdqc=
X-Google-Smtp-Source: AGHT+IFOzevMzwSqrsW5SI2f6zfmPKiGi7Ag3hljzjdY6B6YmBgvHDwMJG1evRLjw+6YvkchrmUSAA==
X-Received: by 2002:ac2:465b:0:b0:545:1d25:460d with SMTP id
 2adb3069b0e04-5451d255120mr480534e87.12.1739404689779; 
 Wed, 12 Feb 2025 15:58:09 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5451f09ab70sm13305e87.78.2025.02.12.15.58.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Feb 2025 15:58:08 -0800 (PST)
Date: Thu, 13 Feb 2025 01:58:06 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: "James A. MacInnes" <james.a.macinnes@gmail.com>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Chandan Uddaraju <chandanu@codeaurora.org>, 
 Stephen Boyd <swboyd@chromium.org>, Vara Reddy <quic_varar@quicinc.com>, 
 Tanmay Shah <tanmay@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Guenter Roeck <groeck@chromium.org>, Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH v2 1/2] drm/msm/dp: Disable wide bus support for SDM845
Message-ID: <dk7udmgj3mexlvxxoxvgwut6p3cv4faxhtcbqrikvfp6h6odi3@myp4sxi7nh5c>
References: <20250212-sdm845_dp-v2-0-4954e51458f4@gmail.com>
 <20250212-sdm845_dp-v2-1-4954e51458f4@gmail.com>
 <voecekzdacvrxedltgkiq5vwnaomchv2dryi6ukvk2xynw72wp@5nre7uesyvkk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <voecekzdacvrxedltgkiq5vwnaomchv2dryi6ukvk2xynw72wp@5nre7uesyvkk>
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, Feb 13, 2025 at 12:41:02AM +0100, Marijn Suijten wrote:
> On 2025-02-12 15:03:46, James A. MacInnes wrote:
> > SDM845 DPU hardware is rev 4.0.0 per hardware documents.
> > Original patch to enable wide_bus operation did not take into account
> > the SDM845 and it got carried over by accident.
> > 
> > - Incorrect setting caused inoperable DisplayPort.
> > - Corrected by separating SDM845 into its own descriptor.
> 
> If anything I'd have appreciated to see our conversation in v1 pasted here
> verbatim which is of the right verbosity to explain this.  I can't do much with
> a list of two items.
> 
> I don't have a clearer way of explaining what all I find confusing about this
> description, so let me propose what I would have written if this was my patch
> instead:
> 
> 	When widebus was enabled for DisplayPort in commit c7c412202623 ("drm/msm/dp:
> 	enable widebus on all relevant chipsets") it was clarified that it is only
> 	supported on DPU 5.0.0 onwards which includes SC7180 on DPU revision 6.2.
> 	However, this patch missed that the description structure for SC7180 is also
> 	reused for SDM845 (because of identical io_start address) which is only DPU
> 	4.0.0, leading to a wrongly enbled widebus feature and corruption on that
> 	platform.
> 
> 	Create a separate msm_dp_desc_sdm845 structure for this SoC compatible,
> 	with the wide_bus_supported flag turned off.
> 
> 	Note that no other DisplayPort compatibles currently exist for SoCs older
> 	than DPU 4.0.0 besides SDM845.

With more or less similar commit message:


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


> 
> Hope I'm not considered being too picky.  I first sketch **how** the original
> patch created a problem, then explain how this patch is intending to fix it,
> and finally describe that we went a step further and ensured no other SoCs
> are suffering from a similar problem.
> 
> - Marijn
> 
> > 
> > Fixes: c7c412202623 ("drm/msm/dp: enable widebus on all relevant chipsets")
> > Signed-off-by: James A. MacInnes <james.a.macinnes@gmail.com>
> > ---
> >  drivers/gpu/drm/msm/dp/dp_display.c | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> > index aff51bb973eb..e30cccd63910 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_display.c
> > +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> > @@ -126,6 +126,11 @@ static const struct msm_dp_desc msm_dp_desc_sa8775p[] = {
> >  	{}
> >  };
> >  
> > +static const struct msm_dp_desc msm_dp_desc_sdm845[] = {
> > +	{ .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0 },
> > +	{}
> > +};
> > +
> >  static const struct msm_dp_desc msm_dp_desc_sc7180[] = {
> >  	{ .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
> >  	{}
> > @@ -178,7 +183,7 @@ static const struct of_device_id msm_dp_dt_match[] = {
> >  	{ .compatible = "qcom,sc8180x-edp", .data = &msm_dp_desc_sc8180x },
> >  	{ .compatible = "qcom,sc8280xp-dp", .data = &msm_dp_desc_sc8280xp },
> >  	{ .compatible = "qcom,sc8280xp-edp", .data = &msm_dp_desc_sc8280xp },
> > -	{ .compatible = "qcom,sdm845-dp", .data = &msm_dp_desc_sc7180 },
> > +	{ .compatible = "qcom,sdm845-dp", .data = &msm_dp_desc_sdm845 },
> >  	{ .compatible = "qcom,sm8350-dp", .data = &msm_dp_desc_sc7180 },
> >  	{ .compatible = "qcom,sm8650-dp", .data = &msm_dp_desc_sm8650 },
> >  	{ .compatible = "qcom,x1e80100-dp", .data = &msm_dp_desc_x1e80100 },
> > 
> > -- 
> > 2.43.0
> > 

-- 
With best wishes
Dmitry
