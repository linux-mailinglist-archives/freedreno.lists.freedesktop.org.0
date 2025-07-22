Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BFE3B0DF87
	for <lists+freedreno@lfdr.de>; Tue, 22 Jul 2025 16:52:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFC4D10E6C8;
	Tue, 22 Jul 2025 14:52:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="fvxP2BTG";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1BEF10E6C6
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jul 2025 14:52:32 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56MEMDp9015188
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jul 2025 14:52:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 JKfgySS6e/EZJ9CHZwXQOHZ4Nnh1OaO/SrNWrKkQSd8=; b=fvxP2BTG2vlJvOGG
 PublOSHqG307548zzPWYE6pIZE6E79GhiPnSSxeif2V/g5SiIu9r/qyg4VQhN+o7
 +krg7HRQccZS8t/HiuOdrBT4b2ZTRv3vRPViQ83jIBGH+jLDMsofTcjknsaH0usz
 Q4xV9Bx/sEchi0sy9FZ1fFMaLFgzf1MzKyE0q3LwBkl6/VGKd+9Yw9yLkfdylxN7
 C+F4vN/cAJCciQFNNC3LG6OsyAOryVBnQzdjuA3SQC7CQ0beaOGcvamcupBZVnfz
 PeF/LAaQ7KzQXFav3XB4wqge/ks+xi/o+OYtT0BhtWeKnP4ME/nL0IAS+X5aCq8t
 OIWLYw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481t6w2yww-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jul 2025 14:52:31 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6facde431b2so18348866d6.1
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jul 2025 07:52:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753195950; x=1753800750;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JKfgySS6e/EZJ9CHZwXQOHZ4Nnh1OaO/SrNWrKkQSd8=;
 b=S9nq+371g5/LrbzCIT+1Uf3FU3UWvJDdhQHVQwGJbHbmQFUugzxvxsBGQ/DHeGaJnH
 3QmWGS/ZOQGza0I0FRDTgheQLM/D8trObIZLdcYWJQPjGWMvnBoUIYWV/VJptuPcZ7PO
 U8jO3g3b/sUVc9bXWrGDAJ4qryM/bLeAhqIS8VOzVb6DbIqrKtrrP42z3fskI9rlO5u4
 bXgtKkQ0CVSu4fOd/zf0dyQ0OomX8sJ54bJCiA4QRhxEJmD1V92qQj8vuGGhs1UD6iM7
 kSZrLLdnwzrZL0n7FIZ8MVqgLXSKKB7VwieOlbeW76Ph/GJ9voQWw+AL76dAWY/6zGz9
 vYAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVGnVRzWys56uQSR9izZhBeHvPhV1+mgbHgqqdZSPEK6XKK8uNBhWHqJFoLeqSHPe17sZWg9OTmqII=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzhiMNftSMR7z1B9CR8WkjR4ja4j9TL/dgKKjUlef3cF28a3ZhK
 /2G9t5q9WspF8a7PP8vmLDPd6DeHuJrzNz3s/r1lhRRdpeuNT02MjeX0ilj93fDZgmaA5gbgxUu
 CVSKunt6InxXv8UBz5VINn/sXbqxffTBSnJ/PEQ8XOBoapPDoMvxDfVzKwWLR6TPms6Qb7O8=
X-Gm-Gg: ASbGnct2dnv3UYbOL/21TZ81Ia4fRnIiTfET2eo89Be4sy2Yh3ff1QGnNBI5DvESrWn
 5czxHwZUq/rtq73szzxbHhHG32eLI/8ZS9ahdz4vpZOT5su1KhOy5N7H3913Lyb9ap0tPlYJEgN
 f+51UmGHxsiRjKEIHIbI8WrhbLscJ2t82SpROyJuwQVLxRTJzdvBJs9/HTXHffrXX5JaHLPTHbd
 mLJkzgNwqzg68XrJaZZc9xk3DcZqihZxirzWvmQXHAgkc7RWSmTIXEtVxQpr5SVqs27j+M5K/S5
 WvBFd94CDbcna+cYLO+nyV1zJBwv1WmJIqUQi6wloBihTlSqjP+7ZWXY/yHTZo/yi4WWivb7AYa
 kYjApO+VMkS4aQLt7N4be
X-Received: by 2002:a05:620a:2714:b0:7d2:89c2:eddb with SMTP id
 af79cd13be357-7e342a5dc6amr1310278985a.2.1753195949434; 
 Tue, 22 Jul 2025 07:52:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHuJgUU9V6/qKb7uv3smvtN8wrkQjr3Ocrb0xAp9swHWKZD9GzivTqkf1QkinncRE8s3a+Xow==
