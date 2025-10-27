Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 592B5C0DF8B
	for <lists+freedreno@lfdr.de>; Mon, 27 Oct 2025 14:20:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CDFB10E491;
	Mon, 27 Oct 2025 13:20:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="dwIVjq4x";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 405F310E49F
 for <freedreno@lists.freedesktop.org>; Mon, 27 Oct 2025 13:20:27 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59RBJgXX2546697
 for <freedreno@lists.freedesktop.org>; Mon, 27 Oct 2025 13:20:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=2Kj22k9fvRGgrx/wBkPeuGzy
 xbWnEzFTmd7/uwZJCyo=; b=dwIVjq4xhUDZCJzwxE3ZOMyH4nR3tEZKNUzWKmWL
 BYF30w9mq6/zytpBeT8+02bz/FS6qUpm4ueaf7G7rKzX8cU6PsdcM8fHy43ppRLJ
 AlBbhSFJVYTtNJ29IByKTesZUlRG0/qIyvj1sJdOxmNQbhyjF/SDaPp/Oqkl8TYs
 vQsup9ySY1bW1uZkN51tYm4sUEzLERKGquf9TAtH9oc9krrbewD6ICg9L5WCq3cj
 /STxRRCRouQWW5O/ZeFAq2QwbPl7iYvlctf51PLeIEqNHVl8TUqRg26zp9kfpXCd
 56FxdozwSlcDrWxog7nosV2lKd8dQZCFMvkaQIAqu+THdA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a27s2ga0k-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 27 Oct 2025 13:20:26 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4e88947a773so251411921cf.2
 for <freedreno@lists.freedesktop.org>; Mon, 27 Oct 2025 06:20:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761571225; x=1762176025;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2Kj22k9fvRGgrx/wBkPeuGzyxbWnEzFTmd7/uwZJCyo=;
 b=hBBF4dTGWTMjWPSYSppPVFB2Eam9MUYFBYlJeVzBuhEKUxiUhIDXuDIk5qvTJS19Hq
 QoeM/gwbe+Pw5PcM3Xf3V2imzY0/2gZ8FLjq3jiYhz005kkHqp1xb9G4GXNWuULfBzqI
 oe5K++yz8EVrazoxjC0SIErlWmk/iv5GgK4R0uQCBMqKB69SM9PhuIhLLG6bWbtCqTYe
 vleE7iaYHrpPcpAGU26qvIDEwejJBfdnGNu8r9ODDqKmDlLOjwFkXvHrZpPjV4TPrBjx
 wjLDQICAKE8LnbK91eN0T2QD2OJ1KzDQdeTZYWhDTr0IAGABRuQcCbF9ssVLd4zXFp+k
 yTng==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMzZIorCIYbcm41ROnFQAV8e4YkXrng0Pi+mxKhMkm+hRnC0c8XNnuJfedHxk2tVDW5dmuLQ5V7y8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyHMfXr9Hvrs8hGtWLwIcmXzr8PUeOFLa1b3QmKGw5+VPwHP93h
 O3r1yjuV4ojgTkDgiI37xznQOwv5UEmms5gIqWU+otoRXr9R78yinvwZIw4/6v/uKj7O48N2jE/
 Du/nk2xBVZldY4eHxlInPIHjHn7MhMHUnOCZCELOXldTgsihOHWUhy2R55/AE5NB3HoeJfJQ=
X-Gm-Gg: ASbGncvpEATxfUifby9e2/cJFCoRYaK01Nm+UYtj5/THNEI+up82rrDbBZp8BoZ9mRL
 JPpojdqs5I3jXn6EvtCEvqRvmecKaiG/QivwqMIgoFIySeDjc2ZT0+CN+BRGMGj9cQUBeDZhvaQ
 CHvULf1d7nqy1HbztD6GBbHgKis4ocHZAFIjM5ozcbDw1s4zC4gYjkDm2XbeIg4/F8QSoybCLxQ
 4OX9Y4M6yHmHvjNXFR6Cgf9oWtd2erHZRR+uzAMAZXrjHnDfiTNQ2pmixFktM27VSd+lR2XVlv/
 0xnyCvd7alF24CFUTA0nONrkWwc4eaPxF2ktrGsP/wjzYCymr6XpkhQCrP4imty4Wkvyao67VSC
 JgEisX0d66hEFzjnPvejoAc3VqJFXe3jUQbhj5ILv8CotZ1aAqingMu5VbwHtDI7dM18ZoauuID
 fhGaiLJPVT1oHK
X-Received: by 2002:a05:622a:1a94:b0:4eb:9c80:f68e with SMTP id
 d75a77b69052e-4eb9c80fb64mr120719651cf.35.1761571225583; 
 Mon, 27 Oct 2025 06:20:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHBc2C7TR7QhTEGEcw9us4tkFC7f4Ut/FGoqtIIC79l1JnmcHizx0ypgFkWMXTqqEaPMgwhw==
X-Received: by 2002:a05:622a:1a94:b0:4eb:9c80:f68e with SMTP id
 d75a77b69052e-4eb9c80fb64mr120717821cf.35.1761571223545; 
 Mon, 27 Oct 2025 06:20:23 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-378ee09213fsm19983561fa.1.2025.10.27.06.20.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 06:20:22 -0700 (PDT)
Date: Mon, 27 Oct 2025 15:20:21 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm: dsi: fix PLL init in bonded mode
Message-ID: <wg6ncd4zyoh3lrrxtpjm6bup7ymyy3v3notzvvdssoptveblxq@4g4shyi2xqar>
References: <20251027-topic-sm8x50-fix-dsi-bonded-v1-1-a477cd3f907d@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251027-topic-sm8x50-fix-dsi-bonded-v1-1-a477cd3f907d@linaro.org>
X-Proofpoint-ORIG-GUID: g3yGFrSp_sgOsFMlqFryu-vLkf2Z8ufc
X-Proofpoint-GUID: g3yGFrSp_sgOsFMlqFryu-vLkf2Z8ufc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDEyNCBTYWx0ZWRfXwGJEURceuUh6
 STKUfq2DXFw/ofkmmXDUNWlWxi19yig9Wihx3RDQoj0UrJGB6/J5qyAZRu5lveNIXpcSSz3hWL9
 MeBj41o/p36IcDC9g/X5pweG+PDPO8oyNPJw6sStXBgnvm9Fi85r87xYdxxRFDwKzpaB0LDztjS
 WT4fAgYVV5oUId9DJeJfL1fB252HJUa4JFSvTFajaaHE6CDgP6CFJDRI1ENjX0QnFgWVM+Z6wcQ
 MMTMNEtFvRiCzJR/I3nGABrCPzBBbH+zJrUHV6RNiMhdtiVZ3MfyaiYyYtDn05g/4jeeDcXnOG6
 S2vDRZBEqEgaBEt9XPToGVjbPHX11ShO75UXNn3bh/Gcpuf8jnA3vM66kGO1QFhqY7MuZNUlWZN
 JatU1tsKobHfQm/+NVDS4Q583ipq/g==
X-Authority-Analysis: v=2.4 cv=R60O2NRX c=1 sm=1 tr=0 ts=68ff719a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=kAMrfz4tof1vowKnfp0A:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_05,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 spamscore=0 adultscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510020000
 definitions=main-2510270124
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

On Mon, Oct 27, 2025 at 02:09:48PM +0100, Neil Armstrong wrote:
> When in bonded DSI mode, only one PLL in one DSI PHY is used for both
> DSI PHYs, meaning that parents of the secondary DSI PHY will use the
> primary DSI PHY PLL as parent.
> 
> In this case the primary DSI PHY PLL will be set even if the primary
> DSI PHY is not yet enabled. The DSI PHY code has support for this
> particular use-case and will handle the fact the PLL was already
> set when initializing the primary DSI PHY.
> 
> By introducing a protected variable pll_enable_cnt in the commit
> cb55f39bf7b1 ("drm/msm/dsi/phy: Fix reading zero as PLL rates when unprepared"),
> this variable is only initially set to 1 when the DSI PHY is initialized
> making it impossible to set the PLL before, breaking the bonded DSI
> use case by returning 0 when setting the PLL from the secondary DSI
> PHY driver and skipping the correct clocks initialization.
> 
> But since it was already possible to set the PLL without enabling
> the DSI PHY, just drop the pll_enable_cnt setting from the PHY
> enable/disable and simply increment/decrement the pll_enable_cnt
> variable from the dsi_pll_enable/disable_pll_bias to make sure any
> PLL operation is done with the PLL BIAS enabled.
> 
> Fixes: cb55f39bf7b1 ("drm/msm/dsi/phy: Fix reading zero as PLL rates when unprepared")
> Closes: https://lore.kernel.org/all/50a49d72-2b1e-471d-b0c4-d5a0b38b2a21@linaro.org/
> Tested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h     |  1 -
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 18 ++----------------
>  2 files changed, 2 insertions(+), 17 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
