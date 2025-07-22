Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92AA9B0DEB9
	for <lists+freedreno@lfdr.de>; Tue, 22 Jul 2025 16:33:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BDB510E099;
	Tue, 22 Jul 2025 14:33:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="D6uh+MGG";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83CCD10E099
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jul 2025 14:33:52 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56MCrWHt018019
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jul 2025 14:33:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 xtT5su/VJ7JP1pHjFV7X/fYhQ9wlxMPwqcGXpQ4560g=; b=D6uh+MGGULIyksQh
 T1z98YOrVB8kJ3nH/vaFmvUc1IfBWpz8u0xhpyshYnb99/AfS5SqUhMAYDEMLYpP
 xNUvw3lHLhJTkEfTlivMfUj3jb7mXStVBncUdBjfuZyi3fYAGnt8edcWZHdf3bQX
 MDWPWdi0BqJ8AGbFosXVtz4O5ZCBNfAweH45AbC9XYUWpf0UXJA3B89ZU6ALzcut
 UQ60GCuT/nLISw0wGWVJEfCl1gaBUrAGXPYWzGUgVXYccslegUOQNYumJ0R6+opH
 J+1m1XDDRjBKOfheJt2+x2TzW7CB2+Y7J16+DzY+25uvuyabjNe7G0NZgq9wLAi3
 anrgTw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 482b1u8a2g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jul 2025 14:33:52 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4ab65611676so20385811cf.0
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jul 2025 07:33:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753194831; x=1753799631;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xtT5su/VJ7JP1pHjFV7X/fYhQ9wlxMPwqcGXpQ4560g=;
 b=MlGn+p9HQBpL/Q07QXxQ9z7qTf6zVEIi8eScHUy+i5EE7TvEF1oXxtp3IS0asSn5tx
 4KdSzse8BKGbmaoQXdopvYFjmIEGbuWgAzarkkGPGuoNyRE4Pul2trg1HmLn0rvQ3m6K
 M1xfrBwb5AxcR1ZUkAytkDWUvTfl0pSTyqOyv8djjYYv/en3HdRBrTj4GlzC0Gz/me7I
 L5bjY2DPzakVLZn8YidCtdpxAFjDIPv41+mPnnD336dJSt8eSFHIt9XO070TUi4fSaXg
 JWzwIJxkV41gC52Ko/f6Jo2RCLVAYo47oTNRSv3BCEimP0f0Doi6hOwG5f+shFigEYro
 RilA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYOra6qdYZ/3kLVpJ5DrsAg9LBpn2RwtH3iSIwTJP/+k/cPshGB0MxKn4BdElWsYWaZDRgnbfUMA8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx/7OV2toayzGrjm/3FEqr9PgN2J4lVWlmB4VQ78vVyIfG9S30Z
 28q1gL15uY8TN6B9ZRR4UcgIKConY/G5Z8QPg8KBypUeR7WitdogNK+8H8lqhBwYdDTzVsKyjbZ
 7WkgJJX6TJIery0cdlDIgdJA+SO2OO0OMnLtKr9LMbrBQnUwvO0HdPWXBc0OwLvnDHIGkmXM=
X-Gm-Gg: ASbGncv+yFrvuipEml42V1ywjhk6S8bD2N3dO3d0yownneeVbUtGw0BauAKtyKdGacO
 7ft9LlNkRdtfD5dycgtcELvFKkVwl0gW+sqaIffCn4vvQEX0hFrfMpP1P2L4ayLVpx7cXMwazcN
 qg9TChzQV2JXNQ8lcMX/FcB9nIjhdjQmMAsefkrpNoPNJsqK63MRP5SGsWIw7pSagDCxzOnN+mM
 AEc8twc/1FQUpNEMva/VDNvekPSPylJWlwG6f5FDshfUCD8+sfrZ81fzU0udq5vQn0fNJWzqz1W
 AX/3z6HNF8yAVwCgHMAeTaLrsgJd2MD46d47hidOvswKHdwehLKCFa7IgBh8MWMSVQugCATWRiL
 4UBCs8hPtxOveicrcGp3/
X-Received: by 2002:a05:620a:2227:b0:7e3:2e02:4849 with SMTP id
 af79cd13be357-7e342b41754mr1177998485a.9.1753194829883; 
 Tue, 22 Jul 2025 07:33:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEU1lbhaP2WVsTXTqM7GGer/GTSGogiYRwUzlLubvQGVjS0cOplM2JT/IJ8lGgLcTomzSOXCQ==
X-Received: by 2002:a05:620a:2227:b0:7e3:2e02:4849 with SMTP id
 af79cd13be357-7e342b41754mr1177993285a.9.1753194828498; 
 Tue, 22 Jul 2025 07:33:48 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-612c9075d76sm6920459a12.52.2025.07.22.07.33.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jul 2025 07:33:47 -0700 (PDT)
Message-ID: <84a33e15-edaf-4951-8411-24b17ee5f4f5@oss.qualcomm.com>
Date: Tue, 22 Jul 2025 16:33:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/17] drm/msm: a6xx: Fix gx_is_on check for a7x family
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
 <20250720-ifpc-support-v1-3-9347aa5bcbd6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250720-ifpc-support-v1-3-9347aa5bcbd6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LdY86ifi c=1 sm=1 tr=0 ts=687fa150 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=rILJP4qTGdYfNujWrMwA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDEyMSBTYWx0ZWRfX3GduoLSFx3z0
 7C2UmBN+v/DhLoaycoHv/+rTQvhZZKNSm2Ul19VOUBHk9+uSn8aIDMM0wYoZ5zN2py9ba1k4sIL
 nK2rp9l70YfMR1CAivoWt/PxmAOduIzeQ4UUgLdTERWdAu9G7CnOFQERMpS1FE20SzldHlorwa8
 imPtelwptwEcCdqtChsyGi+JgOqpNdkqy4T51it4yqqTAzIHGCGRnN/bnUa0B4yZ9864eyXHGeh
 7H17u9v6NFbUNkzt4rjM0dey5hkjAdn/7xIlvSnWMK0Q/2hw9j2ZvsB4fKlKWsJx1aPtxq8X3rI
 m919b5zTrVHATHb6Ni+7m5GoRgNJlVh4M8QAJK8iDnCR+mfxLOeBPfWOGP3H1QCkOF76uJ9zP7V
 ojq1gKjD+mLjsorVNTC13F7b7v1GV440kjWMxXU+oztc+HrzrdsxbjgpZLiDywHCT8aFUoTT
X-Proofpoint-ORIG-GUID: SBnOpbi1RZwHbCOtyrnS11GM1M4NgH_q
X-Proofpoint-GUID: SBnOpbi1RZwHbCOtyrnS11GM1M4NgH_q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_02,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 priorityscore=1501 adultscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 mlxlogscore=999 bulkscore=0 spamscore=0
 suspectscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507220121
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

On 7/20/25 2:16 PM, Akhil P Oommen wrote:
> Bitfield definition for REG_A6XX_GMU_SPTPRAC_PWR_CLK_STATUS register is
> different in A7XX family. Check the correct bits to see if GX is
> collapsed on A7XX series.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

This seems to have been introduced all the way back in the initial
a7xx submission downstream, so I'll assume this concerns all SKUs
and this is a relevant fixes tag:

Fixes: af66706accdf ("drm/msm/a6xx: Add skeleton A7xx support")

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
