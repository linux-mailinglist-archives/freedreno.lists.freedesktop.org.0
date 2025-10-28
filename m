Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F41C16EFB
	for <lists+freedreno@lfdr.de>; Tue, 28 Oct 2025 22:24:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C05610E668;
	Tue, 28 Oct 2025 21:24:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="nyzmT0E2";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MD1Xh9A8";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAD1610E669
 for <freedreno@lists.freedesktop.org>; Tue, 28 Oct 2025 21:24:05 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59SJlH1v2615908
 for <freedreno@lists.freedesktop.org>; Tue, 28 Oct 2025 21:24:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=ABfUVFah1hyptug17CT9PCLT
 6YKSwLKR44p2mhENPxY=; b=nyzmT0E2zUZcOTuJNcY9dPI/G0QV6X+vN1PlNWiS
 hEVln05paPS+i65KuvyPhRfjRYAXkmg5L+mRskypLVCLxmlfnKa2dchwJ1r48hA7
 hY+9nSiKsVIZASoObXecgJwnPFB5SUAItW5KKwAxH4MfAHcoI5NVo/3yVZWwX+VS
 XmgE9Bp+nONz+qTjmBmDwzsILtzFTckjj6G00vgWY1/edOhuV4+Tj2ZaNvX2Ixdm
 H6GDFfMCkfBhy/6OiB1fBT6IB68cqMKVfQpRSB9pGaolPpWgaTJ6GhLvM7k94XEj
 WjXXYFqWKkMs4GqYZEITm5Iis2f6GTVfVC7C82Vzxd6JhQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a0g6y7-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 28 Oct 2025 21:24:04 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4ecf0501ec2so70528021cf.0
 for <freedreno@lists.freedesktop.org>; Tue, 28 Oct 2025 14:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1761686644; x=1762291444;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ABfUVFah1hyptug17CT9PCLT6YKSwLKR44p2mhENPxY=;
 b=MD1Xh9A8BQcOu8cjdeZhabBEJ+fwjTiRYsRDT7YWAs4Befi1mIwVEuavZD+QREaYCx
 dJNmM+K2c1QJZQo75FBm5sMHsXxjaODFqLTjOFmS4BhzerS7hB5wIUsbGCoTQVBuaw/d
 qEG3YTOmIz5zXTAflMDjUqe2/jgH9qh9Mqu/C2vgL/EGBX/BEq9S4eFM4YNjVd5YU2s9
 PTJsP3glz4tsWiWwuORKfV4+KWnfhrHrYw8Dgp/A7yzkY2HkwAtCReamMT83FoXFWvjU
 /HdnsczvHe9FXp5G5FXWrOSds1JFGYNkKhm8kSQ01lRNhStg+G6OYA3UDCIS6lDWpWi3
 moZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761686644; x=1762291444;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ABfUVFah1hyptug17CT9PCLT6YKSwLKR44p2mhENPxY=;
 b=huoGhYT9M/4mxnQqbVmRAQ0rekPKmfBwj2e+z0Fc0Qbu2925veJwBey/wVLVD/VLu8
 RLsI5UxtRfeov5k0xgcdHGtXdjj4MOVkHBdoDbZj8QdrfS/fxZpVq+O0n55C3MwAnq7M
 NJ7n4k9S1J6GHdZYECwCP0U1WAdubVF7UjgtnbOtFKr58s/2PSUFGsmJaQnd6JocRhvd
 1DrkcH6qfmiLLuE/Rb+bOVC+0NWLtks2QUADrLXlY8cThPK+edaB01hNUs4OnRjDOfiK
 3S6Urcz/LGjjZj08FjATs4layKDcLGHzSbJqDQvjp50KS7m7Kvh1FWoQdN4olg2kdL46
 wTrg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV57bHrFiNPdJ1ZX25BrLz58U9fIErXDZlANpkF6QYA2x0RywlgyN3zAOOggN7tctIeUuRCs5eu604=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx8XX99r5mdBBsPpTWUwMh/0j5yovHbjM2cHrGQxPyjn3UKjhNb
 222ZcR1dar/NntCXNWrssa2F9X7FTSlzWSaB4ecAZgaYAoodfeA4+QqxCqKFbliDKOBtDAwlYNA
 qVmpLJHpuVABa8O4UvGkpMJbH5iXT4MPCMc6Xd5ByXVPsOXtAGMshQ1rU7xhAP7dVpGJroXw=
