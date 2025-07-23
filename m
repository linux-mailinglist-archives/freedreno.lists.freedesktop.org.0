Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F724B0FBF5
	for <lists+freedreno@lfdr.de>; Wed, 23 Jul 2025 23:06:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04CC210E189;
	Wed, 23 Jul 2025 21:06:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VZwFZ7Jw";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6355610E189
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 21:06:40 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56NHZurV007922
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 21:06:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 /ByNsxNG/AyQvTr41MbSY4M0uuFiVWXFnX5tJOWH1zQ=; b=VZwFZ7JwlVcl5ZMS
 kGCFgDVeqNn1ZroGfszFIX+aPstI6Z44Gnx7IrDmK3EwwcwC4Z9zofg4Z92tUTYo
 BWeWOK9H0z3P3MEL3PKvUcZr373MGQ/8/L+SOjZEILn15B969HRDAbgEQ1QGpkMn
 ZnVZFjICNFnfl1tjpuKQO5zDjiY4tfdR62waN9PVkR09S2vW1wBlZn3vEZpMIE3/
 STy6zW1gla2DkMRjpxQBmDGejAEh+1eWlESMqWc4dsUG7bdAHaS/8bd/hCsEqN52
 tQwhY8zWvzs/GWJysU/SDEhXyPNbEF9e5IizupweaF4t6mjlmpesa+W97PLGK4Yg
 oesgBQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 482d3hvjjw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 21:06:39 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-236725af87fso3028315ad.3
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 14:06:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753304798; x=1753909598;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/ByNsxNG/AyQvTr41MbSY4M0uuFiVWXFnX5tJOWH1zQ=;
 b=a8dBtz25VpEeC6UX4mbEKgzfCHGHWOTFUnS6EY7VZakMo/dI1CQy9vRM11ixYL0BWo
 oJl+rrgICpx0UTIn/O97cu8S2Uwe9BiY+xDY4b9vIDQijDPZDaWOj9XcIineJg1wSU2+
 jjI5eCBRXupuHWTOPy6qLvP/xMf1sTuYxA0FWJalvrmiOepNj//qFJxR0QLKUF4y65rP
 JJoJkkpDIHxZ9mYIr8Irq/AcDkz9e62i1mPGQcQQttmGU/GKPGuiGHwKFD9n4a1VERuJ
 xBlvpvx+jx86v7N2kcsYIfOM8oTLd7i+Nn71sW7MlQpDkh/cph12ReiRqqaYFdGyfy5F
 okRQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUwTklY9c6oZFwVP7l7F7RdPI6TYUWOFgLOXNP8w8Wo3jf7Ko4tacnaDw7IioASd+eG80d+53cIoB0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzSvDaIjfv/xqTp5xKwBb5QVlEAKeFS2s0H1IaFekOPGqaenXDC
 R5IKAclXzT/YOnJWWbwQSXcLklfnUsr3q8qghcnFjYynOKjPvpw+XBOuQL89IBex+oFX62YU0Ow
 FP3Ce4adWjox4MSOJejcXJL5JScWCWwjKK7uE2vwUBJg5HHoZhZbC8o8Al+Th1UVDSV4yLTo=
X-Gm-Gg: ASbGncv/cSyNPQCHGV3X0mxmfyYjcdPWFiB05z6de2GZRSCvRymlYQTJjhi6LKsgrwx
 Yoa/DEbmRMAchmb+QA9EK2mnBVFVKKWxxiXxs+guMNV9FN1gURa8AEwvph8n636jr+Ev0KFdSdZ
 GpaM5bNHMwm4Lu1//C2pVJKGB6p66vQTeZ0gTqKCXLk238U9tipEr5Gwp1mSnf0oermODkIt/kH
 5q/oJb19bX41yl5HLbZVjucYsyn0LyZZtGtwnaJhP5B0Mc28AesUB67EQI2ORGbrdltvLqMwtQi
 LqWmX/+UhN5A5ZO/DiFmgsqf6iI8jNbAZv9KJbBbm7AOAgDwE21aptjd5WV/fg==
X-Received: by 2002:a17:903:184:b0:23d:d348:4567 with SMTP id
 d9443c01a7336-23f9813f511mr56953335ad.19.1753304798286; 
 Wed, 23 Jul 2025 14:06:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxu2LcuICb2xFOgDTOahLCuANW8W/4axRcHon5EQHJL5Qq3U/5Qcx8vWysqROHALSCldmkrQ==
X-Received: by 2002:a17:903:184:b0:23d:d348:4567 with SMTP id
 d9443c01a7336-23f9813f511mr56952995ad.19.1753304797828; 
 Wed, 23 Jul 2025 14:06:37 -0700 (PDT)
