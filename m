Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C59DB0195A
	for <lists+freedreno@lfdr.de>; Fri, 11 Jul 2025 12:07:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 032EF10EA0F;
	Fri, 11 Jul 2025 10:07:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="OX36XM2I";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6164B10EA0F
 for <freedreno@lists.freedesktop.org>; Fri, 11 Jul 2025 10:07:23 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56B1XJdN030508
 for <freedreno@lists.freedesktop.org>; Fri, 11 Jul 2025 10:07:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 hk3nB5hWTU3eT0rJpe16RuFw4gADrZf69fEfZrrhc2E=; b=OX36XM2IQUjYjYLC
 L4JqjrIbaAKVweFxyeSK4wN6dvE5lT3qkwMV3183xhN+svzUylTx27sH8vR82D3X
 +LLBCt3WcV84TxXekS8/MyTWVz+kG7i8lcJt1qytO7ynWUTB6CoX424yAETo2RPN
 GI1G4svg4yTDq7t8w6NYEOGIeuqdE4CpsJx2rPk3W8hASUpbrsZ5hZMLHFvFEjcO
 qMrGz9PAdsny5U4hNRfrPN78cKVMWMC20zXUTrBtgBIHofaJlF3THCtJLJR0Aaz0
 NXLzVJqw4XPu6CKZO3k7OtEdmuwugIMMcajabtwMwsh5H18H7CiEmLAZ7qq3ppHe
 i+HmWA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smber7v0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 11 Jul 2025 10:07:22 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7de3c682919so17856885a.2
 for <freedreno@lists.freedesktop.org>; Fri, 11 Jul 2025 03:07:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752228441; x=1752833241;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hk3nB5hWTU3eT0rJpe16RuFw4gADrZf69fEfZrrhc2E=;
 b=PLWrYgRyHU7YCCVWBv2af2A2WKd6ov8hD72zokJ1KyZyjoqijFcWCSIA/K9QkzmpWm
 ucC+r/BBwn9E/pNyDGt4xJ40r3L1Q2ssQbHLD4aELdPu0l2725GtrO+uPwPLJvTDhcfL
 N0CF4NAhNX1vugrSodAQJqECItALdPEYlLUdL2G08ccymFeiKrh8/Y8XIjRwsI2Gp3Sz
 u5K0oMlPDvIlXL48XikosbUQT04NUQaYmjxJlKQCAxmbFIbFJsKliUQi14tPR+/5WzVT
 d0lhb2WA7zRl0CkLRdtohb2HJ7QIU7fAbOqtrrwZTNCNWkc+6THXgfTgQhl2OY61ljKG
 wemA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUs7ic+WbDjqcQTzr2wc6Mp1+mS3h5zWFWeb24KLz5zbRD8ah/TbBNdOPRHqHKdyhJLFUWCJg7GuC8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxwfUEX+S0+8BN6cv0pztHio9Iewf0SpH3NN3l1D3afZOZ+B/Gc
 +PSzFOFwoCQFEZzmTFaz72FR9735iw/uH0ny+8Rlyz8CzS7AIIcOcq7Ii1oG7MqjHOG8fmsDj7z
 jN5gn2zlBIucNW311xeIVxw7/4k2aBIojtc5fi9zypqy2Kdkh0AE9FYyzhiv/KNEcjC2AkO0=
X-Gm-Gg: ASbGncudAVW3VfMj0C9QGWuzpkmte3fFXDYySbH0K89AcvZ/msx7dpsQW66ab3dj8fX
 Oa1yrBwimtle/nO1nNSNkyXJUoxFnqQcqQ/NO5IP8mr5fX5KN7vIscfNIvlJbTdWaMKIitmnlJP
 AQUx3XAfF9FUZ9pGpjxpxNWJmrTf72k+9O9UZYXBnwPpqbqh3cxiNStZf8AdE9bESA5aeTuqjGm
 MinkmBshCvVS7nStXlTN5iaR/phnuxp+8nZvlN0ZnGrn6G+695aHt8RFscdcZZe8fXaUBT0+8RN
 SGBJQeUH5OMwDAG/EdmhnEIyKehbqkZfu/9Bhjhz33/VCYkgRAKqt7KdzEhDnDIEXyIULv2z4za
 VJnAYXnI7dq2aSQyiApcW
