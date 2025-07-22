Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEDA5B0E591
	for <lists+freedreno@lfdr.de>; Tue, 22 Jul 2025 23:33:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BD3C10E274;
	Tue, 22 Jul 2025 21:33:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ftvMARh3";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26DCE10E274
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jul 2025 21:33:38 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56MKTJcG014495
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jul 2025 21:33:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 9qRWH5+ZW9GBx8iVLnvrSB0e+DqRvlgDbboXKfgFMmo=; b=ftvMARh32A9+CJ+d
 Hrd6jmIQGG6LkxPudAmk09lRXbIhwhWrSYq61QwIAKjYMsA574Ccq0VefBgB9qLT
 N76DtVkPsMD3TzPyUKQx7mMpi1YYd6jtMXvftLvd1T6cOsS0QtTnZpnKyrE82TWA
 POgqg9zD1YkFlWKiapVC5/q1GxRWDU646aOmBCugyDqfmtfLWfjKzwYxo3xthWSH
 nxlVADJ+rApnGFdksmGUdEabQFb//f14iQ+N7vyfVFv0IjilUzhTykLxyTW7H1Yi
 HzlNFZqub4Wu+wAJJ/1b6JmlKZHYeEY2aG3PAGXjt6mUKy2QdReAg/MHULrYZtpV
 7awRSg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48045w193u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jul 2025 21:33:37 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-b34abbcdcf3so4217757a12.1
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jul 2025 14:33:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753220016; x=1753824816;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9qRWH5+ZW9GBx8iVLnvrSB0e+DqRvlgDbboXKfgFMmo=;
 b=NhFuDzfOWnIAXR9+L/MxNOKIvFF2wpVvhFxZpCeDL4Z3dpXpTJtZjRJq9Ho/6rJ9c0
 HLUSV2YHicLCR/ttzz5LizgxzNO9Ux0IoJshwpPYALtyREAQ4P5hUUpGLE1HNMNJOztJ
 h4bdB9bnUezcO0bomdoX2pM1KFL1PJ4haturQLE9gzuZAaMFps9/Tq6HbHPO3PQVO5MT
 rKW+I4uUi9uZ/pSbYHpCqyIwoKz6sf2OgeEDOzRWVVR3bKcT0OY2e3rUZQJii66RMAbW
 qxGeHeEbl34/b878+iNwt6ePWYEilkg3ubTf5gyw6aaYAmX3x9yskWkLb51BWt2mIi/Y
 +Vng==
X-Forwarded-Encrypted: i=1;
 AJvYcCWiSXVrGxLrxRRRVojalrt3vaPpjYHAP68fwlBnXqDNObIIdsBH6wOWAs8DmErbSvYwgI5W9pTEDKY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzcdYamcU7F8Q11/V3sCP7nBL7DDabsqsTzh2nLeE0wj7V1vlqk
 v52KcqOVggx7l3BYmOJalW71OMywZ5ch/UXHfm9Rurbqjuy8I7qqSRvYWG1tkoaIVWEkr3Gc/mQ
 BK/HM8/Gcr79IJ5aG2vulTVuR+omFofIdNvYW2p2yEe82t3uNrwiPDBglMRBGGd9/q/q/zFg=
X-Gm-Gg: ASbGncsU2y4rmVx0RUgZOf5mk0S+FW5q0r3EdlPZBdrgcD1XiivjFtPAt/Rvj7ZU8FP
 9X4go/oq8Laz3uNxPPrpCC29wqeVGyFR239a5y89T77kL6ezlC7x5FEC+Np8tHmuKZEWF1xpWyn
 TDtP0/mGBwsPzK2jmTMOhEBTUPbcwWhFWhLVJnwRqPutmGs0le3u1AB/6JwVIlhI8uzRtKLBk6d
 eYt324ZVHSj0JlaUo8zEO1SaLkQ06/CUVVsJNau1vUI7jUnJiSZh6I5Q9o+AaxAw+UHM8reXQMM
 sSPxuxbFGJEVUe3h0bWF8jEgpRS2QVjYyYcUxTg4Zmx1WQXGZs21o9wPCiOBeYYZ
X-Received: by 2002:a17:903:b8e:b0:234:cf24:3be8 with SMTP id
 d9443c01a7336-23f9820461amr4935725ad.28.1753220014581; 
 Tue, 22 Jul 2025 14:33:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHiLcMOkApVl8sBrggOyOYLjHKG4LM2qy9YFRdUAYb7bhhEcERxourvdjtEQUEK9sitkC4Pyw==
X-Received: by 2002:a17:903:b8e:b0:234:cf24:3be8 with SMTP id
 d9443c01a7336-23f9820461amr4935365ad.28.1753220014085; 
 Tue, 22 Jul 2025 14:33:34 -0700 (PDT)
