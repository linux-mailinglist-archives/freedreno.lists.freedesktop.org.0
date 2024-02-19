Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A405D85A686
	for <lists+freedreno@lfdr.de>; Mon, 19 Feb 2024 15:54:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 211CE10E26E;
	Mon, 19 Feb 2024 14:54:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="GGwreiAy";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com
 [209.85.128.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F055310E37D
 for <freedreno@lists.freedesktop.org>; Mon, 19 Feb 2024 14:54:44 +0000 (UTC)
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-6084e809788so3197247b3.1
 for <freedreno@lists.freedesktop.org>; Mon, 19 Feb 2024 06:54:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708354484; x=1708959284; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/+Vf6X891RpEKNXrdBrteASyRB3a3/HliSNBQV8d1lo=;
 b=GGwreiAyUJWWwDl/pmeMKXAa26tg/Zb6joibQowkrL0x8wt+ACL2eguI0Ux+PYjzWS
 6a19iJ41849VeQtf+nO24XwvV3c6aNCzMEJjw3eY7n2Swr3CRRJ75SLtDF+PGabmDYKs
 ngI8qusT+6iJ1xjGEUOSMc5TW8ldFG67H9HIYcTk7DhSRh31DAjo7h6E7CYDKyk7y1jq
 COi9q+AnglOT83VfnbPBDQ61nQ1KlaDH3EmbgDItyPoyPg1jK+Klv5qJyKM5qBYbTl4m
 Pcg91pltGmObwMaluPOdLObZgpSZ44eme6MD9V2A0+QGGThzDiMgqYf31l/rZSFgQ1pq
 /ODw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708354484; x=1708959284;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/+Vf6X891RpEKNXrdBrteASyRB3a3/HliSNBQV8d1lo=;
 b=uUKQ+Fhg2KVMiW7QiBmfVXvKDZj9FntnhbHeWZx2tKBbprDjSuezK4GWEFqly0stzD
 unyVBXER82mbklbgDojd0hzzlX+62xKZOIDG8Wa0iAVF0WbBy1bNc0USpSa1rc0izITi
 b7HH6+fyxUx4RfC1xsH+beVC97CUlmhQQKnTzQ5lMvHdUbqlSYrvf+dtn4imqbb6gGf4
 QTJkUZ7iJ0xdToglRL+PS0k6FUShwJDYmQMsbAuL5I/VjFF8ip6g5xlm7WqM4XLke7Xx
 108ZC4WjdTHrezliAJQh1Wg1GzTxnu1VuKT4TqJ8Tz8cVeLUWCZYO7rhq1/3dxYWGMQF
 7Pzw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVocp7m9kF39fVo5V1DHfp399V7TVHNoHbOWe94bUKAg/QARt4ps93sNE2vbBAFLaXpC4xSdNLq/91wcJFDLxDqhkQiyJUHiZUCkc3cvGMe
X-Gm-Message-State: AOJu0Yyu7ar5ORVYY7TiT95U0ARWVpH/CHdgL31O/iHFXyBZYOfeAhR2
 JlADWkGimdR+DTePSWNwbBKvRncMtQ+m+x2iR7dkUY/YJGErs7qp61GJeHwi5l/ZUPwAIuS5Q9W
 2RihxZp+tcjRKSi8iyUcXHbYsZ6WNUdrBcu9/5g==
X-Google-Smtp-Source: AGHT+IHg7XEOTTrtpgQqphtP3Xw9sPuPWwJbqow3gZN5qRELJzU++tbN2bRulnySBEDH7nL4PxT+8aS1knEIIJLBbCc=
X-Received: by 2002:a81:a185:0:b0:608:59a5:4ad1 with SMTP id
 y127-20020a81a185000000b0060859a54ad1mr39629ywg.22.1708354483969; Mon, 19 Feb
 2024 06:54:43 -0800 (PST)
MIME-Version: 1.0
References: <20240219-topic-rb1_gpu-v1-0-d260fa854707@linaro.org>
 <20240219-topic-rb1_gpu-v1-4-d260fa854707@linaro.org>
In-Reply-To: <20240219-topic-rb1_gpu-v1-4-d260fa854707@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 19 Feb 2024 16:54:33 +0200
Message-ID: <CAA8EJpq46Wn+gWKL81_zMxyddUpJRuKHDrx=4Q2DvbwufmWHWA@mail.gmail.com>
Subject: Re: [PATCH 4/8] clk: qcom: Add QCM2290 GPU clock controller driver
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-kernel@lists.infradead.org, 
 iommu@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
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

On Mon, 19 Feb 2024 at 15:36, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> Add a driver for the GPU clock controller block found on the QCM2290 SoC.
>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  drivers/clk/qcom/Kconfig         |   9 +
>  drivers/clk/qcom/Makefile        |   1 +
>  drivers/clk/qcom/gpucc-qcm2290.c | 423 +++++++++++++++++++++++++++++++++++++++
>  3 files changed, 433 insertions(+)
>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
