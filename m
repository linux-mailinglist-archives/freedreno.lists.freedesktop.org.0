Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53022B54B77
	for <lists+freedreno@lfdr.de>; Fri, 12 Sep 2025 13:48:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2842310EC26;
	Fri, 12 Sep 2025 11:48:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="UvQWuptq";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA1CC10EC26
 for <freedreno@lists.freedesktop.org>; Fri, 12 Sep 2025 11:48:00 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58CBBR7t017560
 for <freedreno@lists.freedesktop.org>; Fri, 12 Sep 2025 11:48:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=GToV4QE6cCKItMQsLrIeSPhG
 neO7K5k2i2q1jGRtV+I=; b=UvQWuptqKdBsydqZVnOxBAy2NHjQMB4PcIhj2s2J
 hP5GPM73YQX3/bjE5eZENftiDyxAixdB0O0kORIFVnWbNcel7vpUsB7I44qnUNeZ
 NepM9rpBTdNPOBDUc4r60Nfc10odNSPIYR2Mr6V35b6He5QVTRMBKARIJHv/83TL
 jvGUlhIaz6uMhi0xU5ftuM6X+JgGzW45ctb55uf7DMhF5wESOseibbdKRq0/LgKo
 KpLeR3ZDWc9YxuJUof2mr5zf7WIn8eO6GdtTCy2Fh9qBvSChNarq2nDlI/5BzSwv
 tSNjHnIkxYu+YKkA+aYUhfj9eWVMHmWHPpYDUTZYEe9wQA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 494jdx034e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 12 Sep 2025 11:47:59 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-7654126cc2cso29319666d6.0
 for <freedreno@lists.freedesktop.org>; Fri, 12 Sep 2025 04:47:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757677679; x=1758282479;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GToV4QE6cCKItMQsLrIeSPhGneO7K5k2i2q1jGRtV+I=;
 b=oec0CjGs9UysKWuW+Di8rFkfw5vKmJzGdisbKa82hFOj6FYESHAUaCizUdaf1NysDJ
 NQthLxRE+kY/SKdxBb5gyPStbIpefxJpV/5jYffYdoLU1+7UbgrQ+5k1H7VPGZAy2e+f
 Va0o62FdcOZgKVyEkYDrXEtcX/Cdmg4mgoFuulPzbKadfuju6xFAuH1QzGFyaBRSTdCK
 mAcIpxKL5e3J+vOLZS0/cAw8ArNqBna2+4ssARt6vFqGtPmCdexFokDYIzsfbnsZ/xc2
 dRi3DxuUzkwiNCaCuoM/100e4tvoSv6Wid19rHIgc/5u9dszlOMhJFrZMuLlsYd5274N
 YPfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXt5a/alqhpUMnLo8IkVEiwITIbTpjaCK34eCCDLKiTWGhRH0oZKpy+KLcIWXiYGpVpTQN9+fW7A6A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwWCh0602+LZ2y0XXXZCLYEpJgIlde4CeR0+qfEQDyVdhqw+UB4
 QlZet8lBQYhRLEaGDwlR+u7mTINCMR1dGb1HuxYOa1LIi+g8xxrQ8tlN3r6ASmsxpXGk7pjkfyC
 Mq2x9L/aKtnveWVEAsZ4bXKwrn4p7hvzLXKpywzAHFIzyZOvN00u8QzAm8dUuW/Ez01OGAsQ=
X-Gm-Gg: ASbGnctZZfQEy7bH1GLHHS2IzgtpDufoCUksCFItkFmRaBSlwRVB0i94P0QKKuc2gmF
 wt7KhUo/73jndmJZ35MgAtHsEf2DPGAwI7hK1G7LZkNSnxX0pl9DhYZCYpx/MRET5AkuG4vyZ7m
 reR2H8zX9jmv9QTKRRiCYPy64kW+5LtFJALCjGFKuYBbopnt0lMYzlkIWJuuvRHacIBDJ6wqqjV
 Vj9ByT6+PbS9scoVGCfxza2248b5wAMra8GfQMcPPKtkoJXWDstf+P2aLVX14uIn+f8A/qId6HU
 9mKKiIF7k89Mnh1yod+ic9+EqgC0/mLVlRCxk00eznmGrScIQsucSZ5IWTXuv8VL4N+V7OvR+Mx
 VQmBN3g0BGgxz0x0yqOktkaUeFMZEJXmI2b7VfxVL2qFfuw/uEow2
