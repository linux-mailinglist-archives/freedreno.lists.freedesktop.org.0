Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3604B0E463
	for <lists+freedreno@lfdr.de>; Tue, 22 Jul 2025 21:52:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D81310E700;
	Tue, 22 Jul 2025 19:52:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kr774tyK";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36F7C10E700
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jul 2025 19:52:27 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56MF8r8r013033
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jul 2025 19:52:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 NgleyO5RfA0jJonC4fbj/fBe3zzFRDRyWtUD4mibfAg=; b=kr774tyKpnQ9Zyws
 IuNzzBUb09SF2MpAfZsdQnslNeHCnvzeZWMs5fDOb38LZRUtSJnk3arYSHS5hXjt
 yCimrEi6zN5BHVIDmqBsUuN6wBtQTl6hNX4nS49QV2Wll6ZTEgl8EsR2BKZls5wc
 7X+gf3kHSKpRARHjXcDdv5q8ts/KWNteAlWdX23/ugJDhxKwXSfbuDoA3I7G2ZGC
 FHmn911HnathefJ52Ew8TVzbdeuZF4MAmQwASVhC07a5OdN0Y2PJCY6MnDRwMnJw
 Yd4dJBqOv0VRoiQ68WLJ+UP8+6TTwYsyA3j//zWz6LRTA2cMx0evaUs/xQCv155N
 uGGL7Q==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481g3engu2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jul 2025 19:52:26 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-748f13ef248so5431799b3a.3
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jul 2025 12:52:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753213946; x=1753818746;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NgleyO5RfA0jJonC4fbj/fBe3zzFRDRyWtUD4mibfAg=;
 b=D9vdTGUTT1tfvPXxuQBw0QLvUXuXs75YCdNHM+NX3d1pX2UhZX3wVH5YIl02IB16W/
 R3qzVrDClVMu0EYm3N12qWMysfbsUTVyVqCJRYcdZ3KSKrAJuNJTdhR7BGpd84cAuJHg
 zPXHyisSe03gCowyTkReADcD4ROTCtWMKtbvdK40acRJoJIpq78m3K+uMYRWdztQ06Af
 2BaJBkAovhvyUrqqoLrmik+QLZOUPE2VhaCJJbvSBsFMAGnN6ZIAWMuKwnW0+zYF38oF
 2F0SrDuIJkFuGVenlP+T4mGpXx43+9lfLqNFSS3+3PlAfed9ZXs0k+OTyg8a/0nvC8K0
 ixKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXl7673WGKaQbjIR77ro2UbsMIhSNVmeuz9AxZZwria3CZPfV0XTKAr8RH6Dwk3GIX0+3XGCgJcUT4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx56GHST7az0ausliStQZaKMDZpLyYF+VLHcXiFdw5rihhbXjrq
 7HtmV1HmSfvi3nHvqJx1Sbo28RUr/YO19uhAbjlR9Ge8KMzVbaDAo3pf0f6aGtyYE4Hv8Pnz78m
 eMDASEg0MkblqWxCcTy0NQ8v5ntH929mAoGpIC0Lr6er2CX/75q8SrvrxSbzYi1rBpxU8Z8o=
X-Gm-Gg: ASbGncunqOpNil1IoY8dP8rmzvVRAmJbL64IoaRfVkmmwTRPPOy2QyLGLVFUJdeNTWY
 z6kniKpQbRCxplNZ2ds1ZNQ3NJIhEPL6zgVAhY5+AvcW47c6PeYlcKCLkQzegXBFgHst9nAyMc1
 GUkoQGClOfdz7gE5KYc8zY2LycLRzyeU8odVkZ4xt5Gja6qzERJ5rD+SwF8Ib61vf46RwP38BCu
 1u7YTL4hO415/D0Mhw9ewtYjgx+KuKDsIgaLulq7caaJPiaaoo1L9mvC4crT6r+UhbyVffjdDDW
 m6YLja9ABTkPdjsYl+MNDcgaHG3lyR5jp7+Dq0RFTiBheLVQIPSHR1alFUp0OxOC
