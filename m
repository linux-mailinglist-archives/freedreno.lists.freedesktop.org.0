Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B18B8FD38
	for <lists+freedreno@lfdr.de>; Mon, 22 Sep 2025 11:45:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDC9210E19A;
	Mon, 22 Sep 2025 09:45:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="QSP6ajeF";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19D4C10E195
 for <freedreno@lists.freedesktop.org>; Mon, 22 Sep 2025 09:45:53 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58M8uBbK011758
 for <freedreno@lists.freedesktop.org>; Mon, 22 Sep 2025 09:45:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=W0EkpJuNJzvM/UpMfzArfzg8
 rpKA+/ukTR6O+NEzO9M=; b=QSP6ajeF1p/OfoerwhXLINeYQgKv7w2MFtTvWBPH
 VGHxDfpuGAJ8mqotT+1GssKRPo0jOBfkPEK3Ra3PqauPm9iiFiAsVNrHgE5DLi5Y
 hqfWGGmq4hauxTgN/tjREy48YBE5hIUNFu93dHFSXGJiW3c6xxPg4dOnqgeok5DR
 YTWacIRA9Wdk/7QklFfSb2/TRsKfiZBj2iRE5lazQlaheV9YHzX6+zPVsakJTRsj
 cBHN+D4yirfglFJjTLzLz1tAr8V0ypuDfKquibikQc0zF3cpmSDM8kbNrhyBrCDR
 9pJEAnL4MkNO78sauWoVTObFvc7TPYCQy1Ak6r7qLdvlmg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499kv0v91j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 22 Sep 2025 09:45:52 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4b793b04fe0so80230141cf.3
 for <freedreno@lists.freedesktop.org>; Mon, 22 Sep 2025 02:45:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758534351; x=1759139151;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W0EkpJuNJzvM/UpMfzArfzg8rpKA+/ukTR6O+NEzO9M=;
 b=eCn+z1iuE05teCxoXT8Qdm27mwPTdA3kA5CIG6DaQqNjUtf9MK91RkOI6qwGyaY4Zb
 kLhrH4t8FacVZED/prbQL5b5RpPtMwh9Ef1KWcunAnA4X3wI+daIOA0if5prQ6iN0eng
 0RFuDHoeoiAU1N2w5NP1kElpQRl2dEyM4w/IOW8i/gdz7IvDRVu8O/tiNEdHRDbBr5k5
 8dwG9pBe5RQ73gV3pEzHUe7Fnt4/x7acWBwgdU+fabysCuaFgTBY1+PV4E6FG4IikE71
 tNQoB6gRE05uq+DFnItzq8I2GLxsYlrqx0TAlkZHWy1Q5eGU9T5ayOWZGv1Esyqimw5i
 uOdA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUrB7xjd0ck6qf4dYQkywwDJ7uaNOho/VupHv+vGvRoj6d2RAzWk3Lr7fhh85b570ztNa71q5UEv9w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy4hrigHQuEORlwpgKUShgW/EBw6ifXlcU2Lsu66Vkktr5F8ZJK
 qI/vqedWwYm2eB/pc0DBCXT5aXNRADQCa9u8iPlWBlJAJ/9UXX9vAdMXphmIFZnwQ6/7ZyKNjz9
 1gSlCmANlcaDyiUkeHYGLDAa1JxO1yqGklF1tttH8SEf8UA7F+9icMjRctyusCVlM8hgBFIM=
X-Gm-Gg: ASbGnctTiDly4s1JLlFXUQpT+1Ft96AL0Drlll8k5bidgboE2wHdFLj/bipKxogrvJZ
 JScxZqvAT25RwR88FLhDmJWG3jkjGP+qcaWcpQBNbjUSXoTPqE8mNE5n2ehFDMle/o8kuZU7Gwy
 xjUdH+j4Vm15Ke/S/pPgviQtnwpoW8ZUn/GyPF/eyAHIeuaid/c4QHGTz8iUqeYX+tnHMI6mnxb
 DHs56FzBIx2hMiV5WZIyIaun6bjNeDDBgb1C0wvursorNl72XLLMqtQsk3EoqNQxtN1abd+JYmX
 vbsKUesaOQ7crHhKK2cS9LW3oFzKt/TCLQDbm08cVTgYUfvhXYOCri5zSCmVQS6/aciLRftcTYH
 gQnoTX8qB+urtxcdPqaKFTHg9yYe4WXydRkBqaHC5uGE6EzsQGlX0
X-Received: by 2002:a05:622a:228f:b0:4b5:f5ef:5fe8 with SMTP id
 d75a77b69052e-4c07104b016mr131682521cf.32.1758534351194; 
 Mon, 22 Sep 2025 02:45:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFVWjR+4vgOsePjn/CB9WZu/Pei26UIPflbd0gu92L/o+rhj5rmsKA6/RW+80WDu80POfqZfA==
X-Received: by 2002:a05:622a:228f:b0:4b5:f5ef:5fe8 with SMTP id
 d75a77b69052e-4c07104b016mr131682201cf.32.1758534350531; 
 Mon, 22 Sep 2025 02:45:50 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-578a5f44771sm3214997e87.20.2025.09.22.02.45.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 02:45:49 -0700 (PDT)
Date: Mon, 22 Sep 2025 12:45:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 li.liu@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH v5 12/14] phy: qcom: qmp-usbc: Add QCS615 USB/DP PHY
 config and DP mode support
