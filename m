Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7D485A6A6
	for <lists+freedreno@lfdr.de>; Mon, 19 Feb 2024 15:57:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE2EE10E39D;
	Mon, 19 Feb 2024 14:57:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ScV4WooM";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com
 [209.85.128.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0988710E39D
 for <freedreno@lists.freedesktop.org>; Mon, 19 Feb 2024 14:57:35 +0000 (UTC)
Received: by mail-yw1-f171.google.com with SMTP id
 00721157ae682-607dec82853so38364197b3.3
 for <freedreno@lists.freedesktop.org>; Mon, 19 Feb 2024 06:57:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708354654; x=1708959454; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Szw+QTMnTAcQAZlNeYyyrJj6KbWZ+5DPKy/5tGrWbDo=;
 b=ScV4WooM83ZSMZVq3ii3kVK/JRFWOZ/80EQ/r1XAtrEOiiqO2hVgy1ldLZgYlaAfLQ
 67ABt8Ox/zJlvLLdm825X6tV1NYFIY6K3i775Mk+AOb/oksMsNLQpBkW6Qj+D2wfAvBk
 kDmQTOsjrfHJRcbs1IyjNPHguWBPU33k4Ie34GtrZhdNb5gGmxiDeRj5OCvFCRqTIoas
 oAOAQOGpGeQRDkid8bOPxYWkSWkYBG+PtGUAKEkK/Xggt7tbZOyFDt8vRIzNQvvo+737
 FJ4xm1XMB0VubSrJLjalWAJDvljiAW6YgCOzsmU1ciFPl5MP/p3Cy1IKb4fqFiW64mKC
 enbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708354654; x=1708959454;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Szw+QTMnTAcQAZlNeYyyrJj6KbWZ+5DPKy/5tGrWbDo=;
 b=DdfrXpphWu1FrpU8+3lMIk4Ff1FDmODBBG8LiE7x8TeghwQmBsS73K7WrmzuBfG3PD
 SIpia0pOaeftcFuCF7RYvfxasYZErpuiAB0TGeg9zSdXR0IIIAvXXTZAs8XYLwMlsmjA
 TlwJgm+AJTZMF2Q17fP602OB95nnoa6RsgHa72Jb398UyyhWkEak26NxUW3uKfOaiPzg
 dAdzZpKbN2wCwNJQ8s6xJS8jdwWNjEnGM3dvKhATJcQyarrFa7RSZdYQ1E6AQ3g88zcP
 T1fiwOsUGAXjK2TbL/ZHLLdQ15TdYa3JIjaltNmq2GMTjKgFqo3CJtX5Y71HArfIGdsL
 Z0PQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXu5jNwdDqCqcNeULTDM2QDYVSlxJSo5I4fjdqFidv/x5f0/2KpwmrSFRq4M2+xP8cF6Byai2HaUjD26h0sqAzKmLCoTWO0jhONUW5s+273
X-Gm-Message-State: AOJu0YwaZG2xRGv2t71un1+yoOa5V6TaL4aFyHTJuo2Z9aSK7eaDwAX4
 1/5nC8OacnMtKBBp8Fr+2YhtZencM94ZgX6k6ZAlJqQ54e8hiv8r5IQ/rhluPtnvp6sAoqLexBL
 wpoHonn+ZKthYM9XuprB4FlsQ5HLJpIR8GvqTpA==
X-Google-Smtp-Source: AGHT+IFwS+iE/0NQYgsx7qVKwDMppWGjVew2/XzNi/ojh9QbxDe0oOmgCSu0UPBrXtjFjsGyUMyo5ZWdgudhKw5Ujrs=
X-Received: by 2002:a81:490e:0:b0:608:ba5:729d with SMTP id
 w14-20020a81490e000000b006080ba5729dmr6119664ywa.19.1708354653839; Mon, 19
 Feb 2024 06:57:33 -0800 (PST)
MIME-Version: 1.0
References: <20240219-topic-rb1_gpu-v1-0-d260fa854707@linaro.org>
 <20240219-topic-rb1_gpu-v1-7-d260fa854707@linaro.org>
In-Reply-To: <20240219-topic-rb1_gpu-v1-7-d260fa854707@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 19 Feb 2024 16:57:23 +0200
Message-ID: <CAA8EJprpZxCV-3xkE0OuGg4jHrHcb=EPKCi_wSy5viP7jVwPvg@mail.gmail.com>
Subject: Re: [PATCH 7/8] arm64: dts: qcom: qcm2290: Add GPU nodes
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
> Describe the GPU hardware on the QCM2290.
>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/qcm2290.dtsi | 154 ++++++++++++++++++++++++++++++++++
>  1 file changed, 154 insertions(+)
>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
