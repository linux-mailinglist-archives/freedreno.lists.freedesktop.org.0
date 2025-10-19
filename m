Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A99BEE977
	for <lists+freedreno@lfdr.de>; Sun, 19 Oct 2025 18:02:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ADC010E216;
	Sun, 19 Oct 2025 16:02:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="A60wrfVL";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C7EC10E218
 for <freedreno@lists.freedesktop.org>; Sun, 19 Oct 2025 16:02:31 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59J8hGLv004476
 for <freedreno@lists.freedesktop.org>; Sun, 19 Oct 2025 16:02:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=yrSgxSLSjug2hqzstf5hGIeQ
 dvScIsYA26L3fjhfwUQ=; b=A60wrfVL9zZXiJo1IpYz5nSiXDhJggSOBHOpZkcc
 tlEyseTYqS/ksvdbaDIM4xqXhH0AI8SNEg5poSQa6MnO0U3gkv0/wHZ+LW401cjl
 TbpqwHrALb3oAEU3qn8lDhxRWU6UjE4aA0EP7S7HhCQ95vm0ShrjGSygZnkV8DfV
 u/1b75DmFFnSSN7r4zNkl5rIOQexFxo47+aLiFttYBRZrGcB7lugIdY6BdlEwmIm
 LVu9DQpsYbPjUFdm8qtASQ8ptQKYjFfAIVun/PdmA3OcU46mVZNAH6SlHqa/kAyy
 xkh0MQo9VfIfM5eqvPM/87ayI4rlCiexYTCfrN7WlcCNqQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v469ahar-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 19 Oct 2025 16:02:30 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id
 a1e0cc1a2514c-932ca066facso359113241.1
 for <freedreno@lists.freedesktop.org>; Sun, 19 Oct 2025 09:02:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760889749; x=1761494549;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yrSgxSLSjug2hqzstf5hGIeQdvScIsYA26L3fjhfwUQ=;
 b=QPgVNKAD+DaYF0GcGJeV7BWsxsFjYlEPMSqkz7oVgPrQTaCYZ+8042/WK/F67go5Yt
 Us0o2kIYoV8ZZG1HRKaum5lGfMnW0sfnKs5fe9OTGGgdpTpgCF0TeJEkn2e+50nGqFys
 hSAdf2g2sKrKjhABz1/1h3pdmlrVsji1x0JI3YX+uwQsLHqcawXQ6TI1DA0gmqC5ht1i
 GccjyG0eVaie4mPjksXF042t7znO+5mqoM4RSogDviO2oFSvG7lgEWq1zolRv2W5ZtYI
 EL2ZClvXigcZxOhl6xMaYLueAhKfQvXPBF35NjaU4r+JoNsEEChR/g2YIj1GSDatbYbT
 WlCw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXkl6yp4Ei5kk7nz85EHvFUkjXZdrQqQY6MzGjhvkJDDtaHoGflYGA6UeurfMtW/7+oWBjDm3Bz+E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxxLHEZZNfdTnns4Vnk0GmctQDRC5W/TgMEzeyN16VdjCaaD0CZ
 GX9uxz8wsHX8bDifjhVk4+IIr4QY9Xpq/fUyvDUjFnSO6p/dMZQwGcjIGPEsYlLlBn1/7PkDAbv
 GPMhS5EHd4D/Dar/STTsdxplBfUOVRk0Hy2wBuzIDBTIXjkxIJsGVDQbXKIm0M+fOaGfiDrU=
X-Gm-Gg: ASbGncs/zN7+eT8uZ/JE/7MOv6N3M9eFE0hfRfXtbh/Upt1NmKKIAEPiiiv4uQ5LmXW
 TQnPxF81x1SqwTYptdDctVfbZB30iDgyY1DOdL3XZ2X9HcdWIFrSBuDVnLP11YkPil6vLTACwhI
 jsUrE5Nm3x0LVrQSBPRN+6LRWYsbXzGQmdIa8wuf2E5s3QkN/Ntawyn4xvpEkULxV6vQtp40rg3
 WopzBDYuoa56qxZqy3j3U6s3OBsaILl2v8FzjrigKJZSVt2tOXJNHO+M+m/UUCNR8SilF56fEM9
 tDFmrfanjFo5ciK/VlxK1l+RbabZ8oQuXfzM8Iq6SSVcR/jC0B68oESlPgtq3yGfr5vPWza0N/v
 IHDJK4bJ2Gfh/pGLzh3tpa7QMaOicyL7/yMtkoL4z+FsqKfsmJRwv5/lq5wcXuH9NIQ3lN34rpS
 ZmAMdISVqnanY=
