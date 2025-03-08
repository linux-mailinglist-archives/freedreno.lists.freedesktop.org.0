Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF88A57868
	for <lists+freedreno@lfdr.de>; Sat,  8 Mar 2025 06:09:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E960010E02B;
	Sat,  8 Mar 2025 05:09:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="DWUY1BA2";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0C6610E1EC
 for <freedreno@lists.freedesktop.org>; Sat,  8 Mar 2025 05:09:17 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-307c13298eeso30219701fa.0
 for <freedreno@lists.freedesktop.org>; Fri, 07 Mar 2025 21:09:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741410555; x=1742015355; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ulAMfJbRFBT/fSAG0Qg9z+1DBNf6VyZHT1tEXJwkloQ=;
 b=DWUY1BA2k6o4wP/8cy7CA24gUOa/JZgSgj7cS8OkDNKxZ7/XvyTTF9MkxisVrFk/Sg
 vzZ0wFZnqkOee9TCGwXyRo6CE4i8sziHj9ikUM2YsWSJPtdo23KfkM+tfJdlGp0vaWhO
 07xbQiF0EGtMp2LTUtRkFWq4aNBWfdCInD6ClajN90zpfGXfxo5pbhDLgtUOek2Akfmd
 9j2XZuX644tx/yVu6uVLTmdprNlIr0Z7sBsQC6QuWp220DIEZh3lhpAqOxPTRu51no6W
 Hha7wW6WfHcVK+rWmCS4sCLK+mEbNde0TLSNnPbH2rbItLaysO0V/cfNYgV/ks485/r5
 0OZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741410555; x=1742015355;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ulAMfJbRFBT/fSAG0Qg9z+1DBNf6VyZHT1tEXJwkloQ=;
 b=nbRQ3v6HhqXRMs1AAFZJWlYoVtJQ0qkkbItEmYkp0hqM7yD2JI6mUqX1+ktlPY8JHc
 L0Z4ZGDaj9Kj5BhWQxF8CnNAvvJKxVrSsK83QqW0uHmwtD3vqhaeoBkS5R0tRYqutSOp
 3k+hGBhnxDi9u01EvHHmYc623NTvlm3kYn4EJZVymR+NLNUBcLoHIW9vx+OaAGfFzSN5
 4hs7LLh7y/iUsd33vI3blcX93ctiQ05KowbnLdHYpEchgTHJGhXnJUe/prDwKPs2YZwz
 QDn+SWHRKTp/gbBN6rT4U4FMM/44SxJR6k85NiT21qnke6eBtj/VrEC+1QIW5qdAgn++
 EdvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUyk2qP1grdEIWRdeYNR8iaEjNROEcmfednsm+2/3TStAxNzA80J2C9Hdwjn+ji2IeGxr6awNsi8q8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yye6iqCSBlCu+hUFHYPDuSoUukNtebSwPSFuYixLYeyNmTH94qh
 hRaIFPL8GdG++hRWFa0dRdYemqKeNVD8AFXeKpgBepFz8+fXWrtQFkpDniDM/QU=
X-Gm-Gg: ASbGncurPKzw5BighJ1YuLNEx0JHW1gvS2awbuN9CIT2cqq74w2I7NYU99yCcouHUy4
 eShJf6JbJrkehJlaoJHKT014VlCmMMVJ+vZz5fe8n+3T4rKO1aih2W10rt61pXzog4MhPJ+sd9E
 YskXwjPRQDzz4lYcC5A/VpXfwaIFh7P/4KzvcPv87pCTj0xUkZbaaM561lOt1t1/P0yA3u90uhz
 +IJ6VQt3DwdyoLgFk92ElqV9aOQzHRmigvd1vrmmnrBtmVIe63Flf5j8Hjp91ghYNAro9pW0DiS
 nSmAsrNDuWptqNYhZnNGPBUvw9cZi1gTDnVchRlKibenpb7KMI8d9ebazsiDK2Eg1rdR29lw2S+
 KWMgXAxHs9OgLC4j+tkmKCpxv
X-Google-Smtp-Source: AGHT+IF7bjBB5aMjSIOWPIZXx3se8ZXwg6KEPXnQgNtkefZ48n8buFCzC0ExNuYMF9We4+jwIP9GuA==
X-Received: by 2002:a2e:be91:0:b0:30b:c608:22bf with SMTP id
 38308e7fff4ca-30bfe429ce8mr7170571fa.9.1741410555213; 
 Fri, 07 Mar 2025 21:09:15 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30be98d0bf3sm7872791fa.8.2025.03.07.21.09.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Mar 2025 21:09:13 -0800 (PST)
Date: Sat, 8 Mar 2025 07:09:11 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Dmitry Baryshkov <lumag@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Sean Paul <sean@poorly.run>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Conor Dooley <conor+dt@kernel.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, devicetree@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Clark <robdclark@gmail.com>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Simona Vetter <simona@ffwll.ch>, freedreno@lists.freedesktop.org, 
 Bjorn Andersson <andersson@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Joerg Roedel <joro@8bytes.org>, Jonathan Marek <jonathan@marek.ca>, 
 Maxime Ripard <mripard@kernel.org>, iommu@lists.linux.dev, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 linux-arm-kernel@lists.infradead.org, 
 Will Deacon <will@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH 05/10] dt-bindings: display/msm: Add Qualcomm SAR2130P
