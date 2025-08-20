Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3229B2DAAA
	for <lists+freedreno@lfdr.de>; Wed, 20 Aug 2025 13:16:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB83B10E6F2;
	Wed, 20 Aug 2025 11:16:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jb4FCtHg";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 525CB10E258
 for <freedreno@lists.freedesktop.org>; Wed, 20 Aug 2025 11:16:42 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57K9fSx4010404
 for <freedreno@lists.freedesktop.org>; Wed, 20 Aug 2025 11:16:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=1Z7Up3r+c9engU8+UCwkklUb
 n4iM1d7MoVv1XcE+/Bw=; b=Jb4FCtHgVzCuUKJ7WmuwSjJ+BngX6Y0KWaespDfZ
 /gUwh0yFRpcSznLyLx16ksxhAwNyF3cywKbX/XJTWQ9kpbrwYHpPU83ulp35TuvE
 RxJEzDzKBAKHKzI72rO/dBtvWfp2Q+nQjUt4DHnkK2iFeMVexC2w8sp9jC6nbpBT
 mRroLv2koSmJulBWEqR0FVSElttV8E+mLnJ/u6waK3bxBN8SkVc4SHASDNUUuE4r
 UdgzWo3uN5P0BMguUqiuPXJdIXmltNnxPxoF+zKGS2gAu1jfK3ytp/pyNu9qzZ3n
 LdIkCbrbaZDQcp56ERlYjMtRJvVX26D7aUfjwNZkzK3awQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n528sg7s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 20 Aug 2025 11:16:41 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-70d7c7e9709so11051976d6.3
 for <freedreno@lists.freedesktop.org>; Wed, 20 Aug 2025 04:16:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755688600; x=1756293400;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1Z7Up3r+c9engU8+UCwkklUbn4iM1d7MoVv1XcE+/Bw=;
 b=rkUg7Q3XyeleZc62chSYFqgORTXCdfGd4SOgsEEBDd6s9DTaMvm8AUQPqAwb2gaOA9
 x72Heb+jGRbxBsj7FPq7woC71QwEKn07k77uOUsgaR6v9HfM5Y1R7Cm3VBio43tEmDQT
 ODpLvM+Holxm4YlIzZOrScy0xV1s2xd/G/WIazjA76U8hE0qfOkHW2su/FyT8jjF1Lbi
 fKm8tYB2V08nbtRjljfygfEnN7b9Gw4F+e2046zYQbiDucw3z0e/qbMaZmzNGayhfti5
 hvInaLrWVoenbQXt1NaOhbtPjHVNuogBvuWz8u0getWGWgArO/+oL4hz+QJWzk37ywni
 AGaw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXPNoCBTBNaSsmW2azde3EBMkHir/W6DNseJPsFmY5wwqFpl7hRMlJZY8IFUrJ7ZXO4ywSAGp6YdjQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx389Kc1Xt7jx5WskNCxLOB4MR1zPWzKgyKCLeztOWnXogd0ufp
 +kl4XfWQsZpNRlw9zvvf2YpM02PVF3WO5bDNBEk9fNZrBEYwvmfv720LjEhX86FmKLRuiWrs4IM
 BOmvIm8R2/Xru2mAwdyujk543/LCPwrBJ/QRpeOBf0oyv26CFszHlKO5VjXJBDbHHMyiqD58=
X-Gm-Gg: ASbGncuyIoJQHRhCOW2b1rqWyDRcRAZ7dXIwGP/ii/PJI7bCDBE9urwQXP68rrPZsGA
 gVwvnkD+C1GmZx8m2VZ8M1MHwQRyUy2/5w9YmxOqJIzf9dBHeIAkHYvMhYSSsIyL+5nqeUT7Lz1
 XSAFNpyTZqw3DCoBPObATyDO/EQBoE6iF1LV3BX0vElb173C5iSP9ZLC9trFPx9eddcr8J04iwm
 zRF84uTRbpOuckRDfT6JixEid2RLmumubbMEeqb01cRA2CDr+YxYPor/2dZFWqMClA4CzV4Wm1t
 K4CsUxX+IzTDAK0LsTGkyQS6GbHRAe8NWgmv4/5YK7R2SRzPIpA4GrXKTf4HY1CNKw8tZK4AIat
 OMEBhhsypJHaK3SAeZI0C5xCO2f+Qj9dliagWplvHx9rqnidlCpNF