Received: from [192.168.1.5] ([106.222.235.3])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23e3b6d2fa7sm102685975ad.162.2025.07.23.14.06.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jul 2025 14:06:37 -0700 (PDT)
Message-ID: <d696e7df-7f11-4491-89ff-ba71274ae101@oss.qualcomm.com>
Date: Thu, 24 Jul 2025 02:36:30 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/17] drm/msm/adreno: Add fenced regwrite support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
 <20250720-ifpc-support-v1-7-9347aa5bcbd6@oss.qualcomm.com>
 <tyjkwrdmsj7k7tkqqxdd65l5v5jxugr5me3ivg5onn3hbffkwp@7uhsbzolqiyd>
 <30442713-2990-490a-b076-93c3cfc3901d@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <30442713-2990-490a-b076-93c3cfc3901d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=G8UcE8k5 c=1 sm=1 tr=0 ts=68814edf cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=pSIa2sKh8ADkebnh61Ypzg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=sI7m75I2uMoaLRCfwtgA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDE3OSBTYWx0ZWRfX74RJTTxQ1q4n
 M+mUsirPmWF3CTIYv0NYCxT4076pIhKDy7xE+OcVHZ6r4CV74aFeePygzgCPNXunWvH8Kyl2FNT
 kB3AnH8hG4HBD63FJYXEJSpEy+9cL7GE+/iUq1c3G3lVM02HFb3MKVJxB8XPg7bWyi0qQHTXGZW
 7Nq1+vsRNIGAKiWoKkhigJKB26Ednw9TWH2MUkuuH3ZAGOq+FVAOWkKr0xvKlZwNUcXVts0cekB
 ED/zTIyFpEpKi6OXf+COiTCHxxel/SaWs+vt7TAYjBjnQ2wqUORSjCC1kkMQnhU/p4lte8dRtTi
 KYuDt9iUdjQY8DDF5tOBNG98x+6oTwFqFgPgzqbLAQCyb9DphN2oS3Z0AIQpvn4CSg3/Xl1+mID
 uXiGAQm61y/wGdevO9twgJeYf/rrjaKxGwICNR/8gHA3Iocb9+f9ETmpoys8qALUF/WQpV2z
X-Proofpoint-GUID: 6mpkpWT_OU944H_W02XDGbT5J-nNSBJh
X-Proofpoint-ORIG-GUID: 6mpkpWT_OU944H_W02XDGbT5J-nNSBJh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_03,2025-07-23_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 mlxlogscore=999 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507230179
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

On 7/22/2025 8:22 PM, Konrad Dybcio wrote:
> On 7/22/25 3:39 PM, Dmitry Baryshkov wrote:
>> On Sun, Jul 20, 2025 at 05:46:08PM +0530, Akhil P Oommen wrote:
>>> There are some special registers which are accessible even when GX power
>>> domain is collapsed during an IFPC sleep. Accessing these registers
>>> wakes up GPU from power collapse and allow programming these registers
>>> without additional handshake with GMU. This patch adds support for this
>>> special register write sequence.
>>>
>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>> ---
>>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 63 ++++++++++++++++++++++++++++++-
>>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  1 +
>>>  drivers/gpu/drm/msm/adreno/a6xx_preempt.c | 20 +++++-----
>>>  3 files changed, 73 insertions(+), 11 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>> index 491fde0083a202bec7c6b3bca88d0e5a717a6560..8c004fc3abd2896d467a9728b34e99e4ed944dc4 100644
>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>> @@ -16,6 +16,67 @@
>>>  
>>>  #define GPU_PAS_ID 13
>>>  
>>> +static bool fence_status_check(struct msm_gpu *gpu, u32 offset, u32 value, u32 status, u32 mask)
>>> +{
>>> +	/* Success if !writedropped0/1 */
>>> +	if (!(status & mask))
>>> +		return true;
>>> +
>>> +	udelay(10);
>>
>> Why do we need udelay() here? Why can't we use interval setting inside
>> gmu_poll_timeout()?
> 
> Similarly here:
> 
> [...]
> 
>>> +	if (!gmu_poll_timeout(gmu, REG_A6XX_GMU_AHB_FENCE_STATUS, status,
>>> +			fence_status_check(gpu, offset, value, status, mask), 0, 1000))
>>> +		return 0;
>>> +
>>> +	dev_err_ratelimited(gmu->dev, "delay in fenced register write (0x%x)\n",
>>> +			offset);
>>> +
>>> +	/* Try again for another 1ms before failing */
>>> +	gpu_write(gpu, offset, value);
>>> +	if (!gmu_poll_timeout(gmu, REG_A6XX_GMU_AHB_FENCE_STATUS, status,
>>> +			fence_status_check(gpu, offset, value, status, mask), 0, 1000))
>>> +		return 0;
>>> +
>>> +	dev_err_ratelimited(gmu->dev, "fenced register write (0x%x) fail\n",
>>> +			offset);
> 
> We may want to combine the two, so as not to worry the user too much..
> 
> If it's going to fail, I would assume it's going to fail both checks
> (unless e.g. the bus is so congested a single write can't go through
> to a sleepy GPU across 2 miliseconds, but that's another issue)

In case of success, we cannot be sure if the first write went through.
So we should poll separately.

-Akhil.

> 
> Konrad