Message-ID: <2ewxoe76rrii4w3n5b6wl32vmatcp2boj75o65cuq5nx4f2a55@7cn6m7oxzu6c>
References: <20250919-add-displayport-support-for-qcs615-platform-v5-0-eae6681f4002@oss.qualcomm.com>
 <20250919-add-displayport-support-for-qcs615-platform-v5-12-eae6681f4002@oss.qualcomm.com>
 <bfpgktxgo2hb6dpzy3i7jdr6w4de5boorx4n6qeapct2vre4sn@4z2mnppridn5>
 <14cdf3a4-714c-4136-8c1d-99392e7911f5@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <14cdf3a4-714c-4136-8c1d-99392e7911f5@oss.qualcomm.com>
X-Proofpoint-GUID: i5BR0ED3UCYMqWRwmkIIVIQaZPI2RrS2
X-Authority-Analysis: v=2.4 cv=RO2zH5i+ c=1 sm=1 tr=0 ts=68d11ad0 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=DpVyi1o0YMp1h5EDp2YA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAyNSBTYWx0ZWRfXzh+KJxmPkqjY
 OuUtmYCRPBs3ns3gF65JXTAD5nl02ZI4ORZ5K1tkU35gzhHqWTv361PAC8RjRPIO5kgcEgzfLP2
 h7h6Zp4a3hwHYqs/PEVaVuT9hVgoX+HiA45k7G+vv1m1Z5eyCoscsuaiNgnPGPvujx083XQPrMd
 cW/IHQYrWAPeDkbkf6/Ymw0DZztTrziFjAHt54GN7JV/l9LOTSM4h9CxeqS9lR3raCMEm4uE+xA
 SXYp98ouGvIdXwUwUaN6/OGIIM4dQ25b/YT49QBAjozeacFWsjGiJgTgWGylfJEaIYv0ALx/mk0
 NO3qg5nW/V9oj3coBYGeBTwlKtifvXEzsh1oxKr4jHUGxrHK3heaNijfSs91UKtmfcz+6M3yvrc
 fjfMU+K4
X-Proofpoint-ORIG-GUID: i5BR0ED3UCYMqWRwmkIIVIQaZPI2RrS2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-22_01,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200025
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

On Mon, Sep 22, 2025 at 02:58:17PM +0800, Xiangxu Yin wrote:
> 
> On 9/20/2025 2:41 AM, Dmitry Baryshkov wrote:
> > On Fri, Sep 19, 2025 at 10:24:29PM +0800, Xiangxu Yin wrote:
> >> Add QCS615-specific configuration for USB/DP PHY, including DP init
> >> routines, voltage swing tables, and platform data. Add compatible
> >> "qcs615-qmp-usb3-dp-phy".
> >>
> >> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> >> ---
> >>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 395 +++++++++++++++++++++++++++++++
> >>  1 file changed, 395 insertions(+)
> >>
> >> +
> >> +	writel(0x3f, qmp->dp_tx + QSERDES_V2_TX_TRANSCEIVER_BIAS_EN);
> >> +	writel(0x10, qmp->dp_tx + QSERDES_V2_TX_HIGHZ_DRVR_EN);
> >> +	writel(0x0a, qmp->dp_tx + QSERDES_V2_TX_TX_POL_INV);
> >> +	writel(0x3f, qmp->dp_tx2 + QSERDES_V2_TX_TRANSCEIVER_BIAS_EN);
> >> +	writel(0x10, qmp->dp_tx2 + QSERDES_V2_TX_HIGHZ_DRVR_EN);
> >> +	writel(0x0a, qmp->dp_tx2 + QSERDES_V2_TX_TX_POL_INV);
> > Are you sure that these don't need to be adjusted based on
> > qmp->orientation or selected lanes count?
> >
> > In fact... I don't see orientation handling for DP at all. Don't we need
> > it?
> 
> 
> Thanks for the review.
> 
> I agree with your reasoning and compared talos 14nm HPG with hana/kona
> 7nm PHY HPG; the 7nm COMBO PHY series has orientation/lane-count dependent
> configs, but the 14nm PHY series does not. On QCS615 (talos), the TX_*
> registers you pointed to are programmed with constant values regardless
> of orientation or lane count. This has been confirmed from both the HPG
> and the downstream reference driver.

Thanks for the confirmation.

> 
> For orientation, from reference the only difference is DP_PHY_MODE, which
> is set by qmp_usbc_configure_dp_mode(). The DP PHY does have an
> SW_PORTSELECT-related register, but due to talos lane mapping from the
> DP controller to the PHY not being the standard <0 1 2 3> sequence, it
> cannot reliably handle orientation flip. Also, QCS615 is a fixed-
> orientation platform (not DP-over-TypeC), so there is no validated hardware
> path for orientation flip on this platform.

Wait... I thought that the the non-standard lane order is handled by the
DP driver, then we should be able to handle the orientation inside PHY
driver as usual.

Anyway, please add a FIXME comment into the source file and a note to
the commit message that SW_PORTSELECT should be handled, but it's not a
part of this patch for the stated reasons.

> 
> 
> >
> >> +
> >> +	writel(0x18, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
> >> +	writel(0x19, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
> >> +
> >> +	if (readl_poll_timeout(qmp->dp_dp_phy + QSERDES_V2_DP_PHY_STATUS,
> >> +			       status,
> >> +			       ((status & BIT(1)) > 0),
> >> +			       500,
> >> +			       10000)){
> >> +		dev_err(qmp->dev, "PHY_READY not ready\n");
> >> +		return -ETIMEDOUT;
> >> +	}
> >> +
> >> +	return 0;
> >> +}
> >> +

-- 
With best wishes
Dmitry