X-Received: by 2002:a05:6a00:2446:b0:74c:f1d8:c402 with SMTP id
 d2e1a72fcca58-76034510546mr882715b3a.8.1753213945706; 
 Tue, 22 Jul 2025 12:52:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFUuhsn+CPJWTbTSXO1IZeQTiGzjVoE9h75N3Pgihn8vh+oCDCTqUQNSuxmfB1Ryj20g7s3JQ==
X-Received: by 2002:a05:6a00:2446:b0:74c:f1d8:c402 with SMTP id
 d2e1a72fcca58-76034510546mr882673b3a.8.1753213945209; 
 Tue, 22 Jul 2025 12:52:25 -0700 (PDT)
Received: from [192.168.1.4] ([106.222.235.133])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-759cbd63cd9sm7622600b3a.160.2025.07.22.12.52.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jul 2025 12:52:24 -0700 (PDT)
Message-ID: <62391e11-2f26-4e30-9c8d-b47d4985b41b@oss.qualcomm.com>
Date: Wed, 23 Jul 2025 01:22:20 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/17] drm/msm: a6xx: Fix gx_is_on check for a7x family
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
 <84a33e15-edaf-4951-8411-24b17ee5f4f5@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <84a33e15-edaf-4951-8411-24b17ee5f4f5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: SdpSfFyoqCky5ahCSIW_Avd6B3oI64qb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDE3MCBTYWx0ZWRfX0LWxjshTtCCm
 3ndvFVna+kMXFdMOmhmyerbN3gUpbbd92mxrwnNNWpGBInzOSh+YxQGZp11fBxeJapdZ+GfZcbt
 B9gGSOCqDMbttgXu6+tEnoLixJmkWI7yNNWNMi5N/rr02hKrhO5QvlPs5Y3VfgGqYtlM6ekEvKO
 B75P5YviGIyMofPaDSI38q5IEBip3ZCoqnv5A38r28F0hychyDD9DzOMSMDwPKeO4QQkQ6nnSme
 NnXQwORWjQ0ULy4CxY0Lsjggvsh8Ivn7v8wKSaY+x1BPxb7dttHvL51igaBPHrz8PqPndWnRPqn
 ieT3DP6dIi9noQEGDltrI0qSDxhQHw3lo76iseiFluSw73rGOGjlmf12zMKO2YLAaYah5y0/OwQ
 rqKrkgg2I96dT/6n/ihkiFen1FGJn6QfAtJp70j0eY3PyQuDXVx1oMxvS8Hj8XEnHri3ft36
X-Authority-Analysis: v=2.4 cv=Q+fS452a c=1 sm=1 tr=0 ts=687febfa cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=4dphQItTPUswyQvINXrzgA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=KQakvA195p00paWSqTwA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: SdpSfFyoqCky5ahCSIW_Avd6B3oI64qb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_02,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=999 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507220170
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

On 7/22/2025 8:03 PM, Konrad Dybcio wrote:
> On 7/20/25 2:16 PM, Akhil P Oommen wrote:
>> Bitfield definition for REG_A6XX_GMU_SPTPRAC_PWR_CLK_STATUS register is
>> different in A7XX family. Check the correct bits to see if GX is
>> collapsed on A7XX series.
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
> 
> This seems to have been introduced all the way back in the initial
> a7xx submission downstream, so I'll assume this concerns all SKUs
> and this is a relevant fixes tag:
> 
> Fixes: af66706accdf ("drm/msm/a6xx: Add skeleton A7xx support")
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Dmitry/Konrad,

We don't have to backport this change because the existing code reads a
couple of unused bits which are '0's and that is okay when IFPC is not
supported. So there is no practical benefit in cherry-picking this
change to older kernel versions.

-Akhil.

> 
> Konrad

