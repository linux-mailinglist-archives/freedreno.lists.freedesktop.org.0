Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 847DAA3D6CD
	for <lists+freedreno@lfdr.de>; Thu, 20 Feb 2025 11:33:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08FDB10E919;
	Thu, 20 Feb 2025 10:33:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Hq/HIYST";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A242210E395
 for <freedreno@lists.freedesktop.org>; Thu, 20 Feb 2025 10:33:35 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-54529e15643so1689725e87.1
 for <freedreno@lists.freedesktop.org>; Thu, 20 Feb 2025 02:33:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740047614; x=1740652414; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=nOULWVV8S2WJWFH7D0olvt+CcxnnRMsdjMYkB3pg9sU=;
 b=Hq/HIYSTAxqFd0/xVBeBEr+fqG3kGfp/gPi2r5PG5FobYJjLA0+SpQfLpazVm/N1wS
 UiJvCEKd1baODMqeEMjIHzdNKQqhRtZC0J5YjZVviq7pZwHrakFQwV2emwi9moEk2b65
 hFqiqN81pyx7QsFeK/J/0jukok0YmY/NW0wVTkvhWsmraFY+5QZfrRASqEGshjSfwJ4r
 wuuOVKqjeijC603QmAzh8UdTnoLdwdcwYnYo9uZ7wnNrNXICXLBExuFRcr56H3Il2fZ3
 v/eFg8Q/MHo4BwVDAbGeL3iEzhAAA+IGJxOfrWVrnVt73fSjCB0O1SqXlqaz1iEp7WX4
 6U9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740047614; x=1740652414;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nOULWVV8S2WJWFH7D0olvt+CcxnnRMsdjMYkB3pg9sU=;
 b=S1aOd2rIo+GxuiE5IwregQcWL2uQt0iV00vKmYlUDdQmsp1e7TgWl2qYGl5/5rSyCM
 lS0MbsdGR4EfcujjfRLwGrio8SLNNRqWsK7Qa1PuGXROIlohAtima948SkcfhchiXyli
 uVNo65kEprhPwB2o3zCfmgUolY7pVK8H7TpXFHsrg/0j/QZEzXlCeA6yQTSABPJBdt3C
 OFC18nN11XeKxxfsOs2mR5wdxcCydxkLoqL3zmrWdaDFr/EulYoFq6Fq0vqTxUHT3puT
 iribt5rBMTJvYVHnSyL9kv4mmyOvLLROX6sN1lc/Wam2sfRTAY+t3/iVj3RXfBdA8GXa
 SPRA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUI4JaE9b02BGkpBiKox8OoT1IRtpna/wZ7PztveFHi/jPHjev1EXh4j7xBKSMxiSg0n3FCePqJLZQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwWVnPiyjyoIzMF1D8Qh7zFNwqu/P8xQ520zcpaubVAjbIzB5K0
 bHc3x5XnzUphqlvbYoCBjmdvfTKOIjCsTUKoDTB9mbFDkjcxiXFJbLvfQahhfzc=
X-Gm-Gg: ASbGncuIN32Jrv89Jyas/rfl+28ulB25z13NkMm+/IMW5rJQO/aT6ia32d30eqyKcG+
 EYQFkwqV+jOtT7HyRP1iazCR5cK3MWrg9npc9EBLuT/wOVQrpaSN9cG3vMewcFzLW44x3HK/cEz
 c/0rMpapznjBrxy27vbHfn0Acy/3ZTp6mOUifFsHnFQCfbDlzzRKbJlhlg9LB9Xu9HHsylqx7a/
 lpP/u7D8jas1jQ1R/gV5pBkaVCW5m/hciQLk8ueu5kbYtbtEZPlRdJYsdyI3XdSQ1AfOt7x+DD1
 g43owO/iZ08YhWtApgzRRpxfyko4OY6JU+nLAdW3iaAL8SHP+9FauhG43pbfCQqVoSHjXBs=
X-Google-Smtp-Source: AGHT+IGUUcYwMWrswexilTub+9t7uGS/voZUkkMFCSEUbJmmonP/3ieTF/+EZ9nECI5YUhJLWrjddQ==
X-Received: by 2002:a05:6512:2387:b0:545:9e4:e823 with SMTP id
 2adb3069b0e04-546e58bacd7mr835355e87.16.1740047613925; 
 Thu, 20 Feb 2025 02:33:33 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54595e38064sm1632621e87.126.2025.02.20.02.33.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2025 02:33:32 -0800 (PST)
Date: Thu, 20 Feb 2025 12:33:31 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v2 4/5] dt-bindings: display/msm: dsi-controller-main:
 Document dual panel property
Message-ID: <grdadzunaabzg5jxpsiasgzbioy24tctlhhyxg6zwdkpv5vjwe@7k2di2myu4k6>
References: <20250220-dual-dsi-v2-0-6c0038d5a2ef@linaro.org>
 <20250220-dual-dsi-v2-4-6c0038d5a2ef@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250220-dual-dsi-v2-4-6c0038d5a2ef@linaro.org>
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

On Thu, Feb 20, 2025 at 06:07:55PM +0800, Jun Nie wrote:
> The DSI interface can be connected to a panel that has a dual DSI channel,
> or to two separate panels, each equipped with a single DSI channel. To
> prevent the DSC configuration for the dual panel setup from disrupting the
> current configuration of a single panel with a dual DSI channel, add a dual
> panel property to support the use of two panels.

Please use the terms from the standard. The "channel" is mostly used for
the "Virtual Channel" or the "logical channel".

Also I don't follow how DSC configuration for a dual panel setup can
disrupt current (?) configuration of a single panel.

> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  .../devicetree/bindings/display/msm/dsi-controller-main.yaml      | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> index ffbd1dc9470e2091b477b0c88392d81802119f48..e3f2eabde27609a66d6d81fafcb14e1bc014613c 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> @@ -88,9 +88,15 @@ properties:
>    qcom,dual-dsi-mode:
>      type: boolean
>      description: |
> -      Indicates if the DSI controller is driving a panel which needs
> +      Indicates if the DSI controller is driving display device which needs

Unrelated change

>        2 DSI links.
>  
> +  qcom,dual-panel:
> +    type: boolean
> +    description: |
> +      Indicates if the DSI controller is driving display device that composed
> +      with 2 independent panels and needs 2 DSI links.

How is tht different from qcom,dual-dsi-mode?

> +
>    qcom,master-dsi:
>      type: boolean
>      description: |
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
