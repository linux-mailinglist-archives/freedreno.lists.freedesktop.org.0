Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5804FA38BD3
	for <lists+freedreno@lfdr.de>; Mon, 17 Feb 2025 20:01:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BA6710E5AD;
	Mon, 17 Feb 2025 19:01:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="vv1wEtxE";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3F4710E5B3
 for <freedreno@lists.freedesktop.org>; Mon, 17 Feb 2025 19:01:17 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-30a2f240156so12717931fa.3
 for <freedreno@lists.freedesktop.org>; Mon, 17 Feb 2025 11:01:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739818876; x=1740423676; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=3KVpMc6HL6H0IbUiBn0TVnYFjN3Gop2XIWiyOAEOilM=;
 b=vv1wEtxEGfglTUYKBg4ZTJBrZU2DhHSh2YGHktviOrIfo4bp4W9hYnahxyNUcLOwh8
 PePCn9EeRKX2fRp1jLdp4JWrhGmv/GEd2+eLBPYePstJRF5x8NCNtHSW+S/rR8t9GVnR
 IrYgivbnRwCwZF0YhiKPPFuHOQDOMtx2akwPCkZC5Q5J/GTUYEvQVbl+L+0QB6GoWHYP
 GIPmDWqZXZ16jcB8eleKEJqOB4hv2uI8CeUY2R1kmsafxR0LiNKQwhk+lga/QTMJaeUt
 NLzJ8Lwk5Um9VwMzZ1Y+Ujk6fHB1RL4/6S+77ZNp7llhKCOnetd1YDb4G59mPvXjVokw
 D27A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739818876; x=1740423676;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3KVpMc6HL6H0IbUiBn0TVnYFjN3Gop2XIWiyOAEOilM=;
 b=B3rsui4aVJSRqv8zlb0j82c1Y3hQH56FG/0/xNf/akUQUDYKAhV/cYhPbrxpMc9U9T
 tQum2VNX2i8nfOqQt3ZwwD9PcAvRqUjarM6Jx+Qt+i1p9x7bJyet5qA54jCjOJy23GSP
 NJNZVEuqctncjsJ2z2UVXCoBBReTjsJbdxuL/MSbisUNN8/izMrXKDf6e4r2bclGWdWv
 g8NFDWIAQCRwdPVUn/Nx400nSM6sglmX0h/l0plt38c3fDDI83CNSSnn33fTnsaGXQcG
 5MLM2vJfVmtoIiEZ8j6LtUPHLIg5HDVYcZTfQdCKHiQVz2rXUuIBFOGDrTPBFHJn3z5V
 n1dQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxNIlwl0zCQkBzUjMAgIlvAAHGHjRplsbO/GXL62zK/aIEGP/KQ5I27YAO5o0KtSjb0Qh8btfamEk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzYyGnKUeg9vOE7ZOhpy09KIYatyjkj+RO8rIVn7dg4uCRis+n2
 zEdcL7Zlt0hM9g8iuE2luuNM4lexZzF45c74Dl/8DFUqAwMbeSLDJ2GKQU9+9ho=
X-Gm-Gg: ASbGncuOb3NqR3ql+c28KmggrF2YhrNd3l3j/FsIfq8zkmmRQserxkHBo4+TsssPEeb
 fZHl6ggjwK8E0mKy58Gg57jSEdhEuyPAAzByMSwLmB7Cu/ZZTnJHrsZvQB4rX1R6tH7D4mOLSgE
 ZyZolV5Y58sIRRMo4KT4+eSnq3ugIxJB2AEp2vLWKq0IxGRcmlOdHo2v5Z4rO0A0oTvoDjjugB4
 x5NHhnG9rvBYzAL/mThIy6U9kRmLSD/gbmoLuCG1RBDQkriROsm4az/cI3nMRrzeLAoudlayQ4T
 19MSdrXTVx8Xg2ujadBV5tYCIunp2ButAox0z8P0eiWAH1o2+YswDegiXJq4brlK/exyoY8=
X-Google-Smtp-Source: AGHT+IHOqzXihtG/q/MOUu/ObVGRxR4vcEqAKB3UjZpWusxSGj7tDYpn5jPIEX0hDh+XE6pxaNtc0Q==
X-Received: by 2002:a2e:8895:0:b0:300:33b1:f0cc with SMTP id
 38308e7fff4ca-30927afef0dmr28520491fa.34.1739818875993; 
 Mon, 17 Feb 2025 11:01:15 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30a27206f15sm7247121fa.61.2025.02.17.11.01.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 11:01:15 -0800 (PST)
Date: Mon, 17 Feb 2025 21:01:13 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v2 10/16] drm/msm/dpu: Add handling of LM_6 and LM_7 bits
 in pending flush mask
Message-ID: <fqmt5h24asj36odjx6bdgc5qjoeqwgpmrrsqq642ss6l3tsnmy@wh52uxkzudvv>
References: <20250217-b4-sm8750-display-v2-0-d201dcdda6a4@linaro.org>
 <20250217-b4-sm8750-display-v2-10-d201dcdda6a4@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250217-b4-sm8750-display-v2-10-d201dcdda6a4@linaro.org>
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

On Mon, Feb 17, 2025 at 05:41:31PM +0100, Krzysztof Kozlowski wrote:
> MDSS/MDP v12 comes with new bits in flush registers (e.g.
> MDP_CTL_0_FLUSH) for Layer Mixer 6 and 7.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
