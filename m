Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22BFEB38797
	for <lists+freedreno@lfdr.de>; Wed, 27 Aug 2025 18:15:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E775310E161;
	Wed, 27 Aug 2025 16:15:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="WgVXKxWV";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3ED710E161
 for <freedreno@lists.freedesktop.org>; Wed, 27 Aug 2025 16:15:01 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57R6kBlt029243
 for <freedreno@lists.freedesktop.org>; Wed, 27 Aug 2025 16:15:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 72Snl19eM9SG13obf5lnpG+wAP1deg4gz5g3WQbmbnU=; b=WgVXKxWVJuRBsVz9
 XHDVQMH89DBN52LZM0i6JeZ4HCO9BuZ+WqFlW+VLMi/eo3WJWoTOFmZ9dqk7WD9n
 gexfdNriIyYI+ZBpsbjCX4VcJO5mNo7yVDWfCqBgY56v6EMaaU5mFcaXO4gXKKYt
 5kr87RDxfNTDSA28KzPnSE9m32vauXAfpsRUCw8xgtrmcVg30I815WVOQI9ZKNVh
 4MeJ0ttIpcouCf9Z659WXuzLiGmyIfWFPZgmr4piBzXGSGSMWEsFvc3FWa/70htd
 AXv3ABUIQ9tWJTgnkg+GQtG6wS6Zoc5CqDYoAOVFPLieKtbT710xZQVDaqWZ5eEv
 ZjXmDA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5w2wddh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 27 Aug 2025 16:15:01 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7f74124c796so16234585a.2
 for <freedreno@lists.freedesktop.org>; Wed, 27 Aug 2025 09:15:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756311300; x=1756916100;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=72Snl19eM9SG13obf5lnpG+wAP1deg4gz5g3WQbmbnU=;
 b=bqvzkfFc/IoUGPfKj6NjMb2vWkzpdpeP2R+45ulaFDl3cNqBfPZm8wW2t26p2s6fS1
 S5cuie1bJSPSVESEiIftWbBQeSQwbXw6+/J57CkeMBuIoEGULeLivRiea96IMXNz8hlb
 teEqEFEtyGo43NMyOWU2ZpW/+bvp74HjJE7aIK086vD/UVnTwwgnEiomZz33zHIF2S7y
 kxAD2lwg3S2u2p0Ve+LIa8sC8MeheiY06/Jqkw96/dlTmxhkExl+G/kLHAEnCTBZQcVW
 JlVL4yARpGMnLQwanHGVGaqOrMgqaMxs6Z267udKbSGASbFikHbpqDqW0vK2cJoEiR/z
 PhAg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVA3h4J/C5fF7Kt8QqBE+oti9l08kr2/zg6btsXG7F648dAxZM3y+90sPfgCxMYxp+RKlzWKUGYaOE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyGpUgmCdMFTcbIyRN4JR2LY0Slm/kOfBgRRpFvf44dzrFzhjxb
 RcW/b8F4j6hpmsh2L5BsSk9Yy746KfaQn99TsCEwqFtEDOGKqqfQS98kCrqHtQ8uLDsZgUd6+iN
 y+0OmvWCHxbwZ1NWdKJgrReNnUnQV2r2W8beUIwFpgIEDndDrQhyxaK1TLlAxYn5eyvakjf8=
X-Gm-Gg: ASbGncsrIdqdc5E1olv21lIMQ7oEIG8AnFnlKmKNi14pqZG2Nne1cXRrx/ZppkZRJPX
 pYj9nQj7s7Fwt/GQ8geioh8dvRO2sziY1Nefyc3x18IEVj1XXyw+sON9/Qu6kz2bAMt3pxXrM++
 Otjgg3bceyZdOw6qpOrq0R6e4LRR3mIg5mlft1I2SinwlRc9RFrVzuMyGp/fLFlwuDLlgOUUjSP
 tJbMTS21JpuGgE6hPFKhcj2sxUxqBauhaEqF8HTvhLFeyc583wxc0aur2P7/S7jRhd8PUPzX/CY
 FDNFMy8LSG22l0ote4BBDhUN16RGwoYt8wpOuGcOTUpIDuasq4Gp0Mz7iAHtwpEpJRkdRUI7QdH
 GGG/InDEPbQVcOWwfHHOIAijYv2PGVin+TZCD1lQOWQGLFKMsis4w
X-Received: by 2002:a05:622a:4ac8:b0:4b2:e0ac:63b0 with SMTP id
 d75a77b69052e-4b2e0ac6451mr82573221cf.77.1756311299636; 
 Wed, 27 Aug 2025 09:14:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFPzGcbfBYbuRl3Du92a0zsaKioL4MbDCRH7YFgTAKCluORsEyl5ZX6nTkAvEBJ0xy1YynMxA==
X-Received: by 2002:a05:622a:4ac8:b0:4b2:e0ac:63b0 with SMTP id
 d75a77b69052e-4b2e0ac6451mr82572361cf.77.1756311298937; 
 Wed, 27 Aug 2025 09:14:58 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55f35c02020sm2863442e87.29.2025.08.27.09.14.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Aug 2025 09:14:57 -0700 (PDT)
