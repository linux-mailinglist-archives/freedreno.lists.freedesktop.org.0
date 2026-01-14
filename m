Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8990D1BE13
	for <lists+freedreno@lfdr.de>; Wed, 14 Jan 2026 02:02:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A07F710E172;
	Wed, 14 Jan 2026 01:02:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VD9yqTFR";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L5pMCrHG";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33AE610E172
 for <freedreno@lists.freedesktop.org>; Wed, 14 Jan 2026 01:02:32 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60DNIV4t988086
 for <freedreno@lists.freedesktop.org>; Wed, 14 Jan 2026 01:02:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=h18ZqtLLvGt/Pa+wG27Y9TqJ
 rGVZgx2iCCkSzGerT+0=; b=VD9yqTFR4gXnt3n/FZpIJQX4gpBL0ktXG9WZhk4I
 yY4RP+jB+88nfH8GbeMS3CYOmrUAGd6f5r6QDFSKo2QJYbxcAzDy2ncylVXPV5Ai
 Bi5HQfHbT4B2zCMSiD9oNI4P+c5fWJYNmHsgEAr7S2+a0c7vaom+JUfPR8YzKGm5
 HQiTvZaoRfw7JD0d/eXnVqh2iqtwxGqyXuxrhF4uyMZxtkxXiKFO43FHJ9eWLGiU
 AkNKR3aAdeux3ByK5/j4R1deWK9zdYewlq58tzEOHwMVkOSxFKtMZoYcORTJsws6
 ZVcSNJhWeNIr/jZJkmrAALiSwD0RyK5O7/6RQpgDtHNJAw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnr3e9t48-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 14 Jan 2026 01:02:31 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8c1cffa1f2dso100543885a.1
 for <freedreno@lists.freedesktop.org>; Tue, 13 Jan 2026 17:02:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768352551; x=1768957351;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=h18ZqtLLvGt/Pa+wG27Y9TqJrGVZgx2iCCkSzGerT+0=;
 b=L5pMCrHGC0/7nT31zT05Ik4Lj8Hz6x/471/mbXG4HFRlUo1rrpa3Z+hnKiZgqjqpwS
 m/wAEqZqljcZmFfr8Pn8x62wxlrY9dFkhtyHjDbIjaquhKaEpoxFoh97x77x82iGsx/o
 WGkE5tFkk4Jdl0dqS8BrQOGRm9EPyX+OWMY7aThJ31Y9MzKtGfLlh645eeuwDEYS2hfV
 piMe67yvf1tQGStBeefwKWO/qabmjpDjpWNZMbYqH7+gJRvK5eJvxwzVIdrbgorS/ySx
 ldX258EdeYGSNxcN0apmBqWnl/1pfOcfCdhwV7SJ+oZCUQpdvBBYJv1jCUwchFQGZBjJ
 TtFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768352551; x=1768957351;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h18ZqtLLvGt/Pa+wG27Y9TqJrGVZgx2iCCkSzGerT+0=;
 b=SB5Kq3tq2UnaSBOmd8uHCRffN0ts9sPZH4bdiuag8DB8fWzF/MItK3h1Wsg8jKnQif
 5P6hHipymIqQ3bNsQefl22AXkAJoexjmfLebAYUpCG2+eDMQ5/cqaYfBxcqhExaovx8c
 ayUEAtvkchGso/xxH0qcvbUQYkJDEF0lwmAiyPgr+7k6bSQyE1ZCOGajdbkD3K12YI1d
 suDRhfRGS4F19gDP8SrnmkpyDY+sX+Goqji0OqyJxG6JZSoZH+TahcrnpkGsffTSFe7i
 L8FGr6eiJFXncRpd7BdLAxLeCN8GhTJmD/a5sZFJ0Fc2dRpJ/PiTd2uTspjJ4ciRPGfn
 VJcw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+Q+gQ+wxUKshTnzQcREWdwwA06sqNRf5WnR+e1C9LDC7lAaD07HVprpb6+JTVQPOfQJ7awaM35tM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw3OZOgcjMrmXq7hCRCkM+mKg7NS4OlXlCYH9q4D+GYVLVuPV5f
 Ih7T70b2Cm7gYVvaqUXI8IEAFM24f+Z7W8Q2JTdu5JiecfxPyrNVRj2qXe42e+9q3mtXzCouqgg
 YNkuB8zC3psMsVdVVa4vHz4JZReZhkx+Fm8wAVT7dFL4dIuKwgbnE8l72q8TF8rszpW14kKI=
X-Gm-Gg: AY/fxX5KrIrut+Jyb3eKBfUtdri65EOvMP3xl32SebdnMbcl/p1XO0L9Ocz4SW/bJxJ
 7EMTMmtpeaBpg8B0e0CGF4TJAcNQS3OFqXPgPTZjhNCU/qKMd19cOQ6w/IYJgHIurPL557B6G/o
 fUSD+jGAlOxYvx2bdyFreTlFZq6Bp8NqZBDl/+bET0G0XugkXzss0axB7z9LOGx/QjIsZJABvI7
 aZdLlVLRhHlI11utzoe0TSmdhqyDuKaN5wfxsve6GBBVDOtpKnY2FVHI+Br3jn5NG/TthmuI7WA
 LyBsN+M/NYW/85o09wsy7ejnSxR6TaZ5nf5ZwIaPk7i7f/mHcHaXz4qmYA7BvKxWv57baCjo39h
 45SUFqI01XwIm0tfmPI8yz77v3XylZCU9ReTsciaYnB6NR5UhWEci2Hx65K6IwH/eCI2KT/P1ZV
 ztTLcXqgB3mina/HbiDS9NvT0=
