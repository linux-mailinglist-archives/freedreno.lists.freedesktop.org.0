Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8AAB314C7
	for <lists+freedreno@lfdr.de>; Fri, 22 Aug 2025 12:09:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9828910E08B;
	Fri, 22 Aug 2025 10:09:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="aRLhTNmw";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84A6510E0C8
 for <freedreno@lists.freedesktop.org>; Fri, 22 Aug 2025 10:09:17 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57M8UKux017925
 for <freedreno@lists.freedesktop.org>; Fri, 22 Aug 2025 10:09:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 /CUwk5QH1ZSt+M+5NuLxUaiWmoXIPaE8loSJYuZG5tk=; b=aRLhTNmwMlgE6JQe
 tWwNf2M2oC4oojXabs2KKGwrhhStri5fyzPV+aU3lhp7Jbi3ypNE+l6O+n77w+Tp
 2+SNiqs/0+tfPliih6suw9tHpp0ffs+9zMvXNPDnj13DW/s9SKKdCdxxzOJF/6Cd
 2+pirkH5OE53jNtRqWAYvIT1QB/WQS/5kyUqK+EvwumVYk4v3hTDqjc62miMMSj0
 4B14/XgwMenyqdYSqstlznouGEBuD2xxAJJ9JnOfdMzbsleFWKK2Nn9Ue5BS1F8s
 y7j3e5mNRCzD09dwMDo+M9AcSE5/u8Ow4n4rCDWtFLgLegNNY5i3RDJyrHH0ucW+
 tyuQBg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52b0pp8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 22 Aug 2025 10:09:16 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-70d903d04dbso29934016d6.0
 for <freedreno@lists.freedesktop.org>; Fri, 22 Aug 2025 03:09:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755857356; x=1756462156;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/CUwk5QH1ZSt+M+5NuLxUaiWmoXIPaE8loSJYuZG5tk=;
 b=hCMKO0jwImjiIZjDIrg81aaXZ/P9DYZled/L3apVnINRZDzz32ARqEyayiA5Os5BTO
 nRKwgdTzMQq9gMJ4CEjZMhVOZGMQOppfafjv6OKLjROJyxCU/n9HcTHEL+CKtqDvguPC
 7E7Naz/1IjJn5Np8klkAH/pB1AJRSoZyy0dguw7Q+kPcWpG35e54eAfpawVbSjB7jAEM
 a2glfewF6XroItL+SNnuEzIxohozoV3QL5FDMbwZYvBqC6uvYqv5vktdKITWKVivZDq9
 JRVXWQMDj4zjNU1Xi7KYTcv5Oy99l3WmSLt2YGkcCRx40vMbSj77fj5F4QqHKUVDUF80
 cdPg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVbi+LxDRJz+tKLhIReSrflcaUBhmTGHJMBJv7lzmKvPN3bkQ4jna09XwjaAyTGhqjqk1NLAeQu9P8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywhz5f69vjnfDmRVwqXEBmr+l5Aj9ofI8sDx8s/BbkIV2Psn5Ml
 tQ//WtWszrrgNZQti8map7xLGUxSBgXnOy2QvbgHQLEAW0hSwuFb/xVhBOoSKp1EP+r6va0X/g8
 mx83eGUrt1/3Ylss72IhVYlWcLNjKIYEbRkxJ+DFc01Y9PXu7ZYNrImT+qhwWlb77dnj+8bc=
X-Gm-Gg: ASbGncvCpZzyPfnK5ZS8OU9sSwmSWL2WQS0LxEyAMyhUGRIwAf+qnFGK971YUli+OSu
 9dWr5zany7NOasTGazH2vR1ybOkyl6+2Di1v8ab2V8HUy83v96jZ/DfgUgFq4TFtP+V0rEToPqT
 VMj3PyuwAJ69aBlKxUGJD6fANs8CM0RXhJAACaSj8su1b1UZb8dJ486JPv+nNjrngSzF8DBQuyA
 zIjDfVpK922QC8C5HGEF6gnnFPBG6k73sc3izJbZexV5U0Bf/7rRIY7ZUqhMQPO8ROj7uueoDGn
 mFgzZflOfz3Xzi0QWWc4OYbD+lH6CrJAjrWNOVI2SIyCPt7R3XRaJAEO62TvezWcllvX/AyGfTc
 CTRyOlj18F7yfTeIKszWrYAYZsvM1GrYt7FCZmAobM+bjtwvgeopG
X-Received: by 2002:ad4:4ee2:0:b0:709:d518:74fe with SMTP id
 6a1803df08f44-70d972f905dmr28317666d6.38.1755857355559; 
 Fri, 22 Aug 2025 03:09:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGjLDedc3TEHaa5fOfhQL6JH2lzExRdfVuK/adJjjF/AbJ1wFTlhwvAYsjorze1ggX8bWHyRw==
