Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 585ABCD33ED
	for <lists+freedreno@lfdr.de>; Sat, 20 Dec 2025 17:50:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12EFD10E2B8;
	Sat, 20 Dec 2025 16:50:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="WxIM7VWZ";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HiiayG4i";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09F8010E2B8
 for <freedreno@lists.freedesktop.org>; Sat, 20 Dec 2025 16:50:51 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BKDadbE348946
 for <freedreno@lists.freedesktop.org>; Sat, 20 Dec 2025 16:50:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=uFf82mLJBjZjNx5KkB24U4aM
 KDWvcWa6QMSouhjlBAg=; b=WxIM7VWZk+e+IZM5ePFc6mJxWoikxG70AXWQemKl
 Sqw7hQ8IuJYKb8g1C1IjAvK5eDTHljyi5M76Bn9Igg0xyJXNufPtLppXcfGdILPJ
 bAFsuNG62sm6atSuYY2GJWpWUmrWulVLFwumcXAKFGbI4Pw9IthsmbQwIZxsI/o7
 Z6gdLVx2TYEYCxiVVVmydGh4FWQPL9o8ZNQ2JpUMtGxYuY7NfuuQIoKaAl4OKFno
 OWYFQb2E7e83r8Ir/HPdF6a0ZPX9I6Q3sG87G8fARSAS3D2ungknArm5cjtmVIPJ
 JvOToRr5FTyMN42IPl8Eoy6PCv05q3lJgqd17wDOBajzVw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mra8y7b-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 20 Dec 2025 16:50:51 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-88a3822c06bso68550546d6.2
 for <freedreno@lists.freedesktop.org>; Sat, 20 Dec 2025 08:50:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766249450; x=1766854250;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=uFf82mLJBjZjNx5KkB24U4aMKDWvcWa6QMSouhjlBAg=;
 b=HiiayG4iYxlYRtrbw87Rx1tSarhOyORCX/Llmpqr39y6DmivHbog8dBuOKD34imZRW
 0WZ5eGRnz2mEOLOwrWLf+gTWAbR7p2Aq2wm31BbJA/9tkaSERp/2wrjYhHQhffWhu1fE
 kKot4aQTXr5wIKq6bu3vmoIJVHIB+d4g0OrEG7C75O8BtGO7pvxBDhO8QdzVVi5+jIsQ
 M+LuUmZrfQAhcqZ2K496tY6xQuAPqP/C6TAvftFp3qCMJ/e9J3QtLExaCf1ooX1QNgqH
 IPKx3nHv6ajD8wW/97R+rIcJMmx3vxF06/nLwV+J64hzEtAUD266qW8w/lbaPQIl6CVE
 OguA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766249450; x=1766854250;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uFf82mLJBjZjNx5KkB24U4aMKDWvcWa6QMSouhjlBAg=;
 b=BOIcuX4F+2CawalPGw/3+lK+/TqjSw1EtkRiUW4Bcr5NyGIh3LGnGSo0+wz7UHHuk3
 wQ474jXGqP1cCtesKt1WIm5ntV6pFx1y1Q6HLo+z3n5aBKOcPLBY0kHcDDz32WkbW8Dx
 6H0Pu9GLKMCYSkzzWZ+knk53mpdysO6RAD/3EhQGJC/8sPzNurS7s8nntP372u0/jWjB
 hJbBRYp0gy+2crxBAhOCEGfHyhECXR482LJKlBnnTEgeL6smVFYwmFSTXywa8/BbPOSv
 qyB0Is3bMxCEp7ZJZloN5+xlmez9TSylebOiKnEmMSGcKGxXOc5C2+MGXZBmjDm2a23/
 I5gA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTLO6U3eVB7LqcXXA0lpTBDMPO68r6rLsE2EOCugkKWIKAa7I4G8ufzYJqdfRRMR4ppSYLvIF4YZE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw2Ln05q19a8nyw9PxDuRbgMZI4fXdQLyifARpz+i27BzrUI0uo
 QGVPwyyJgOJxrbRGsgh+qFD+5p/t1fEZjdUEWQicaINsMAwpQXE+bRivvZKopIDlJFX+wsVTw8r
 TtzZLvu6NMVftD8YkHK22iRkO6qCBZ7I7yVxKyg0sdN/feKxz9qqk9eGGDcxkdc5DYa6bN5c=