Message-ID: <nddxntwmiyurqew75gc6yoj2dcinhjqu36cdujhruqyrz62ry5@4e2y76ghmo4h>
References: <20250308-sar2130p-display-v1-0-1d4c30f43822@linaro.org>
 <20250308-sar2130p-display-v1-5-1d4c30f43822@linaro.org>
 <174140525677.1770282.3232695979994091275.robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <174140525677.1770282.3232695979994091275.robh@kernel.org>
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

On Fri, Mar 07, 2025 at 09:40:56PM -0600, Rob Herring (Arm) wrote:
> 
> On Sat, 08 Mar 2025 03:42:23 +0200, Dmitry Baryshkov wrote:
> > From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > 
> > Describe the Mobile Display SubSystem (MDSS) device present on the
> > Qualcomm SAR2130P platform. It looks pretty close to SM8550 on the
> > system level. SAR2130P features two DSI hosts and single DisplayPort
> > controller.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  .../bindings/display/msm/qcom,sar2130p-mdss.yaml   | 445 +++++++++++++++++++++
> >  1 file changed, 445 insertions(+)
> > 
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,sar2130p-mdss.example.dtb: dsi@ae94000: compatible: 'oneOf' conditional failed, one must be fixed:
> 	['qcom,sar2130p-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
> 	'qcom,sar2130p-dsi-ctrl' is not one of ['qcom,apq8064-dsi-ctrl', 'qcom,msm8226-dsi-ctrl', 'qcom,msm8916-dsi-ctrl', 'qcom,msm8953-dsi-ctrl', 'qcom,msm8974-dsi-ctrl', 'qcom,msm8976-dsi-ctrl', 'qcom,msm8996-dsi-ctrl', 'qcom,msm8998-dsi-ctrl', 'qcom,qcm2290-dsi-ctrl', 'qcom,sc7180-dsi-ctrl', 'qcom,sc7280-dsi-ctrl', 'qcom,sdm660-dsi-ctrl', 'qcom,sdm670-dsi-ctrl', 'qcom,sdm845-dsi-ctrl', 'qcom,sm6115-dsi-ctrl', 'qcom,sm6125-dsi-ctrl', 'qcom,sm6150-dsi-ctrl', 'qcom,sm6350-dsi-ctrl', 'qcom,sm6375-dsi-ctrl', 'qcom,sm7150-dsi-ctrl', 'qcom,sm8150-dsi-ctrl', 'qcom,sm8250-dsi-ctrl', 'qcom,sm8350-dsi-ctrl', 'qcom,sm8450-dsi-ctrl', 'qcom,sm8550-dsi-ctrl', 'qcom,sm8650-dsi-ctrl']
> 	'qcom,sar2130p-dsi-ctrl' is not one of ['qcom,dsi-ctrl-6g-qcm2290', 'qcom,mdss-dsi-ctrl']
> 	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#

It looks like the patch 2 could not be applied and was skipped. Is the
bot parsing the dependencies from the cover letter?

> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,sar2130p-mdss.example.dtb: dsi@ae94000: Unevaluated properties are not allowed ('compatible' was unexpected)
> 	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,sar2130p-mdss.example.dtb: dsi@ae96000: compatible: 'oneOf' conditional failed, one must be fixed:
> 	['qcom,sar2130p-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
> 	'qcom,sar2130p-dsi-ctrl' is not one of ['qcom,apq8064-dsi-ctrl', 'qcom,msm8226-dsi-ctrl', 'qcom,msm8916-dsi-ctrl', 'qcom,msm8953-dsi-ctrl', 'qcom,msm8974-dsi-ctrl', 'qcom,msm8976-dsi-ctrl', 'qcom,msm8996-dsi-ctrl', 'qcom,msm8998-dsi-ctrl', 'qcom,qcm2290-dsi-ctrl', 'qcom,sc7180-dsi-ctrl', 'qcom,sc7280-dsi-ctrl', 'qcom,sdm660-dsi-ctrl', 'qcom,sdm670-dsi-ctrl', 'qcom,sdm845-dsi-ctrl', 'qcom,sm6115-dsi-ctrl', 'qcom,sm6125-dsi-ctrl', 'qcom,sm6150-dsi-ctrl', 'qcom,sm6350-dsi-ctrl', 'qcom,sm6375-dsi-ctrl', 'qcom,sm7150-dsi-ctrl', 'qcom,sm8150-dsi-ctrl', 'qcom,sm8250-dsi-ctrl', 'qcom,sm8350-dsi-ctrl', 'qcom,sm8450-dsi-ctrl', 'qcom,sm8550-dsi-ctrl', 'qcom,sm8650-dsi-ctrl']
> 	'qcom,sar2130p-dsi-ctrl' is not one of ['qcom,dsi-ctrl-6g-qcm2290', 'qcom,mdss-dsi-ctrl']
> 	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,sar2130p-mdss.example.dtb: dsi@ae96000: Unevaluated properties are not allowed ('compatible' was unexpected)
> 	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250308-sar2130p-display-v1-5-1d4c30f43822@linaro.org
> 
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.
> 

-- 
With best wishes
Dmitry