X-Gm-Gg: ASbGncue0cuMQyxyEzlTwas5fph2tkVprOTdzrldb6vEZd/0Ofdp69lcJ7pQ3EerDq7
 Qxd9TXFHhk2LqQjURD8OLrrNTqOJz8NNQgPxjkybZhnEQAlv5z5rV9Ep5zZL1MvObqrUfdoxjk5
 tGussQHQsxPZ4CTpbTZLABItGEKp80W5YUhwqzAgar67K4BEpAgbspu71CU42hh94p2+OpvfsB5
 JJm0nMrifuRZVcbP6R61HtRsIio4vJphK9ZtkaxujxC1djZ1uZf3gypt1pqLuNauXgkwcEzUZs0
 FSQvSiH67Mg3+EaPOebQP3iewouGgku3phH5kb3yUob1rbVTz/WNX8VtvfS/tyhEwWfEp7Bzf2z
 BvOWxZ/pFB6XNptCx37mt6LdKVimF6rDsPc4RfHh3vphzYjgDPCVAUTFfnRFxLKFfiaTlLEfvaM
 0RC5HSzIUIhHia
X-Received: by 2002:a05:622a:1c11:b0:4ec:fb62:fcc5 with SMTP id
 d75a77b69052e-4ed15c04a96mr10327011cf.49.1761686644169; 
 Tue, 28 Oct 2025 14:24:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEBhHm7sDSm0SNn4923M5bA+i3GKL7HcAL70JWJZ8fxnsCfd+ylfQkS7TGD0NAfopfgQklzAA==
X-Received: by 2002:a05:622a:1c11:b0:4ec:fb62:fcc5 with SMTP id
 d75a77b69052e-4ed15c04a96mr10326691cf.49.1761686643711; 
 Tue, 28 Oct 2025 14:24:03 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59303ec8b95sm2955835e87.98.2025.10.28.14.24.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Oct 2025 14:24:03 -0700 (PDT)
Date: Tue, 28 Oct 2025 23:24:00 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vladimir Lypak <vladimir.lypak@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Kalyan Thota <quic_kalyant@quicinc.com>,
 Vinod Polimera <quic_vpolimer@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/6] drm/msm/dpu: Fix allocation of RGB SSPPs without
 scaling
Message-ID: <5ijdhvmmqgt3xdfajgumv46ifsgnt7h4amtrbfoklcl5do4xjz@ks4ufzfzpyij>
References: <20251017-b4-dpu-fixes-v1-0-40ce5993eeb6@gmail.com>
 <20251017-b4-dpu-fixes-v1-1-40ce5993eeb6@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251017-b4-dpu-fixes-v1-1-40ce5993eeb6@gmail.com>
X-Authority-Analysis: v=2.4 cv=HvZ72kTS c=1 sm=1 tr=0 ts=69013474 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=sCrT992wuxv5weLG16oA:9 a=CjuIK1q_8ugA:10
 a=ZXulRonScM0A:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: JEgcYBzrGQl8mjpuLyULib513WtDOIEa
X-Proofpoint-ORIG-GUID: JEgcYBzrGQl8mjpuLyULib513WtDOIEa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDE4MCBTYWx0ZWRfX0mXcMdRdoZ0x
 Xip33Xs8kULIfAlCgRJNXTh+Eytx1HWOTA871wEqOrD/1IeUpw1n7BNp0esiCJxXY5hE6xxSH0F
 +7k454/L8zXSrS65TMRclGkpySg1c44+WJ+xLQLc1k8Xl23xpJVEJGe2T0+2hLU9J4zUHkphyU9
 aUt32KWkLuhjggNTEUHN2TCtf5yuW5k//x6nGg/3phmVP3Y/orm0W9+tyjLVc62H/+21+bheq63
 aGMY/3o6BvTWcBcPhJGS9Ambjc6YbELHlOde0YWqMo8GkJpoD7UBg1TYHOt9nqcTrwrsYupVZUY
 KexcHFMWNDSqsHi9aXQl+hLnaSn2MOMgVlFc3PUlOreu3z19ZEOKsvAuRx2RG/MF0iSCMG38DIR
 WU8HdhXgauLPFoGtmOlTWSOrcr4XKQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510280180
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

On Fri, Oct 17, 2025 at 07:58:35PM +0000, Vladimir Lypak wrote:
> Due to condition in dpu_rm_reserve_sspp, RGB SSPPs are only tried when
> scaling is requested, which prevents those SSPPs from being reserved if
> we don't need scaling at all. Instead we should check if YUV support is
> requested, since scaling on RGB SSPPs is optional and is not implemented
> in driver yet.
> 
> Fixes: 774bcfb73176 ("drm/msm/dpu: add support for virtual planes")
> Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
