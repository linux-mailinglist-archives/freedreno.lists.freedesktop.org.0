Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A95EA38BC1
	for <lists+freedreno@lfdr.de>; Mon, 17 Feb 2025 19:58:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E7CF10E5B3;
	Mon, 17 Feb 2025 18:58:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="AVnpSC9n";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78AF210E5B8
 for <freedreno@lists.freedesktop.org>; Mon, 17 Feb 2025 18:58:28 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-5452c1daabeso2689473e87.1
 for <freedreno@lists.freedesktop.org>; Mon, 17 Feb 2025 10:58:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739818707; x=1740423507; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=mfEQeSw7ZYdARp3yhUKPkDoI2uTibzTnfRpNUooOXAI=;
 b=AVnpSC9n7/9vadi9DJP5hMNtEWfND96llxtFtYa0WhPnZN3tXncYRBRWsqdsPhJHec
 jCjtLWTHY3Op41hXqeVUCYnbXszVqbv6jpQV4ALl5Os88v6+olK9GcDrYqVJHLAvekEk
 3DUIOaMKZ+mnScg5DcMCLeAhyWyjeukBJWAc9kTCX5eG9l7F84iZ9zn2YdFtJUg9Nm1S
 saJYpBULqUnClXVtrxhlmt/7S03jrDhlWbHXgNtfnEDG7ql95ec8f0yVKYAK51PT+HNM
 0+CJwjj40NNdw3cgvc2RqY9OlfxVSR/zC6h6M2jFDiUDyWzskg4s0ibXluzX8lcEp9YK
 faVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739818707; x=1740423507;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mfEQeSw7ZYdARp3yhUKPkDoI2uTibzTnfRpNUooOXAI=;
 b=VgUvnzBc0DS+WDB24S7CIiHuLRlmKeSy/iebPNV/NhpJYDf9KnLfM1uRbDq8yGhmsx
 Ejb4RNVWD6Y22NoS7rZ/+agihGy99f4hEq56Kzl2CruttpAx+a/6Pf7pY3S1VUQ6VDlo
 XhQ1coXPbGFDsJcDMoYNShmRmOcLW2IkJ+lFzWkWF+RMVsx0NmOA0DtK21V7/x7D3ZFS
 RA8mcIMw+oD2bAtElHWnjMorEnFiCCcaJAK+vh8/KZ4B+eCzwEPTW5K7uV022Eg0Pj2f
 SH5sb0q+ktO0EOuuk17WVsVmX5QWhyzS9iat0qLZnSCGPXXUh+urUQZOB7cwvSecoauP
 u16A==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+/1IWF50WCC4XBctvovQxVOCDjaFa3LsIKcPd3kulMyIRtXcuWSAc+Ju6XWgcze0mmtCncUb/Fi0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxpuHXKR6ON6TG3ofi3hkpVW13BESJXG13W4olb884svcLDewcC
 4ZZSRPv85sFz7Z/NOrPrvzQLRAR4mH++yWh4ce/7fh2WQ2tSQoDGY/rIbaPB228=
X-Gm-Gg: ASbGncuSYAPpwOegLhbpUvD7uyEdnKgYySFwTB2Gg89PZhUGdNFPgb0Ncm+N5J4VUZ+
 CZZKTEPnpVbyPIFtYyNKl2WfZ/oO3cFy3IeP1Zb2c3fN19cmaCE/JeXN0bwJPZGgl85omTfBUQ2
 H5yJTUrXCYFpn2L0v+XS7c70kQXuUNleB1ar1wPfNOhF1Y9D1PJpa2PgxQBW/XrJn+jcy7wUT//
 2mCXEC2WBJVtYXl8FHtxQjwQeTLCapgpnHwRZAFvDHbMy6Bg1yvAUjyvig2pkOLTmJxJzYE6rge
 jGSS/CglP2d/ETR3azao+y9u2zrAt5vpmXI3ZNazSVoZLSXtChMFN8iFzds2gvxrMdPSfs4=
X-Google-Smtp-Source: AGHT+IEeMZ8fqELxvhpQNGcI5FA5HN3p7pDhUbzSFXQMFatRwo9m4DM5TDLR93eSFY/NJzp3zGXAHg==
X-Received: by 2002:a05:6512:ba6:b0:545:2c6a:ff6 with SMTP id
 2adb3069b0e04-5452fe450c9mr4006392e87.16.1739818706708; 
 Mon, 17 Feb 2025 10:58:26 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5452f9aac11sm1131324e87.231.2025.02.17.10.58.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 10:58:25 -0800 (PST)
Date: Mon, 17 Feb 2025 20:58:23 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v2 05/16] dt-bindings: display/msm: dp-controller: Add
 SM8750
Message-ID: <aqpuik4zitdfuk4pahn4wyzxdvxldy4dcqjs3mhr6fqtxpoxhf@ssfzzbfce2nu>
References: <20250217-b4-sm8750-display-v2-0-d201dcdda6a4@linaro.org>
 <20250217-b4-sm8750-display-v2-5-d201dcdda6a4@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250217-b4-sm8750-display-v2-5-d201dcdda6a4@linaro.org>
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

On Mon, Feb 17, 2025 at 05:41:26PM +0100, Krzysztof Kozlowski wrote:
> Add DisplayPort controller for Qualcomm SM8750 SoC which so far looks
> fully compatible with earlier SM8650 variant.

As that became a question for QCS8300, does SM8750 also support exactly
two MST streams?

> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> index e00b88332f2fed2fc33f6d72c5cc3d827cd7594e..a4bf9e07a28355c0391d1757fab16ebe5ff14a44 100644
> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> @@ -37,6 +37,10 @@ properties:
>                - qcom,sm8450-dp
>                - qcom,sm8550-dp
>            - const: qcom,sm8350-dp
> +      - items:
> +          - enum:
> +              - qcom,sm8750-dp
> +          - const: qcom,sm8650-dp
>  
>    reg:
>      minItems: 4
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry
