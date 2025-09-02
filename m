Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F396DB400A8
	for <lists+freedreno@lfdr.de>; Tue,  2 Sep 2025 14:33:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CC9C10E6AA;
	Tue,  2 Sep 2025 12:33:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="JrvnP5+t";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A1AB10E6AA
 for <freedreno@lists.freedesktop.org>; Tue,  2 Sep 2025 12:33:11 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582BGFfc010341
 for <freedreno@lists.freedesktop.org>; Tue, 2 Sep 2025 12:33:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 vSvPlAtycm0pq6Ig/4XPFbNEtXJ7S/Va70A53TQ5/A4=; b=JrvnP5+tLTWa98Ty
 yumJjQYn3dO0XnbKa5+FlBG7AHsOP6WEPFza7CP86KjUy292hW/VGjv0Z/fZqNmV
 0rvKK7CR/TlEESvwdAlnMBMpLvMwcjRpD7Dx27zkOSdeD/g4tCnTekR3VhJF7n6H
 VVSf/lt+s7aKADlobM5MeekYXFh/pxhHgUNInvKRdyX3683BFfIBjP5JOCXXMO+n
 ugzYWbBvv8Z+DY8ia+3PXOLCJZebNTnnLi/ahpupXgoNjlRZrt1igtgO2SJfOcoX
 NAt24AC2+I5TYLwb2BwI5xHtH6xdSFQ5f9FWnr32FeXAJ0jkMqe9UGtCdWnKVXmf
 Phq/6A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urmjfrkk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 02 Sep 2025 12:33:10 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4b2d1c2a205so16052591cf.3
 for <freedreno@lists.freedesktop.org>; Tue, 02 Sep 2025 05:33:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756816389; x=1757421189;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vSvPlAtycm0pq6Ig/4XPFbNEtXJ7S/Va70A53TQ5/A4=;
 b=BrGBgYnXk7wUko2kNECBosfxAcxpOW8qWJL5SuThCt+zAqRAQP1tZPIQjJxITpl8la
 WpKr+mtKgyz7Yn2Oq/JFs1FHcmt+kXgKzaZupQHs4CYPybv6yklear+gUX07B2qeEajC
 M3+RsY2hEhtYbpZ8Mjzc+ed7CB9ZoiOEFl/14FcErw9tecqR+FLDkaZsOMr0XhZPZatu
 T92YDa41LxHsNZp42jyrSqclwfSX7dTp2AwTocx9/kcWmaOLCgJyIMsycDDf7dwnSvtL
 fvQc3uQNbtm09auuH3laWpNIk/2P5D2D7B8wZYqzZj56Y4dH11qsWk705oi1mxKTqWBe
 bOwg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYhRtbidWR4ahmGI8TsDxVbp1tU6MN17/riuhNvphSiVST+S+PC+QnZsqfQB4fp9YcXW4Hy5DQQrg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxEewRGpnCLEFbXhhQOEq9AytJaaSdUZrTZ1KJ/8uFB7p8OUxfl
 jyorcdhvtYdR5hTZsnoFS5TPM1CdH3TonaKYdvuznjWO5KG8ERfUt2BZ+X/d4SCxqvVlg7M7DCs
 uKk/bFzbOUNEumNBHKqDYBMxa9KkNhu1nzmEh+0Ay1r8YH5aOabqnQ/mkoE6UebuhHcl9Vfs=
X-Gm-Gg: ASbGncv7aKMcmQ/Iac8C2YpiedSVJIH9wj9lfbqGCOh2zIoy/tNNo24SX10aj3KtUzt
 1peuQ6xxgZCgJKUKWvfSrFyHbY3R07bjCycc3LcpA6qQ7yt5zVdITDliC0s7ZLsMqxiYvYRoHrP
 OrP0zomIJvrqW8N4sTkQfQ8lTTNnnzDI1urKR8/mzAsSG4ODMdvRm+QjzMqMkcsXmx3Uu0E3ogU
 dTxvVrGx7bi0ejiDLxy6qJ/slGCoFVxf4LbFixzwJoTlrnl7RhVqSE4NnVXnrtrCOlxWgb2zmm4
 K6s/AhSJH0z1/x6DMsudrPVddL7dTNVvZJS5guwvcHZCKfkQlVo8km99NQF8OWZK05Q2qLjnHqv
 6pPwI8pTpXLGZaDi2WB7UUA==
