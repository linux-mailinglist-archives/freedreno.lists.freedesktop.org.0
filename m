Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A5ADAA87B5
	for <lists+freedreno@lfdr.de>; Sun,  4 May 2025 18:13:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EDA610E27E;
	Sun,  4 May 2025 16:13:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="KmuoZrem";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21C1710E27E
 for <freedreno@lists.freedesktop.org>; Sun,  4 May 2025 16:13:44 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 544FFrUL012959
 for <freedreno@lists.freedesktop.org>; Sun, 4 May 2025 16:13:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 VqRNS/AP2L0HYV/XzQMxzhswyBS2iB5hSp0sUNl5kjs=; b=KmuoZremEiorgmv6
 hZ8N2J1KRhkxb3L9zQJbG+Vwnt1Ki+ZvBh8uLNPQ3LzBeVueVVb2dCfIsvhQ/T/m
 ZXJs4Z5p5W5H/Q3Ikmk4H3EjF5dSmGJ9aI1NU7zXqhBc/uIDsa088TteaElE4RQX
 dc5iUulHFfafIrOBKhwzXy0gWXSUTDXJAVTcJ7/hmrfWe31Ij7qU6WHk9ARh4DJJ
 jkGwtA4HS8orNBfiW9BB6Jlf61e9njSAzEl/fppwE6QYxxMiqFlTgtK+BgRj7t7A
 8RmJOKvzpLGK9aSIzsvkgX6a25X0wk+5fjH8OB7ouNjlbj+CoMsbTpCCQmmkuv/7
 fS1NCA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46d9ep29s3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 04 May 2025 16:13:43 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c5750ca8b2so5221285a.0
 for <freedreno@lists.freedesktop.org>; Sun, 04 May 2025 09:13:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746375222; x=1746980022;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VqRNS/AP2L0HYV/XzQMxzhswyBS2iB5hSp0sUNl5kjs=;
 b=hMZWzK2mT1OqyOZL+2dIlS/Qc8hfPRd5muGfrLVBYCT6l6qNGMUf/JBqUUrDu6DtwY
 9R4xKqeSGcaS2Mu1CIkEGxVX+pey7jiTos5RpSphJwaryND3UAUz87yUdRrQaWHcaKPy
 6tZ3DsrQhBlNkJVFaIAwsw1LjoBVUXALxmqR74Y+hfSsXZEqktgVZctnEKV/JsreG2Uv
 XZJFtjYm7AYczgtca43ZX5JcwcqDe/wL/HpRflG5ZgpIUJXJxYrVeeAXZqvkm9r//f+Q
 kOF9ZwwYVuH4Dei5Akhkdm7VorOfa408xt0+HFAxEk7kgZM/ybGUUhO9xAmfFUAkQDqP
 I/kw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/zoqefa8lu731Go3Uvpq7YWG+Bz90YbULyfEkgr1/zM5PoaCd+vPZWRdT2VM/Lf0zX98GEiujc5A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwSUVveTABwWfO6ICq9gAtHzT+B1EayUt/NQHXw2TZSccl8LD8c
 sB30dViqkZUQTfpodsAz8WUVoIysdVaq7i3Yp2XWEZcywwk5CW8HCcuvWG6gI2EkKaoOCYLi4Qr
 ggauKqK1aoIzt+zdg4HEGyGJYyNKoX9hcorH6VMomueaO7O9P62lo5EbJKRay2IYdljY=
X-Gm-Gg: ASbGncsGxaTgTEdPPmP5Uc29OebPNcKWBmSd7DPtR3VZNhmoA18JH/Iqp6DBFEPLHIJ
 oA3mIqAyhvRPY+3ctN617S2hGcrtdfxrDzrgrouLvAgPnJ2LSkiVFVvpkIiFnxsl1v+bhSiURdz
 7kfqX4xk/lRlkoIBM1tt0enTcCWTqdZ3rKztDBGuCWjBAqJl2mggbgeziejtlAehrxuq8ebRnK5
 wwnlvpyQ1gbDHHx5L+SNYVZco61UyDRCnNJrqV7JA5hGwGbHDVhy+Wad/nJZ3xKYDrfjS4x8pDr
 zW1DSr3KLgR1fI+rg4yW07sUpGlvcHOWrR0isFrF2MfYpgnM9u4CKMbTdaDaX0m9UfJwmaDBkaD
 B2SEt1kU4QGRWzu+kr3nFmPdg
