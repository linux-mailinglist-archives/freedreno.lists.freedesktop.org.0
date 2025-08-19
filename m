Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 271E5B2BB41
	for <lists+freedreno@lfdr.de>; Tue, 19 Aug 2025 09:59:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F419510E545;
	Tue, 19 Aug 2025 07:59:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="AxHxocTu";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D928B10E547
 for <freedreno@lists.freedesktop.org>; Tue, 19 Aug 2025 07:59:36 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57J2RDG7025345
 for <freedreno@lists.freedesktop.org>; Tue, 19 Aug 2025 07:59:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=3vU6X6UmptKEeubZXKONa3UV
 WPBKyO0rvUIh820/nkI=; b=AxHxocTuLdMKi6qPApw02H8p2uKc9/gCfFXp6JIk
 Wxrg9EWZNdMQHKdQ/GGv2JYKe7qTS8dWUR+Rtq93OIlUSzsxpfRzW3p3XtVepfcX
 JpVfAr7f4hw1dJaVE0fuIuL6Na32UrtXQ1xJPFyzQomZHGJ2ialZ88e659HAadkN
 LPlO8t4dh/z0HIlDM/3GgStv0OZoihhuG0ZlG/jvLX0V4dDByjjU2F15jWqb5D7h
 P/JPGcAxltYQo8Y1D+X47NJx3vaEa7Ij643UlrkqccUo0l/EoJ/d1n//w26XENCm
 PF0mlMyRL+L94jXit2BEne4DdAtI+3tEKqM9ks2bk3fpAg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48m71cje99-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 19 Aug 2025 07:59:36 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-70ba7aa13dbso91678166d6.1
 for <freedreno@lists.freedesktop.org>; Tue, 19 Aug 2025 00:59:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755590375; x=1756195175;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3vU6X6UmptKEeubZXKONa3UVWPBKyO0rvUIh820/nkI=;
 b=BCbSRO4VCldkrVdRLx9sjq05mtOnDKNoS2T28fHDe+ZBLkC2Yywgs4O0Dj7aovXVB4
 9Rf1S2lrZMjJSrkrb0T6WO93NejPCHX+eYzpwOBwa9Kq7FOOmRtKAj8QGEG3Q0Cfv9ch
 q5rEvb2iqViitUoxmAzTbGG/afIBFRe2scydmZTqjisY5eY6lEu7y/pNBxd8LIjI9uoP
 UATGrWkThGBEcRLXcTpXeRvEfPstlCgOIG/vMyTq2znHcdXEgach1DDi1rx4NwCFxh3H
 J9qOhAsGh3e5/CkjZUNGY8HpbrpikIo7pdkM4UyhlFVOI29FmhPA4zxEWjKtjfwHazlh
 MSyA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXDUDkHI+CV6s9YhpTqIK67k7qGEK4GGQv2cHOvSRIqBjzub0rJXkKrwUvmrgCoZ2mEhYmsdx4vddk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyXplmFaoXru6vVZkfQ7CR92G+aT7CtI5mBrTB9jYDRBV4bD3m9
 OexdPgB5RF9PGu3vNVLVoo80wovBk1C+lpu+xKI4HKh+Fxbznbq7ZHJaq2cHhRef9GlQl3cEbGi
 WxgIstlaabTpocBrGIoncXDRuCH20gatdiQV2ADKqi9Pk11rk4R78q27z8BvNyS0gI28WZL4=
X-Gm-Gg: ASbGncst5tnnKmppdae2L9Z4Zff3l7OOWm2CQuPEhGnrp2zan5tpJW+J4S2MVzSwc7J
 JiXK4whZW7wOzCyBHewCRPx5mELzdZpFj912KVUpAcOL5UEQW3YxbQpUvsheoNi6wyg9VxtshSb
 VikgUAfwlwS8/UjacyxKt00vZx0U7bxFlSddx/+Q1Nf8ep6PfvB/KEaryPwcASKuy4+im7BtRqQ
 zUGfJxLpH51j71oRZcHdA/Juu76qFM2Lxy5Q5uGmD0sPdfkLR0Dr7Oo42a6URuacY0yt+JgUagA
 3hgnZJ3k+RUihNte3MFhl0LHFgZ4UvsTHo6s0LyMvM07oeCsAmYz5gPf8c8jn85FGMAII/uwVzq
 XfLSGcHoDLxGb24z4RJJMic95C5wXPgniW5YAyqIh+bq6tz/SLyzF
