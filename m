Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7378902C0
	for <lists+freedreno@lfdr.de>; Thu, 28 Mar 2024 16:12:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11F99112492;
	Thu, 28 Mar 2024 15:12:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Jz5kpA9F";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com
 [209.85.219.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02C6D112494
 for <freedreno@lists.freedesktop.org>; Thu, 28 Mar 2024 15:12:00 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id
 3f1490d57ef6-dcc73148611so1150424276.3
 for <freedreno@lists.freedesktop.org>; Thu, 28 Mar 2024 08:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711638720; x=1712243520; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=K1dRERqIwvawP6yvst+7RzsJv2Gfa3ZP4TWtYVKk144=;
 b=Jz5kpA9FRrkKjklfpwSRUxDVWECYHF9GCFpyoZkPM4tGBoOx49KrPQjS304wPUt9Zp
 4QSNLwgETOWYAVRtOluKQN7v/6l5UeI39l4VOE+yDjFa2QSUY4CjVHMpj0SHGkQPZYSG
 9rvjE3Skx37MqGaXudmYGDtf4iMuUkd8bYO3456kk9rnqfBkRv9rrbzI5fV0UcQO9HVv
 KEENt26AgdctUZD89huzMcg6vr3cElXGfFRZNgzCmq/5nCxm5Che64Fncda9ria6Mhtf
 aIBB3a8H1FHL0CsEkfcRIysU9Sk0g/Ym6UIeCC7SXYCKNWFYmN7E3CA5pcS6+y9MLlcD
 e9zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711638720; x=1712243520;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=K1dRERqIwvawP6yvst+7RzsJv2Gfa3ZP4TWtYVKk144=;
 b=r8NuP5QvimWsPYKN1JvyWvf3M8XFHHwopA7RQPWyyGEk/O/ZcAb7eR3z5INfeo4qTE
 Sl9yxMqnAFZDH1rV2ez0cl1a14ICg40bTQKiS7cyWuQ6aOJVwYjwEkrlyL/fXgcB5inr
 DOjWTixail2cPs3eyZeHwe5NaLwXKmMrHwFy817Gz9UJJkJg9ruGLAHqwKCzoKXfRgvE
 BVf7TUo0nuvhLIggPTrhFGXFE1q1h9pi+h/mjQp5qMpHsH3ZgRRKN8MpWhtYRO0c2QK1
 BAwjpTW2g8/ROXXwokb/1aDJBKqlgPMGipblTlDi9mAvORfiGLOW+ZbgcyUDWuRihZNG
 KuAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWlYDI3i95zDzEjgXw8NuscBAVqPDQvDqRwCokT3TSDAWDP4hqO2UOFQWX80Z4kUAMXYVxOgBg6EuF3o/335pQ/Tg1oTI1cLQ9pASiT+u0a
X-Gm-Message-State: AOJu0Yx5vYN+cFyrwakR2I7a0D50/NidmDWeAvqhzXhMNZe9RjSExj21
 Zi+jJd7b0AE89S4c5zCglYaP0e95NYN63I7EtzEQyiwZO23rutZpw2EBvoEPxYWEZqZCuaPZkdG
 xk+EbK8ylzg5lcVwO4mRAtcG5j+PPyI6KQR7cQw==
X-Google-Smtp-Source: AGHT+IGrkzP9Sxso9Vjo20YSLlSXYjup2Hg+RTtCFuuy76qY0UhZk+SCGzz1Uxer7GzjgHrcr7xJIaioiBDkEDXa2kE=
X-Received: by 2002:a25:db85:0:b0:dd1:7128:617b with SMTP id
 g127-20020a25db85000000b00dd17128617bmr3216871ybf.38.1711638719977; Thu, 28
 Mar 2024 08:11:59 -0700 (PDT)
MIME-Version: 1.0
References: <20240328-sm6350-dp-v1-0-215ca2b81c35@fairphone.com>
 <20240328-sm6350-dp-v1-3-215ca2b81c35@fairphone.com>
In-Reply-To: <20240328-sm6350-dp-v1-3-215ca2b81c35@fairphone.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 28 Mar 2024 17:11:49 +0200
Message-ID: <CAA8EJpp1XEh1CR8898HnStWizcgByREGk-2ae_Yr2xTvcrEbag@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm6350: Add DisplayPort controller
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Thu, 28 Mar 2024 at 11:43, Luca Weiss <luca.weiss@fairphone.com> wrote:
>
> Add the node for the DisplayPort controller found on the SM6350 SoC.
>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/sm6350.dtsi | 88 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 88 insertions(+)
>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
