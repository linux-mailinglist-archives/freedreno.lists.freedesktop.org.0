Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C52AA9D11A
	for <lists+freedreno@lfdr.de>; Fri, 25 Apr 2025 21:06:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5707E10E98C;
	Fri, 25 Apr 2025 19:05:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="buHlkdeU";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3207810E98C
 for <freedreno@lists.freedesktop.org>; Fri, 25 Apr 2025 19:05:58 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGK1nI032096
 for <freedreno@lists.freedesktop.org>; Fri, 25 Apr 2025 19:05:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=LRv92KOIwcjmIzz9Q5TxqXo1
 6+d8D9ntGnUnJ9cFXrw=; b=buHlkdeUCX2IhNHrdS2sz3oiWrOK1CJJhiiCDn07
 fUt8T4w1jDWuxz5UY4UXBWypUlbeIc/b1tvICgWaYNHZBBXoTQH710SjWvxUHs4e
 eyt2LBwVssiGYbKvZJ48NSSOA5fDrKCDm5cqN3SWS3Mc0CsoYZlotSRNfybmXaMy
 pWQkMWSFdXvEK5e+rhIuXaGiYx+S4GsKDPnDO7dz5PCU/55mflf3vJhAuq9s7jDE
 0t8h24AyKNI7XC+7EN+Sf+tSE39282irX6309eWPCJ0tjkg3Qv1S8USTGFEmOvsO
 VkYdWLrjb3f97pdnBXWdR0rJbux0j/ZP+kVNfCWkvnIJwg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jgya1s7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 25 Apr 2025 19:05:57 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6ed0526b507so44439216d6.0
 for <freedreno@lists.freedesktop.org>; Fri, 25 Apr 2025 12:05:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745607956; x=1746212756;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LRv92KOIwcjmIzz9Q5TxqXo16+d8D9ntGnUnJ9cFXrw=;
 b=TGkQ8HCkarKGVaoQvchHLDW08MGG8WSisWe2ZMMqk8HRuVf4FqFBRvmVN9Oj2k6cTv
 p84gGpNVJvR7DIGE+hDAlsZGuqXEahVSX/b3ZXIofPqjA2ZDO//SdUj04U0ePEr3De1v
 HG9jwHEQDCiFFJUvWBA5TZqxJelaOBnRgeVnSEzfra9wSIAiEROKJ9YlS7+6VeGlb9XY
 P2x7bCOG1Q84z/ZqZI6wgTh9sf8CJR8I8/FnVlv2B4l0G5PhHDz+aXaw0s3hVkoq9/xo
 PHPA0YBwxSnfe0vq2hX8E0v8697DUboyVEBS6urX1HAZflTwulB/nbNJ+7in40G0acUv
 7BHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVd9XjzuSuVD8dc287+Ahln67N/C/qGakmFCA31g6ESSYiEFFS4ipsGnhLWNkfA1MifDDJGSPtdGkA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzlpQNm2ocisfMP6x5pvh7w8/mKvyOUgzC5k2qigSM3vaKijgFI
 9s6/ya9S30/I7NWU1QzT0kOhdCLMYQLf8/xwq/WqTCHKi95fk6wvE2Pkbimusi5ZR65BWvpcqWE
 ancFLmzabnXp63s5o8IgW5ixP7lfirCSPIcMuN5VNv4Ov04faYFLNWP85GcK1BKeU8q4=
X-Gm-Gg: ASbGncs8KdvJg+VCcrYihD8O0+zjfe3hEHuE5h7Bv0FFSa82riPu+IIydlVyZ0vKzu8
 ONqLV7mkeAfuyliFkTIAcH8RE1Pv1gz5d+iCkVQWY6BMGLeP/ffUcG0ao3p4csQUuHQBtVPFGkz
 mXEIDKBvFYYZB8iMxcsn2zwcQ4r1SvvSx347k0ICL+j29WaF6RVbEddBxUWpRcZXQkFGHJEpe4N
 pRsVUBLYrNjcIMMktHcc2VZdoIdBO4+frLCpd5a3wk6BwQX8QzN8kbN1BebMQL2Nxe3E0ZGGLMO
 3pQo7VaaxLQG9ycOAKRnjT9wdvu/9jrLsamUlb6mGm6KEO9Pdl5lulTXd30L+gkHzlhzSTLrSVA
 =
