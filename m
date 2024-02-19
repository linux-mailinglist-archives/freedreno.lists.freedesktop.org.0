Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 167CD85A657
	for <lists+freedreno@lfdr.de>; Mon, 19 Feb 2024 15:49:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA49410E0CB;
	Mon, 19 Feb 2024 14:49:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Ky7Q2zHl";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com
 [209.85.128.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85C7010E0CB
 for <freedreno@lists.freedesktop.org>; Mon, 19 Feb 2024 14:49:25 +0000 (UTC)
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-607fc3e69adso32580767b3.0
 for <freedreno@lists.freedesktop.org>; Mon, 19 Feb 2024 06:49:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708354164; x=1708958964; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=WJI1teD2wPawZOQzTgWhX+w1Ti/ZVP+Yv2CET7JvPGw=;
 b=Ky7Q2zHl+kJvnWuVwz0BkrbbnY2wqOLW9HiRGL1UgzMMwYLm1i7cAGyea1qI0vL77k
 1dEH+LJZIjQJBSsIvDB+/B4tjU4edFuaC7yfSkXFwIsDSASSMvrSV1PXrX+DWgAcOUWT
 J6K2GKzztwCSsBrngdtx6C6QTIrJVSdEORXVpVYFSOeUQeAgMnxjtfieE2HKOkLL0t5F
 U1Q6FTE3ai0kmzlTCXKmYp0z/EUB0p6a10fE6uz7yF5DoxoCZ7/OWawoxWr34WXSVvDl
 h5bPy3nSJuqLS+vgTMMAcvrpIQx4OBuEKzwvXKIOE2U+tpWuau8pzY5Sgt7N1zsLnH6b
 4y0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708354164; x=1708958964;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WJI1teD2wPawZOQzTgWhX+w1Ti/ZVP+Yv2CET7JvPGw=;
 b=CQS/1Pp2cpldwrSvAFhQ93R4p/xMAr6lzF5qBo/0VObpB57SNr0z86aiQPTIWXBhFO
 unej4QauxhwXVuQUcBwkFAkofTb4ZqEXWZoLjhLJ9iqH0TX2LKca4r6CsICrKs1nC2AI
 d7zK9CQG+9rGsWuEhm/iy6VgjMKH83SuFpiaT/7aL/5xqBddJO67Ra0Jqe7C36JrIObX
 ZfTcvov75TVsHJ9toDfThShk/ugl/JPtFlYusepc+Uf0gRvnE7TZcHzUpLt4KbE0Q39o
 Hgb+g+qxcPB3lxvELZvKP4Ov/o6m4DlZT0n/T6IReIXIE5C5T4xPJ//V2S+iIon6WFk6
 4Etg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWisYgCCn6RA5lPJKxDtOzFTdTj2OTqTrCmKhohVOGXcE9VVcwG36F3/P/WLitX6KTGxR8qel1TF3H1G+XdGwhuv7jx60mtH3LXghS5iUjs
X-Gm-Message-State: AOJu0YxIl6TFohqpZDsrB4a6nug2zwV7Xss+OmrLjik39wdNa2p4RlTi
 XKVRwlkodUE4bCLotoweBnQaJ2EdcwFAl6rq1Gi+CQiUrxABFGaZ3eJ8s+AYqmZVFGkVrVtlJlr
 CahK4owmTRoUNHj3AH8elqrKXOVlt7bFKWVvSyg==
X-Google-Smtp-Source: AGHT+IHr/IUKFhapXnOD7toFxlQf0Om4NTc3bUIZPM42rFzdOhQ5udZqS0lilrwVoRYH1x47luPm3EintARWerYH8fE=
X-Received: by 2002:a81:ad1d:0:b0:604:a47e:6e52 with SMTP id
 l29-20020a81ad1d000000b00604a47e6e52mr12358877ywh.32.1708354164616; Mon, 19
 Feb 2024 06:49:24 -0800 (PST)
MIME-Version: 1.0
References: <20240219-topic-rb1_gpu-v1-0-d260fa854707@linaro.org>
 <20240219-topic-rb1_gpu-v1-8-d260fa854707@linaro.org>
In-Reply-To: <20240219-topic-rb1_gpu-v1-8-d260fa854707@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 19 Feb 2024 16:49:13 +0200
Message-ID: <CAA8EJppPvXfkz=wVca8aFBhFaVUe9+OiVzcQUq7D8zPbK+T1FQ@mail.gmail.com>
Subject: Re: [PATCH 8/8] arm64: dts: qcom: qrb2210-rb1: Enable the GPU
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
> Enable the A702 GPU (also marketed as "3D accelerator by qcom [1], lol).

Is it not?

>
> [1] https://docs.qualcomm.com/bundle/publicresource/87-61720-1_REV_A_QUALCOMM_ROBOTICS_RB1_PLATFORM__QUALCOMM_QRB2210__PRODUCT_BRIEF.pdf
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>

With the exception of the commit message:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  arch/arm64/boot/dts/qcom/qrb2210-rb1.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)


-- 
With best wishes
Dmitry
