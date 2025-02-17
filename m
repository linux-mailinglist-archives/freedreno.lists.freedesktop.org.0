Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1887A38BFA
	for <lists+freedreno@lfdr.de>; Mon, 17 Feb 2025 20:08:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4029910E009;
	Mon, 17 Feb 2025 19:07:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Vi51V+ky";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 969F810E009
 for <freedreno@lists.freedesktop.org>; Mon, 17 Feb 2025 19:07:51 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-30a36eecb9dso9191581fa.2
 for <freedreno@lists.freedesktop.org>; Mon, 17 Feb 2025 11:07:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739819270; x=1740424070; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=9ObUne2yQMezeKiKaLoIvFCZpEHW3DUQ78CPgFXgb8A=;
 b=Vi51V+kycAm7oIDoFIpX1BulShUd9oAAHVm3hW+SPAIqZCVD5pwmjOaKAR7wNMPH0Z
 +k2kEiOAgt7TBJgnyfu3hfR3rC6g27qvkGwU/pW9kq/luKbtmDlKtetv5SEShDzpNScL
 jMh7XVVHD7IrCQieYnUBS+uheei9dAfn72DdqhQ43p5TyXv+PClC/ARLNZvbMuBWXHts
 JqoPuyb5cscqQjkCqFCLGHkaq7OsmKF2uS76AdJewXJKHLJRiA7oLKhmOAIFSCdsYYrd
 8d015s0rqN//HTjYy5mymhXPPKSuowFbOqKKcuQkhdt7fO2rSjAdwJZZuiKOXlSQZS2/
 FUmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739819270; x=1740424070;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9ObUne2yQMezeKiKaLoIvFCZpEHW3DUQ78CPgFXgb8A=;
 b=dHMHuo1PsX1rlVtUCQuxgnaYpr8Wgj8hEEU8Q6Rm0LUzgpSoP2RMMdZYTNzrmJ07ZV
 nUkso17sZGIOmNbjsniFDN6dt8bSQCtwTTDX2PzXm6RFPdM030xWH2FWJv7ry3RYrdBD
 Cbg/MTNoYoqw2IzLycc7ofP3LmJfXSvuD2whkzW6c/ViX/h6AFrNW+RAM/ira0du0P0+
 p3QmdZJHuCPG8jaBnSzXyl2JV5i4dDorgtBIZsK/3zkBJyeLux2mRX6+jHem2yb491Hv
 rRl+/b34CYkMhDtisZJpJ3QSvhfR4wbi8rdXVMsDTlcAMNiS4esrN2UwFaQfuAyFE4WG
 DWUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXhqipZXm75dzSEv3533Qu1zHDSAeGQtt+VZ+e3ky0VAAS7XJG6gn+PxCU1Q0AmzVR718HDFKYHzDA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx3j2LXfSR8vY9s5q8MKaFSsOiteNto6nY+XU1OObh1AGCLZeb1
 MwE7Sz+NpN6tA8/veiFVHgImcrkIzR1kQsjimvxdA9GHLrNJIdjvjFx1gKLjgRs=
X-Gm-Gg: ASbGncvuyooH7TIZFtSDPkxeG7hh4SYKr427BFkKJmoLZV2s0NwO1rOYjqXD8vBt8Mb
 F4dfrYSMNpNBzt92cxBf6SD7xmgVSKJsTDF1DHV4TgSOkuLoGvED+jOIcO2jpw5T9hVHTXyTcfq
 Ie8ICMoub0XjOG5TeEbyF0sQqNnyEtsI0hr6Hqr8Ti8FJ9bNn0xxO6yDYM3ziQAaB7omzOeMW1p
 Z3VPn9k5QKGBF3YLq8TfkGDR2O9bOp7SkFvXGUC97M4mTNpM9but7LZ8/0x2Krt2GWK8yVlSkmo
 Gt/ASAgTaD7wkqRP+gkdLcloStjbR5YTE5Uyw05qmy38Z7LzjVlsbSBRQrDC1ul/QzcB+R4=
X-Google-Smtp-Source: AGHT+IG9DynPxWNwdOmU6ii3AvcgWu++/3DPvh1LUYd7jp9CBTvIMdEBiRwbV324OAhQ4qab/et7NQ==
X-Received: by 2002:a05:6512:308b:b0:545:25c6:d6f5 with SMTP id
 2adb3069b0e04-5452fe96673mr2812097e87.53.1739819269896; 
 Mon, 17 Feb 2025 11:07:49 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5461ee8341fsm612141e87.133.2025.02.17.11.07.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 11:07:48 -0800 (PST)
Date: Mon, 17 Feb 2025 21:07:46 +0200
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
Subject: Re: [PATCH v2 13/16] drm/msm/dpu: Add support for SM8750
Message-ID: <qfbynkd3d5uqlzcgvcsfoi3muoij4ap3kkkwug5yd3ggxbhiic@6epod27ux5ai>
References: <20250217-b4-sm8750-display-v2-0-d201dcdda6a4@linaro.org>
 <20250217-b4-sm8750-display-v2-13-d201dcdda6a4@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250217-b4-sm8750-display-v2-13-d201dcdda6a4@linaro.org>
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

On Mon, Feb 17, 2025 at 05:41:34PM +0100, Krzysztof Kozlowski wrote:
> Add DPU version v12.0 support for the Qualcomm SM8750 platform.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes in v2:
> 1. Add CDM
> ---
>  .../drm/msm/disp/dpu1/catalog/dpu_12_0_sm8750.h    | 496 +++++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |  29 ++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
>  4 files changed, 527 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
