Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2339FA34B01
	for <lists+freedreno@lfdr.de>; Thu, 13 Feb 2025 17:57:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5CA210EB42;
	Thu, 13 Feb 2025 16:57:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Mzdu27Zr";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FA8C10EB42
 for <freedreno@lists.freedesktop.org>; Thu, 13 Feb 2025 16:57:40 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-30761be8fa8so12352861fa.2
 for <freedreno@lists.freedesktop.org>; Thu, 13 Feb 2025 08:57:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739465858; x=1740070658; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=6DncLcX9aKkMb7TYzbSn7LrwA/nLBwK9XSdK3BMFQDQ=;
 b=Mzdu27ZrWH92HBFqDnep+0/xRC8qWPw7hTZ3FZyqcWSsdvzZGDkAkhjN2EgtYnRI/L
 JoHhd7CIdu1T4FHWVQk762/kjg/e4qXDj8fGqB1D+sdgmZNQNrkChfkNTVBTbtOjwm9F
 ZEiCfANuCHNA6dICqW1MuRQEJMUlcRCkRJf2YfgY/riu/OmKlO5oh7OQjDmVE2k8PeoG
 xdEE8wbjA/xJffOgw+TLTA6zfRKarxTISTH7kh2AdTsvPhJKWae2vhf6gpPQbfGrLDaa
 pxDKfM+tZXNdxv/pieqJErdScTu8XTfFCvojX7FiIjJCmsYP6+Amd5s/wmCh8cSnm+UP
 NBwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739465858; x=1740070658;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6DncLcX9aKkMb7TYzbSn7LrwA/nLBwK9XSdK3BMFQDQ=;
 b=EQL9h9am5OU7/4KzZFs7RGSmjiMwNiyG/SKyqQig5ougCT1Kz0G4+9G2PdWtEVt6VY
 4IpfjIojY3SuL91w0sGbbzLjjGbRvzHKrdnvhyaepzt0IWcHJI9iBqqCNeK6fYnwi/Ba
 7ewv6iCE8XgYWsx2ehaO9sC6g4y/h1p/HrKf4q6wfcO9QX9hgYqx3E9rSxYd3MR9Mh5c
 McEzTuR5gK6wJFx4NiqdUNBPZS5SpJa4RcGlE0W+/Dsh/3Ep2VeApGswH6xyivpcjWmt
 y7GA+Rl3hnI3Sby7+7DU0fR3x/HRRraCCKNAM2JEym/DBMNPHdRa+kRNgXh9O3zElK2a
 gbRQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVuTrsQGrLmVUsh+sYxhRM4Kh14lODAM12ravISVpokxPBlNqv9VcJvRMoWhH7zYAH2QdEHtd4wXp4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw1azT0u0THefRU49OFvQJnQoDBGv54K/33m7V0ce/dOTmwFLJy
 RzYmi/yAQmCZsUkPgQHlvwEOAGwysbLgxVGm1GaFRYzqFC61lgiYMyUg2GMmMBw=
X-Gm-Gg: ASbGncva+1udqVZa/2yvPtgG8jGgMMx7QnjvQLsZMCk6mY/mWApq+fEnmOlGT+zfGWG
 cpW/BFWRng4LJ4PDAYFVNdkoSEjFln8rEPlcyOlLlh8foQUeRhWjH9XLtqO5uve2gmS4DqXonlC
 m1CHk5i0jKEk7JaMMGA5iMi5qrmL8C2rXBXTLMVwmn/WaKvHGVJWFFD+Vyt2EtpPkMdasbtnqxE
 TSSoPAjRulOOAkyZhTSzH1eTwbRvt7xBeeizss17qLd03HpbpipwozHqJegPrFAWhJINTidJ5WX
 8P3Tozr8fBKV9/52dcbl78Y5XowV4nXQdJQIF0VqgyCAz+49IfanD6/AhbQ3csEb41P8Vp4=
X-Google-Smtp-Source: AGHT+IGmG7vAzEnhXHlQo3207L4CmELRiyNhJ3wUUEyMyFbBXvRHz97NRmkBrfrhecbVrZ+I7yOf1Q==
X-Received: by 2002:a05:651c:4108:b0:309:bc3:3a56 with SMTP id
 38308e7fff4ca-309148017bdmr6741931fa.0.1739465858543; 
 Thu, 13 Feb 2025 08:57:38 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30910276efasm2467321fa.85.2025.02.13.08.57.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2025 08:57:37 -0800 (PST)
Date: Thu, 13 Feb 2025 18:57:34 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Jie Zhang <quic_jiezh@quicinc.com>
Subject: Re: [PATCH 5/5] arm64: dts: qcom: qcs8300-ride: Enable Adreno 623 GPU
Message-ID: <gberjl2wv5tafnemlagidyrulhiqtfwri254swv7zoc22dnzns@2obwq2rzcnap>
References: <20250213-a623-gpu-support-v1-0-993c65c39fd2@quicinc.com>
 <20250213-a623-gpu-support-v1-5-993c65c39fd2@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250213-a623-gpu-support-v1-5-993c65c39fd2@quicinc.com>
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

On Thu, Feb 13, 2025 at 09:40:10PM +0530, Akhil P Oommen wrote:
> From: Jie Zhang <quic_jiezh@quicinc.com>
> 
> Enable GPU for qcs8300-ride platform and provide path for zap
> shader.
> 
> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
