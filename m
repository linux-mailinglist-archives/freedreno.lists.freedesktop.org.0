Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CCAA59F3D6B
	for <lists+freedreno@lfdr.de>; Mon, 16 Dec 2024 23:24:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC1B910E62E;
	Mon, 16 Dec 2024 22:24:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="aaPiBPKz";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9922610E7D2
 for <freedreno@lists.freedesktop.org>; Mon, 16 Dec 2024 22:24:55 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-53e399e3310so5528989e87.1
 for <freedreno@lists.freedesktop.org>; Mon, 16 Dec 2024 14:24:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734387894; x=1734992694; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=4lUKNdC2kAAGBCwC8ulcU+ZnvIc3yXrgdr0jrnZTuug=;
 b=aaPiBPKz3JrBrkEYbH/ecDCN1fzwhjnY9s+SvqMi4yG5GRKGJw65EwBtBAHFgRr4pz
 zk/N1HVqVJmRyNJLVd/BQgbYMOQZU6CUL0pDIVeWgc1RRcFZJYqF01KHVh5cvZ22m+bI
 J/0OWeO1M11sojgHzoPlmr4Dg1PzwolbmaENEeb2gLbRgMcn1Y7K2pFKXuulnSlvMJu8
 F4/qi5BYLy145A+aBKQETP3eYyqsMqwqi0SWeGan/TlnuVSE/kaWaNx9P+JGfHKZsaI/
 XJegU07FtDW4OG1pICx3L8DEfqBCnsuUYb1cA0yLxaDpiVfDrfKfQGnoLYEUD3fPegj6
 ulcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734387894; x=1734992694;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4lUKNdC2kAAGBCwC8ulcU+ZnvIc3yXrgdr0jrnZTuug=;
 b=qMhBT7Gzl+apKbIKUiTA3k05N/K8YEMSNuhuuR0IJW1V2Tl12joi3DL7KQE0xWZ01X
 3efI9VSadg2zUhIK/Snv1rtNSyOaFMQCnm8o/mYZbN1w6IiRXfouo+uEw9u+IzcqAhEc
 XQaAfciZlklWrV5eZ8+84TmP0vl90Mon+/2kasf//JYqZ3GNnoAzWV1jIw1oduNZ8Xry
 K+Dkcnz+JUDm+Ojo+5cdpX7WW9wCrl6EBCqPjQt749VODUagj4OIZvnicJ+HGJdBq4Xi
 W2HWkc8yCERFmA+jXi8ZxLfRz0uMtmOnOaAb/Yneqqr07zFTV/PqtgWppJSnXO5f2ScV
 29VQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLFAb5fA15Zxx4qUdFSz9O0qAq65MvIP++4PB3i0dN6VIakicDH08ZZRprH4ig9wuITQjgKg2JZsQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz7Q4tdTyUEq2pY0gUbk1qa3c7FYdgFchVTq0nqNGtPg9TRkjW9
 cnx2hUqpQ/P4Jk0/qiWUIBvaqW3KP7MRmn9T8fsillQ/BqYAKwdIlPhzbdw2qjE=
X-Gm-Gg: ASbGncukzSdvQLbRh0HnZ+oxkMFD3Uf4ZkVKZUysPpN1uqU3GCxu04Xao5NKjZ70OEZ
 ZC1MeyFhC4WFqP8ntttXQj7/eATJ25COTkM+tr9oULQ7hb5fd8cgYBcOXl+quHfPiclNDsii3dG
 Gi9gMZcuQHtaC71QL3lGgJed2Y3Z1BKrqv8Hilx8thpFWuvmL0W9jvdS0yhDLCFF1JJqSI7cJwN
 /AUYy0ZNlXumaxJPolBv9l5zT2gLseDMQqPCgiBb2jgZjdpN2Tx6/eS/gIgiNzCQxLPLlAwCE1K
 CSyWd5KJ0QFs0kzdlgOJ18DD0JIusB19KKE+
X-Google-Smtp-Source: AGHT+IGeM80+qzSI85ogwxR7TJc35MFGjDldBmFT9FD2cLdQVLMDcDnI76ZKZkotwpop5fLoExBoFw==
X-Received: by 2002:a05:6512:3b89:b0:53f:afae:7364 with SMTP id
 2adb3069b0e04-540905a6f62mr4232404e87.40.1734387893905; 
 Mon, 16 Dec 2024 14:24:53 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54120bffd77sm972047e87.136.2024.12.16.14.24.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Dec 2024 14:24:52 -0800 (PST)
