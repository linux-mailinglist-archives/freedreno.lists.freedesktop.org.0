Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA424851531
	for <lists+freedreno@lfdr.de>; Mon, 12 Feb 2024 14:32:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A56CE10EA17;
	Mon, 12 Feb 2024 13:32:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="p1UKQuQ5";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com
 [209.85.219.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8DB410EA17
 for <freedreno@lists.freedesktop.org>; Mon, 12 Feb 2024 13:32:24 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id
 3f1490d57ef6-dc6d8bd612dso3059420276.1
 for <freedreno@lists.freedesktop.org>; Mon, 12 Feb 2024 05:32:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707744743; x=1708349543; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Cc0i1kM3GFsjytyQWwKzSBYGY5dJXRRO6XelaSiPAvw=;
 b=p1UKQuQ5X2/XlJE80dUJ7tFTru5q5SPFOTWSHMevHaIpDLpze/8phf/nrPDdWEuU4l
 6MFy4qvPtv7frUvwQs23j6hxDEsZOEcFOnwFzLjB7C/zFXRuwAUUDfMfLQyd8TfzSecj
 84D9w/mTaMCFgXmD1GYo66XJ3xLFd4uSA865zFOhtBhHcoeFcGusVuxk09JR/ziiIcjK
 8GsLO/IMDkqAzil/+PM9jNtUouWHEcwU9H5sML/bWHX05AzSYqaOhFskZFpMFV4xmFVq
 ZH+6mIunejN89ZSpdDcXUaca97WHr+VrZXti+/JZC75pL8qoG4ghd2kvwT5NpDFvNe6z
 geJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707744743; x=1708349543;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Cc0i1kM3GFsjytyQWwKzSBYGY5dJXRRO6XelaSiPAvw=;
 b=OXwQjNkCFSWo/xtE40pH19WeTELLE+IMW508MV94XatbXFTHbdG/7QLyVCtfvxnwBj
 Ntk4vo8kOcHKvTunsCfkU1k9440owTELno8Qm/SYaa72CFXmGtdZ0p96sMEgW5g8Kpny
 GD9EvykbMCcW7pgnmPaL++HIi9Fsh+4zhqDCFjkmrmP8nLlSEhEG4L56ubopHUUUAKt3
 DT8JRC8Rbr7rMKXVdO5GrgTUxZHFXfkFtyozE39WhNyHqz7oojWED6iB4BpkLcHi25wo
 I2LVKY1W53yy0rTrYoDaE53cmy9Gnr8pmjkFSREyEQUX3vcXv34HM8772z5FnimZ/lCh
 ZEMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXIYpcjAfbfSTBaQLKcbq1lVya0T0PDAzOvgxbzisFYmFlrTUYTMjVzcyOeEStKAEjdka7zMu95GUM6nzkg08YgEIgUtEA1JaKyBPazK5ck
X-Gm-Message-State: AOJu0Yzg7CihkYbYTEkHIY3/hPpDcliC5mG6K/uSlXi1tAC2p2NhVp8L
 iXoa8jwXCy5VhZkaD67eOnF0mGEe4lQUX2vvAnDgIiGKqMbpaB8+6SKRtclLahvPIXWl/igem3a
 E1QRD5z6huO+8gUmT0tS2YT+Tej9RuMDIMdycZQ==
X-Google-Smtp-Source: AGHT+IHrimlujObx0gy/3DfQFabszO/ewn4clRRIqfcAPZot0WCgYdNU8XudKJCEXiqOZqbCse/xPRfzJJEpg6oz5Yc=
X-Received: by 2002:a25:b117:0:b0:dc7:4439:d14d with SMTP id
 g23-20020a25b117000000b00dc74439d14dmr5093350ybj.54.1707744743273; Mon, 12
 Feb 2024 05:32:23 -0800 (PST)
MIME-Version: 1.0
References: <20240212-topic-sm8650-gpu-v1-0-708a40b747b5@linaro.org>
 <20240212-topic-sm8650-gpu-v1-5-708a40b747b5@linaro.org>
In-Reply-To: <20240212-topic-sm8650-gpu-v1-5-708a40b747b5@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 12 Feb 2024 15:32:12 +0200
Message-ID: <CAA8EJpryCXUxs69ockt0TN4LOuBB-4dZkLYHUZyN1Uq0isMjYg@mail.gmail.com>
Subject: Re: [PATCH 5/5] arm64: dts: qcom: sm8650-qrd: enable GPU
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 iommu@lists.linux.dev
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

On Mon, 12 Feb 2024 at 12:37, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> Add path of the GPU firmware for the SM8650-QRD board
>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8650-qrd.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
> index 8515498553bf..7151f3dc67c4 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
> @@ -525,6 +525,14 @@ &ipa {
>         status = "okay";
>  };
>
> +&gpu {
> +       status = "okay";
> +
> +       zap-shader {
> +               firmware-name = "qcom/sm8650/gen70900_zap.mbn";

But why? For sm8450 / sm8550 we had "a730_zap.mbn" and "a740_zap.mbn"

> +       };
> +};
> +
>  &mdss {
>         status = "okay";
>  };
>
> --
> 2.34.1
>


-- 
With best wishes
Dmitry
