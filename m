Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C1CA56048
	for <lists+freedreno@lfdr.de>; Fri,  7 Mar 2025 06:49:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1BC610EAD7;
	Fri,  7 Mar 2025 05:49:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="gtX6yhjg";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B018F10EADA
 for <freedreno@lists.freedesktop.org>; Fri,  7 Mar 2025 05:49:03 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-30615661f98so14774971fa.2
 for <freedreno@lists.freedesktop.org>; Thu, 06 Mar 2025 21:49:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741326542; x=1741931342; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ddZoIefzqan5unLa1d6QbkepNMobkeXSFMsHFbEyBPg=;
 b=gtX6yhjgWhZMYMNGSSsNsFFP6h+FLbwj+qenTvI7EbBKFmUqV+fWdBtX9a9BzWIuor
 3/n3pafg9M2YIwVCw1LdlggGYbsBNa7trBKoFz0rpFNMFvwi0br8PXCh5PaZplteWTAr
 UGFLzTK/BYGhVBo+I9mKfn4xAJxyhmfDJL9atC05CphznEe+Sb3pPasj4gp6tGwRGXkN
 PpELp/dG6iIQ+JyqFwMYWN4cQkfaUqbvLIlmHEN/JrH4Xz5ogdJjQ3mOun6MZhRjrF1R
 ONuHQdbrkeZfeH3McF8S65H8ggQYClt//w0Em5jDCtPZB19oSrTAkRIpVdTdaCW5wiCC
 Knig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741326542; x=1741931342;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ddZoIefzqan5unLa1d6QbkepNMobkeXSFMsHFbEyBPg=;
 b=BohutBfDMx1Qu0zvtTVriRR334SfP4gOUGfU6a0VheZICRZcsyaXHTf9dY4tzQCUIJ
 4YLpn1TrgmWmzblx6yRqFN656yNht9bmIpE8US7E+Qcbddz598F0V5RjmwDv2YULeQgf
 y6Tev98Rrq0aBkkyHgQBYfPJJbSA9ONVUod10V1fqlHoOIfKEFznT1H7bhZSNpWe7jA4
 UyLFjxq/mlatZgY0WQPDDqIM0cDlOGqQC7o5GE22rt0qvWXO0ZTqW8dXGRkMQCFQkbe6
 xC1OH+3d3yLnGWV1XolC9HIZOZAKT8B6GmDy1teRfLfLbVngeSg4RMjxVrdjAtAn6YlK
 zTKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW65Cn8wN18NSr/SI2IxsvJZ9mOLewhp2dNYAF1SjV3nt+1ff78qnva8q4XAnKRx0Y/V7Ae0eS6zpM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyu3yMEUHehmjQZqo+y1+poP36aVwWyr+lIAKE5VwBWu1eV6xGa
 ay4hNafE4DIFbABNcbQeEobNHWCWQVpy3lCftuMDTy29lhX6gNgRIlRXIfB3ALU=
X-Gm-Gg: ASbGncvw24G2EXMojqg9iJR+t8vSQLbq+iIUwjaCNoUPaBbPRMA3T9pIdfWDSTk90Pa
 BBYgfdLaPMIgnupZLHPeI1ibWpei2UQ+ePwCi0+glyCoDf8SRKY5p4dsONUddesqDbzWFGlmoOM
 ja0I+6usntD3sh9R4EqhgpLhchAYUsr5F9mnFJciEXndp3p22cN2ywdFj6VIh557MUXJNDcMHFy
 OLng+HtIfbQVBO8wyKGtuv9+Z+QOKHswQmd/z9AXRWEeqEwcf4q2GADSyQ9JPvlUvGjYLHKq7ep
 j+5/8tF06M5gcUfHS8pnmyu8UO1BXOlu5lPBNAp5rkZXoJfoGqL/JeQ1boHewxPX27NaXnIQS30
 GHRD7YQCVnzt01XqhGo1Su0HA
X-Google-Smtp-Source: AGHT+IEQXgwPTN0zWE14o/eWd+esiKQ+JOKkgZz1V9e0jKN/Xjh/s0kS262qvqbdXkWzD17f+19+eQ==
X-Received: by 2002:a2e:b88b:0:b0:30b:cceb:1e9a with SMTP id
 38308e7fff4ca-30bf451104amr5734371fa.14.1741326541966; 
 Thu, 06 Mar 2025 21:49:01 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30be98ec3f5sm4209511fa.28.2025.03.06.21.48.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Mar 2025 21:49:00 -0800 (PST)
Date: Fri, 7 Mar 2025 07:48:58 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Robert Foss <rfoss@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Wesley Cheng <quic_wcheng@quicinc.com>,
 Christian Marangi <ansuelsmth@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>,
 Rohit Agarwal <quic_rohiagar@quicinc.com>, 
 Kyle Deng <quic_chunkaid@quicinc.com>, Vinod Koul <vkoul@kernel.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, linux-arm-msm@vger.kernel.org,
 iommu@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-usb@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 08/11] arm64: dts: qcom: sc8180x: Rename AOSS_QMP to
 power-management
Message-ID: <6fqpulpczqnzabdnpckd2rtrcdhxryydhkuou7vdhmsftquckt@wzuoxvhyep5d>
References: <20250306-topic-dt_bindings_fixups-v1-0-0c84aceb0ef9@oss.qualcomm.com>
 <20250306-topic-dt_bindings_fixups-v1-8-0c84aceb0ef9@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250306-topic-dt_bindings_fixups-v1-8-0c84aceb0ef9@oss.qualcomm.com>
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

On Thu, Mar 06, 2025 at 07:11:20PM +0100, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The node is currently named power-controller, which requires the device
> underneath is a power domain provider. Rename it to align with other
> SoCs and resolve this sort of warnings:
> 
> power-controller@c310000: '#power-domain-cells' is a required property
> 
> Fixes: 8575f197b077 ("arm64: dts: qcom: Introduce the SC8180x platform")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sc8180x.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
