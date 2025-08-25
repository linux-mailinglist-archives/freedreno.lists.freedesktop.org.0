Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3CE2B348D4
	for <lists+freedreno@lfdr.de>; Mon, 25 Aug 2025 19:34:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E73810E042;
	Mon, 25 Aug 2025 17:34:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="figFNp7y";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 014E610E042
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 17:34:42 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57PFuF6a020705
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 17:34:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=921Bzr011b9Fk2gqlTe/2ABf
 oYFpWqrFuSDN0tU0Jcg=; b=figFNp7yWDmkIdmseVps3EgfXJ5gryeuXcWD5lyA
 dH6bFvW3l5NbJR7L5OgFMRuNQo3oGOcKskZlSty0IY1fKF9ykdU9jEj6S3fUCi7Q
 RNObZIodLFJffFaph0aMvFbXWMDylU7ucoGsmJiWL/rRLKyf0nL/oUvXNqg+OeLs
 TcuxO4AURjP/0wxo357YcbWhk0doJ2GXWmgG7shNBND79+8EbCODQ2iBGDz/X7Z8
 6EdPd6etAuIhn3Bf+Mw3nTXSLwq21OvOZHZvqjYsU9/WNZSgfUTnMCl9VE/f3coU
 4D7gy5gEiLbq3e3vTUDoU+ZT5/ptJbzeaRec6izeZqlfRA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q6x85y2n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 17:34:42 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4b2dab82f70so19502631cf.3
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 10:34:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756143281; x=1756748081;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=921Bzr011b9Fk2gqlTe/2ABfoYFpWqrFuSDN0tU0Jcg=;
 b=F45c6xMdLQI3faYj9bI94ryTjrWvpAZlLXdFuxsmNI/wrQcOQ2GSx3sDLECOQhfZFf
 VkVgVxmbFdAPJJMWpBxq+jltC2exlUE8bXour/V+FIdVnsI4ZXQToXVV7Ux2ZpzJz7z3
 Mk8HNiJS5AyIcn/GD5UPYm88gLtD0J1Q1Ndc/xuFsoyoms9ooa1r/2ZInRLCcnY7NE0j
 1nt/ulAVsoDWa+Vj3qpas+oASNhzvUFsOc078eOn1+FI8q2qGw+YkyBHSk5DZ7EBJB62
 W8d3P8jsSlRMzBu2WT2fwK4pmDDk+4MmUaMhwr9J23DsM6A0h0vWtki2dOmuVnMsmq2+
 ZOKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVbb7A4IjW+220MrYB+Xko6W4+zzxRwp0IgYMw5nRmXoLDy3/aI9r9iYhnZJ14rHmtQayrekQucy0E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxmoW1cTNS/GCEaOM6yCyY7BiMVD/L19+6sTVyFIT/GYtOdv1b5
 /pehx6SGuMnpj4WCva3RMOHW2S6xWxOH8mrRN1hbfgTnIs2GlHhH1ecI+5hH4sV3ilp+WiiO+ac
 3AeMhicq75I/C/vdn72WB5fo0Earg+t0/yGH994/ApuvAH0ps4D/TJWLIJW8LM8w1uYB0p0M=
X-Gm-Gg: ASbGncuUZ6x0vX1ugaiBw2lPWshlW3YATO36B6z3Leyid7uuSn8gAUgToPGyxLSG8V9
 lsR4V8HAVxBGcyW3QFQSzeyyuEFkjFLW/D2/hqOjdW1KmaVqUxhTVtypL52bqXRm95zZUocCG8o
 ZzhqhT1bL2xcmGy856zZcrkzflqZGeIUpEY4qiPAUbxKsvdW8fpRcIK1bkQbi+SK/NZZPv7Bpx+
 MsIMN4ZnVmqk7AgUZapx+lfTlM3DF+wx3xMYNqyAJJ0yZ20RTA6TmG5BX/dmMBhsorYZoD9S7iA
 rr7VutkH+MQFrDHX6vv3PuyJd2Rq/RdrnLEtyQNujXbEsU6tLVUSN47/1L2SCC14Fo1t7lX7MxX
 cVNPwIXwaxarTIpRIrGDRZNXZ8kgbU8ZJ1PGUYlCA+yAENY9rjwyk
