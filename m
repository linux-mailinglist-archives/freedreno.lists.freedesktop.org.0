Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D3ECC9F38
	for <lists+freedreno@lfdr.de>; Thu, 18 Dec 2025 02:13:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 632E710E35F;
	Thu, 18 Dec 2025 01:13:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="JnwbxRkw";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JUHgsnrX";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86CFD10E35F
 for <freedreno@lists.freedesktop.org>; Thu, 18 Dec 2025 01:13:16 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BHMSblQ296544
 for <freedreno@lists.freedesktop.org>; Thu, 18 Dec 2025 01:13:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ODx0DDClD7oE2D8NZwf9qUCT4cF6yooKb905lWB79gk=; b=JnwbxRkwH3ltLFpg
 x5yfuTcWFS7O6EcGPG9iw2y6huWAY/NfOCbddXTUzRtHjbR3dWprW6Bu17VVa2+b
 JWKSxRLi6YAuuoWhaD6jRJ9GoM35uVqOkWmrsITx+TvqDzYNKbRQqDZXo3XG8dS1
 /KCXBveqK9N9ysd5g+QxkQ5RuF05eyB05Syef/6xLbln2kd95tFbuJ9w2Xwo5Ox/
 nlbTN0Lp5mLMEyHOKnnBWGbz95Vj1n9HXdv7mEueqDMV5X9OWNq2Q1p1NybbEhc5
 NQuyqRWJgOlYL3vBKMM3pyhPwGuLS0czyKILYomkdSBvZJuH+DakUQfYAdTYDISC
 4Q/Nzw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b45bhgan5-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 18 Dec 2025 01:13:13 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4f1f42515ffso2773631cf.0
 for <freedreno@lists.freedesktop.org>; Wed, 17 Dec 2025 17:13:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766020393; x=1766625193;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ODx0DDClD7oE2D8NZwf9qUCT4cF6yooKb905lWB79gk=;
 b=JUHgsnrXL1qnMh+msHN41Tm8V5/hUqofpeq3bxVuYNd/cQmfN8jLx5qH9MlDwcMDWY
 seRguSm453Ws+pdA+tTMjB4EgWj/E5AUlTgdmsEYrJEB2Oi4+SJ2TPVXtHs8lJmDk5mh
 JHclsDfXvqRFMxtopzQjBKOXIM49vAbJBfAOGwO/ulHBorT3j3LyeCwnYsuwKQ+3A0WL
 D3ZIgSlHBI6kEs6jFH0yL5FTEmhxNWRiMRo8S5TDk5W+PCUKubdatl8zNmtLia/83IkW
 F+fqOk0bMj7QPG33gZe7ovtyffVKGZUvedcj9KB+hQx2CB7Pic6IiKuV+b8k85b5xl5Y
 l5Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766020393; x=1766625193;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ODx0DDClD7oE2D8NZwf9qUCT4cF6yooKb905lWB79gk=;
 b=FMSoeMr3Gc/Bn/MVkOrXbW9/xTByjtCvv6731LBnrqDg1NMljhBPAbLcpRh59dLs1p
 z7O/MSu0W4k7RxaFZOICJPhgF1St4Vxlf73QFrL18BCOvunNYF/5Zt4tXzPYbNuFkhEk
 jvrwjAW0SG11Uv9xsJK0XpFsYZcrvVZaHOrw77bRstV78PjnQsBuhht9YeV/AGrsGoJS
 0Fweq6gTZY2Ji2HVuAEei5LO+nV1qOFtdUEbffoq+zoA/fSD+buCqT9VFXo0sNnabix/
 oDl3c94ErO0cmAqxYiWaMfZnzff1rSGtiqFM18gBxEUuNC04Vhn+lE4GLCdOnD+SW2aq
 eM5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhTiOU97lyRtZVQ91+DZcvkDNj0vHJ0L3qOHHvNHHgZMQ6jc3ocHXry3DK7SCUj/el4pGf38/oGPE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyG8jj99RqzD+ee3HpgTFwBPaQUpIEa526oV0KXpp93Z2Q36bqN
 D/LLgRx6Ag4/5wBxqiTcEWWv9JMcBZV+yDLkdrdsm413YnYVmCu90TUOu4FGy4mIMV3rqsjnOop
 WyoFkQQzCtR8Lrj2YiEeiUOw610X3/vECqg11rayoHZupnFtmO5LBQbDQOs6TNUh5UwOVg74=
X-Gm-Gg: AY/fxX5UYx9dfynYcvL7zetcV4SXwjEzy1jiaJlt0pjQbCEPCHTyUJiWyGtB9zy14yR
 1HwKKgrqd2D6nZZqI4KZkvM8mwwWeDh7pkEOHOZX26NhcZZNV6vcnX7Hkp6DCRq5p6Whkwj9W/k
 ToN8YGoVDF+Egz8rzgJqr0YTTDNaYrxww2txvdxMXNnuNsQiOqBJq/RExsF5iAg8cepp9LdpiiP
 HqXAJ2gDzUCFJmyxsn+TJRIFd/FfQCop/W1yUVsljmxuYoM9HoB0gBypOd07hGM7N8qsekXwtHl
 vCA314WlWJ4j/0qbxtsZ7NG3nlzCV2HxXDKPTqYX+KJ+xhVOCk6YuLrAwWnXq3r3eUjeAr9Sb+v
 pHg1uOOlTqn+XiSUGBG1LgqDkxlLn62v4m30nD2SeiG+U55H0qztfjs6WzCB1ySLJVZyOJ/3CRT
 ol4vHEnY2OicAWIoWUKuS4J/I=
