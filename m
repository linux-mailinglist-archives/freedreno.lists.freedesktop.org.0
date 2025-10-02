Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17379BB254D
	for <lists+freedreno@lfdr.de>; Thu, 02 Oct 2025 04:05:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D25710E761;
	Thu,  2 Oct 2025 02:05:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ShJwV9vW";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEEB810E763
 for <freedreno@lists.freedesktop.org>; Thu,  2 Oct 2025 02:05:01 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 591IcUEp006537
 for <freedreno@lists.freedesktop.org>; Thu, 2 Oct 2025 02:05:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=YPwm+P27wbaFxyVh9NuqbEoU
 jT6f3nVsJYKSXWrzzrc=; b=ShJwV9vWy4elk87HvRrZd2nyuHihVI6HbD2aLt+E
 gIJY9rYEUa9aQKCLjOfR3FXB5hN6X/TlCxjxrvu6n6truv0CE7n9K6Mk2ddxYRaR
 TuL/KyRcQe3hkCBSbLT3dZn8oGiGXN5boPszwngQr9A5nrZ61QbI2UhlAk1vvHqG
 sZEl29FomEl3vhBbJhepR5boxOV+HTifcBgzNK5t4Lz0j+V4LkTbwMNqqCzcSWsi
 1I/s9gW2W2mvZuyZPs5YENhUJbRSiOJChjOwdQE8w9ehRcXvibHmeXy/zGokkmnV
 CSW3IzGAe1lcxo8MkVHm7NAfew7fEsdE59xBrSKcBy8RIw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e851pe80-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 02 Oct 2025 02:05:01 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4e484dccaafso11837461cf.1
 for <freedreno@lists.freedesktop.org>; Wed, 01 Oct 2025 19:05:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759370700; x=1759975500;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YPwm+P27wbaFxyVh9NuqbEoUjT6f3nVsJYKSXWrzzrc=;
 b=kytcHxne+wdZShNJ7khOpZ+VOxuRIpzqFfW+veIKQhQ9OA5yLSDPrx8u/Vejf/DPZk
 qGyJ73gAJk9ImqXLPL2iNOhTD3WA8rZSUdVmjouDGPjxjM7c7JEhfVTraTkljjY74CUG
 h0oBUfhW6rM5oyatvkFLAbTVYIDPnMqPHT0DG9Hgra4Eo648MMI7cjmcCm4Wyyrsj6n0
 dQ05bWrWT0IbSwzch2kDYbW+Lilx3hg1aRNo6cCnyGJopbaMm5iHTDrg/EISgZUTUsO9
 Ikdu1+8+8Y3mFlCSz3jL0OLPy4o86QWOaIDcSSju3X3gA1rz3M3p3f9UjKwYSKx0mjZj
 MkFA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdBrjtUk8clsjRb5oTvMvr43ZWoA1ze7MCcebqh1YnNAdkFoJQMjzqWaYFlV245i40adBLjY0qJfY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxIQKyyy+vmtzqrM2aWNTJQOadXKydwMLpFZGPVMROZo5QBJGFT
 FCjo1W1m7altX6Y4ZWrF12CmB06FD3ACEoWuZMUc31n3PY2O9u5/PuCdwSVsddLQyIEL4dJSu4+
 DQqGUsQu9Ya6oUJq4ma+u0MgKqPl4ruoEDfhGW5TUQxvHZQ0f46Agdo9jlhL5u1cIlzV0i6M=
X-Gm-Gg: ASbGncuHSgbtb0YEEPABrC0tmcNSnN+z/bSfE3DZ+OuTU8N/J2NiBb15+UCo725kABy
 obbnkfaN9NqkBO1eN0h51jb+At3UFMnDvyqyRWnMP64GNGhJtHGUmcmkRuDsPHUIvGSR+egViGo
 NIWeyLl+aepOu18PCgMsx88l71cc4OaptQMJu17Cn79CuVtaXlLPjajVlqIeBLI6qzFGdIIaBHj
 121qmrVYH1kv1N+Lm6sp1eLhw36HI2wP1TUD9E9TtvZffd0e9gGfjiQG93yAZsEI2TU4ZUXP5IQ
 nVniI14+rFFkc7RiGXvDWbhWwl2l7Dd0iBn12NV+yzooiO34co1BQAd1v9d19s6z05gd7yEoR0w
 guQulaiC/imEhlH37MhuWUA5qhCSf2YYK28u/iVKtZrApEn0Fk1I6QKASOw==
