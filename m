Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A31928A8FAE
	for <lists+freedreno@lfdr.de>; Thu, 18 Apr 2024 01:49:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73DD910F95C;
	Wed, 17 Apr 2024 23:49:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="w8M0ux+6";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7207D10F95C
 for <freedreno@lists.freedesktop.org>; Wed, 17 Apr 2024 23:49:32 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-2db2f6cb312so5585571fa.2
 for <freedreno@lists.freedesktop.org>; Wed, 17 Apr 2024 16:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713397770; x=1714002570; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=IDyTmfUTB48zbrRJ3Ex/J4eaqhXRSOEtnoHY2dxsblE=;
 b=w8M0ux+6RjkF4q29Mu92meEaMqqCDfgViWSWZg6icYQA7/b6vYm8qSJMUVi7FpZq4X
 0vfv91kkvluHDZ7MxWR9mt20foU9IYOWqnTsRJqb7eNnCZjwvOp76w3ZsJ0yh4nKvGZ7
 Xag0sHqvIqCGf4pW66Eq7pKan2WOOMiAYkxkZoyD2Rh3HmTUta7YGGanqDaWBCDlTeOZ
 miwqFYawar2e1dYTkQ6Bh44ZmbxRhSWypb6aRLwkof78yGvcdAydJUKwdnGNpGBIp6r7
 jsPWPD5ufDSOzygp1w4YiKwAtOlBEVTgFzW8x8HqQsBKff8D05bejSjE7PnEHgcmYs6M
 K8LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713397770; x=1714002570;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IDyTmfUTB48zbrRJ3Ex/J4eaqhXRSOEtnoHY2dxsblE=;
 b=vGoGcIlBzv4PLIDFAW5Rl30F4A0oO8lo5zXsu+6bGf1LJrMCWstO2lXr0wZHDLmA0G
 xy0vK8Aco4e3yt1LlBMRBTHq8tJGrJ2jX9GbiIHmP6JnGcINFRQ6wjRuuR7KbJp5Upth
 /pkJ5ZWq8Z0TbFANXi497a8Wa28NN4DUZIqZKnhvINogLODCoUAkNOtuKsEyP423yQso
 NmK4g4GN7y0bBL+WCDo7FT0+4cnZBjrVjkB9/SLKQB8CrfmM9p9KoOhiz6w4fSPPmG5T
 DQN1H/1cyVCdOlrz3iLKyF4NkfVndR61Aro9MleJpIjCfNMcSkz6FD4Zozv/04JvuocO
 gEpQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNFOxjVr8v7DCOt4iK3hiOJkpkW0e9PtKRb5udTVT0WCry4WiZC9WzIDyMS2ZkDuPYikFNbHfvH16S/5aEgZcTq25PFBPwKE22hAz6hGyd
X-Gm-Message-State: AOJu0YxhrTHyWk/HAeDnZVHJGxZSLykFjY1UdtMl3+I/uRqzIqx9i3KR
 HoraTFeSv/2xFiLaMGH7oBWcEXkcmcGHTK7IVTr7gYkDQcC5yYZto3qXuzp9HPo=
X-Google-Smtp-Source: AGHT+IH/MUOBgyPCemAoyY2nfZkjc3UXoMr2/x45ATSbPEjenP4BTGIPiOlkgeZVrWhJMW0EEXYW4w==
X-Received: by 2002:a05:651c:50c:b0:2d4:6893:24e1 with SMTP id
 o12-20020a05651c050c00b002d4689324e1mr536858ljp.50.1713397770075; 
 Wed, 17 Apr 2024 16:49:30 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 e21-20020a2ea555000000b002d70a040f21sm35241ljn.91.2024.04.17.16.49.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Apr 2024 16:49:29 -0700 (PDT)
Date: Thu, 18 Apr 2024 02:49:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 7/7] arm64: dts: qcom: sm8550: Wire up GPU speed bin &
 more OPPs
Message-ID: <hykql6t7xy5uajvnzbslagrki6xvg3mjuba5hpjha36ue5ra76@4s3m2vsbxjav>
References: <20240404-topic-smem_speedbin-v2-0-c84f820b7e5b@linaro.org>
 <20240404-topic-smem_speedbin-v2-7-c84f820b7e5b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240404-topic-smem_speedbin-v2-7-c84f820b7e5b@linaro.org>
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

On Wed, Apr 17, 2024 at 10:02:59PM +0200, Konrad Dybcio wrote:
> Add the speedbin masks to ensure only the desired OPPs are available on
> chips of a given bin.
> 
> Using this, add the binned 719 MHz OPP and the non-binned 124.8 MHz.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8550.dtsi | 21 ++++++++++++++++++++-
>  1 file changed, 20 insertions(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
