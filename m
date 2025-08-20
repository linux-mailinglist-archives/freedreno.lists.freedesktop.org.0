Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B59B1B2DB0E
	for <lists+freedreno@lfdr.de>; Wed, 20 Aug 2025 13:34:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D25710E6FB;
	Wed, 20 Aug 2025 11:34:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="eCNU/iKn";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F80610E00D
 for <freedreno@lists.freedesktop.org>; Wed, 20 Aug 2025 11:34:09 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57K9sfqP010521
 for <freedreno@lists.freedesktop.org>; Wed, 20 Aug 2025 11:34:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=XcNX4ZDYiBJ7hPbbX3QqeNKI
 VB3toybrjSkdSm9Gk44=; b=eCNU/iKnkqs2/ujRIBoZ3cftAZtZMetCNlRfqUcS
 WBDmgpb5vugP2hRdIcOiP+bTSMIgTQ47Ax+2hnGjqmlxM/13uTFqFs/SC4j6bA+J
 nLUx+pO3Uc6UG3QnR5IYcVJcJV+PHR8bBwBy/yZtefRJvcoU6zXuqUNNLD3JRKiW
 IrjKsYtFqMvvQ0AR2q0XNA0eggWzuVla2/gY0AsDXVP0L3PuEh73qMlD0vSSQuaw
 qRqQaF3gaZq9Qpm5dZRyy+roT3jMPAHnSjEYp5TYJC5ZeKCNgmOLkc0CVjTvUavU
 wc1/3eWdLpk7HpxWlfX2c3/sTguSODbFm9i/Upn9w6kotQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52a1k2m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 20 Aug 2025 11:34:09 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-70a927f570eso141473966d6.1
 for <freedreno@lists.freedesktop.org>; Wed, 20 Aug 2025 04:34:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755689647; x=1756294447;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XcNX4ZDYiBJ7hPbbX3QqeNKIVB3toybrjSkdSm9Gk44=;
 b=RLqq7G29McDH0mygjDL7ofFta+cAY4N53mWzN0tz7BAPsEpne2KHtUb/1lP4EZGdtJ
 RFdGb5ti9d7ruLdokraghtjBj1wbjM9QTgndGxThVQSudylTJ364aHrA63pCAc5Iy1PB
 C/GthYp6umgdY/p7W5YRir4AAvy/TxCzdLC/ZUKijo+QXQcDbLsjcG3wbWOOxzgjGvcG
 L4zhmMTUoraUXQpaOQ66wMPIDS+5cttfPBUo45PWJd8C+1WK/qNGLL8hjM3PFGCnoPXa
 1qc9TiQsDJ7nBqAJ4pg9wMHbBrTpqQs/WxQctdKFYw6Qn+u7/1xCwudhgRMd89D+BHC6
 pCmA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5NRiovQWuAC8L/dz6ppwgD8n7FcDfYc2uDZN9L2zu6pctHOUWbludJ73izETcBxBXqZ2q3v77vV8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzuYPT8Mq2crKca+tK+n3MO9J7A8Vb6/xRJtyWtZ20avaKhbAy6
 AX5Md2T6mb9wp8p1bbkEeQ4cKbbz/yHcLFLjMKqtLe0z0qBBJrzA5sjpOaL0/4+6O0kQfLom8iA
 d25a1lcew3HQWttmwO1ldo+Ahw2MglS1MEgrwFgHH/j/sPVym3onl8lHaMrB7jlHVGGY9ARn59a
 lMABY=
X-Gm-Gg: ASbGncuaJd/u9MfbHFb28OGFUMaFt5WMr+2qQlc5JKW5kt3KBgBigZ5PwYR6mD/tkGE
 bDSkMpLoc9V27wfWib/bHpYE211c23OFctWu6QSTUNiMyMdbvlU4aQKQt/D8z91J3OgWMRTQYto
 bZwHaZZGy0IN+Xdp5huzcw1jh5ft28U1C1AYBHGwwY+YI1+DDy2I0hK86VYdTXDSazoGyZfE0wl
 yLqBl4k1oJxSPSqVi9aTBljnbBVZ3Gn14bqC/HQ2Pz9Gbop8dsj5OCS6BylOgHkRvbE0HaHSPn9
 4UBL89MplNpPqOqOL7VdP2gdZysUiyJirS7wDYOT8iQoNIAxU0v0X8gy2ULsbp/6bxeaCB7fO6V
 kmGFYn6VCtSGxZETGbUHjMxT4D65E00FqplATFQ7K+Be6HkkhdJpy
