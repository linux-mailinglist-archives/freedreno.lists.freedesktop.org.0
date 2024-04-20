Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74AB98AB851
	for <lists+freedreno@lfdr.de>; Sat, 20 Apr 2024 03:26:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D61110E3E1;
	Sat, 20 Apr 2024 01:26:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="reWTqBKO";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C00DE10E3CD
 for <freedreno@lists.freedesktop.org>; Sat, 20 Apr 2024 01:26:27 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-51abd580902so1107605e87.1
 for <freedreno@lists.freedesktop.org>; Fri, 19 Apr 2024 18:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713576385; x=1714181185; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=82tFBgEdIxjnsfXiodhMe/pFfwk8UfoM7JglpDttIJo=;
 b=reWTqBKO4iFY+nl8phqL9ALnAhjg1zs8XO9CdjLTXr9OSaOe1L0EVbxyIE5FFdowG+
 gOcvRlJC9wmDsPmkyWXd35KLTtM4S5IhFJOdPMe68xASUKtxfKCtnfHmCqnU0VsLHCBu
 TMmo5tjufCndTNi145LUewXewuhCjO3h7toE6E927TOztEdK6AgnugoUAsOdJberS0qc
 RMiZiKfTKeJE7Eh+sk0r7aNVlfPMMPyjhNpY+smjeuEV8LxgbZbF/4+3Q9oAcz2/esKm
 bFfecSnAOnC5eAdVZyf6qE+rjHDVf+nNJTDUQNOAFTVt4Cbj/kzNeB+6odGA7D8UToFM
 tSUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713576385; x=1714181185;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=82tFBgEdIxjnsfXiodhMe/pFfwk8UfoM7JglpDttIJo=;
 b=I6DZwvEgmUJn9lQDdzp7eQpE4r2At1YNmWO/DlOyo2txsxDdVt1F7KBh26WH+sPUjV
 I48WxDCUXl1z6f8Q6FkOiW1b2P8DoR//KS0z2fzlp1NIVRTCxU3DfAkF+Dyvz/l9q+CR
 dJInQ3OUNi/NLABh6MWFElvwXZZPqYAGe164cAA9TXiI2iNGsvulO9NzaYu93Nz4FaaJ
 lB7W1xKIlaAoQsMFB0xoazt/tV9JufUk5V38iIAcA6tBLPQ/u99fZ0JqDlP2PwNj74AK
 7apXyuD6zt+5CLRj5GlVdI16O9hCMl2/9IKOsrj/xfwohSPTWy8fL0LYYcLaXQsk0l4L
 BvcQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXa6ZQbPJFumMz4TVOQK+JMSx4mDegXB5y/BRYUsSDvP+o5k5kMv9DTlS5WoYGaidg5HgKlSdsEG7TE175IrZkzN/ms7cn4oN0VCS3xcaOc
X-Gm-Message-State: AOJu0YwpoStr3RWkOgyoHJ+yVA3vPbpK/MD9A+lX2pLmnDOZ0BurQoMt
 Gx/3otu+ufB6WZKBe0Ur+fa9ailRkFWFDBppeQxAjVoPXWteikG0jFE/ChPYUM8=
X-Google-Smtp-Source: AGHT+IGJrr07aHC/Cs7bDT/YFGzvwRXVO7yvc2tL4V11EO+OlyAP8FyUQmvwWb7usmWdo7JZH01J7Q==
X-Received: by 2002:a05:6512:2003:b0:515:8a20:71de with SMTP id
 a3-20020a056512200300b005158a2071demr1847450lfb.5.1713576385258; 
 Fri, 19 Apr 2024 18:26:25 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::8a5])
 by smtp.gmail.com with ESMTPSA id
 o13-20020ac24e8d000000b005178f5ad215sm954850lfr.122.2024.04.19.18.26.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Apr 2024 18:26:24 -0700 (PDT)
Date: Sat, 20 Apr 2024 04:26:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH 1/9] drm/msm/dpu: drop dpu_format_check_modified_format
Message-ID: <ccgx5mjsxf2asvadithitzl7shkboj6ipcg6onfawa5pskchgd@etighi5usone>
References: <20240319-dpu-mode-config-width-v1-0-d0fe6bf81bf1@linaro.org>
 <20240319-dpu-mode-config-width-v1-1-d0fe6bf81bf1@linaro.org>
 <9c2f5f63-291c-c2b5-41a1-d2004055cf7a@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9c2f5f63-291c-c2b5-41a1-d2004055cf7a@quicinc.com>
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

On Fri, Apr 19, 2024 at 04:43:20PM -0700, Abhinav Kumar wrote:
> 
> 
> On 3/19/2024 6:21 AM, Dmitry Baryshkov wrote:
> > The msm_kms_funcs::check_modified_format() callback is not used by the
> > driver. Drop it completely.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c | 45 -----------------------------
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h | 15 ----------
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     |  1 -
> >   drivers/gpu/drm/msm/msm_kms.h               |  5 ----
> >   4 files changed, 66 deletions(-)
> > 
> 
> I think in this case, I am leaning towards completing the implementation
> rather than dropping it as usual.
> 
> It seems its easier to just add the support to call this like the attached
> patch?