X-Received: by 2002:ac8:5d87:0:b0:4ab:5c58:bb25 with SMTP id
 d75a77b69052e-4b313dd02a0mr101705861cf.1.1756816389186; 
 Tue, 02 Sep 2025 05:33:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFygbSXPmg/W2fjM/6E1xOIRsZDrVD2qEEhASg0Xx0E83kK/rba5OZ+uTMQ8o+BQvRuG1WRPQ==
X-Received: by 2002:ac8:5d87:0:b0:4ab:5c58:bb25 with SMTP id
 d75a77b69052e-4b313dd02a0mr101705591cf.1.1756816388644; 
 Tue, 02 Sep 2025 05:33:08 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b040df6e19fsm723031766b.100.2025.09.02.05.33.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Sep 2025 05:33:08 -0700 (PDT)
Message-ID: <694f0989-64ea-4c3c-8613-863da1dd286a@oss.qualcomm.com>
Date: Tue, 2 Sep 2025 14:33:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] drm/msm/a6xx: Add a comment to acd_probe()
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Jonathan Marek <jonathan@marek.ca>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250902-assorted-sept-1-v1-0-f3ec9baed513@oss.qualcomm.com>
 <20250902-assorted-sept-1-v1-4-f3ec9baed513@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250902-assorted-sept-1-v1-4-f3ec9baed513@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OemYDgTY c=1 sm=1 tr=0 ts=68b6e406 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=KrKh6rb5Vgb6-fdLxr8A:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: 7WIjMM2FB5ZG6Hl_bcJHPkDyZM6w1mn1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNCBTYWx0ZWRfX4Eqh3NdP9sKY
 KV5nf61EZLuSXCjJuPWOiBXGisFBnZu5GmSQaKeT4UbGw58dRb3IEGZx2Nrg5CG9TFo+gR0xMAa
 J3YA0v4NEKApgTU40FrSvsoss5GXIw70/FbJ3enZf+0bTUmfshGKOh/lXfwjvFUXisUG02sid2n
 Z7LFj0VxzPhV6o61evhc9e2FmYSS74WcuCOgQd/LFmYDnrHnphgdFxeByHFMZJ+nt5Y6qz+jp+y
 UHqTqzH+qMTd143UO1W0lYidkhOrhVmVPXtmZLymZJCBr2ykqaRQxWnJwlimCEqZW+FZl6ezEIJ
 z3NtqSv45/rL8aUgywt5ucfeiiCz7ScaDm74YJQs+v0rnrjG+frgLadc2V9QNzGbR+G9B8XYuJc
 +fPnTzXv
X-Proofpoint-ORIG-GUID: 7WIjMM2FB5ZG6Hl_bcJHPkDyZM6w1mn1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300024
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

On 9/2/25 1:50 PM, Akhil P Oommen wrote:
> It is not obvious why we can skip error checking of
> dev_pm_opp_find_freq_exact() API. Add a comment explaining it.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index ea52374c9fcd481d816ed9608e9f6eb1c2e3005a..de8f7051402bf0fd931fc065b5c4c49e2bfd5dc7 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -1694,6 +1694,7 @@ static int a6xx_gmu_acd_probe(struct a6xx_gmu *gmu)
>  		u32 val;
>  
>  		freq = gmu->gpu_freqs[i];
> +		/* This is unlikely to fail because we are passing back a known freq */

This could probably mention that known == we just retrieved it a couple
function calls above, but I suppose the reader can come up with such
conclusions

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