X-Received: by 2002:a05:6214:2467:b0:704:f952:18bb with SMTP id
 6a1803df08f44-70d771402c7mr20425466d6.46.1755689647307; 
 Wed, 20 Aug 2025 04:34:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHKE0JSYrOpvMO2WcRrh53W2VDmbQ14HSNNSlF+so2tCr9GefhcpbJA6wUwasEOVbgwxfyTww==
X-Received: by 2002:a05:6214:2467:b0:704:f952:18bb with SMTP id
 6a1803df08f44-70d771402c7mr20425116d6.46.1755689646629; 
 Wed, 20 Aug 2025 04:34:06 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55e084e46b7sm233240e87.48.2025.08.20.04.34.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Aug 2025 04:34:05 -0700 (PDT)
Date: Wed, 20 Aug 2025 14:34:03 +0300
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
Subject: Re: [PATCH v3 04/14] phy: qcom: qmp-usbc: Add USBC PHY type enum
Message-ID: <cueyo7huj2m2yt46sjk3atfktft6y5slhhtslwmi44r7h7lxbn@5zvwxtdmk34t>
References: <20250820-add-displayport-support-for-qcs615-platform-v3-0-a43bd25ec39c@oss.qualcomm.com>
 <20250820-add-displayport-support-for-qcs615-platform-v3-4-a43bd25ec39c@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820-add-displayport-support-for-qcs615-platform-v3-4-a43bd25ec39c@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=feD0C0QF c=1 sm=1 tr=0 ts=68a5b2b1 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=LJgbN-Jd--P93uwsTkIA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: bvEJ0oJy9qnTAYb2QFoX57HZIl4tcVAL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX7KGAITeozDCa
 7olw3RPx4Ob84e2ay7zuEIqg/C7HIJAZ+ENNIt8+CphY4p/fPz4sTrbwZ9Lfor3dQ5pTy8d6FaH
 J55nijwBKBQ+/V3+bACS68/S8uuhVccyc2SDvqRWriTjX6LWNO1nXwyvyKiV9uR38jt1J3mhd6j
 HH6cFM1vylE+2Pjwp8W0TcCC4dbwblROxx6LNxwISjs7IcGPn+4KihjasV0nKEMLlMhBIxtXB8s
 e/RgLcB8Wk3KVDcGFoZ1V0Ow1JXPKucyk6AmruJ6BAWidcFEwhbnzVyoKseGU+AmO8MU0YOoArd
 WxBsnUD+famf/Wyab6grZAI+T0ihJIj5lxRO6xcevGkDn5ujcDBlt9OyBmyA4gmrHsAl2ujpl6d
 JjQ6YDriMRpeT2wPVXvBuSe3E2jk7A==
X-Proofpoint-GUID: bvEJ0oJy9qnTAYb2QFoX57HZIl4tcVAL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_03,2025-08-20_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 suspectscore=0 clxscore=1015
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

On Wed, Aug 20, 2025 at 05:34:46PM +0800, Xiangxu Yin wrote:
> Introduce qmp_phy_usbc_type enum and a 'type' field in qmp_phy_cfg to
> differentiate between USB-only PHYs and USB/DP switchable PHYs.
> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
> index e484caec2be20121cfe287c507b17af28fb9f211..5afe090b546977a11265bbffa7c355feb8c72dfa 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
> @@ -284,6 +284,11 @@ static const struct qmp_phy_init_tbl qcm2290_usb3_pcs_tbl[] = {
>  	QMP_PHY_INIT_CFG(QPHY_V3_PCS_RX_SIGDET_LVL, 0x88),
>  };
>  
> +enum qmp_phy_usbc_type {
> +	QMP_PHY_USBC_USB3_ONLY,
> +	QMP_PHY_USBC_USB3_DP,

Drop, you can use presense of DP offsets in order to differentiate
between USB3 and USB3+DP.

> +};
> +
>  struct qmp_usbc_offsets {
>  	u16 serdes;
>  	u16 pcs;

-- 
With best wishes
Dmitry