X-Received: by 2002:a05:620a:2714:b0:7d2:89c2:eddb with SMTP id
 af79cd13be357-7e342a5dc6amr1310275285a.2.1753195948053; 
 Tue, 22 Jul 2025 07:52:28 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-612c8f5d06dsm6945128a12.33.2025.07.22.07.52.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jul 2025 07:52:27 -0700 (PDT)
Message-ID: <30442713-2990-490a-b076-93c3cfc3901d@oss.qualcomm.com>
Date: Tue, 22 Jul 2025 16:52:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/17] drm/msm/adreno: Add fenced regwrite support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <tyjkwrdmsj7k7tkqqxdd65l5v5jxugr5me3ivg5onn3hbffkwp@7uhsbzolqiyd>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=SPpCVPvH c=1 sm=1 tr=0 ts=687fa5af cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=5dKzzWTJmYxMyaayncUA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDEyMyBTYWx0ZWRfXwhDKjeFE+FCE
 6vp7CmzQ/KoBV1m62HAkWbZeDi2uwfTqiPXKUuZ6xbaTN5u6fQjCE7Epp63M+lRk73sF+DEs0L9
 ETGWCKku2YV5+fQ9f/cQ4kF41p4lCUPsML1zxAgoSydEEQvHdw6lkKaL1LUkdhYPTjmeio/2q7A
 0MzIlQH1l7UtkQJRNrp5Wpumj8LQrdWcYUEDQbPr4zsyRxPcj1YeRZiNS3vQ2ySnx9Kbyigj/uZ
 6+jj5CJ2fR0Zj5QeOobXAf4wuppjF8HId44Vr7dn+9XnPfpx1cFN4YdQYwcpytG4ryVBI0+/2JT
 KQ2ltWsggEhjJCyhiN4/saXkVXKGmCxKzipFRuOcDMjxJaIxoH84xzH0Un6vU4P09cqRfrS6DWy
 wfjUmexR/a5oNH6hx3M5Hec29Fkja+BO097MEFOng2OOLsG3+c672dj6ymjryMZgJhHC+VJQ
X-Proofpoint-ORIG-GUID: 9JMXQB94LVPdAic2EIEqZm2cEkjmjfwU
X-Proofpoint-GUID: 9JMXQB94LVPdAic2EIEqZm2cEkjmjfwU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_02,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 mlxscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507220123
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

On 7/22/25 3:39 PM, Dmitry Baryshkov wrote:
> On Sun, Jul 20, 2025 at 05:46:08PM +0530, Akhil P Oommen wrote:
>> There are some special registers which are accessible even when GX power
>> domain is collapsed during an IFPC sleep. Accessing these registers
>> wakes up GPU from power collapse and allow programming these registers
>> without additional handshake with GMU. This patch adds support for this
>> special register write sequence.
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 63 ++++++++++++++++++++++++++++++-
>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  1 +
>>  drivers/gpu/drm/msm/adreno/a6xx_preempt.c | 20 +++++-----
>>  3 files changed, 73 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> index 491fde0083a202bec7c6b3bca88d0e5a717a6560..8c004fc3abd2896d467a9728b34e99e4ed944dc4 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> @@ -16,6 +16,67 @@
>>  
>>  #define GPU_PAS_ID 13
>>  
>> +static bool fence_status_check(struct msm_gpu *gpu, u32 offset, u32 value, u32 status, u32 mask)
>> +{
>> +	/* Success if !writedropped0/1 */
>> +	if (!(status & mask))
>> +		return true;
>> +
>> +	udelay(10);
> 
> Why do we need udelay() here? Why can't we use interval setting inside
> gmu_poll_timeout()?

Similarly here:

[...]

>> +	if (!gmu_poll_timeout(gmu, REG_A6XX_GMU_AHB_FENCE_STATUS, status,
>> +			fence_status_check(gpu, offset, value, status, mask), 0, 1000))
>> +		return 0;
>> +
>> +	dev_err_ratelimited(gmu->dev, "delay in fenced register write (0x%x)\n",
>> +			offset);
>> +
>> +	/* Try again for another 1ms before failing */
>> +	gpu_write(gpu, offset, value);
>> +	if (!gmu_poll_timeout(gmu, REG_A6XX_GMU_AHB_FENCE_STATUS, status,
>> +			fence_status_check(gpu, offset, value, status, mask), 0, 1000))
>> +		return 0;
>> +
>> +	dev_err_ratelimited(gmu->dev, "fenced register write (0x%x) fail\n",
>> +			offset);

We may want to combine the two, so as not to worry the user too much..

If it's going to fail, I would assume it's going to fail both checks
(unless e.g. the bus is so congested a single write can't go through
to a sleepy GPU across 2 miliseconds, but that's another issue)

Konrad
