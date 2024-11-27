Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8285E9DA96D
	for <lists+freedreno@lfdr.de>; Wed, 27 Nov 2024 14:56:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0D7C10E283;
	Wed, 27 Nov 2024 13:56:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="jOpQDzBl";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1BF310E283
 for <freedreno@lists.freedesktop.org>; Wed, 27 Nov 2024 13:56:06 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-53df1e0641fso610040e87.1
 for <freedreno@lists.freedesktop.org>; Wed, 27 Nov 2024 05:56:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732715765; x=1733320565; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=867OxvdZ+RR+pbVHkiA0WW9IzYzXbM7LHcyZ0FySfzQ=;
 b=jOpQDzBl/1w1aPdUCHw+8gwseld5ki0RCSGCaz7Ou+MZTvE1c78ZrwlkcIBJpiiNtT
 f2/Qzfm28rSGADTTWjQI5gjP768FCWFZitYOtHGXihcjqTkhMPu17+HEujtCvjHbMUR/
 vAKfxvOHU/hENDJWL4iA5UFO+1+uu5vpgdBG6N+3qcpjx6M/gw5YPq5+A6A/YOJfBTXy
 rMNZj3RgLb6BZTDYaVMGOw4T0Juvwmrs9BKAR6LvL9vqfrfgomYkQ/JuMOsaMXn9lxBh
 PC1iZgKfVNjSevcuR9g1HuOqaer+aYpqW5NyJmarwtiqZKTVaS5jLEq966cmNcpJ89tZ
 PJrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732715765; x=1733320565;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=867OxvdZ+RR+pbVHkiA0WW9IzYzXbM7LHcyZ0FySfzQ=;
 b=Cwq8mi2SlYc11GRcHJCqPpR0da46XR94VOFxO3lYA+0IWm9y8pH7xZyyj/6v41dp+W
 kxYmSdvF8Weclpsa8htFAn/KdpgyO8Ico2KS42d9Whf9JbCq1kkvRXG2fqMLUc6s3Bu0
 RrbVd/OY6kbOG/eMHDtG3SAL5Q3fnrFhYaef1fUK7HMlLVe/WRCHGL8C3Wtbso7JZnG/
 zQ/Jempeg4tN/2yYtC6KqiHbvyuTRldZNwozoDpvvZ3oRODSwkk9+2ufcAKslhXdnB/g
 3Kuxg39EPS2dE1+Btu61YCF9fJaE14fPLRvbuUx+ATZ64W/d0tD/PBYrCbGW0Q6D2sGK
 Xg6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSzwJ3fnSq02IilrxgVnKyjrLyx/aQpkDoMc2lMSksVpzmv/aStDZtJtAZGSlXHmk2ewYcknfdRPo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxv1n0vouHG8e+GGDAKiQWB3E2kmR97VR6BAKER6jewMDuZdxQl
 lFGSLNypl2Lk1LRKzyAZmLkU0lWtT34GKpGu6ZDPDX4JQTiNCKjicg8PH9pQHT4=
X-Gm-Gg: ASbGnctLXnmUbS876JD5UqnMypYFXfCNBDTn+QMbQZ7zvMYOrKXCKb/LtCyrykD0q49
 TjM6rDemiff53D299q9cChugvui022PX2bWQaeOeMPa3Y9MIvByqRllXm+KSDLAnhaeAGLfVdmm
 PbD3V2XlK0Hjw5/zGn3kIzizJqKRLlJ2Xit15THnygbOGGzagMhsuqI9woXZONIvfNUj+0kWMDc
 +vn4BM9rLQWM3mAAr/wIHDVliQx38x/fuxNZZpNOw77c+1RWnJbPwtR9meEeVOOFp+L/v3Lpwzo
 xZMZQe8DGz8IpSXiUD+HvzvJ43aqxA==
X-Google-Smtp-Source: AGHT+IFWOWbW0Kkqtz0JT9z7g4F2xU64RN/HauN+JR3aCNqtQMBX11GpWayOTW870X4Odd9+w2h+9w==
X-Received: by 2002:a05:6512:33c8:b0:53d:e70d:f3bc with SMTP id
 2adb3069b0e04-53df00d1bb2mr1722513e87.18.1732715764697; 
 Wed, 27 Nov 2024 05:56:04 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53ddd7c7a72sm1623628e87.32.2024.11.27.05.56.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Nov 2024 05:56:03 -0800 (PST)
Date: Wed, 27 Nov 2024 15:56:01 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Ritesh Kumar <quic_riteshk@quicinc.com>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] dt-bindings: display/msm: Document the DPU for QCS8300
Message-ID: <bzuzxddbxtlzeps7zfx33ghrfm7pbz64mynnnv6t4pznppxjyn@zhjpqwsliinu>
References: <20241127-mdss_qcs8300-v1-0-29b2c3ee95b8@quicinc.com>
 <20241127-mdss_qcs8300-v1-2-29b2c3ee95b8@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241127-mdss_qcs8300-v1-2-29b2c3ee95b8@quicinc.com>
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

On Wed, Nov 27, 2024 at 03:05:02PM +0800, Yongxing Mou wrote:
> Document the DPU for Qualcomm QCS8300 platform.
> 
> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> ---
>  Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
> index 01cf79bd754b491349c52c5aef49ba06e835d0bf..631181df2bcf2752679be4de0dee74e15e2c66c2 100644
> --- a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
> @@ -14,6 +14,7 @@ $ref: /schemas/display/msm/dpu-common.yaml#
>  properties:
>    compatible:
>      enum:
> +      - qcom,qcs8300-dpu

The DPU is the same as the one on SA8775P. Drop it completely.

>        - qcom,sa8775p-dpu
>        - qcom,sm8650-dpu
>        - qcom,x1e80100-dpu
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
