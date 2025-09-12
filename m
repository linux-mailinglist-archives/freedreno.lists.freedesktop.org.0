Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D75B54CA3
	for <lists+freedreno@lfdr.de>; Fri, 12 Sep 2025 14:10:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CA1510EC34;
	Fri, 12 Sep 2025 12:10:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="mDZ+sMVz";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 560E410EC26
 for <freedreno@lists.freedesktop.org>; Fri, 12 Sep 2025 12:10:09 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C9fLnF015465
 for <freedreno@lists.freedesktop.org>; Fri, 12 Sep 2025 12:10:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=dUewbymExetqos/pBiWHZiBD
 APIskSwpfO+nHDhO8vI=; b=mDZ+sMVzzT0+YVrLCIiX+PhRLvmJOSfFfErrhw04
 m6AdFsZDmcPt0Obm6ckzfWx4Q1aZ5+S4nMGWp+miK4xCgs5METyJJPCetrGb1hy4
 +UiBpuZQR8xqIlvMCmrq6SANVmDRdwdAnkOEtTJSEuFEb1BfJM/LJq0hyjPNc4H5
 tNPyF+h1AVv7BmcAQYO97RKAKwZbiuj/Y7CfN2Co/OJz6LGNPURlDJXr78NYKlb4
 Hul7VxkCW05y/MIGDcpS60WXLZmFOUPfsNqoq4jPLFeOmYLJxbBwJZfXxMZUG8iM
 Vrrq/6Nj1dg4sWApmDsmlbdnIwHXY61EDnwe65LTxzYACQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490aapuucd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 12 Sep 2025 12:10:08 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-767e5b2a74fso9557416d6.1
 for <freedreno@lists.freedesktop.org>; Fri, 12 Sep 2025 05:10:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757679008; x=1758283808;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dUewbymExetqos/pBiWHZiBDAPIskSwpfO+nHDhO8vI=;
 b=JF309+Av6tYXNEjqROiClOsqfijzPjrVWD+HbdgkELvPzpbcxQaORtgadRvzqBG5E6
 lJgtx8bcbb6pCGU0RM+6FfYpwkTyDwBFdOjR+MJsmVXN1aToNkSHzBI5A5/NnKwhLq2o
 tax3pKG9zmw2j9SC48FK/2nCIeK+4PzwTCvUgjLWhod9WcWPmk/xWQ/pGb8a6Ejmw0DR
 9UCx7q00iHF357YSVamAdT2AxLM1HAfezGVyqxqGMCOU4Ek2xpJm3ZL8sQiz1h5PN3K2
 MKLtUhkNqfRxMW+CjVhmyelVdeHank3nNUK3xOSe5xSGtL4DGp3vyn4dR4IO+qE3DUbm
 GEKg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVXiISgRY6Wn//zitttU3LU+hT7sCWWh5JeXu9FlUAdCydXUD2RQSUzIgAXAZ8AOXjlSSyqN3nBrM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzRFEjpoVHJNytzmbgcnU5GdGOQklBRuNdicQk/4GQDFoFibA0E
 pXEAQ1Tz2QklbImLtdWFDAvECItQh8OWhsZ3zQIXlDUD4F7cHkF1Ue5ANUjQW6raBX7reBVl8Ea
 kNNjd4Eg1tHy47Xp7n60XQo16ZexaZx5hd6O3pDtFoWuAt7QJUgoNC5h1NbqxxcGPsLzN4TY=
X-Gm-Gg: ASbGncv2uAFzyWgXuZEe8i03V5lTN9kDwDSUAsczMOnJ1BzD0imgYnLBrbai85nGst5
 9h7MEZvPQbySfY/tUBbMxQbKvV7ocWen93Wgid5n/jx2k0KqOp+rYf7tlUdU/S0cSgtQ3IvNZor
 j+Wflg+v90dvWJSxfXx96nrEJ9MIlHD0Z38aG3mq98jgQgNE+p9x+GtSqTFsrpM38Tt8qe4NYiy
 iQ/i2I42rh7Sxegv/rQHbOkpIbOlXn53/4MK34MMEh6RaofXZlmUA624aKgHOQelIUe1o/86HsU
 6PH26US9s2rFPfZpFZFiPBSvjbUDes3gp5lFDEXRpC90yEeDLXlXDh8qpPzhqTjl/ZI4Ileg9Ns
 0MzFM4X1TrDKmnsQ7oMV0/quU7+v3boh9Nj8LkUuaxSOYRwQFv5qq
X-Received: by 2002:ad4:4ea3:0:b0:70d:f55f:ef97 with SMTP id
 6a1803df08f44-7621c32efaemr78241926d6.1.1757679007388; 
 Fri, 12 Sep 2025 05:10:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGj9V1c+2coOy5S3o8/s5vrGQ5oy6OiMW/P7QJhRZCoPuqb8GRBAOCSvwHquRJ3YcZvRDvPSw==