X-Received: by 2002:a05:6214:2428:b0:715:94ad:6add with SMTP id
 6a1803df08f44-767c3772553mr34660606d6.47.1757677679085; 
 Fri, 12 Sep 2025 04:47:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOipAh7umVQHV6wn1IWs32WNBot8nat+cTmZungdIIqqFVBnoEtURSnSYREkpzlbIAflY9Sg==
X-Received: by 2002:a05:6214:2428:b0:715:94ad:6add with SMTP id
 6a1803df08f44-767c3772553mr34660316d6.47.1757677678632; 
 Fri, 12 Sep 2025 04:47:58 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-34f1c014cb1sm8425911fa.62.2025.09.12.04.47.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Sep 2025 04:47:57 -0700 (PDT)
Date: Fri, 12 Sep 2025 14:47:56 +0300
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
Message-ID: <budeqnh65mcmtc5rscbgvy2nz3woptxnht6sddzg7jhttsnx5f@bwf3kyvbrfaj>
References: <20250912-add-dp-controller-support-for-sm6150-v1-0-02b34b7b719d@oss.qualcomm.com>
 <20250912-add-dp-controller-support-for-sm6150-v1-2-02b34b7b719d@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250912-add-dp-controller-support-for-sm6150-v1-2-02b34b7b719d@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEyMDEwNiBTYWx0ZWRfX+LFYdZ/znp3y
 GZ3Ca/jA32j7eylDd2Bx0rwBbPdjFy1EGs7159ZLFm/sRmXOMQcLaNxjAqQPlalX8LRwwkXvcm7
 8nmTJ8Z1sHLliCeP8fJqn7H6Nvj4beb+9jM8OTLJB4BL15h7H/1QSmw35hvenFSVpqzTTFj/N26
 KdTsL8A6/Mo09ffTVY8pR9yj9xbPFnV9MPmIjOEkGwx8l3Kb9LiOoXOfuzCKGiVRfHvRIHYX9S6
 uW48h2YsFCnlkA7ZP/r6gEuz86VHCvwaQ+YepPZECKW35zGgPPF6ZklZyKmFpJbrtp2HHe7Qrig
 wSPMjJuybxxS+4lMPmu6NggnWW0UxHsFjG8TpBGlCQCOq9jQ0Hz0lVsjI+mor7u4/jZaFoUx/jC
 GFZZSZuv
X-Proofpoint-GUID: -8bJpyiMP318ygTxWYM0mkMTAVYRcKhz
X-Authority-Analysis: v=2.4 cv=JMM7s9Kb c=1 sm=1 tr=0 ts=68c4086f cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=2HRO-YaP1JHyyBiP0YUA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: -8bJpyiMP318ygTxWYM0mkMTAVYRcKhz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_04,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509120106
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

On Fri, Sep 12, 2025 at 07:39:17PM +0800, Xiangxu Yin wrote:
> Add support for SM6150 DisplayPort controller, which shares base offset
> and configuration with SC7180. While SM6150 lacks some SC7180 features
> (e.g. HBR3, MST), current msm_dp_desc_sc7180 data is sufficient. Listing it

SM6150 supports MST as far as I can see.

> explicitly ensures future compatibility.
> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index d87d47cc7ec3eb757ac192c411000bc50b824c59..ddb22b50490035779904d4cab20e2fee7e0f9657 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -196,6 +196,7 @@ static const struct of_device_id msm_dp_dt_match[] = {
>  	{ .compatible = "qcom,sc8280xp-dp", .data = &msm_dp_desc_sc8280xp },
>  	{ .compatible = "qcom,sc8280xp-edp", .data = &msm_dp_desc_sc8280xp },
>  	{ .compatible = "qcom,sdm845-dp", .data = &msm_dp_desc_sdm845 },
> +	{ .compatible = "qcom,sm6150-dp", .data = &msm_dp_desc_sc7180 },
>  	{ .compatible = "qcom,sm8350-dp", .data = &msm_dp_desc_sc7180 },
>  	{ .compatible = "qcom,sm8650-dp", .data = &msm_dp_desc_sm8650 },
>  	{ .compatible = "qcom,x1e80100-dp", .data = &msm_dp_desc_x1e80100 },
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