X-Received: by 2002:a05:620a:4103:b0:7c8:b141:29a with SMTP id
 af79cd13be357-7c9607b23d1mr561079785a.53.1745607956411; 
 Fri, 25 Apr 2025 12:05:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGSIuxa3fWgHA8r+nKVNS0fd/thKUyHE882nF18+9xWUpORLb5D/kIP8t14NpMUJ3MCW0p8BA==
X-Received: by 2002:a05:620a:4103:b0:7c8:b141:29a with SMTP id
 af79cd13be357-7c9607b23d1mr561076585a.53.1745607956073; 
 Fri, 25 Apr 2025 12:05:56 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54e7cb3bf7dsm692860e87.100.2025.04.25.12.05.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Apr 2025 12:05:53 -0700 (PDT)
Date: Fri, 25 Apr 2025 22:05:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 laurentiu.tudor1@dell.com, abel.vesa@linaro.org, johan@kernel.org
Subject: Re: [PATCH v3 3/4] drm/msm/dp: Prepare for link training per-segment
 for LTTPRs
Message-ID: <kawx45acgpl4ywifjnszqhddtq363etjsyo4jomg7mbtqmmtev@nqghr5rtsoen>
References: <20250417021349.148911-1-alex.vinarskis@gmail.com>
 <20250417021349.148911-4-alex.vinarskis@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417021349.148911-4-alex.vinarskis@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEzNiBTYWx0ZWRfX6lNRBTT4sSw/
 QSOxdjBzlt7wIpmSV8m3CaKnzRskNd56WlfnsR8ERz/ohz1UURdfJeDZP85KVjqnVFegYB/FbFc
 fcOB993BYaM8A8f66WuiCwdx4GYT7anlqlJi/ST68xSQR/d1D3gNnekXZ2unZn7oZfnE5vZYRia
 x+2qE0vkVveAXs3YHtW1xtIElMjaiDouOhnn4xzZtOo32HKfz6ATzSaYd4Dlk6qnt8ib7kNsUoT
 tIaWTUE84Qi6qu3XQ3K+19RQV7YLmqAl/y3fYRkY4D/zwJDhJ5QxbAtaf7+uqRukDFYU1mqyONE
 hNWHUMXhw/uDhXfbOWwPy2uega++wC1kS8cOoCdVBKVx2c5na17XaWehgfUPkEV37G7b7BDS3ZC
 GkenzjQkZoBLnhLNx9mOqfSXxNUrOsj2Rlb+BoDGiHWnL5mpYhwHtoO9vUhDJL1j5I/0L13B
X-Proofpoint-GUID: SzAseTFCTQUaLZ6abXlyFQqIGYIq3Oo9
X-Proofpoint-ORIG-GUID: SzAseTFCTQUaLZ6abXlyFQqIGYIq3Oo9
X-Authority-Analysis: v=2.4 cv=M5VNKzws c=1 sm=1 tr=0 ts=680bdd15 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=XR8D0OoHHMoA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=-fZx5E-Z4OSi-0Z-ZQ4A:9
 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=822 malwarescore=0 impostorscore=0 clxscore=1015
 suspectscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250136
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

On Thu, Apr 17, 2025 at 04:10:34AM +0200, Aleksandrs Vinarskis wrote:
> Per-segment link training requires knowing the number of LTTPRs
> (if any) present. Store the count during LTTPRs' initialization.
> 
> Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 17 +++++++++++------
>  drivers/gpu/drm/msm/dp/dp_link.h    |  1 +
>  2 files changed, 12 insertions(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