X-Received: by 2002:a05:622a:5c16:b0:4f1:8458:2679 with SMTP id
 d75a77b69052e-4f1d062a568mr320752671cf.60.1766020393142; 
 Wed, 17 Dec 2025 17:13:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH8kzKjigPADnhYvAQQ3ZNwWnZ7myCpFKgi4W4FArGCcVgc7WHrYz7CkY/anZJ2ACGtwLCPUQ==
X-Received: by 2002:a05:622a:5c16:b0:4f1:8458:2679 with SMTP id
 d75a77b69052e-4f1d062a568mr320752251cf.60.1766020392613; 
 Wed, 17 Dec 2025 17:13:12 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3811374eaf3sm4082291fa.47.2025.12.17.17.13.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Dec 2025 17:13:10 -0800 (PST)
Date: Thu, 18 Dec 2025 03:13:07 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dale Whinham <daleyo@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 =?utf-8?B?SsOpcsO0bWU=?= de Bretagne <jerome.debretagne@gmail.com>,
 Steev Klimaszewski <threeway@gmail.com>
Subject: Re: [PATCH v2] drm/msm/dp: Enable support for eDP v1.4+ link rates
 table
Message-ID: <chu5gqcvhqpeve7coitjo5iqf5n5cqipfyxpu2w5dm5tcjp66j@n3fg2qrgkara>
References: <20251218-drm-msm-edp14-v2-1-2e56c2338ab1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251218-drm-msm-edp14-v2-1-2e56c2338ab1@gmail.com>
X-Proofpoint-GUID: 3psaMms8BYF3A-SnPyv7F4jDu2yGmtmy
X-Proofpoint-ORIG-GUID: 3psaMms8BYF3A-SnPyv7F4jDu2yGmtmy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDAwNyBTYWx0ZWRfXy6GXHoyELbcB
 RfeipmOLQ8pJodSwRTi4mQgQjHqEe3o8H5JvxTpw7iBnCFWJCPOyzUxKdzUZT+FtiKHunQbrW3z
 ZflMHp3AwGhujs77hzQbfkSND8ygj0YkSUonNZDQNFMf/Dc0YBcadWP1Azg5j6F6IL9LkH5DJQz
 JIilBQvgMVbYvYVaIJQttxLxZMlYvgZGmyXQZkG+ZcmRyu9MEOMTbK8vidgUQLgVc7PkQy2MjsQ
 9bPYRkAegiS3zvR9e1r9cwqg9kGyCbDv1V4G9o+mH8P7b9VaIpJK0Qzqwrhyw3lHaP+acT/oSLX
 ouT4RPHkOa+87zJx7vJNHYbaHZ/2/e5OZFcr7BLHLkEg3XjQZhgWALNLL24RNH33tW5YwSh1Ew7
 HydfjubXxTUs1Ym6hG2u824WrkN0cw==
X-Authority-Analysis: v=2.4 cv=SZr6t/Ru c=1 sm=1 tr=0 ts=69435529 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=5AQg0nHepjwah1_JwOEA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512180007
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

On Thu, Dec 18, 2025 at 12:19:32AM +0000, Dale Whinham wrote:
> The MSM DRM driver currently does not support panels which report their
> supported link rates via the SUPPORTED_LINK_RATES table.
> 
> For panels which do not offer the optional eDP v1.3 fallback via
> MAX_LINK_RATE, this will cause a panel probe failure (e.g. Samsung
> ATNA30DW01-1 as found in Microsoft Surface Pro 11).
> 
> Detect eDP v1.4 panels and parse the SUPPORTED_LINK_RATES table when
> present.
> 
> Additionally, set the rate using LINK_RATE_SET instead of LINK_BW_SET,
> but only if LINK_BW_SET hasn't already been written to.
> 
> Signed-off-by: Dale Whinham <daleyo@gmail.com>
> Tested-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
> Tested-by: Steev Klimaszewski <threeway@gmail.com>
> ---
> Changes in v2:
> - Re-ordered writing of LANE_COUNT_SET/LINK_BW_SET registers to match i915 [Dmitry]
> - Fix detection of eDP by reading EDP_CONFIGURATION_CAP and EDP_REV (in v1 we were mistakenly checking DPCD_REV) [Dmitry]
> - Link to v1: https://lore.kernel.org/r/20251214-drm-msm-edp14-v1-1-45de8c168cec@gmail.com
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c  | 56 ++++++++++++++---------
>  drivers/gpu/drm/msm/dp/dp_link.h  |  3 ++
>  drivers/gpu/drm/msm/dp/dp_panel.c | 93 ++++++++++++++++++++++++++++++++++-----
>  3 files changed, 120 insertions(+), 32 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