X-Received: by 2002:a05:6214:d6a:b0:707:71d9:d6da with SMTP id
 6a1803df08f44-70d76f5be8emr25704986d6.10.1755688600514; 
 Wed, 20 Aug 2025 04:16:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGXo2tEhaFHWFMNzMyu5ebXhvONp13hFPzXhg1vzwJcxoRGG2jluk+k9PtM8oxn7Ws7nmt9rw==
X-Received: by 2002:a05:6214:d6a:b0:707:71d9:d6da with SMTP id
 6a1803df08f44-70d76f5be8emr25704406d6.10.1755688599895; 
 Wed, 20 Aug 2025 04:16:39 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55cef3515edsm2625261e87.20.2025.08.20.04.16.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Aug 2025 04:16:39 -0700 (PDT)
Date: Wed, 20 Aug 2025 14:16:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, fange.zhang@oss.qualcomm.com,
 yongxing.mou@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, quic_lliu6@quicinc.com
Subject: Re: [PATCH v3 08/14] phy: qcom: qmp-usbc: Add DP PHY configuration
 support for QCS615
Message-ID: <su3zkeepxaislh6q5ftqxp6uxsyg7usxmc5hkafw7yn2mgtqeu@wua72odmy7zp>
References: <20250820-add-displayport-support-for-qcs615-platform-v3-0-a43bd25ec39c@oss.qualcomm.com>
 <20250820-add-displayport-support-for-qcs615-platform-v3-8-a43bd25ec39c@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820-add-displayport-support-for-qcs615-platform-v3-8-a43bd25ec39c@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=I4c8hNgg c=1 sm=1 tr=0 ts=68a5ae99 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=2oAyx2JpwU0Ji29QuscA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: 4l4hGfj72UXkKZajD92myr6Qug-R-BbW
X-Proofpoint-ORIG-GUID: 4l4hGfj72UXkKZajD92myr6Qug-R-BbW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX1iob9Z008aac
 xEqi0JinV423jBTy4fIW5DF8PrFtZpvbn2tfnoYh1hI3euRgdUaNcgLzZUj9LzhlYUKtYYd+Gl9
 MgUtUB2tuOOT2E/HP1+X1XIA20nAoydypN1UpqDyiHnh1W1iEvq9e2Bkx4X+cmmr5Zrs4orwylA
 tbXvKPUWcyuysHA1Ud5YK/J0BQ3DGC3Qr+B15NB8ciM1wKr4UMCIVDgSxho6Qc1R05ZWl8gScYd
 d+mjZ8VX8+c2eALHrLd34CE0KxGUSQevOpPA7NWdB9v72bz38oBTEMEtyxRc6dYYDfqU/WspSfV
 eOdkzBKb0jwWNWGup38GhDKRQhNEqy9vpFYgJIVIk2Me5boAjWnQohMNG0mIqCqBoAat/8j0GrZ
 UV/v37YxLHyyIoWKAvGGjWdbjRH0Hg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_03,2025-08-20_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013
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

On Wed, Aug 20, 2025 at 05:34:50PM +0800, Xiangxu Yin wrote:
> Introduce DisplayPort PHY configuration routines for QCS615, including
> aux channel setup, lane control, voltage swing tuning, clock
> programming and calibration. These callbacks are registered via
> qmp_phy_cfg to enable DP mode on USB/DP switchable Type-C PHYs.
> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-dp-phy.h |   1 +
>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c   | 251 +++++++++++++++++++++++++++++
>  2 files changed, 252 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-dp-phy.h b/drivers/phy/qualcomm/phy-qcom-qmp-dp-phy.h
> index 0ebd405bcaf0cac8215550bfc9b226f30cc43a59..59885616405f878885d0837838a0bac1899fb69f 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-dp-phy.h
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-dp-phy.h
> @@ -25,6 +25,7 @@
>  #define QSERDES_DP_PHY_AUX_CFG7				0x03c
>  #define QSERDES_DP_PHY_AUX_CFG8				0x040
>  #define QSERDES_DP_PHY_AUX_CFG9				0x044
> +#define QSERDES_DP_PHY_VCO_DIV				0x068

This register changes between PHY versions, so you can not declare it here.

Otherwise LGTM.

>  
>  /* QSERDES COM_BIAS_EN_CLKBUFLR_EN bits */
>  # define QSERDES_V3_COM_BIAS_EN				0x0001

-- 
With best wishes
Dmitry