X-Received: by 2002:a05:620a:31a6:b0:8a2:595f:657 with SMTP id
 af79cd13be357-8c5208a4cc6mr654201885a.21.1768352550587; 
 Tue, 13 Jan 2026 17:02:30 -0800 (PST)
X-Received: by 2002:a05:620a:31a6:b0:8a2:595f:657 with SMTP id
 af79cd13be357-8c5208a4cc6mr654194785a.21.1768352549807; 
 Tue, 13 Jan 2026 17:02:29 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-382eb7b464fsm48970681fa.20.2026.01.13.17.02.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jan 2026 17:02:27 -0800 (PST)
Date: Wed, 14 Jan 2026 03:02:24 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, llvm@lists.linux.dev,
 patches@lists.linux.dev, kernel test robot <lkp@intel.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2] drm/msm/dp: Avoid division by zero in
 msm_dp_ctrl_config_msa()
Message-ID: <5e64ih6c4abydpjto2asvd2dev2bu3wlqp7rbryr75vzcf4ubo@ky6t7rkbf6wr>
References: <20260113-drm-msm-dp_ctrl-avoid-zero-div-v2-1-f1aa67bf6e8e@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113-drm-msm-dp_ctrl-avoid-zero-div-v2-1-f1aa67bf6e8e@kernel.org>
X-Authority-Analysis: v=2.4 cv=TPFIilla c=1 sm=1 tr=0 ts=6966eb27 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=oHda18c8P31K-R3mfaIA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDAwNCBTYWx0ZWRfX5PlB2EGp9fEL
 eXHvMY/hI06GXpffdE9vd6/G50gIfFPEzTM3iqG1bgSYeGu8RP/sE048sR8xsMuwcDkHY447+tW
 p+ctGX5x4ym6Mw2cC4KawWHP9zDnqAMasCiJyLcVPr+6zOPuICd3sowkOCVzpW778KFL/m/OgPA
 Y1X/KcXeceEA77j0yLUZi5yO7hVPN/G6ubXwZbO977ee/1/qVO7lVR/DKIdmshwGiZwwpE/OR87
 G7bUadnt7hnmmRMmGohEbU6MSumW8HUhOv+kxDM684X2sENik9i/Pe/nQrO3iimSHWeATfJJuZb
 /4lz+HL22kw3k+Z4dm4UyrRwk3q4usGdYy4Ts4IbPiekdx8/93aIGKzBpeS+hHfK/xDrVRgJ7yT
 gBEGaMNkwdreJe/6GsG6wTSuiXpcP3trBB76cO/oahwEEa/hhnuO+Q+UKiGjx1AMSa1Bdc+2gAD
 gYG8bJ/qDYCwnh3k5Kg==
X-Proofpoint-GUID: 16jsRm_GvuCNyMnqX4O31kwO--zvLvRU
X-Proofpoint-ORIG-GUID: 16jsRm_GvuCNyMnqX4O31kwO--zvLvRU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_04,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140004
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

On Tue, Jan 13, 2026 at 05:00:31PM -0700, Nathan Chancellor wrote:
> An (admittedly problematic) optimization change in LLVM 20 [1] turns
> known division by zero into the equivalent of __builtin_unreachable(),
> which invokes undefined behavior if it is encountered in a control flow
> graph, destroying code generation. When compile testing for x86_64,
> objtool flags an instance of this optimization triggering in
> msm_dp_ctrl_config_msa(), inlined into msm_dp_ctrl_on_stream():
> 
>   drivers/gpu/drm/msm/msm.o: warning: objtool: msm_dp_ctrl_on_stream(): unexpected end of section .text.msm_dp_ctrl_on_stream
> 
> The zero division happens if the else branch in the first if statement
> in msm_dp_ctrl_config_msa() is taken because pixel_div is initialized to
> zero and it is not possible for LLVM to eliminate the else branch since
> rate is still not known after inlining into msm_dp_ctrl_on_stream().
> 
> Transform the if statements into a switch statement with a default case
> with the existing error print and an early return to avoid the invalid
> division. Add a comment to note this helps the compiler, even though the
> case is known to be unreachable. With this, pixel_dev's default zero
> initialization can be dropped, as it is dead with this change.
> 
> Fixes: c943b4948b58 ("drm/msm/dp: add displayPort driver support")
> Link: https://github.com/llvm/llvm-project/commit/37932643abab699e8bb1def08b7eb4eae7ff1448 [1]
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202601081959.9UVJEOfP-lkp@intel.com/
> Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
> Changes in v2:
> - Transform existing if statement structure into a switch case with a
>   default case that early returns, avoiding the invalid division
>   (Konrad, Dmitry). Add a commment about the reachability of the default
>   case.
> - Drop the default zero initialization of pixel_div, as it is no longer
>   used due to the new switch statement.
> - Link to v1: https://patch.msgid.link/20260108-drm-msm-dp_ctrl-avoid-zero-div-v1-1-6a8debcb3033@kernel.org
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c | 24 ++++++++++++++++++------
>  1 file changed, 18 insertions(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
