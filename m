Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4E0ABAF29
	for <lists+freedreno@lfdr.de>; Sun, 18 May 2025 11:58:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6483010E28F;
	Sun, 18 May 2025 09:58:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="i2tPW4JL";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C6D610E273
 for <freedreno@lists.freedesktop.org>; Sun, 18 May 2025 09:58:05 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54I6U5wU002841
 for <freedreno@lists.freedesktop.org>; Sun, 18 May 2025 09:58:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=gT+4GMAdIcHZx7zz1ZKYcaAm
 iPe1Cu+OKG7s22TPW8w=; b=i2tPW4JLvJ5hIuvroOV6KoP+4P1hb/Kz/hcuDHwc
 qYMXkEDUeGjeQ4sM4hmp9/jn816r/Cm+ysNRlafQi36HUE7uD5x8KBV9yaQvYlbG
 3paaIYVP4qwfJPwluXrgXu90X32j4gzQM5uOM9ilyt1QHHNpx69oBDScF0V5NiUg
 Q2d4DeX4i9OR01Sh+v7UCZUKAOVwu+qSwfaItOh1KUX+Xe00QjEJjaXlwMKlUjEC
 nBjgNkkCE+Hv90nNYOVHCrFtB9bqbRtqLeTBNeEZaeurY9O02/RZCg2ALxf3KlJq
 uKywxubi/IAqNGD2l637Dd0+v7kNiGDCY8nKrp4lKV8tFA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjmest4m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 18 May 2025 09:58:04 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6f2b50a75d8so54468846d6.0
 for <freedreno@lists.freedesktop.org>; Sun, 18 May 2025 02:58:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747562283; x=1748167083;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gT+4GMAdIcHZx7zz1ZKYcaAmiPe1Cu+OKG7s22TPW8w=;
 b=EYhRMYuLr5vtb0VXenck7fo+iTLvKcWP5tNiw/i84RSVEwpyvoWyNvNMhk3D8LHkXB
 hy8M9iI7z2bkhXC2TlZBFlb2qmeQd0OFulqiCQTvvMSfEn5eI1LIUndqg/G05JiNoSzk
 L6d4n8WcUE9BVSO+IKTwy4rDg/4BH5e0qSmHIjFeQh3H7UpK/XnFbfPRyFV10MdjDvK7
 AAEYUDIeNgTZY4RjR9NeIiGguGZTnULAK0NwR0JF/jH9JjBFmxc2RDzZ2yi59NJxLT5F
 7wAhpktU9wcE2XonBQySsOdBh8q7WZ6E1mr37/ba5Rl94hinhl5mzwFTuT3xpXCj8std
 2AJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkSYCLz5FucAIAT/6DDQaPUsBrwPFeCCYweAh1dOsTc78//x/S/y7RklA3hVIpeacZVMvib44SNiA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxyntYqsop7puR5qp5/oDzh28OdJqt17R2bwJ03ePKKppnGjPN9
 Drhcbe4BxoDvWrg9TUARbWipvv5wQsb1RSJEayv8rmVmtRHW/HnFXBaksH6pde5yrZ0u/uiczLq
 5jVZu9U0A2kZhkP7Wv8x2QWAbrkp103cJ1ohH/EJNjImVWyOtythzPGiYH6E1LVs+xUu6idw=
X-Gm-Gg: ASbGnctXWW7mNVt3ZSJVyicWkapKm/FQGdcnEPYqaA8NHtRx98rKrf/USAIw+sjyiPr
 Lcmhj1n2IXkeiZQDUjVo6wK923+vDtZ03yfwsieMws6yQmCYSt9cWrJTTGy+L4qWgJfOcJlJbY9
 0k587lS9xNLjbNECuAoXetFjwZUp/SY0SHdySXZsosBTQ8rP46GLqDGsTOrqZ2XmBwHlukqabAM
 o9XMRRjjVNA2B1qDDbB6atLtc1w0C82KA8/lqKDWoGgV/yOzf1Lp4cD0HALmgekPo5sW6Q5PMmP
 45PRnKtdOm5zKn88hbRX5265ob3RyZqiUZgZ6PRTsBwEQECKMuen4L+E3TK6yAbh2L3Rua2zUeM
 =
X-Received: by 2002:a05:6214:1244:b0:6e8:fde9:5d07 with SMTP id
 6a1803df08f44-6f8b2d43931mr131431386d6.26.1747562283624; 
 Sun, 18 May 2025 02:58:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFXOR6vgmS6GPiW625UI3++wlwyBg0bFxpLkN+zyktFFittJClz/BbivAaprb8YwW0sMhFTKw==
X-Received: by 2002:a05:6214:1244:b0:6e8:fde9:5d07 with SMTP id
 6a1803df08f44-6f8b2d43931mr131431096d6.26.1747562283284; 
 Sun, 18 May 2025 02:58:03 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-328085cf976sm14124621fa.103.2025.05.18.02.58.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 May 2025 02:58:02 -0700 (PDT)
Date: Sun, 18 May 2025 12:58:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH RFT v3 11/14] soc: qcom: ubwc: Fix SM6125's ubwc_swizzle
 value
Message-ID: <lkzvk5vqxy3oe4f67tg5hirmqarfcq6xibljhtspvufuebxbna@k36dw3km25qa>
References: <20250517-topic-ubwc_central-v3-0-3c8465565f86@oss.qualcomm.com>
 <20250517-topic-ubwc_central-v3-11-3c8465565f86@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250517-topic-ubwc_central-v3-11-3c8465565f86@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=RoDFLDmK c=1 sm=1 tr=0 ts=6829af2c cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=lyADY8evpk1XTh_PsdgA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: qrvsG2UTwY55AH1drzMgS3jCmL8JM3kU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDA5MyBTYWx0ZWRfXwo1ETbjbYebW
 MvoblWC1JjUYyeuaZvF8lKSqW1kHH7A2y67IId5uzN9uLeqETn12SoJ8bQ/bwdWAXNhWi2trdvN
 Ndzxcgoi0rNpV22QNYvg62bpBtMOcsHtnM4GsqCoNBwwVT+woIG48fUYcoWQ4rhpE8w7kne6Sr1
 fdAVekbsWbktr8y9MpHTcZjVnIovrdKMohRsle60ZszZZRmICEDH1Or9sIJ/K2H7BrCFifQsZzb
 C7zoZfv+v0GPmjjXEkSjT/UK/GtXRStq/QBi1QF2BhKTX6P7qvqKFZ/YMA/EWL2DutBlfgu/8vC
 MDG9+LC8pQ/DgfqXNbkkvl08qprygTlzBlxBylS3IbVfMoPHi4ldcLgNJ0JIvKGmX/UQQuKW4XQ
 v+5ABnSIsWsS6Mnixg0z6ut39JDLOKCLDf3YH0UscUpyZUg+c7A2e8p+v+YGL6IuSejcBGU9
X-Proofpoint-GUID: qrvsG2UTwY55AH1drzMgS3jCmL8JM3kU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 mlxscore=0 mlxlogscore=927
 phishscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505180093
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

On Sat, May 17, 2025 at 07:32:45PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The value of 7 (a.k.a. GENMASK(2, 0), a.k.a. disabling levels 1-3 of
> swizzling) is what we want on this platform (and others with a UBWC
> 1.0 encoder).
> 
> Fix it to make mesa happy (the hardware doesn't care about the 2 higher
> bits, as they weren't consumed on this platform).
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/ubwc_config.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 

-- 
With best wishes
Dmitry