Received: from [192.168.1.4] ([106.222.235.133])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23e3b5e2de8sm82627185ad.11.2025.07.22.14.33.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jul 2025 14:33:33 -0700 (PDT)
Message-ID: <28b85705-dba6-46d2-ad06-ac548528fdf9@oss.qualcomm.com>
Date: Wed, 23 Jul 2025 03:03:27 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/17] drm/msm/a6xx: Fix hangcheck for IFPC
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
 <20250720-ifpc-support-v1-13-9347aa5bcbd6@oss.qualcomm.com>
 <i4o3ivearks7gwg37ywyqyl4jpmbwnuczac6h7dscrmlepawag@jhedlyj2hzps>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <i4o3ivearks7gwg37ywyqyl4jpmbwnuczac6h7dscrmlepawag@jhedlyj2hzps>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LL1mQIW9 c=1 sm=1 tr=0 ts=688003b1 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=4dphQItTPUswyQvINXrzgA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=e3cV7b4uTqknVPGEt5AA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: 1RiCAAa4FE_LcCOfmY3npy76QPsJlq7u
X-Proofpoint-ORIG-GUID: 1RiCAAa4FE_LcCOfmY3npy76QPsJlq7u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDE4NiBTYWx0ZWRfXzKEKgCc0v2J+
 I59UOzYhSdc2kOVVMuAczNz9kraAYSnxPcyXyFncHic7kT7HxhOH2bTzYI1/mr22i4A8L/HyRCU
 WDcFi3VUUBWlUUAr5GcsZX5J8Pah0GIi/bvcj7g9poBU3u0DEmUqz68FjBxKz52Mw1I2pvaJZUL
 G1HCYDB2PHcrLeOVOP8WkglLJchOttv7xJF7tCcRROXNujmDSKfynCIp/SuL8S5tKBRPkWRvuWY
 9txP7Bp7On/8Er3NQZIcg+qqfFz9XfVYz7lAGLLhihyS/gueD2awZfDs2Cf5FJ5Fq+s6Sh2Etd0
 OjAZlvWbUPq58zMVPLQZ8SPkqnnzGvghCQjZizfd4ODykw0hrmU6KMxCdcHPNdKUOzh2zbjLLzL
 jDKC7o6rCAhVSB9vB+SKq4Y6JiC6QwnjFHX9FQ+4XXXBjf0uIUTZelXq0NHExLtGtcqLrHQf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_03,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxlogscore=941 clxscore=1015 mlxscore=0 adultscore=0
 suspectscore=0 spamscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507220186
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

On 7/22/2025 7:22 PM, Dmitry Baryshkov wrote:
> On Sun, Jul 20, 2025 at 05:46:14PM +0530, Akhil P Oommen wrote:
>> From the hangcheck handler, KMD checks a few registers in GX
>> domain to see if the GPU made any progress. But it cannot access
>> those registers when IFPC is enabled. Since HW based hang detection
>> is pretty decent, lets rely on it instead of these registers when
>> IFPC is enabled.
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 14 ++++++++++++--
>>  1 file changed, 12 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> index e331cbdb117df6cfa8ae0e4c44a5aa91ba93f8eb..b3becb230a94163cccff4eaffb8eed44f1c29ad0 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> @@ -2399,13 +2399,23 @@ static uint32_t a6xx_get_rptr(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
>>  
>>  static bool a6xx_progress(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
>>  {
>> -	struct msm_cp_state cp_state = {
>> +	struct msm_cp_state cp_state;
>> +	bool progress;
>> +
>> +	/*
>> +	 * With IFPC, KMD doesn't know whether GX power domain is collapsed or not. So, we can't
>> +	 * blindly read the below registers in GX domain. Lets trust the hang detection in HW and
>> +	 * lie to the caller that there was progress.
> 
> I know that we've relaxed code line width to 100 chars. Would it be
> possible to reformat the comment to 72-75 chars?

Yeah, makes sense for multi-line comments. Shouldn't the limit be 80?

-Akhil

> 
>> +	 */
>> +	if (to_adreno_gpu(gpu)->info->quirks & ADRENO_QUIRK_IFPC)
>> +		return true;
>> +
>> +	cp_state = (struct msm_cp_state) {
>>  		.ib1_base = gpu_read64(gpu, REG_A6XX_CP_IB1_BASE),
>>  		.ib2_base = gpu_read64(gpu, REG_A6XX_CP_IB2_BASE),
>>  		.ib1_rem  = gpu_read(gpu, REG_A6XX_CP_IB1_REM_SIZE),
>>  		.ib2_rem  = gpu_read(gpu, REG_A6XX_CP_IB2_REM_SIZE),
>>  	};
>> -	bool progress;
>>  
>>  	/*
>>  	 * Adjust the remaining data to account for what has already been
>>
>> -- 
>> 2.50.1
>>
> 

