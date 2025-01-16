Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4DCA13446
	for <lists+freedreno@lfdr.de>; Thu, 16 Jan 2025 08:48:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C06810E8D2;
	Thu, 16 Jan 2025 07:48:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="IV+3XIqG";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94F5210E8D2
 for <freedreno@lists.freedesktop.org>; Thu, 16 Jan 2025 07:48:11 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-303489e8775so6282621fa.3
 for <freedreno@lists.freedesktop.org>; Wed, 15 Jan 2025 23:48:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737013690; x=1737618490; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Luwgr/98+f8j9HTp9cKFmSabnH9PtUv555iDvEhdCnM=;
 b=IV+3XIqG+j+ys5chr7ndr3CrDKm3WV6w45q0q8F+ZtI6uXHNXOGbgTgEMe/kaXq+42
 /cGgyidrjqUNIQGfPibIL/kSym2Sm50ATNpu5z91pcoZqafYnYrVzCdWXkOFRIGVt8Ay
 V43wIaq2SABX7WjQ5Ac9eJACJuOz5qugSBSsS7PutQWBMrKDwwmn9hnBlEhCcWUzcw0E
 lP/0UI5VMd4xPhiMINN5oka+jAccUo7fCVFK0yIhEPqEfKm8P85RHBmb77lI7r9DZ0XC
 5yKkbGplIsY+yDf4LUiQkjB/FnIidX7XY4NLCa+WJLoFscxWr4bNQRaJTQfLc66iYnek
 NR7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737013690; x=1737618490;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Luwgr/98+f8j9HTp9cKFmSabnH9PtUv555iDvEhdCnM=;
 b=ryx7L+T9kuUu1c6JKiseAKLPJWDyCHqFvmUgSFuOkI2U25z5kUamkoivhrcPHgDHND
 UFngjK9mNEqvldh3+Wpo383rRPFdvrESxoACh+N3EWavtHUT/blDra3qCIv16kkxmNFC
 QikoT9hhCRfbZhUMF9925b9aRnRn3lptlqYSHwY6DmAU2J18J7JYKJOIVAa6YdKeP8CD
 5f9zoLUZlj+EdLUQp4EQqB0YHfmZGw2x3D9yIwr1TI3H89TO5gTHqDUZJb5XTG1ZF9r0
 dBwc2KXgjFbE3BNlM5PwM5SmKmdNusPPpY995giDMoAhP3CKPyldKeJFDfNmx3PPjktj
 GQlg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCiHTBWKtd9WOwATrS7B5BCLgWOq26ukuK5lVSftw0tWY7BQ/+bYW/lxHCNc3jPls6Pwz3Zn+cjnk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzHxpq2dpudCIuaS4ZZ2Hh1bl2U0tiIVDk/C5wdTCXAywCUNhJa
 HHf7KEf1AnmsJFgVBCxyeRMDJXRJzfYkO8tqB8R9tt09mjVa0lpXX+yHxfe9ct8=
X-Gm-Gg: ASbGncszRqDBkJUg/LiQOc+gA16xH6K3ZPkqnW78Ss3DUYIy1FtrqqyWCXLPFHD5CXI
 v0pFP9ncVi/qr7ssj1OqqAHj4JERzP0kJA/B3qR2B0tClMQCuUpqIvVzCWWHIo2Zii7qhef899L
 XXffmav9z4fMHpPzvGLOgPEPc3hlt6useHMkB2Zy9i8opCwpGv9w6aYN7Jr3BhAm+g4C3yEMuio
 U24ozYAA6IHEj58dXFlGN9cXUSoQ7rgSFH2qedvrXDDo0nbAuwMXrL86hfDj44ey/yfbuyrr14Z
 uAoj+D/iWwsb8IBnTW0E+3xxEd7Qs0lNDY+8
X-Google-Smtp-Source: AGHT+IFQa3wMQmdvF5PR29nT2j5Y4yU5wi9b2px9OWV8zN7GBDkw/qif9xH5KGsN9r+gg/ugRekl8w==
X-Received: by 2002:a05:6512:acf:b0:542:63a8:3939 with SMTP id
 2adb3069b0e04-542845a6f01mr9968008e87.8.1737013689890; 
 Wed, 15 Jan 2025 23:48:09 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5428bec066fsm2284879e87.189.2025.01.15.23.48.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2025 23:48:08 -0800 (PST)
Date: Thu, 16 Jan 2025 09:48:06 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 03/16] drm/msm/dpu: configure DSC per number in use
Message-ID: <bmjrpuxahjzjbnl7xvqhwmzh7dlhyjnfvh7swnxo6txuerfy4o@pvyzbd5cxfsm>
References: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-0-74749c6eba33@linaro.org>
 <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-3-74749c6eba33@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-3-74749c6eba33@linaro.org>
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

On Thu, Jan 16, 2025 at 03:25:52PM +0800, Jun Nie wrote:
> Currently if DSC support is requested, the driver only supports using
> 2 DSC blocks. We need 4 DSC in quad-pipe topology in future. So Only
> configure DSC engines in use, instead of the maximum number of DSC
> engines.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index c734d2c5790d2..6603e9c03226f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -2027,7 +2027,7 @@ static void dpu_encoder_dsc_pipe_cfg(struct dpu_hw_ctl *ctl,
>  static void dpu_encoder_prep_dsc(struct dpu_encoder_virt *dpu_enc,
>  				 struct drm_dsc_config *dsc)
>  {
> -	/* coding only for 2LM, 2enc, 1 dsc config */
> +	int num_dsc = dpu_enc->num_dscs;

Reverse Christmas tree, please. Or the variable importance criteria.
Anyway, num_dsc should be lower.

With that fixed:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

>  	struct dpu_encoder_phys *enc_master = dpu_enc->cur_master;
>  	struct dpu_hw_ctl *ctl = enc_master->hw_ctl;
>  	struct dpu_hw_dsc *hw_dsc[MAX_CHANNELS_PER_ENC];
> @@ -2039,7 +2039,7 @@ static void dpu_encoder_prep_dsc(struct dpu_encoder_virt *dpu_enc,
>  	u32 initial_lines;
>  	int i;
>  
> -	for (i = 0; i < MAX_CHANNELS_PER_ENC; i++) {
> +	for (i = 0; i < num_dsc; i++) {
>  		hw_pp[i] = dpu_enc->hw_pp[i];
>  		hw_dsc[i] = dpu_enc->hw_dsc[i];
>  
> @@ -2068,7 +2068,7 @@ static void dpu_encoder_prep_dsc(struct dpu_encoder_virt *dpu_enc,
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