X-Received: by 2002:a05:620a:bc5:b0:7c5:a29e:3477 with SMTP id
 af79cd13be357-7cadfeda15emr898764685a.53.1746375222404; 
 Sun, 04 May 2025 09:13:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9jh4HRhFrjaplPP4DWWTXh3MXHXCDhI5cVsnoV7jzD3rgGA1I0X5J69xbTqyP4ckpUfqShg==
X-Received: by 2002:a05:620a:bc5:b0:7c5:a29e:3477 with SMTP id
 af79cd13be357-7cadfeda15emr898759485a.53.1746375221999; 
 Sun, 04 May 2025 09:13:41 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54ea94ee937sm1335231e87.142.2025.05.04.09.13.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 May 2025 09:13:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>, Bjorn Andersson <andersson@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v5 00/10] drm/msm: add support for SAR2130P
Date: Sun,  4 May 2025 19:13:24 +0300
Message-Id: <174637445761.1385605.10286310480029078025.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250418-sar2130p-display-v5-0-442c905cb3a4@oss.qualcomm.com>
References: <20250418-sar2130p-display-v5-0-442c905cb3a4@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=EOUG00ZC c=1 sm=1 tr=0 ts=68179237 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=iEGPaXCqe01J9_RIJz0A:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: wou_iDeiGyTyNv432mgnLsvd3nrIC3nQ
X-Proofpoint-GUID: wou_iDeiGyTyNv432mgnLsvd3nrIC3nQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA0MDE1MiBTYWx0ZWRfX5D5VeBHD+LBl
 LWcMO0Xm5A1u7HLgdxAHXRjFKJ/4TsRkDe6nj6HBGp5CSmSqe9y783MciBXil14GTTnbNopmfzf
 c9czUT7IB6+QqRfxGgEv6gRAOOZ9PFsp94+AmoZ8v2zd/wkXcja4k/IeWnze2QRXtTvNq5oHusT
 JyNxn0y1HDGajMm21m4CgdG14TRYMuF+VBa3tuR6GlTsBsBZzK6YmoE95cIClf8H8by9o1wfiIf
 WzfKI4hBHDxtcrOG2JJQLDzAGJ4rD0ToR/aeoqIlfa50brCyY9qyCrTDCWnLrGLnsC3hhSMUVla
 lU670qFzgghnP2xOTzl6fOWuiRq+l0OKzCWwHGZcCNm7xZ8ch+N4jio8HQ2YRfppWd8SaivYDNp
 ugB06IpUs8YmBzoNRPAxLqO0mM/r+EjGtUV/SRBTYIHlwjvU3ese0n1X8C/vDwqovziH5FYj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-04_06,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 suspectscore=0 mlxlogscore=888 mlxscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505040152
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


On Fri, 18 Apr 2025 10:49:55 +0300, Dmitry Baryshkov wrote:
> Add support for the Mobile Display SubSystem (MDSS) device present on
> the Qualcomm SAR2130P platform. The MDSS device is similar to SM8550, it
> features two MIPI DSI controllers, two MIPI DSI PHYs and one DisplayPort
> controller.
> 
> Note, due to the technical limitations DP controller wasn't completely
> evaluated.
> 
> [...]

Applied, thanks!

[01/10] dt-bindings: display/msm: dp-controller: describe SAR2130P
        https://gitlab.freedesktop.org/lumag/msm/-/commit/b341da1172fe
[02/10] dt-bindings: display/msm: dsi-controller-main: describe SAR2130P
        https://gitlab.freedesktop.org/lumag/msm/-/commit/3c70c9d0a99d
[03/10] dt-bindings: display/msm: dsi-phy-7nm: describe SAR2130P
        https://gitlab.freedesktop.org/lumag/msm/-/commit/262650e71854
[04/10] dt-bindings: display/msm: qcom,sc7280-dpu: describe SAR2130P
        https://gitlab.freedesktop.org/lumag/msm/-/commit/759fe7181723
[05/10] dt-bindings: display/msm: Add Qualcomm SAR2130P
        https://gitlab.freedesktop.org/lumag/msm/-/commit/3096209b7a62
[06/10] drm/msm/mdss: add SAR2130P device configuration
        https://gitlab.freedesktop.org/lumag/msm/-/commit/1e7cbfea6624
[07/10] drm/msm/dsi/phy: add configuration for SAR2130P
        https://gitlab.freedesktop.org/lumag/msm/-/commit/8e63b2075e01
[08/10] drm/msm/dpu: add catalog entry for SAR2130P
        https://gitlab.freedesktop.org/lumag/msm/-/commit/178575173472

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