X-Received: by 2002:ad4:4ee2:0:b0:709:d518:74fe with SMTP id
 6a1803df08f44-70d972f905dmr28317336d6.38.1755857354860; 
 Fri, 22 Aug 2025 03:09:14 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-33650ea5f6asm3013591fa.53.2025.08.22.03.09.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Aug 2025 03:09:13 -0700 (PDT)
Date: Fri, 22 Aug 2025 13:09:12 +0300
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
 Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH v3 08/14] phy: qcom: qmp-usbc: Add DP PHY configuration
 support for QCS615
Message-ID: <tdmjo5et4ohwg3g5z7wr4dhvvlqbd4z6nfo2hbzpyo77e6okdp@z5f7hlvyovx6>
References: <20250820-add-displayport-support-for-qcs615-platform-v3-0-a43bd25ec39c@oss.qualcomm.com>
 <20250820-add-displayport-support-for-qcs615-platform-v3-8-a43bd25ec39c@oss.qualcomm.com>
 <su3zkeepxaislh6q5ftqxp6uxsyg7usxmc5hkafw7yn2mgtqeu@wua72odmy7zp>
 <2e3c1559-7da2-4c6e-bcef-eb1e8dfd4c31@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2e3c1559-7da2-4c6e-bcef-eb1e8dfd4c31@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX3rK08dJvVGv5
 oeN8B34ozjd8riZnCvZshFk/bRrE3dKD+EVXHGqp1/xqTb9F5QcshG2KJqatQe21QU4Lrsxy6CL
 TCa5UeJbIU3HUzORbmqUP9ERnqdIqUT2KTE1L5S+c15MsPe5WsvKtJiyao82+iI3peAfGpJZWiQ
 fW5+bVLjDzeX5T76B4YsecAI1IQcII+f2Ih9bwCBekjuKoX9LVvOUpN0F7VfpJMY7aV6hyR57dR
 4MCPqUuaK2DGgZj1XeBSuKANkxF+uGiwDLSQBlU8Ce+sJwmBXYKhkUx6CBA99aIUdYUVh1dQKDR
 qhbBhGFOQ9sPBzjI/+WVSFfOZYa+g38NJUnYW+GNgK/rywsqdYa44Wuk4BM5yl455Osj5vdYgU5
 JCFuzjRHY9Q//kdVDYmwexG+cN10Bw==
X-Authority-Analysis: v=2.4 cv=TIIci1la c=1 sm=1 tr=0 ts=68a841cc cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=VDbBU9HbQ_CCQpQHtSwA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: JXjDJpOAE5MAdfga4tGTzfprrCQ4kxlB
X-Proofpoint-GUID: JXjDJpOAE5MAdfga4tGTzfprrCQ4kxlB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
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

On Fri, Aug 22, 2025 at 04:43:11PM +0800, Xiangxu Yin wrote:
> 
> On 8/20/2025 7:16 PM, Dmitry Baryshkov wrote:
> > On Wed, Aug 20, 2025 at 05:34:50PM +0800, Xiangxu Yin wrote:
> >> Introduce DisplayPort PHY configuration routines for QCS615, including
> >> aux channel setup, lane control, voltage swing tuning, clock
> >> programming and calibration. These callbacks are registered via
> >> qmp_phy_cfg to enable DP mode on USB/DP switchable Type-C PHYs.
> >>
> >> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> >> ---
> >>  drivers/phy/qualcomm/phy-qcom-qmp-dp-phy.h |   1 +
> >>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c   | 251 +++++++++++++++++++++++++++++
> >>  2 files changed, 252 insertions(+)
> >>
> >> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-dp-phy.h b/drivers/phy/qualcomm/phy-qcom-qmp-dp-phy.h
> >> index 0ebd405bcaf0cac8215550bfc9b226f30cc43a59..59885616405f878885d0837838a0bac1899fb69f 100644
> >> --- a/drivers/phy/qualcomm/phy-qcom-qmp-dp-phy.h
> >> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-dp-phy.h
> >> @@ -25,6 +25,7 @@
> >>  #define QSERDES_DP_PHY_AUX_CFG7				0x03c
> >>  #define QSERDES_DP_PHY_AUX_CFG8				0x040
> >>  #define QSERDES_DP_PHY_AUX_CFG9				0x044
> >> +#define QSERDES_DP_PHY_VCO_DIV				0x068
> > This register changes between PHY versions, so you can not declare it here.
> >
> > Otherwise LGTM.
> 
> 
> Ok.
> 
> This PHY appears to be QMP_DP_PHY_V2, but there's no dedicated header for it yet. 
> 
> I’ll create |phy-qcom-qmp-dp-phy-v2.h| next patch and define |VCO_DIV| and shared offsets with V3 will be redefined accordingly.

Nice! Thanks.

> 
> 
> >
> >>  
> >>  /* QSERDES COM_BIAS_EN_CLKBUFLR_EN bits */
> >>  # define QSERDES_V3_COM_BIAS_EN				0x0001

-- 
With best wishes
Dmitry
