Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B66887F25
	for <lists+freedreno@lfdr.de>; Sun, 24 Mar 2024 22:25:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1A2A10E21E;
	Sun, 24 Mar 2024 21:25:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="leCNZXUE";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com
 [209.85.167.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34EE210E220
 for <freedreno@lists.freedesktop.org>; Sun, 24 Mar 2024 21:25:03 +0000 (UTC)
Received: by mail-oi1-f174.google.com with SMTP id
 5614622812f47-3c390030af2so2833054b6e.3
 for <freedreno@lists.freedesktop.org>; Sun, 24 Mar 2024 14:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711315502; x=1711920302; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=JAn6z6C6kAQCNocTNhwJGXaT3ktUI5cvq1m2gw2cMlM=;
 b=leCNZXUEaAsdClriDswF3ele0Flz+50U6RUJ4yq2fLhZJp/i768t/i8aNwGj/xnwJ6
 7Ily4XIN80KoSzRdPRWN9PEx/hvhwWt4Y7e7FhEZR/XWdioEuBkmEv3kj4Hr5PIuazC6
 RfAd/3wwv/WBntvV8NAfQWdKIOKQ4o6jixdSZ2Jtwe/R8pFv1+k5AM0RSru9JlCBcsNA
 MZaWcgpd1ayB1kx36ky3AKq/rMwykEGT5rbihlGKCPnOQPfojVoyS010QKNsRUq7KuKM
 I6YCuHW1+k87psCMURKg+g4X6Vsg8+38dH+TuUfVnSRts04eXDXbeGHvkdEo7fahi3K7
 SpNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711315502; x=1711920302;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JAn6z6C6kAQCNocTNhwJGXaT3ktUI5cvq1m2gw2cMlM=;
 b=Lu5GNWQQR5sNFaRBXbDVnraY3g9EFHWjKBkGxb7TW7lVcwCQqlMKyMj3khAUdg02Tn
 zQJcd12EUs58BTb2d0+k0Yx5aO8ob3sEIaYfPIRbuFXO0iyHrYB6Lqg7VfrK5IvrkS1I
 vIILGVgA9mL17vTdhiajqUJLiiMpHVZ26s0mufZ1KVOUnIaf0oE8hEDEjv9nFgVA9uXO
 kjQogOkeSyK8c7ULz7lURs8t6Q3XxGb3YpXfEc2Zp2PkYKrc3+5tgBN5973aAeKUNjsu
 XEm5JBGju51vIdtLwuteq56ou0JR0oTQt55jLrNIT23U8LkHvH96AVnRxcKOz1upppFx
 VkXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXyXFMdiz0fFWvKNR2IdFDRB/K2PdoD3RTmGidDoDemg5YKzeu5EMvB1KG9Rk0lT2mNpHcJF2MZ0sQmzkFNa6t+SPcLbGl2DhzS5gsc/y7Z
X-Gm-Message-State: AOJu0YwwH4gDdJEnLX8T3FkOZz25PsJOi6PyZBU436IJ7sSaQA3vpg1g
 /FmSCJKEemd545FbvSPWJl7+FKOsgSWDVRPLfp+foqFsaZoY+dKYJdsWMWTZSIaY8WZaDsn7p5B
 QXdoL5MePbJASIxedal9ui7PT5CcmuzvfNZy2zw==
X-Google-Smtp-Source: AGHT+IFsASaAXYhy6wMEzFscwmoJiMkAf8XUTx8af2vr4btW+ENv9jYLPxo+baqJKEZ59gDPp1vL6Dvk7ZbPq+nVlgU=
X-Received: by 2002:a05:6808:2a43:b0:3c3:7edd:bf84 with SMTP id
 fa3-20020a0568082a4300b003c37eddbf84mr5754842oib.35.1711315501982; Sun, 24
 Mar 2024 14:25:01 -0700 (PDT)
MIME-Version: 1.0
References: <20240324-x1e80100-display-refactor-connector-v4-0-e0ebaea66a78@linaro.org>
 <20240324-x1e80100-display-refactor-connector-v4-1-e0ebaea66a78@linaro.org>
In-Reply-To: <20240324-x1e80100-display-refactor-connector-v4-1-e0ebaea66a78@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 24 Mar 2024 23:24:50 +0200
Message-ID: <CAA8EJppues54mPveOn7irCHYe+T4Fdv-=4ucLLpqq843NLBAfQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] drm/msm/dp: Add support for determining the eDP/DP
 mode from DT
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Johan Hovold <johan@kernel.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
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

On Sun, 24 Mar 2024 at 20:57, Abel Vesa <abel.vesa@linaro.org> wrote:
>
> Instead of relying on different compatibles for eDP and DP, lookup
> the panel node in devicetree to figure out the connector type and
> then pass on that information to the PHY. External DP doesn't have
> a panel described in DT, therefore, assume it's eDP if panel node
> is present.
>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 29 ++++++++++++++++++++++++++++-
>  1 file changed, 28 insertions(+), 1 deletion(-)


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