X-Gm-Gg: AY/fxX6eownRN6W1hx3JPvx29dyn5tK5wo3BhdzXK6bcQ29ex1CLcdlb+etHmss47QT
 xWNgU5LvWlHngWj2NqIQT/8hgUguwf1sxesDrehzV2SjURC7LmzbwO1p1fhsCNVwncMlScD/vhe
 qLI/ZWtrgkG1unBgbzDJIxM5+6YGlnSw5weoQmqLqi0R4//DSBFZXQUvtz+mVvs3eOOflRyDHSA
 C6YFtL6z4+T/p5h5pDThQcXcqjbxMRc7TXk6SD5tDqPxV0pqpz9DGV2YlcLGyw2FAGq8SP33flO
 zJ8VAtMGHVb4zHPUR8aRgsK8fK4Mwi8JQJl4MDpxAmgecfOKU0aq79lQTO8c093l29cQvo6adgv
 LUmj7zHCaXxdk3Bgy4AqIBNMIa+4nrnITnmfV+afpd7oR5tKNVfa8QBDrXH/jbs5btawlmcnJPw
 y3ynkPJSQnlQ1jKCB7ery4EdQ=
X-Received: by 2002:a05:6214:5787:b0:882:483b:978d with SMTP id
 6a1803df08f44-88d850fb9f2mr89852956d6.59.1766249450485; 
 Sat, 20 Dec 2025 08:50:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEBxCqI+gr/WocZ4iNPcl5owbDZ5ubpYXfDj0Gm1KEKgQ7LzgELWHUHhzlxo4GL/MCnBb74OQ==
X-Received: by 2002:a05:6214:5787:b0:882:483b:978d with SMTP id
 6a1803df08f44-88d850fb9f2mr89852676d6.59.1766249450044; 
 Sat, 20 Dec 2025 08:50:50 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3812251b2b0sm13654431fa.18.2025.12.20.08.50.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Dec 2025 08:50:49 -0800 (PST)
Date: Sat, 20 Dec 2025 18:50:46 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH RFC 2/6] drm/msm/dsi: add support for DSI-PHY on Milos
Message-ID: <kjqlk27r2wtoiuruycnw32sggmlaxax43l2dvpd3idnbq3i52e@pyltdthhzgsn>
References: <20251219-milos-mdss-v1-0-4537a916bdf9@fairphone.com>
 <20251219-milos-mdss-v1-2-4537a916bdf9@fairphone.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251219-milos-mdss-v1-2-4537a916bdf9@fairphone.com>
X-Proofpoint-ORIG-GUID: 6Qncwt0yutT3HYLuMK61YFrKWqJa2isf
X-Proofpoint-GUID: 6Qncwt0yutT3HYLuMK61YFrKWqJa2isf
X-Authority-Analysis: v=2.4 cv=e9wLiKp/ c=1 sm=1 tr=0 ts=6946d3eb cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=pVFFj6NhozAmOX4LvaEA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIwMDE0NiBTYWx0ZWRfX1hE1iHAseRE0
 D8WVZkehe1kv2XHyA6heqkJx9UJ7uexVFNMLbbZG0r0hKHNyOiFvglviUp+u3JjxiFa3NQcD1se
 030Qra6/Eb+njq/vRM4DaV2du2ILBrVR/3XCZdG7mexRFsliNXV4Boya5j7PXnqvUadLW3q+GaM
 OO0vAYDu4YDLAVVyzPOLxT2nXNHwxZJ882pYBIWk79rhAqaVyUtYbTvNp102yA4iS4uBaXYK3+B
 N8oqIWBAuRivuC0W4PQODMbUNculknh9xmzyG8qEuo5u/2BwNlmP4rHKe/8v72CBdLMn8jT7Thd
 K1tK9cjCNxps2TAIe20sz1x0f6mIhgyqHUVd0gCQ1O58tW3yEaPPrrEHhD6DbDQcA9I0vUx6CNj
 81dsjaslHlSmJTjks4VG9juN6upHR2W2cXn3hoNN7ceAa/Z9aVU+A8GcMZQq+cnixgy0sLxJWQF
 XA0yDX1aTCecNP+56SQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-20_03,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 clxscore=1015 phishscore=0
 adultscore=0 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512200146
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

On Fri, Dec 19, 2025 at 05:41:08PM +0100, Luca Weiss wrote:
> Add DSI PHY support for the Milos platform.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c     |  2 ++
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h     |  1 +
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 24 ++++++++++++++++++++++++
>  3 files changed, 27 insertions(+)
> 
> +	// FIXME not sure about these rate values

Seems to match downstream values.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


> +	.min_pll_rate = 600000000UL,
> +#ifdef CONFIG_64BIT
> +	.max_pll_rate = 5000000000UL,
> +#else
> +	.max_pll_rate = ULONG_MAX,
> +#endif
> +	.io_start = { 0xae95000 },
> +	.num_dsi_phy = 1,
> +	.quirks = DSI_PHY_7NM_QUIRK_V5_2,
> +};
> +
>  const struct msm_dsi_phy_cfg dsi_phy_4nm_8550_cfgs = {
>  	.has_phy_lane = true,
>  	.regulator_data = dsi_phy_7nm_98400uA_regulators,
> 
> -- 
> 2.52.0
> 

-- 
With best wishes
Dmitry
