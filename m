Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 940ECA56069
	for <lists+freedreno@lfdr.de>; Fri,  7 Mar 2025 06:52:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A18310EAE0;
	Fri,  7 Mar 2025 05:52:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="nMjQgzhU";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD7F710EAE1
 for <freedreno@lists.freedesktop.org>; Fri,  7 Mar 2025 05:52:10 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-54943bb8006so1640955e87.0
 for <freedreno@lists.freedesktop.org>; Thu, 06 Mar 2025 21:52:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741326729; x=1741931529; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=97xCV+Gvyecw927R3SbsNwJBWiMKRLeo3l2nPZL/r98=;
 b=nMjQgzhUmc8DESceOocdmrybQboezm0JT0hcLBq6WNiAjxc0gNfXHAyzpov7mXo8F+
 p2XSX3ncfBvmeoFuawtyGh2525hNoMSfh029pvdYU0C5didNAakNL6xp+kM4LRgbtPo9
 NM/fP3LDGchMnZYD0KKeNje34LRXKuYo6H6psFwqQRwrpn7eFlSku2eRVHGXP7El8Gzk
 gx0R/t7cn5LBagnOxKjTrz9zqEpLBWqTeti2ZEUqT+0Ra7PX4P8NXiBI675GRud/N/r9
 b3U0W+Wp7VvfUEOpI1mLEEOCO1mRH4o5qik/5T5UAXC1XByJBQEeq5YzXaJfl/YG6apl
 TZKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741326729; x=1741931529;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=97xCV+Gvyecw927R3SbsNwJBWiMKRLeo3l2nPZL/r98=;
 b=baPQWwZSdzTVtS4+9OXkrwK7xQUkm93stobPoXutTrRxEpnjuexET3y5zcBrLzVGTf
 yMPrGapMdwB/l//C+5NN/Tp7a31GArUph/PgKjR0MoLdhA5hG7QSz69ouyI1igiT6pG6
 4LdLgXwnfZ/WM14XggNJwl7Hxz+KWDZM7PZLtUpwgDAo6g69/W/PfWmceZ/BJkEnvK4+
 +Bb/BZbvcxZm4SBp24ktzuuUxGMTF2ud4Vfj1xtGGoos34rFv7OEmSj9PQht45HRWj1L
 7ytNbzMx2WnQTcAbF8dYnPLZvetd90Clkn+J6ur03PGTSCUQ7MovYM+ep8DwybDtnkn1
 QYRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXShPZDO9mSS1JREmkGnWsu8iORr7vAc5OyxFvYiUKQ+wtRRrkQVOERl0ubGh7djIunXPVRNb33SRU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx8od3YfJuCIT/WpV7Huv+soREbiJSTE7kndVwLeP7/PquthkS/
 pOa5NP++rn+4K1kfw2WjnTyCmjb0KjgpoqvOQASctU2bth+HY9PpSj0MlFt6t+I=
X-Gm-Gg: ASbGncvyI/wVpNkRKSzMozfp7FrYCnN9B8F+ipHxKRhEe/mhNSgJoLcApmYSx9C9n8F
 WfF2D7tTJF6sT/P4UHoiIBfqNL8+6K4wKN2vcQrpfX88moiLSNgbMSkeGqF8/xIPMghp9TO7Yct
 f0dgH8F05nZgk//Hsn6XiizXESihkjE7bMKPSlMLc+RIS5/tJL2OyNlYrgWKI2agUlnVoeQunxj
 +ug+vSDuofDmXW9Qs26bpa0olZbcUUvKKqHYtMXE2OP1nEYru46RHYDY7U1vywJmEJ0Klvn/BDH
 9nLnCyoQlsKW8sKpowXykdJUysiOytzxLg0xatCPLrEdGEs3DfyRoupRCVpK/bDSPcrmaMQAcch
 Qjiqr0We6yYiBc3aJ/tYul4Mc
X-Google-Smtp-Source: AGHT+IHunk8+MpzZDHTJkBgYb12y6m7jhuOmcjA3ogw1gP8DkwdgKWszNP4J5Id48vGNdylVuIQYaw==
X-Received: by 2002:a05:6512:2342:b0:549:4de9:22df with SMTP id
 2adb3069b0e04-54990da2057mr687182e87.0.1741326729036; 
 Thu, 06 Mar 2025 21:52:09 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5498ae45f8dsm384613e87.34.2025.03.06.21.52.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Mar 2025 21:52:07 -0800 (PST)
Date: Fri, 7 Mar 2025 07:52:05 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Robert Foss <rfoss@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Wesley Cheng <quic_wcheng@quicinc.com>,
 Christian Marangi <ansuelsmth@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>,
 Rohit Agarwal <quic_rohiagar@quicinc.com>, 
 Kyle Deng <quic_chunkaid@quicinc.com>, Vinod Koul <vkoul@kernel.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, linux-arm-msm@vger.kernel.org,
 iommu@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-usb@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 03/11] dt-bindings: power: qcom,kpss-acc-v2: Add MSM8916
 compatible
Message-ID: <nolgnvhb4ipmt64bhy3swibrjb5cxncz7nwk56osn7bkbrsy2b@6ntbn5pk22gf>
References: <20250306-topic-dt_bindings_fixups-v1-0-0c84aceb0ef9@oss.qualcomm.com>
 <20250306-topic-dt_bindings_fixups-v1-3-0c84aceb0ef9@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250306-topic-dt_bindings_fixups-v1-3-0c84aceb0ef9@oss.qualcomm.com>
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

On Thu, Mar 06, 2025 at 07:11:15PM +0100, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> MSM8916 seems to reuse the same hardware as MSM8974 and friends (for
> whom this binding document was created). Add a new compatible for it.

Ok, I should have read dt-bindigns before sending a comment. But this
commit doesn't explain, why do you need an extra compat string.

> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/power/qcom,kpss-acc-v2.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/power/qcom,kpss-acc-v2.yaml b/Documentation/devicetree/bindings/power/qcom,kpss-acc-v2.yaml
> index 202a5d51ee88c7190805efe8f1bf493bdb69ec45..27dae49163fa0790ceb6fda8a5c674f739d4a41a 100644
> --- a/Documentation/devicetree/bindings/power/qcom,kpss-acc-v2.yaml
> +++ b/Documentation/devicetree/bindings/power/qcom,kpss-acc-v2.yaml
> @@ -18,7 +18,9 @@ description:
>  
>  properties:
>    compatible:
> -    const: qcom,kpss-acc-v2
> +    enum:
> +      - qcom,msm8916-kpss-acc
> +      - qcom,kpss-acc-v2
>  
>    reg:
>      items:
> 
> -- 
> 2.48.1
> 

-- 
With best wishes
Dmitry