X-Received: by 2002:a05:6214:2249:b0:709:8742:e46e with SMTP id
 6a1803df08f44-70c35c1f06amr21420576d6.45.1755590374892; 
 Tue, 19 Aug 2025 00:59:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHiMVGZQHvFNLcaq5/1TlbULCLv9YgylRXF8bOeajYtu4DRaeBUMTeUknrqEQR/YcjE19k0Pg==
X-Received: by 2002:a05:6214:2249:b0:709:8742:e46e with SMTP id
 6a1803df08f44-70c35c1f06amr21420206d6.45.1755590374394; 
 Tue, 19 Aug 2025 00:59:34 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55cef3f3932sm1968059e87.109.2025.08.19.00.59.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Aug 2025 00:59:33 -0700 (PDT)
Date: Tue, 19 Aug 2025 10:59:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
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
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 6/6] drm/msm/dp: Add DisplayPort controller for QCS8300
Message-ID: <brculyyu3dgc5nkj2cuzv3jkjzcouljy5o4jwr6mw33r6i7gt7@j6ur7yvwmky5>
References: <20250819-qcs8300_mdss-v7-0-49775ef134f4@oss.qualcomm.com>
 <20250819-qcs8300_mdss-v7-6-49775ef134f4@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819-qcs8300_mdss-v7-6-49775ef134f4@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: shXNqgWNRHIZjhZHwxYZ3MxeOrVGw5Wb
X-Proofpoint-GUID: shXNqgWNRHIZjhZHwxYZ3MxeOrVGw5Wb
X-Authority-Analysis: v=2.4 cv=IvQecK/g c=1 sm=1 tr=0 ts=68a42ee8 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=Yr_zk0diUUozgDP3y_gA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE4MDE0NyBTYWx0ZWRfXwCQrE0Jhokr4
 u3/WIsTPNWj63n1N3TaIhJvwt6jNYx1nMraGIN+AoOYl1fRleAFbh6OOJ/KfwKAQWwjX9Q0Cy4y
 cT8J7+IHL8lEO7XhSL7P9yz2G+aOex2Qri6vzkJ/VHw8Ix2flXxIFMYzrbM5CiH4mX9S99L13RR
 8FcrP8OtTXUPJKHz6UOCcvj9E4xGkZTLvlWr91BAs1EHoaDOgo7e7iBSWxTwnL/7oSjDhJIpQv1
 1wYc4ii9fooAUOuykZd6tO2tpfwGR7l0yNAZG5mcTXJKTkVhZT5EElSablVihv0lXlJupvd/i3p
 moKYU4+V+oqYofVbazQizRo6/jMJ4lG4ID/EnpRMM4SblMWJzblMI3FONNs9zgwGq5qDDxk52pb
 cR6Jt2cN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508180147
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

On Tue, Aug 19, 2025 at 11:33:33AM +0800, Yongxing Mou wrote:
> The Qualcomm QCS8300 platform comes with one DisplayPort controller
> with same base offset as SM8650. But it requires new compatible string
> because QCS8300 controller supports 4 MST streams. 4 MST streams will
> be enabled as part of MST feature support. Currently, using SM8650 as
> fallback to enable SST on QCS8300.

Hmm, no, you are not using SM8650 as a fallback. You are using the data
structure for SM8650 for QCS8300. That's a different thing. It would
have been using SM8650 as fallback, if you had declared device with two
compatibles, qcom,qcs8300-dp and qcom,sm8650-dp, and then relied on the
second entry (only) to provide a match and data.

Exactly the same comment applies to the UBWC patch.

> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index d87d47cc7ec3eb757ac192c411000bc50b824c59..bb4660585849d1a67921a28e7e12422e0c327ab2 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -187,6 +187,7 @@ static const struct msm_dp_desc msm_dp_desc_x1e80100[] = {
>  };
>  
>  static const struct of_device_id msm_dp_dt_match[] = {
> +	{ .compatible = "qcom,qcs8300-dp", .data = &msm_dp_desc_sm8650 },
>  	{ .compatible = "qcom,sa8775p-dp", .data = &msm_dp_desc_sa8775p },
>  	{ .compatible = "qcom,sc7180-dp", .data = &msm_dp_desc_sc7180 },
>  	{ .compatible = "qcom,sc7280-dp", .data = &msm_dp_desc_sc7280 },
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