Date: Wed, 27 Aug 2025 19:14:55 +0300
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
Subject: Re: [PATCH v3 11/14] phy: qcom: qmp-usbc: Finalize USB/DP switchable
 PHY support
Message-ID: <inxoswyre3qalrb3dj3lz3b5vmnpnkyy3hh4oum3z6p7yqlo2v@7g67yvvb25tc>
References: <20250820-add-displayport-support-for-qcs615-platform-v3-0-a43bd25ec39c@oss.qualcomm.com>
 <20250820-add-displayport-support-for-qcs615-platform-v3-11-a43bd25ec39c@oss.qualcomm.com>
 <jjsijdmh4hdbgd2boebtrmzvblvhz2hnl7mtv5ga76ine2fnsb@i72dz3r4lbjp>
 <82d19340-b887-4093-9d24-4b2e19b99f8b@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <82d19340-b887-4093-9d24-4b2e19b99f8b@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Z/vsHGRA c=1 sm=1 tr=0 ts=68af2f05 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=M2k1YX_etJ5cuwz7zUoA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX0ZOuJKAWKmFl
 JUdQR/jzXHp2Jk6YFUhQj/Zrc+faF7CeyIBnKSMj0XKPbxh9oYHfajx0RqCoX3HXbiCGr/ZAoU6
 9PfendBDHptJBYGzw6ZtaAiQgLdNW8ZeTZajqMMfky2j43gvAlEL80v+T/OpDCHtKv38MhHfpd6
 mUnUXEAJX2Qpa+TF/5HsoAos1qlm/EydjyWOul9lqBAvALi+qber5UxccETmkG+lJTpIyT4U/vb
 /MFA51OfK9QNrCA/Jd3hsCUBmKTGuL1rMDEuLbNgGZy1JcHwLW3wBGQIpiyPMuTKLwMH+6sqvrG
 n68jaBEMTNKGHscboeGl/+s3SJOhV4JgFRfRwM4zLTTAo3j2Nj/o/RELWvU4veYfMwza7sEvSb4
 lr5111m7
X-Proofpoint-GUID: -xdosJvrbHR_Fj_tapLSp-cn7UOWSQ92
X-Proofpoint-ORIG-GUID: -xdosJvrbHR_Fj_tapLSp-cn7UOWSQ92
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-27_04,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033
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

On Wed, Aug 27, 2025 at 08:34:39PM +0800, Xiangxu Yin wrote:
> 
> On 8/20/2025 7:42 PM, Dmitry Baryshkov wrote:
> > On Wed, Aug 20, 2025 at 05:34:53PM +0800, Xiangxu Yin wrote:
> >> Complete USB/DP switchable PHY integration by adding DP clock
> >> registration, aux bridge setup, and DT parsing. Implement clock
> >> provider logic for USB and DP branches, and extend PHY translation
> >> to support both USB and DP instances.
> >>
> >> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> >> ---
> >>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 331 ++++++++++++++++++++++++++++---
> >>  1 file changed, 299 insertions(+), 32 deletions(-)
> >>
> >>  static int qmp_usbc_probe(struct platform_device *pdev)
> >>  {
> >>  	struct device *dev = &pdev->dev;
> >> @@ -1703,16 +1944,32 @@ static int qmp_usbc_probe(struct platform_device *pdev)
> >>  	if (ret)
> >>  		return ret;
> >>  
> >> -	/* Check for legacy binding with child node. */
> >> -	np = of_get_child_by_name(dev->of_node, "phy");
> >> -	if (np) {
> >> -		ret = qmp_usbc_parse_usb_dt_legacy(qmp, np);
> >> -	} else {
> >> +	if (qmp->cfg->type == QMP_PHY_USBC_USB3_DP) {
> > Should not be necessary.
> 
> 
> Got it. I’ll merge the parsing logic into a single qmp_usbc_parse_dt function.
> 
> Also, I checked the compatible strings in the dtsi files for this PHY series
> looks like no current product uses the legacy binding. 
> I’ll drop qmp_usbc_parse_usb_dt_legacy in the next version.


No. It's _legacy_, it has been implemented in order to support old DTs,
which existed at some point but then were refactored into the current
state. You can't randomly drop DT support.

> 
> 
> >>  		np = of_node_get(dev->of_node);
> >> -		ret = qmp_usbc_parse_usb_dt(qmp);
> >> +
> >> +		ret = qmp_usbc_parse_usb3dp_dt(qmp);
> >> +		if (ret) {
> >> +			dev_err(qmp->dev, "parse DP dt fail ret=%d\n", ret);
> >> +			goto err_node_put;
> >> +		}
> >> +
> >> +		ret = drm_aux_bridge_register(dev);
> >> +		if (ret) {
> >> +			dev_err(qmp->dev, "aux bridge reg fail ret=%d\n", ret);
> >> +			goto err_node_put;
> >> +		}

-- 
With best wishes
Dmitry