Date: Tue, 17 Dec 2024 00:24:50 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Paloma Arellano <quic_parellan@quicinc.com>, 
 Douglas Anderson <dianders@chromium.org>, Stephen Boyd <swboyd@chromium.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 06/16] drm/msm/dp: split MMSS_DP_DSC_DTO register
 write to a separate function
Message-ID: <6nt7cacoik4nxbjpgpidmovzilxf7q2gld64ch2p7ltatkzl4p@sg4ltm7jt47c>
References: <20241216-fd-dp-audio-fixup-v4-0-f8d1961cf22f@linaro.org>
 <20241216-fd-dp-audio-fixup-v4-6-f8d1961cf22f@linaro.org>
 <9fb5986b-f375-4300-b50c-92bb9c0b4399@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9fb5986b-f375-4300-b50c-92bb9c0b4399@quicinc.com>
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

On Mon, Dec 16, 2024 at 11:46:21AM -0800, Abhinav Kumar wrote:
> 
> 
> On 12/15/2024 2:44 PM, Dmitry Baryshkov wrote:
> > It's the dp_panel's duty to clear the MMSS_DP_DSC_DTO register. Once DP
> > driver gets DSC support, it will handle that register in other places
> > too. Split a call to write 0x0 to that register to a separate function.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/dp/dp_catalog.c | 8 ++++++++
> >   drivers/gpu/drm/msm/dp/dp_catalog.h | 2 ++
> >   drivers/gpu/drm/msm/dp/dp_ctrl.c    | 2 ++
> >   3 files changed, 12 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
> > index 7b7eadb2f83b169d8df27ee93589abe05b38f3ae..354ec834f9357c4797fc08a4532e69acc67b4317 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
> > +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
> > @@ -1039,6 +1039,14 @@ void msm_dp_catalog_panel_tpg_disable(struct msm_dp_catalog *msm_dp_catalog)
> >   	msm_dp_write_p0(catalog, MMSS_DP_TIMING_ENGINE_EN, 0x0);
> >   }
> > +void msm_dp_catalog_panel_clear_dsc_dto(struct msm_dp_catalog *msm_dp_catalog)
> > +{
> > +	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
> > +				struct msm_dp_catalog_private, msm_dp_catalog);
> > +
> > +	msm_dp_write_p0(catalog, MMSS_DP_DSC_DTO, 0x0);
> > +}
> 
> This is already done msm_dp_catalog_ctrl_config_msa(), this is either a
> duplicate or redundant.
> 
> void msm_dp_catalog_ctrl_config_msa(..........)
> {
> 	**********
>         msm_dp_write_link(catalog, REG_DP_SOFTWARE_NVID, nvid);
>         msm_dp_write_p0(catalog, MMSS_DP_DSC_DTO, 0x0);
> }

The chunk to remove it got squashed into a different patch.

> 
> > +
> >   static void __iomem *msm_dp_ioremap(struct platform_device *pdev, int idx, size_t *len)
> >   {
> >   	struct resource *res;
> > diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
> > index 6678b0ac9a67881244884d59487fa288d33d1be7..08bb42e91b779633875dbeb4130bc55a6571cfb1 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_catalog.h
> > +++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
> > @@ -92,6 +92,8 @@ void msm_dp_catalog_panel_tpg_enable(struct msm_dp_catalog *msm_dp_catalog,
> >   				struct drm_display_mode *drm_mode);
> >   void msm_dp_catalog_panel_tpg_disable(struct msm_dp_catalog *msm_dp_catalog);
> > +void msm_dp_catalog_panel_clear_dsc_dto(struct msm_dp_catalog *msm_dp_catalog);
> > +
> >   struct msm_dp_catalog *msm_dp_catalog_get(struct device *dev);
> >   /* DP Audio APIs */
> > diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> > index 9c463ae2f8fae916661fef1c7e225f55c1026478..b9c461fee96f8fae9259ce03a32e1155b42d17bb 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> > +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> > @@ -2011,6 +2011,8 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train
> >   		pixel_rate_orig,
> >   		ctrl->panel->msm_dp_mode.out_fmt_is_yuv_420);
> > +	msm_dp_catalog_panel_clear_dsc_dto(ctrl->catalog);
> > +
> >   	msm_dp_ctrl_setup_tr_unit(ctrl);
> >   	msm_dp_catalog_ctrl_state_ctrl(ctrl->catalog, DP_STATE_CTRL_SEND_VIDEO);
> > 

-- 
With best wishes
Dmitry
