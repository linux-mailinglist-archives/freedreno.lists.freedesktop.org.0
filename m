Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97182A1D78E
	for <lists+freedreno@lfdr.de>; Mon, 27 Jan 2025 14:56:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51AEC10E523;
	Mon, 27 Jan 2025 13:56:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="lu3+qPzg";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9C2910E523
 for <freedreno@lists.freedesktop.org>; Mon, 27 Jan 2025 13:56:07 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-3043e84c687so38372271fa.1
 for <freedreno@lists.freedesktop.org>; Mon, 27 Jan 2025 05:56:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737986166; x=1738590966; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Wt4sS6zTyCweAZYH++LZePNO/qvVROY3D8Q5U1D/3eY=;
 b=lu3+qPzgjXB32Qkc6Z/u47cL3LSEVu564pDBZsprDBS+kVSDhtFScX1lN7BEBm+HDH
 mzaOsf9TGSTYXbR2gOMn7B4yCcwlnzH572eZwupiwJ6geUc4ONWgZvgRazdsFnO1j7gX
 k0/e8lc20Wkcv4tFUCu/JUAcucrMXjOOqUrAyNmsitWm6cCavCi8V/+na+M5TBL2NIZv
 BtlugT8kUE6faegDEMQWyy8iJoKc0WW0wlCQNDE4Ris86iEOenAP6Ny9ztLYpwylxROr
 zhwAUXizBvUtn5g5f1aITl1Qtcb7F84q+RuVPZ/D5Bb5WF6FLhSLJXR64OIOfUUDHJWJ
 VlLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737986166; x=1738590966;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Wt4sS6zTyCweAZYH++LZePNO/qvVROY3D8Q5U1D/3eY=;
 b=EG6LmAc0I9KVKUJ2AkyEJPSlsCdd0u9KXbBvMRrPXURNjd5lVpsrqeZxbpQOCYfIPn
 9rm9zU9wb1jyktrmVdGF3GyZ0CckLSt0vuaS1R1uKYmRX/5k/4gwzaToWz7GDNN/yaIY
 Kv8Gg14qOFoN37JCsX9ESWohmEm279Rlnhgq3GJUWnAX822YMjMTmYntU5WA3eMO4+sb
 wYZ5By9cZ+2wGWL9HpToEmWdeTOOsH+LsQDytKbajLcZE5xzu3T1P1o4PVs6apwshKYQ
 ewheVgk8DFf4UJ14HM/GwZNm2wt09W+2NjEj7+9/JpqJDNDNm+TWEdsoLwadXU7mY3R4
 BVbw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQy9mr/NnuHQ1bnuIR6oQosqhmiBFIUx7g3qyBmRfiwnLpdriZWElXnf4JdeCMzyiwlv+maARgKjQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzgz64LXCw0nkgECm8RrTFws5AWI7A9wd5QoJLIh5Y9SeZYLV0/
 4cpgJpV9x3gQkj6kHWSuo0fkGw8raWoYLFTNOcyGQbkPwg6vOdg9F7cdwMBfLWA=
X-Gm-Gg: ASbGnctgaRN1GH0fypZmfJjdAh9/zzo4pfXAtQySjFuHOV8wF8dKkKJe22gL8edkJx3
 W+k5n453mq+WelBl5PmRFuq8qUt9peb7Y/7gOO23Ukh2GCixgdPO92REWeOIVGLZ7h0Hk0LGOGG
 qjeN/wWZoNF9NwHVHMT5jbk2SDPByGwK1Y+Mb/1ydBuNw9mIpcEOEiL8RPu1ZByT4BGTKDidYeR
 lox+iQ5toj0sIMlie3KLP5rF8atXxbXXrbSOrSrbVaH0snRmS32gvoetbKsqHSjMVxk87qBW0ll
 8s4o1i2PEAuk7re4aiMoifJ72eWchNw3DJQEsgkMYvnlG8GIhGVSJSAQd4Qg
X-Google-Smtp-Source: AGHT+IEndS/LVqeUqSpxsvwA84LzRH+l+YBnVxcXQWp9YfcsB2fe5zmaDUUkUk95OVNxnfDlx/rsmw==
X-Received: by 2002:a05:651c:2104:b0:301:12:1ef3 with SMTP id
 38308e7fff4ca-3072ca5bc35mr153845421fa.4.1737986166078; 
 Mon, 27 Jan 2025 05:56:06 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3076bc49b5fsm14359241fa.101.2025.01.27.05.56.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jan 2025 05:56:05 -0800 (PST)
Date: Mon, 27 Jan 2025 15:56:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Krishna Manikandan <quic_mkrishn@quicinc.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: display/msm/dsi-phy: Add header with
 exposed clock IDs
Message-ID: <4vy6tjdvhkplly3uqqekdmz6brkcbac6pijrn6gdyz4x3hralr@meeugoua2ats>
References: <20250127132105.107138-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250127132105.107138-1-krzysztof.kozlowski@linaro.org>
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

On Mon, Jan 27, 2025 at 02:21:04PM +0100, Krzysztof Kozlowski wrote:
> DSI phys, from earliest (28 nm) up to newest (3 nm) generation, provide
> two clocks.  The respective clock ID is used by drivers and DTS, so it
> should be documented as explicit ABI.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Patch for Display tree, although with Ack from clock.
> ---
>  .../devicetree/bindings/display/msm/dsi-phy-common.yaml  | 2 ++
>  MAINTAINERS                                              | 1 +
>  include/dt-bindings/clock/qcom,dsi-phy-28nm.h            | 9 +++++++++
>  3 files changed, 12 insertions(+)
>  create mode 100644 include/dt-bindings/clock/qcom,dsi-phy-28nm.h
> 

> diff --git a/include/dt-bindings/clock/qcom,dsi-phy-28nm.h b/include/dt-bindings/clock/qcom,dsi-phy-28nm.h
> new file mode 100644
> index 000000000000..ab94d58377a1
> --- /dev/null
> +++ b/include/dt-bindings/clock/qcom,dsi-phy-28nm.h

I think this should be dt-bindings/phy/qcom,foo.h

Other than that LGTM

> @@ -0,0 +1,9 @@
> +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> +
> +#ifndef _DT_BINDINGS_CLK_QCOM_DSI_PHY_28NM_H
> +#define _DT_BINDINGS_CLK_QCOM_DSI_PHY_28NM_H
> +
> +#define DSI_BYTE_PLL_CLK		0
> +#define DSI_PIXEL_PLL_CLK		1
> +
> +#endif
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry
