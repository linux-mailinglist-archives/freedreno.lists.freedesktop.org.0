Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C082D9D39C4
	for <lists+freedreno@lfdr.de>; Wed, 20 Nov 2024 12:45:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A2F010E720;
	Wed, 20 Nov 2024 11:45:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Ypj/b8kU";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ED9710E71F
 for <freedreno@lists.freedesktop.org>; Wed, 20 Nov 2024 11:45:56 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-539f53973fdso765160e87.1
 for <freedreno@lists.freedesktop.org>; Wed, 20 Nov 2024 03:45:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732103154; x=1732707954; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=1/Zr+cOuoJa34h7or0PoA0CnB1TGkFgd4IlQqRmWY5w=;
 b=Ypj/b8kUsVUaTyeadZK85Ov3/8XYaqMOYXGBZqvSWS0QGtN5+O12mrrG8X5zjU2n97
 ONiswmOi7S6O+jGbdqbZnd1isGUPYBMh2tfi64wiAnuPZRpDLOedXLGQN/i0azxbcLni
 t2YaB2sgirg154P+yiVzvkT64pqqdSnE62PI4EFlowJMqpRSxlnZDswTwcv3fWM6RJUA
 i7t7Q/YnU66sGb5xyoBrhArS1M53keZvUsTpdvgEn9Bc8q2kpRR6EZ1d4ZcO3OcFrjiD
 +CHSwuEKOf4B+XVask6VHF/P2C00fPWrrwR9GFI1v5h5M0bRddEXMDKcBi/sRnrOFAI1
 M2NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732103154; x=1732707954;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1/Zr+cOuoJa34h7or0PoA0CnB1TGkFgd4IlQqRmWY5w=;
 b=PUXPGhb9xZKbeuV/cpNBxPOSXbFpCbaOZvvUIOWg3NXJSw4vfQYnhqoutOtn8y57zH
 9m9wnSIEOUGELscwr6/lLsrqQW2BwEnbaKj9uob2LZuKoujn+pHNL8P9cfQPsfPXXD+K
 3OSNvm1cGb90UKkMwUTE5nWjCWWdJWpE+9o2QeM45HcOXr2AAob5cMG9ZeWNSbChxCSK
 t8eP6nfENnb6ctceMyMP8JL2QRQ4mSEoHlSf15EQrScrBny9bddO3RtraV5BsM0cOXY2
 31QDorbneuSW8IrnfdFELGzJmfwzi1z9QFyjlQ4NwWPScCFUC9GPG6u7ZXRLcIcqyPUb
 j9Pg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZdBpLzYEGp8RWTPqzljMWYckV4KSuQQDMZlodLStOynX/hYViEoHsl6+1s26/apo/Mc2XzhszCyA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywe0kAZJNRNaKYP1goCjxut39GneDcjdGpJh1PvwoAYowjLJVXs
 7Te76OTSk+h/nsnFyMrfwK55qjDpCdjinKaG/X8yHTnjrpLtlPeRryQxmWAdyuc=
X-Google-Smtp-Source: AGHT+IH/4e+nGbdMaIeU1TUTsdcqmQ4z1YXjYyHyTiiprBXpu4guD3Gg+RbYTx+qPh8+mq5mPy62Ew==
X-Received: by 2002:a05:6512:23a9:b0:53d:ace6:f64e with SMTP id
 2adb3069b0e04-53dc0fa084emr1015414e87.16.1732103154348; 
 Wed, 20 Nov 2024 03:45:54 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53dbd3fa030sm605142e87.59.2024.11.20.03.45.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Nov 2024 03:45:53 -0800 (PST)
Date: Wed, 20 Nov 2024 13:45:50 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>, 
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Bjorn Andersson <andersson@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Connor Abbott <cwabbott0@gmail.com>,
 linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 09/11] drm/msm: adreno: enable GMU bandwidth for A740
 and A750
Message-ID: <aw4t4hfxgk3wjlhcelv6hmv5mpqzwhvscumdvnuh6yo4uqu2tz@w5kzecb3gzza>
References: <20241119-topic-sm8x50-gpu-bw-vote-v2-0-4deb87be2498@linaro.org>
 <20241119-topic-sm8x50-gpu-bw-vote-v2-9-4deb87be2498@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241119-topic-sm8x50-gpu-bw-vote-v2-9-4deb87be2498@linaro.org>
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

On Tue, Nov 19, 2024 at 06:56:44PM +0100, Neil Armstrong wrote:
> Now all the DDR bandwidth voting via the GPU Management Unit (GMU)
> is in place, declare the Bus Control Modules (BCMs) and the
> corresponding parameters in the GPU info struct and add the
> GMU_BW_VOTE feature bit to enable it.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 26 ++++++++++++++++++++++++--
>  1 file changed, 24 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