X-Received: by 2002:a05:622a:181b:b0:4d5:eedd:688c with SMTP id
 d75a77b69052e-4e561bc382amr25329341cf.13.1759370699968; 
 Wed, 01 Oct 2025 19:04:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQQGDSt0rHIHFSUzcvM3T/tHBLD+F8aud41rHaI4N/HLGf0PTFbE91tgaLDaA/YTTUP68brw==
X-Received: by 2002:a05:622a:181b:b0:4d5:eedd:688c with SMTP id
 d75a77b69052e-4e561bc382amr25329051cf.13.1759370699404; 
 Wed, 01 Oct 2025 19:04:59 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-58b0118d21csm378662e87.86.2025.10.01.19.04.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Oct 2025 19:04:54 -0700 (PDT)
Date: Thu, 2 Oct 2025 05:04:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Junjie Cao <caojunjie650@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Jonathan Marek <jonathan@marek.ca>, Eugene Lepshy <fekz115@gmail.com>,
 Jun Nie <jun.nie@linaro.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH 3/3] drm/panel: Add Novatek NT36532 panel driver
Message-ID: <lfdhib6a7ct36nmj3of2setjft7ydrf6sfgtx7qued7qd56nhc@2xol3grm5re7>
References: <20251001135914.13754-1-caojunjie650@gmail.com>
 <20251001135914.13754-4-caojunjie650@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251001135914.13754-4-caojunjie650@gmail.com>
X-Authority-Analysis: v=2.4 cv=OJoqHCaB c=1 sm=1 tr=0 ts=68ddddcd cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=pGLkceISAAAA:8 a=pJp6QwA-p1Jx72zNNcEA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzMiBTYWx0ZWRfX+TJeveK8zAwH
 PoTqIhvj13Ezv/fE8RgiGTZW/CmZNhBjrEgAQPx1isCwt0QtvVRjvQsVUXB5rjm8f0Xl0WyVO+o
 NXL0ay6i8gHlutO/e+a7h2Pqoli7O++OL+9ULEWDTNcOzV3FA6x9h9KxchhwXMAo7qV6nDJ+HRQ
 uWAmlxtv0aznsP0knWCjgqm+VN/kELf9GRMQt2gK/BzZXuQNF0e/0F6F5c+QmYdjL30BZf/ZXuF
 2QQt+DgafQWfM/9RjRkLZrn5k/TaxKnH9jwk5HpSttBwnIG2EaLsEXsn3YZdwrVdhNA5zFsmOqg
 eiEnrmRfLvR2AWXdmkiXC0afhDJ8qjpm4ETTOHtaPV296qioVmwilLCcSlUegzZBexq6JQwToG1
 gHRs8FfrASNwRRaT2dHDvhqoXDEI+Q==
X-Proofpoint-ORIG-GUID: ahSPjzn9c1FELHc3LDJzIoBKBlZq64Ox
X-Proofpoint-GUID: ahSPjzn9c1FELHc3LDJzIoBKBlZq64Ox
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-02_01,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270032
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

On Wed, Oct 01, 2025 at 09:59:14PM +0800, Junjie Cao wrote:
> Add a driver for panels using the Novatek NT36532 Display Driver IC,
> including support for the CSOT PPC100HB1-1, found in the OnePlus Pad 2
> tablets.
> 
> Signed-off-by: Junjie Cao <caojunjie650@gmail.com>
> ---
>  MAINTAINERS                                   |   7 +
>  drivers/gpu/drm/panel/Kconfig                 |  10 +
>  drivers/gpu/drm/panel/Makefile                |   1 +
>  drivers/gpu/drm/panel/panel-novatek-nt36532.c | 437 ++++++++++++++++++
>  4 files changed, 455 insertions(+)
>  create mode 100644 drivers/gpu/drm/panel/panel-novatek-nt36532.c
> 
> +
> +static const struct panel_info csot_panel_info = {
> +	.width_mm = 250,
> +	.height_mm = 177,
> +	.lanes = 4,
> +	.format = MIPI_DSI_FMT_RGB888,
> +	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_CLOCK_NON_CONTINUOUS |
> +		      MIPI_DSI_MODE_LPM,
> +	.display_mode = csot_display_mode,
> +	.dsc_slice_per_pkt = 2,

As this is not a part of the standard, what if the DSI host doesn't
support this feature?

> +	.dsc_cfg = &csot_dsc_cfg,
> +	.init_sequence = csot_init_sequence,
> +	.is_dual_dsi = true,
> +};
> +

-- 
With best wishes
Dmitry