X-Received: by 2002:a05:620a:1a23:b0:7c0:b43c:b36c with SMTP id
 af79cd13be357-7ddea4222a1mr161754985a.6.1752228441496; 
 Fri, 11 Jul 2025 03:07:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHrWNOlRhFuBEfA5EPZynQzF8v5JBD8YYJNHk12CZDzRYg39rtNgm6sSnObsdsSkGwVBUSA2w==
X-Received: by 2002:a05:620a:1a23:b0:7c0:b43c:b36c with SMTP id
 af79cd13be357-7ddea4222a1mr161752885a.6.1752228440873; 
 Fri, 11 Jul 2025 03:07:20 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-611c952b753sm1992960a12.31.2025.07.11.03.07.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Jul 2025 03:07:20 -0700 (PDT)
Message-ID: <f754d2d1-689d-4681-8cdf-9e1e5daeb6f4@oss.qualcomm.com>
Date: Fri, 11 Jul 2025 12:07:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] drm/msm/dsi_phy_10nm: convert from round_rate() to
 determine_rate()
To: Brian Masney <bmasney@redhat.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250710-drm-msm-phy-clk-round-rate-v1-0-364b1d9ee3f8@redhat.com>
 <20250710-drm-msm-phy-clk-round-rate-v1-1-364b1d9ee3f8@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250710-drm-msm-phy-clk-round-rate-v1-1-364b1d9ee3f8@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzExMDA3MSBTYWx0ZWRfXzWJw5ELenSn/
 HLzSRZyozMQs/TyRxpXlCVyLEhWJ56ay6L5fk4+drlLxwD+XHjJgeUWp/qMuqzBIi3AiRfZPoal
 c8iEND/vD6CdfmILLRn92sQ6EYdnZHvek2JgLFPfQ4NTh+K9EsLi9XVTU9F2H67z3IcFSUfnCfr
 kxLSO11kpxQeyTftrZbrZCa55/Pr/iaglXWO3xBU14haLPMp2my51ULSRt6XyEytrTRetbPhSgZ
 q/3vO0yFM7n3/d7TF4S0TADnNprBaO88MaG+R8ss/xOCGHiN1jtqHuBx5ZXms3M4yammrt/Exqs
 Lxegfvm6ybfjy0AJ0meA0f7UqZUDIn8lYAbvywuOb/RamTgo3cEnpyYXr+mcQZqmh5SqED/Q/7a
 zcaJQ8nELJfK5VeimaSix3hYl5H/btm5Mk5RWqxBAcwRTcuwJiSDJM59MhXpdYBBjvTOuLcZ
X-Proofpoint-GUID: IfhjImJAbkwjZbO5Kqf4e1FQTX3_w36z
X-Proofpoint-ORIG-GUID: IfhjImJAbkwjZbO5Kqf4e1FQTX3_w36z
X-Authority-Analysis: v=2.4 cv=VpQjA/2n c=1 sm=1 tr=0 ts=6870e25a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=20KFwNOVAAAA:8 a=oYwTbBpYGhGVpGtzMvsA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_03,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 suspectscore=0 clxscore=1015 impostorscore=0
 phishscore=0 mlxlogscore=999 lowpriorityscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507110071
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

On 7/10/25 6:27 PM, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> index af2e30f3f842a0157f161172bfe42059cabe6a8a..d9848b5849836a75f8f6b983d96f8901d06a5dd3 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> @@ -444,21 +444,21 @@ static unsigned long dsi_pll_10nm_vco_recalc_rate(struct clk_hw *hw,
>  	return (unsigned long)vco_rate;
>  }
>  
> -static long dsi_pll_10nm_clk_round_rate(struct clk_hw *hw,
> -		unsigned long rate, unsigned long *parent_rate)
> +static int dsi_pll_10nm_clk_determine_rate(struct clk_hw *hw,
> +					   struct clk_rate_request *req)
>  {
>  	struct dsi_pll_10nm *pll_10nm = to_pll_10nm(hw);
>  
> -	if      (rate < pll_10nm->phy->cfg->min_pll_rate)
> -		return  pll_10nm->phy->cfg->min_pll_rate;
> -	else if (rate > pll_10nm->phy->cfg->max_pll_rate)
> -		return  pll_10nm->phy->cfg->max_pll_rate;
> -	else
> -		return rate;
> +	if (req->rate < pll_10nm->phy->cfg->min_pll_rate)
> +		req->rate = pll_10nm->phy->cfg->min_pll_rate;
> +	else if (req->rate > pll_10nm->phy->cfg->max_pll_rate)
> +		req->rate = pll_10nm->phy->cfg->max_pll_rate;

clamp_t() smells better for this series

Konrad