X-Received: by 2002:ad4:4ea3:0:b0:70d:f55f:ef97 with SMTP id
 6a1803df08f44-7621c32efaemr78241266d6.1.1757679006733; 
 Fri, 12 Sep 2025 05:10:06 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-56e5cf2f446sm1136422e87.42.2025.09.12.05.10.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Sep 2025 05:10:05 -0700 (PDT)
Date: Fri, 12 Sep 2025 15:10:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
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
 Conor Dooley <conor+dt@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 li.liu@oss.qualcomm.com
Subject: Re: [PATCH 2/2] drm/msm/dp: Add DisplayPort support for SM6150
Message-ID: <ds5fisf464z3i4b6hz2ca2ul4u65d4rmjzvst5plfvdwywo2qm@gzgffhfpp4ib>
References: <20250912-add-dp-controller-support-for-sm6150-v1-0-02b34b7b719d@oss.qualcomm.com>
 <20250912-add-dp-controller-support-for-sm6150-v1-2-02b34b7b719d@oss.qualcomm.com>
 <budeqnh65mcmtc5rscbgvy2nz3woptxnht6sddzg7jhttsnx5f@bwf3kyvbrfaj>
 <d9c55e72-0683-4eb3-a22f-015a799e2c79@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d9c55e72-0683-4eb3-a22f-015a799e2c79@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=eMETjGp1 c=1 sm=1 tr=0 ts=68c40da0 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=YvU48llmxf4k0NmX4icA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: tgyxQoVA9-DbB8o9VITVk4pSA9bEl6_o
X-Proofpoint-ORIG-GUID: tgyxQoVA9-DbB8o9VITVk4pSA9bEl6_o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAwMCBTYWx0ZWRfX43GCdm1edVic
 7OPmWf1s2Zw3UBCTbNsNk/RHwOuJg5ubJvWOzj2GYl9IKU4HdPjFIahfepaWIg6F+ijAlrYwoDH
 J9bC2pT2sPBEf9F5uSiDp3s4W9CPuElJR1gzd7FlFczVxOA4uTir0pd93yyBERhQSdRorFLXwbn
 x07U8Vj3OyX9d+z1Ud5kKMsIgOGoOCjUJ6Kla1jHcg9kci28kKYge4Gf6fAMr6+sISRIKBlDR6m
 wxmu3X7dwNLMQXPoMsKokX1pBLp1T8CWSO/lnokmGQmeI50nz49hoR3iKm6CbRBteQIqF2yVtdL
 5UuYsxEnwroKnl4LRGYIW0C9smPgUXBXJQ9QpuEkqjTDaoiXtnvXsIm4qh66FNanzSOALWqaWGt
 bKsYnC7u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_04,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0
 bulkscore=0 phishscore=0 spamscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060000
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

On Fri, Sep 12, 2025 at 07:53:50PM +0800, Xiangxu Yin wrote:
> 
> On 9/12/2025 7:47 PM, Dmitry Baryshkov wrote:
> > On Fri, Sep 12, 2025 at 07:39:17PM +0800, Xiangxu Yin wrote:
> >> Add support for SM6150 DisplayPort controller, which shares base offset
> >> and configuration with SC7180. While SM6150 lacks some SC7180 features
> >> (e.g. HBR3, MST), current msm_dp_desc_sc7180 data is sufficient. Listing it
> > SM6150 supports MST as far as I can see.
> 
> 
> Yes, but since msm_dp_desc hasn't been mainlined with MST enabled yet,
> I went ahead and submitted it with this commit message.


The commit message is misleading: it makes one think that SC7180
supports MST, while SM6150 doesn't.

> 
> 
> >> explicitly ensures future compatibility.
> >>
> >> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> >> ---
> >>  drivers/gpu/drm/msm/dp/dp_display.c | 1 +
> >>  1 file changed, 1 insertion(+)
> >>
> >> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> >> index d87d47cc7ec3eb757ac192c411000bc50b824c59..ddb22b50490035779904d4cab20e2fee7e0f9657 100644
> >> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> >> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> >> @@ -196,6 +196,7 @@ static const struct of_device_id msm_dp_dt_match[] = {
> >>  	{ .compatible = "qcom,sc8280xp-dp", .data = &msm_dp_desc_sc8280xp },
> >>  	{ .compatible = "qcom,sc8280xp-edp", .data = &msm_dp_desc_sc8280xp },
> >>  	{ .compatible = "qcom,sdm845-dp", .data = &msm_dp_desc_sdm845 },
> >> +	{ .compatible = "qcom,sm6150-dp", .data = &msm_dp_desc_sc7180 },
> >>  	{ .compatible = "qcom,sm8350-dp", .data = &msm_dp_desc_sc7180 },
> >>  	{ .compatible = "qcom,sm8650-dp", .data = &msm_dp_desc_sm8650 },
> >>  	{ .compatible = "qcom,x1e80100-dp", .data = &msm_dp_desc_x1e80100 },
> >>
> >> -- 
> >> 2.34.1
> >>

-- 
With best wishes
Dmitry
