Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57217A18ED8
	for <lists+freedreno@lfdr.de>; Wed, 22 Jan 2025 10:53:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3094110E08F;
	Wed, 22 Jan 2025 09:53:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="SWxzkCXy";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7307A10E08F
 for <freedreno@lists.freedesktop.org>; Wed, 22 Jan 2025 09:53:41 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-304d760f12aso61216371fa.2
 for <freedreno@lists.freedesktop.org>; Wed, 22 Jan 2025 01:53:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737539619; x=1738144419; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=iRgf+4Gq7ci+Ro2VkxNsjuyLNd/CJ4xAOCwqSJx115Q=;
 b=SWxzkCXy911yADLJ7sQNnhNZZOtjT+oEAeaXSzG/HtlViMstcqduqusIzmauW78Ih9
 nj1NhfGoODHjrc/Zv7P0xS2iW7Ap4X2imeWHbledw3UWREdVHIku27IMK/VlLM5uIHKs
 6STnu858ItSm4uuBN0rQow8wwoecj+jT994NpdkI/0eIO7g+uvppibaeJL2mbs5Y/RT0
 3bFiDVRnjATxcBl616via4tPZLLCzmTp+hY+k4S3+iRQ+w3Ra+u26qBcDVwcGkZm0nib
 ArQg5jvuHyaLRk827p2M9HsxJZRUr1mTnSfwsFK3eUCeepyXpmckq775tU4K38QXMfjd
 x0nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737539619; x=1738144419;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iRgf+4Gq7ci+Ro2VkxNsjuyLNd/CJ4xAOCwqSJx115Q=;
 b=GJJz4NePBxm+aY1to+v3EpqFbVCNmMkXEQIFnuZXehT2QJ9fUI9eoEcosEI4TSEj4W
 dUKGZUo10Oo/bOrb9BB18W/iiOhD8zvT4PphHGWUWXIwHOt6wD7wbX3rA7h8HO7+IfeL
 e6Cx0zGhowyBbeyWR+LdGHx6kYCLFL7Ns34D4Kpb2goODnNcGBwjgzy850Ufmsz9JHQG
 IhSYNuEejmsiHd39kvFN14qNpuhPVYkDE+SeWzar//3P5YrXXMv4l+xp/yR5pViFPdB9
 nTh9f+xl74GRVGh97QL8535fqdM8ZH12i9QPoPLJwExaxsIeSXEEt5jhlNd/5XJaKDxB
 hEPg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXamt5II4wCC+BVGK3weuCAvUjrWZvjong9LM+D8E6swUKNPh+ZoO70MSBN7n/mb8r9S3ogw0zJtuk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzmf/lIC4H+dzhMqAuSnAo2IUsxLRFrYD3JGki0kPjcQBIQnkse
 9kj19blijUEJDdmjKH0zsacgI0pndURfM5KKiDNpIJVeTA7zOgnotoM9rpI1tTY=
X-Gm-Gg: ASbGncsXR5edz8yuxK4CnRVOlbmYYD1fA2Q4kJpWfAmmxhIii/QOWK7Tiuv8Ui5ZHg4
 aAVfcWGHAmfCvNipmKdZEcnN/mC/4F2Uc54ozj4+Lu+hgDivek5+HuZBXkyR7GeiDfL3zEu6MKp
 5Q+xuQElkqwZMajMiy4IT+oFOPsRDlZ9VWWwdiar7U18WMncK3Zw80olRydZySXubcAv4eBSu8a
 wCuh/Fww8tHRY0XsheY9d9Tp2oNE1v20/JgJTOJ0+9kwpJ50djzGEChlk8Tv3nR3tITc7Xv3cwx
 cJR2lVNVO+uZg1NUmhU1MGOhGReZAC6cPoQwI5H/Rtr5SuH/zg==