Please don't attach patches to the email. It makes it impossible to
respond to them.

Anyway, what are we missing with the current codebase? Why wasn't the
callback / function used in the first place?

> 
> WDYT?
> 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
> > index e366ab134249..ff0df478c958 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
> > @@ -960,51 +960,6 @@ int dpu_format_populate_layout(
> >   	return ret;
> >   }
> > -int dpu_format_check_modified_format(
> > -		const struct msm_kms *kms,
> > -		const struct msm_format *msm_fmt,
> > -		const struct drm_mode_fb_cmd2 *cmd,
> > -		struct drm_gem_object **bos)
> > -{
> > -	const struct drm_format_info *info;
> > -	const struct dpu_format *fmt;
> > -	struct dpu_hw_fmt_layout layout;
> > -	uint32_t bos_total_size = 0;
> > -	int ret, i;
> > -
> > -	if (!msm_fmt || !cmd || !bos) {
> > -		DRM_ERROR("invalid arguments\n");
> > -		return -EINVAL;
> > -	}
> > -
> > -	fmt = to_dpu_format(msm_fmt);
> > -	info = drm_format_info(fmt->base.pixel_format);
> > -	if (!info)
> > -		return -EINVAL;
> > -
> > -	ret = dpu_format_get_plane_sizes(fmt, cmd->width, cmd->height,
> > -			&layout, cmd->pitches);
> > -	if (ret)
> > -		return ret;
> > -
> > -	for (i = 0; i < info->num_planes; i++) {
> > -		if (!bos[i]) {
> > -			DRM_ERROR("invalid handle for plane %d\n", i);
> > -			return -EINVAL;
> > -		}
> > -		if ((i == 0) || (bos[i] != bos[0]))
> > -			bos_total_size += bos[i]->size;
> > -	}
> > -
> > -	if (bos_total_size < layout.total_size) {
> > -		DRM_ERROR("buffers total size too small %u expected %u\n",
> > -				bos_total_size, layout.total_size);
> > -		return -EINVAL;
> > -	}
> > -
> > -	return 0;
> > -}
> > -
> >   const struct dpu_format *dpu_get_dpu_format_ext(
> >   		const uint32_t format,
> >   		const uint64_t modifier)
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h
> > index 84b8b3289f18..9442445f1a86 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h
> > @@ -54,21 +54,6 @@ const struct msm_format *dpu_get_msm_format(
> >   		const uint32_t format,
> >   		const uint64_t modifiers);
> > -/**
> > - * dpu_format_check_modified_format - validate format and buffers for
> > - *                   dpu non-standard, i.e. modified format
> > - * @kms:             kms driver
> > - * @msm_fmt:         pointer to the msm_fmt base pointer of an dpu_format
> > - * @cmd:             fb_cmd2 structure user request
> > - * @bos:             gem buffer object list
> > - *
> > - * Return: error code on failure, 0 on success
> > - */
> > -int dpu_format_check_modified_format(
> > -		const struct msm_kms *kms,
> > -		const struct msm_format *msm_fmt,
> > -		const struct drm_mode_fb_cmd2 *cmd,
> > -		struct drm_gem_object **bos);
> >   /**
> >    * dpu_format_populate_layout - populate the given format layout based on
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > index a1f5d7c4ab91..7257ac4020d8 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > @@ -969,7 +969,6 @@ static const struct msm_kms_funcs kms_funcs = {
> >   	.complete_commit = dpu_kms_complete_commit,
> >   	.enable_vblank   = dpu_kms_enable_vblank,
> >   	.disable_vblank  = dpu_kms_disable_vblank,
> > -	.check_modified_format = dpu_format_check_modified_format,
> >   	.get_format      = dpu_get_msm_format,
> >   	.destroy         = dpu_kms_destroy,
> >   	.snapshot        = dpu_kms_mdp_snapshot,
> > diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
> > index 0641f6111b93..b794ed918b56 100644
> > --- a/drivers/gpu/drm/msm/msm_kms.h
> > +++ b/drivers/gpu/drm/msm/msm_kms.h
> > @@ -96,11 +96,6 @@ struct msm_kms_funcs {
> >   	const struct msm_format *(*get_format)(struct msm_kms *kms,
> >   					const uint32_t format,
> >   					const uint64_t modifiers);
> > -	/* do format checking on format modified through fb_cmd2 modifiers */
> > -	int (*check_modified_format)(const struct msm_kms *kms,
> > -			const struct msm_format *msm_fmt,
> > -			const struct drm_mode_fb_cmd2 *cmd,
> > -			struct drm_gem_object **bos);
> >   	/* misc: */
> >   	long (*round_pixclk)(struct msm_kms *kms, unsigned long rate,
> > 

-- 
With best wishes
Dmitry
