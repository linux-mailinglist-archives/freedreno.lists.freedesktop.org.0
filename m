Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A02CBA3F38
	for <lists+freedreno@lfdr.de>; Fri, 26 Sep 2025 15:51:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A80F10E36D;
	Fri, 26 Sep 2025 13:51:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="neWq3WgV";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4DFE10EA69
 for <freedreno@lists.freedesktop.org>; Fri, 26 Sep 2025 13:51:55 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58Q9kRJ9026087
 for <freedreno@lists.freedesktop.org>; Fri, 26 Sep 2025 13:51:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=oWhAI0VAdx5gJX6gdXCdFadp
 6xIz1oz4Ky85VfVuHlQ=; b=neWq3WgV5JI4jS54Rti1aBWRVmSsHiLpjdENlaOy
 aiev+6faw8XbnAb+BNkJ+ER+6bqiD9s7T1ZBkdHvP4xpP8xL3xv3AN3RU2GFU2hu
 NW9PtWZ/XK7Dc3Sq8PyMcubuolAHywNeg08RWb7yCjA8y/NmXxp7cSabAnuqU7Xc
 iSAjSRaF24g0R5qpedkpEfRI7VNKHGCnToKMTCcwQjK2hpCrdo2mWjA9wnHTqYud
 u+/LWL2kQPkggfppnPMnFgwlfaTCrS+jGjhHCir08k6A6NaN4F54+4pRoQJg0gOo
 etaN2og3s6jxRj2amO6wS91ATyezWhsrzEXmBDmp6DM9Hw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49drfwgnx1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 26 Sep 2025 13:51:55 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4ddc5a484c9so16744891cf.1
 for <freedreno@lists.freedesktop.org>; Fri, 26 Sep 2025 06:51:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758894714; x=1759499514;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oWhAI0VAdx5gJX6gdXCdFadp6xIz1oz4Ky85VfVuHlQ=;
 b=vcOGipmyHCBAeL9QBTmqmGZkEn85vlbsJiXXGvoBb23UgaaXHF5wYLYV3TdzkaCVCc
 RmjMf5/pNVnL1ydIjIkzzWAUo0SWtwGPS1jDgY96bKiiUnLy4TbMtmUCgO1GEUntKcCC
 DXnio7+45IRxyh8Dd7GoNSijaelIPvCDMimjBJ6H8gJ1DGomKlUo17hKr4pm2azZp93N
 2C8wSsXJi8g6MwMRjTuE+UK3ukqWwoJ3eyxm5ez6N3FbsDtW+IdgbnHokHE5aL0TrqKY
 22WvOaukrL/FlkbANjvTLz9SmFAHWDNY98U+IQmzPTS/xpA+zimMsWjNTkLvGH3HLMN0
 kV7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxK/aBonpxAcIA+JzVlj/h/K+jGbyxytc+zM6DMiAhGl+st+f2+WLDS562VE1TwCzt06FFab48uWA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz5qJUkiv7uh4yx8N32Z/31UsmgQbMv4wync9OrPcqOMhjF7gzb
 Su8Zu2TcRVek+AiwMTIAhOoM7+rQUpg2vuzLDpP9pnVjoBUxUCjX2rRxri0KIhR4DE6vgd4OetI
 1gKfXyHhwkUfj+x0yexnvh0M9ClzlSxeTpQsvuE4sg010A8oHDb3M0MojJ+/ygK9m15Tqd9c=
X-Gm-Gg: ASbGncuwT7IHzRdtcXMUwGgO89vWBm5lY0UE5bUxjxdneS/hqK7JpdtdVS7x7c3v9QV
 WssrU5oqiakmEypGviMBV5Q4sZCT3hmnCKoXWqmNKdAkHdq49JiNLIVvuPmnam59nIgLYQpO+hr
 zfgo5Qvn14Rf6uEiND9jdFq96YBHANiaMBTAMDqfBWtkbPZzsR30aypcuXLd6RC9vVso6UdqQP0
 Hf7nv4dR++d4RZBdRWsGpYxGuzmDOiJwc4RBQZNXkIvpQu3/jAgXGCslo2clQeJ+2NPIDpY9BFm
 YUn8B6wAH6A6oiDHwJLApBxP7cVPDxKIc1qLX354a0Pgb4VuyuEe24x3lQGfuAntr9P0I87sZfc
 OcqLtCxXdHcJRVlgAMRtvku9kIKgZKoQA6iLRopPlpDkkNTNCf3Kx