X-Received: by 2002:a05:6122:3d05:b0:54a:8cfe:193e with SMTP id
 71dfb90a1353d-5564ee5fc31mr2779093e0c.5.1760889749462; 
 Sun, 19 Oct 2025 09:02:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGX12e9u2jTwAw/ohWphMrO/Z/+CwpFfiWoBiRqZoykAWDjj50XtmQqV9+4tCn2aAkVSr9v8A==
X-Received: by 2002:a05:6122:3d05:b0:54a:8cfe:193e with SMTP id
 71dfb90a1353d-5564ee5fc31mr2779046e0c.5.1760889748963; 
 Sun, 19 Oct 2025 09:02:28 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-377a9578a51sm14051151fa.42.2025.10.19.09.02.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Oct 2025 09:02:27 -0700 (PDT)
Date: Sun, 19 Oct 2025 19:02:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: xiangxu.yin@oss.qualcomm.com
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 li.liu@oss.qualcomm.com
Subject: Re: [PATCH v4 2/3] arm64: dts: qcom: Add DisplayPort and QMP USB3DP
 PHY for SM6150
Message-ID: <aruuyvtzi2notuxdoi6mk45y3zybu7dpttpteqrektszkhh4hw@uipxhhy5nar4>
References: <20251015-add-displayport-support-to-qcs615-devicetree-v4-0-aa2cb8470e9d@oss.qualcomm.com>
 <20251015-add-displayport-support-to-qcs615-devicetree-v4-2-aa2cb8470e9d@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251015-add-displayport-support-to-qcs615-devicetree-v4-2-aa2cb8470e9d@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: AVhdPkDvpCJTg58jT-7lMngLBP76H2dK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAzMiBTYWx0ZWRfX/9g6srFyzr+Y
 FDnYDMbYoDRakkbTlyVj27CILBQWINOsWUEuGmrCdqdlJJcdqPMJUOkR1noqv+jxKO8GB8F0yM7
 pKu2eaCfCYCarLKT3PzQLg0M+nfSzkBBsPi/Tm5/nEJ+TXFvH0Rxjvv1ZxrXOi+w2Y+S7lZGtu3
 WJl6FLPhFLERKd8HrTBY/QdDY66LvD3niNBS2Z3MttVsrAr3ZeHENqoGrtTTIPrdsWiBVG9ah0p
 mXklc1Jumcgrdz88f21wLJqxBiTkPQqx/Bb1R9AIr7ULQGSuq7xnh3PE52Eyjd/PB97r1wKLlqC
 rK5qWlj4eDTIs7j6momlGMurhSuQtyMGstzKFz/p7NSqKHiryb5+70cVry1ZEVYAQ+OswASX9/0
 pjeVjue0zDjDHzNdYjxHxssDZ74EpQ==
X-Authority-Analysis: v=2.4 cv=U8qfzOru c=1 sm=1 tr=0 ts=68f50b96 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=jqVs4JzIjkIIVyEy1LMA:9 a=CjuIK1q_8ugA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-GUID: AVhdPkDvpCJTg58jT-7lMngLBP76H2dK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-19_05,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 spamscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180032
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

On Wed, Oct 15, 2025 at 09:53:19AM +0800, Xiangxu Yin via B4 Relay wrote:
> From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> 
> Introduce DisplayPort controller node and associated QMP USB3-DP PHY
> for SM6150 SoC. Add data-lanes property to the DP endpoint and update
> clock assignments for proper DP integration.
> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sm6150.dtsi | 113 ++++++++++++++++++++++++++++++++++-
>  1 file changed, 111 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