X-Received: by 2002:a05:622a:5c9b:b0:4b2:d220:4211 with SMTP id
 d75a77b69052e-4b2de83cb2emr22826191cf.83.1756143280793; 
 Mon, 25 Aug 2025 10:34:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFz6WH+r8iVC5X6v7K3eW/AwuiBzcHaMNlP04RqOd75xHftv58SkM/HMIMyfwMINBYuS6fANA==
X-Received: by 2002:a05:622a:5c9b:b0:4b2:d220:4211 with SMTP id
 d75a77b69052e-4b2de83cb2emr22825741cf.83.1756143280341; 
 Mon, 25 Aug 2025 10:34:40 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55f46dc5a16sm544219e87.125.2025.08.25.10.34.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Aug 2025 10:34:39 -0700 (PDT)
Date: Mon, 25 Aug 2025 20:34:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v3 08/38] drm/msm/dp: move the pixel clock control to its
 own API
Message-ID: <tmbatmfixhm4axvor3xliq75774vuz5w4ard42serfuwejs624@wh3sk5ug2u4a>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-8-01faacfcdedd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825-msm-dp-mst-v3-8-01faacfcdedd@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: wzkQ0g2jXmKuhrfUMLvWuG6wFaadWS8W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDA0NCBTYWx0ZWRfX5EQYK/7CP7uI
 l6XLE0vzBHdZWhYohOQjOfF5bIQCf3QC6C41oisD4LSLPecN9GR5dZs06WmZMRH4dieS4VWjZGF
 3Z7K0o3v91gnoCoLDqUoF3eXWOzHvvZE1uW6elKGQsdu6fLOsSGUDiv6BAO3Fc40c3aESJKLaSa
 v/riHbs3zbM5mR99n6topUTY1lEOBe12p9qaRj0ikcX2l/pQ+lUuJttbatCWPteSAZz1SQK7AfY
 ny6FzMXKemJKYl/UCifwS769fTic+BV2CNZRM/Lbm/QFwyNL88q6g/yBNc3uUkWCNlKQX9J5L1S
 w5XS/ilfamrJ+paUvoPUBFihNO3q4WUxYG8P+PWB9crak+bM0svqFzhhpq27cyzYjnEZ+V16G8Q
 bViDxq1c
X-Proofpoint-GUID: wzkQ0g2jXmKuhrfUMLvWuG6wFaadWS8W
X-Authority-Analysis: v=2.4 cv=Ep/SrTcA c=1 sm=1 tr=0 ts=68ac9eb2 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=YadZbbKFZxuD_lQ-BoMA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_08,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230044
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

On Mon, Aug 25, 2025 at 10:15:54PM +0800, Yongxing Mou wrote:
> Enable/Disable of DP pixel clock happens in multiple code paths
> leading to code duplication. Move it into individual helpers so that
> the helpers can be called wherever necessary.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c | 77 +++++++++++++++++++++-------------------
>  1 file changed, 41 insertions(+), 36 deletions(-)
> 
> @@ -2518,21 +2539,10 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
>  
>  	drm_dbg_dp(ctrl->drm_dev, "pixel_rate=%lu\n", pixel_rate);
>  
> -	ret = clk_set_rate(ctrl->pixel_clk, pixel_rate * 1000);
> +	ret = msm_dp_ctrl_on_pixel_clk(ctrl, pixel_rate);
>  	if (ret) {

Nit: unused curly brackets.

Other than that:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



> -		DRM_ERROR("Failed to set pixel clock rate. ret=%d\n", ret);
> -		goto end;
> -	}
> -
> -	if (ctrl->stream_clks_on) {
> -		drm_dbg_dp(ctrl->drm_dev, "pixel clks already enabled\n");
> -	} else {
> -		ret = clk_prepare_enable(ctrl->pixel_clk);
> -		if (ret) {
> -			DRM_ERROR("Failed to start pixel clocks. ret=%d\n", ret);
> -			goto end;
> -		}
> -		ctrl->stream_clks_on = true;
> +		DRM_ERROR("failed to enable pixel clk\n");
> +		return ret;
>  	}
>  

-- 
With best wishes
Dmitry