X-Google-Smtp-Source: AGHT+IHLb2Jy8LJxpPjgGgMRTl/2bf+lFr1P6PyDavfCYaMiwjULwOKsJk+FZolKdDj43k4KykRThw==
X-Received: by 2002:a05:651c:e1b:b0:307:46f3:4e92 with SMTP id
 38308e7fff4ca-30746f34f8cmr32037541fa.32.1737539619493; 
 Wed, 22 Jan 2025 01:53:39 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3072a330180sm25104611fa.23.2025.01.22.01.53.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jan 2025 01:53:38 -0800 (PST)
Date: Wed, 22 Jan 2025 11:53:35 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Vinod Koul <vkoul@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 11/35] drm/msm/dpu: get rid of DPU_CTL_ACTIVE_CFG
Message-ID: <obrwhv2a4ubg4updrimszy7b7dwjsixuwzf5gutjahgdim6nxh@pin7heiwmco7>
References: <20241214-dpu-drop-features-v1-0-988f0662cb7e@linaro.org>
 <20241214-dpu-drop-features-v1-11-988f0662cb7e@linaro.org>
 <9d86517e-b05c-4cd6-925e-11c859fcb91d@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9d86517e-b05c-4cd6-925e-11c859fcb91d@quicinc.com>
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

On Tue, Jan 21, 2025 at 04:58:03PM -0800, Abhinav Kumar wrote:
> 
> 
> On 12/13/2024 2:14 PM, Dmitry Baryshkov wrote:
> > Continue migration to the MDSS-revision based checks and replace
> > DPU_CTL_ACTIVE_CFG feature bit with the core_major_ver >= 5 check.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h  | 8 ++------
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h | 8 ++------
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h  | 8 ++------
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h  | 6 ------
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h  | 8 ++------
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h  | 3 ---
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h  | 1 -
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h  | 4 ----
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h | 1 -
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h  | 1 -
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c    | 2 +-
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c     | 7 ++-----
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c          | 3 +--
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h          | 1 -
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c              | 2 +-
> >   15 files changed, 13 insertions(+), 50 deletions(-)
> > 
> 
> <snip>
> 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> > index e9bbccc44dad8b391cd51daf902307105b2598fc..e16b0a0c57da4a1aa77064ca2214e37cd9ee4baa 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> > @@ -66,7 +66,7 @@ static void _dpu_encoder_phys_cmd_update_intf_cfg(
> >   	ctl->ops.setup_intf_cfg(ctl, &intf_cfg);
> >   	/* setup which pp blk will connect to this intf */
> > -	if (test_bit(DPU_CTL_ACTIVE_CFG, &ctl->caps->features) && phys_enc->hw_intf->ops.bind_pingpong_blk)
> > +	if (phys_enc->hw_intf->ops.bind_pingpong_blk)
> >   		phys_enc->hw_intf->ops.bind_pingpong_blk(
> >   				phys_enc->hw_intf,
> >   				phys_enc->hw_pp->idx);
> 
> Was it intentional to drop the DPU_CTL_ACTIVE_CFG here but not replace it
> with core_major_rev >= 5?

The bind_pingpong_blk is only defined for 5.x+ platforms, so the check
is useless.

> 
> <snip>
> 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> > index 5f9cd09589bb403746d48af6f8555cd224bf3195..59d25916d2d412113768d71a76a6aed4c879299a 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> > @@ -716,7 +716,7 @@ struct dpu_hw_ctl *dpu_hw_ctl_init(struct drm_device *dev,
> >   	c->caps = cfg;
> >   	c->mdss_ver = mdss_ver;
> > -	if (c->caps->features & BIT(DPU_CTL_ACTIVE_CFG)) {
> > +	if (mdss_ver->core_major_ver >= 5) {
> >   		c->ops.trigger_flush = dpu_hw_ctl_trigger_flush_v1;
> >   		c->ops.setup_intf_cfg = dpu_hw_ctl_intf_cfg_v1;
> >   		c->ops.reset_intf_cfg = dpu_hw_ctl_reset_intf_cfg_v1;
> > 
> 
> DPU ver 5 introduced active_cfg, so this part is correct. Hence overall
> change is fine.

-- 
With best wishes
Dmitry