X-Received: by 2002:a05:622a:5a85:b0:4d7:c9d3:cbb6 with SMTP id
 d75a77b69052e-4da4c96e753mr94986171cf.72.1758894713509; 
 Fri, 26 Sep 2025 06:51:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE8YkJGYw1+CDemqZBbYI88MpytkUH1UcPY/ucGdfsLVPLTx/bR3Xx/PZiHi0DE/0nYLVZtkA==
X-Received: by 2002:a05:622a:5a85:b0:4d7:c9d3:cbb6 with SMTP id
 d75a77b69052e-4da4c96e753mr94985671cf.72.1758894712878; 
 Fri, 26 Sep 2025 06:51:52 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-36fb771029csm11547581fa.38.2025.09.26.06.51.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Sep 2025 06:51:52 -0700 (PDT)
Date: Fri, 26 Sep 2025 16:51:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
Cc: marijn.suijten@somainline.org, swboyd@chromium.org, mripard@kernel.org,
 abel.vesa@linaro.org, andersson@kernel.org, konradybcio@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 robin.clark@oss.qualcomm.com, jessica.zhang@oss.qualcomm.com,
 abhinav.kumar@linux.dev, sean@poorly.run, airlied@gmail.com,
 simona@ffwll.ch, alex.vinarskis@gmail.com,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
 quic_riteshk@quicnic.com, quic_amitsi@quicnic.com
Subject: Re: [PATCH 1/4] drm/msm/dp: Update msm_dp_controller IDs for sa8775p
Message-ID: <c4o6bcvl7cgmvklvnwj7togokawvaiqmiye3sgdlugwftz45bh@g7vfktowo5hj>
References: <20250926085956.2346179-1-quic_mkuntuma@quicinc.com>
 <20250926085956.2346179-2-quic_mkuntuma@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250926085956.2346179-2-quic_mkuntuma@quicinc.com>
X-Proofpoint-ORIG-GUID: jEbCIIULOwMmHRVbsWc_xdrpAl5fFqmh
X-Authority-Analysis: v=2.4 cv=JKA2csKb c=1 sm=1 tr=0 ts=68d69a7b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=tFSzMcqD3SoeBU5fSnoA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: jEbCIIULOwMmHRVbsWc_xdrpAl5fFqmh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI2MDA4OSBTYWx0ZWRfX+BeTFT0TASP8
 F7DW4/oQypCvwJYixIVF/bmwG37EL0nFrIE0NQtyCPnaLGP9ad+0KOCNjY3y/vKqsumbsCRngJy
 a0Rb87Lu6Zlg47LEZj4ze/W+aKk18xq8YmGU0nfAKEwQ3YfoAcFKYLF8RyELh4wZs7k/UF6q42Z
 JUC1bK6aWUQafAmSZiHGhABg2eyvu98GOF8u6Q8kezAIFnGb3Uhp25s6oWmWXIP+URiqRQDRixQ
 7gfU7sKh8ZaXAIc/HdIJHCfoUeKKMdwilCqwZ0xPF1fioQ8ozXG92x/+AFlbhaOUbrdzYrHHtet
 atOeJj1fH1/XamWtqPzbGQk8sRoRXZbshL9/V7KnjI21Q0XJ7nfTNZnK1mzSQuYizht3cDnPKyZ
 PxuIHeS5MOeEWkUkiqEBpTkdF3Kqvg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_04,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509260089
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

On Fri, Sep 26, 2025 at 02:29:53PM +0530, Mani Chandana Ballary Kuntumalla wrote:
> The Qualcomm SA8775P platform comes with 2 DisplayPort controllers
> for each mdss. Update controller id for DPTX0 and DPTX1 of mdss1.
> 
> Signed-off-by: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Missing Fixes tag.

> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index d87d47cc7ec3..f247aad55397 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -133,8 +133,8 @@ struct msm_dp_desc {
>  static const struct msm_dp_desc msm_dp_desc_sa8775p[] = {
>  	{ .io_start = 0x0af54000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
>  	{ .io_start = 0x0af5c000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
> -	{ .io_start = 0x22154000, .id = MSM_DP_CONTROLLER_2, .wide_bus_supported = true },
> -	{ .io_start = 0x2215c000, .id = MSM_DP_CONTROLLER_3, .wide_bus_supported = true },
> +	{ .io_start = 0x22154000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
> +	{ .io_start = 0x2215c000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
>  	{}
>  };
>  
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
