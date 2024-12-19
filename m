Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D6C9F877B
	for <lists+freedreno@lfdr.de>; Thu, 19 Dec 2024 23:06:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B191310EDF5;
	Thu, 19 Dec 2024 22:06:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="z1euAoco";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5689210EDFB
 for <freedreno@lists.freedesktop.org>; Thu, 19 Dec 2024 22:06:26 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-53f22fd6887so1117980e87.2
 for <freedreno@lists.freedesktop.org>; Thu, 19 Dec 2024 14:06:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734645985; x=1735250785; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=sadvPQGyZFnk5L8H9OLf57JxFXnM4lchsSRTPwpDzuA=;
 b=z1euAocoQ7DUoxBWzrjcCbxts/N+dD2JFcWUD7RpZUX6Obcg8ZpOy5AKmGHK4NjHNk
 Bqjtk3kknJXLu31X+7FW0CBvjEZUqiBheiSK6KiQR/w8bprMJpA70IietkI8l747UDfG
 bjpyvz8u0jYw3t0/F7lIzfcliaDCSuL7FnxSZiLaU98IvIkAei3BGINKRjdPrlOr6jZ9
 sKqNzGig32KgF4nftFkqRFlQaGU+CU4N88L8DG97bD21eMQLYQXUklZDnL2D9M5KIr9q
 yabi5VQQcSUW3a3j/vqL6FOGKeM5JTHJX5sF0zQOuNoyxLB+/bdubBLPPBDfxZ4vwptc
 MG2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734645985; x=1735250785;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sadvPQGyZFnk5L8H9OLf57JxFXnM4lchsSRTPwpDzuA=;
 b=Q7j9p358ee0MtEXpzsKdVrf9rEmckzpu+7UhOgO/KXyKAqEKIuSeDmnirfYw6R+GXp
 Tbw9m7TZDPqhWH8rLUq8x4seiT8gRVsuYUOVSmkEe1wqNbRS2qsm4Os0e4JHiw3UKMVc
 oMXlpJ7K2QOPBQTBnC8oLCj1akRz5KZKEXIlo4lhzpUZmiARxZuA7vPlSjoQ2jsxtAFf
 ZNHByLXfsp/K4otijG7zeEyZkjPJFIbg/Up/epnP8scslxU02lRa7boaYmjS1kxpdnoy
 vMUnT2ohpW6SPJ9kNVDpGPr2JET16L3Zs4XWEwtdOy5OZCODvtbo9ZTqXjH3duzole/T
 JGJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMWr9yfISQZPGgXdcAiMPoAfG/93Ovluv7l/Va/j31sOyatlKYKdmTF4mRhrYds5uH+gXDaVIo/qA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy3b35AeG421Mzx8FVk2QEaO+v48b40DQWHI7vm9qI3L4pwCajf
 4iV+kUjA4Y9y8KBVfh87cHuVJxpNHBiwMzYBsOsJJSryFXtiLtBNJaxrZGBIwhs=
X-Gm-Gg: ASbGncszGwHus/n7KhiUY9M9ifBGOuDYhKb5tV+zyEk1X/JtWn8VD49TNWd+CHEsXDz
 9nqxYTQzGlMXtPD43Q99a03l9IAqvcURHebHhICafmrsL3jsk4OGbbCNzH7qtXhgQIlV1XUgVQy
 xP6GPC4i2PFMnkeNnln4ZIHGIlghaYZ80Mfh882PZF0eJgSFBurKtZn2SFMJQE5fPlZNB/zX3iX
 pApHT4dJ9/t2XJBZmw9OYzZLBraln6E0yt+HfefED1AueVVbaV0winaf/tnMoJ3ouXulJSKsPa1
 uozvuXew/qQjqYtQWcZ/Y0qnAwLXpTV1fVkX
X-Google-Smtp-Source: AGHT+IG/oQ8IpfK5v75iR85HF9dLqNh4xH59OagcfgNjPICAJFcqOQUIpt3LAxhSNqh7VkOKFn3u9Q==
X-Received: by 2002:a05:6512:3a96:b0:53e:3a73:d179 with SMTP id
 2adb3069b0e04-5422954064dmr80477e87.31.1734645984651; 
 Thu, 19 Dec 2024 14:06:24 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3045adad6dcsm3412371fa.60.2024.12.19.14.06.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2024 14:06:23 -0800 (PST)
Date: Fri, 20 Dec 2024 00:06:21 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 02/15] drm/msm/dpu: configure DSC per number in use
Message-ID: <fut2yuxo7ixrbxg24n4azeuyxury5i2ggcbo4pfvfxnp22wbs2@uhulitajdrb5>
References: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-0-92c7c0a228e3@linaro.org>
 <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-2-92c7c0a228e3@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-2-92c7c0a228e3@linaro.org>
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

On Thu, Dec 19, 2024 at 03:49:20PM +0800, Jun Nie wrote:
> Currently if DSC support is requested, the driver only supports using
> 2 DSC blocks. We need 4 DSC in quad-pipe topology in future. So let's
> only configure DSC engines in use, instead of the maximum number of
> DSC engines.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 650df585138cd..cc23f364dd080 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -2028,6 +2028,7 @@ static void dpu_encoder_prep_dsc(struct dpu_encoder_virt *dpu_enc,
>  				 struct drm_dsc_config *dsc)
>  {
>  	/* coding only for 2LM, 2enc, 1 dsc config */

Is the comment still relevant?

> +	int num_dsc = dpu_enc->num_dscs;
>  	struct dpu_encoder_phys *enc_master = dpu_enc->cur_master;
>  	struct dpu_hw_ctl *ctl = enc_master->hw_ctl;
>  	struct dpu_hw_dsc *hw_dsc[MAX_CHANNELS_PER_ENC];
> @@ -2039,7 +2040,7 @@ static void dpu_encoder_prep_dsc(struct dpu_encoder_virt *dpu_enc,
>  	u32 initial_lines;
>  	int i;
>  
> -	for (i = 0; i < MAX_CHANNELS_PER_ENC; i++) {
> +	for (i = 0; i < num_dsc; i++) {
>  		hw_pp[i] = dpu_enc->hw_pp[i];
>  		hw_dsc[i] = dpu_enc->hw_dsc[i];
>  
> @@ -2068,7 +2069,7 @@ static void dpu_encoder_prep_dsc(struct dpu_encoder_virt *dpu_enc,
>  	enc_ip_w = intf_ip_w / 2;
>  	initial_lines = dpu_encoder_dsc_initial_line_calc(dsc, enc_ip_w);
>  
> -	for (i = 0; i < MAX_CHANNELS_PER_ENC; i++)
> +	for (i = 0; i < num_dsc; i++)
>  		dpu_encoder_dsc_pipe_cfg(ctl, hw_dsc[i], hw_pp[i],
>  					 dsc, dsc_common_mode, initial_lines);
>  }
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
