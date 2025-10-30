Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB632C20730
	for <lists+freedreno@lfdr.de>; Thu, 30 Oct 2025 15:04:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80B8810E401;
	Thu, 30 Oct 2025 14:04:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="AWuor9Yx";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JDtRLPee";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FC5710E97C
 for <freedreno@lists.freedesktop.org>; Thu, 30 Oct 2025 14:04:34 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59U9PMS33509330
 for <freedreno@lists.freedesktop.org>; Thu, 30 Oct 2025 14:04:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 aQyeMtemgCoOzTzlwykczyRlEpZ0QjYCHYEqGRqhGag=; b=AWuor9Yxkz6K2wy3
 IiPbM7oYI158WOrYLTN7eMPnu70Uu3AuuCOcn+C2w4weR3T6rH0AVFAd8haAFv/H
 pNOTpocnKQbzDT9i+zu+/tXr0ZhoFM9AL3KPw8cFanSHVtw7MGl/3zpSrFwgl/q2
 0znrD3KNsyRnHMYKTFNSXUOSvUj7qrbSCBsPrJd28y8iFdv9h5hgmwvolEKYfvyW
 KmBmsjWOrA6rN7696+mrUhXbV7d89iJz9P3oZmHddxBMxy08Kh/Pcxii9D+xnwb2
 +Mlze/ikiy/UbwTVNSOmrQ0jJVssydVZuXIblCFlRmYMGdkiJ7zrRwy7oAp1LC8y
 R045iw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a45cdgrav-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 30 Oct 2025 14:04:32 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-7810289cd5eso2862414b3a.1
 for <freedreno@lists.freedesktop.org>; Thu, 30 Oct 2025 07:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1761833072; x=1762437872;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aQyeMtemgCoOzTzlwykczyRlEpZ0QjYCHYEqGRqhGag=;
 b=JDtRLPeehvdsxDiQb9Kr/sJx6afVrU/YXydcIAPx3t5R+1MIXV4tThori/euWXpHs0
 o2jX9/QzIiTDiGCN7G2ftO2ri58NmjnjuVU2kkUeG8KFfh7qDh5OAq1wY58FHGYGf+JF
 ToFze5VDKKC/Up5LFXfyvktdc8N78yG+HWkSHUGWDUmBj3/NyIWaoe9+OYi81y80lcOt
 iitWD3EarZGmyNxbVSik0o1APNGiiubldHvCM5/UoD4XI1/iyxz7eornaS5WHgz7bbUi
 Ehpt8esDtOvQoVbjvm+lYNwkVhguyB3PRhk3x/4UI1duhnYyKPpDWep8IVnaiccN2p+u
 G1CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761833072; x=1762437872;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aQyeMtemgCoOzTzlwykczyRlEpZ0QjYCHYEqGRqhGag=;
 b=uoWYxNsi1u7BflPZtHzjChqQXol0WsJBXK52+2uu6ih6mBIH8rkkYvL5/x8/qVj238
 NUNjtW41gjOmKT1iLoDV9LG+aibyIITsBDU+WCb13wHzLbJnZ61otMASTwLjFD8gOAbw
 sLkSJyUxCg3+OgVONQdfRQcqZKEMYnL7l1sMAPw13B93TWxW/4vBa+Fj8nBTOfQ/sRSP
 xYgwjIoYr/Ngjaz/yepQQudBLXtXi0BS13NUvGgx7G7r49CSaGM0oBHxdaj4OgV4cAgc
 wtM+9e2M/+yuAU6su4/k/mY3qubBag64nB8b4d/ctUxkhqCVCXoo6c+jjJwKaUGMBxnj
 gk1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXvlzN6MszRPi2HrRMHQkJHjW7KagnAZjdW926O8gMyxgFwZLMmnZQDd8Wq3VDRILkpoOwadH3Atno=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YytYa2LT6oia8tebjgSkfUPvSyf30uzCO2LIV+dQiEJkR+l2EoO
 BBIK7ONqyV9G9xMPvu0EYMQyt8gfYnUhrxJwqdv1+u+9OMuFkCiAZEPrLd065Rp/STkcp4aaMeR
 P87cgWqU70OAoeRjzcvR8oZhDDx2m3YrTjVFskbwlJfKTgiwxUf36fmhm2d2cil3KtiF6Lb4=
X-Gm-Gg: ASbGncsZx/7qIDDcouDUyMNqX9cTFDuxRo0yp0ozmz1n8hs13C8xZ7TL5WMi4BAvRR+
 UVsoKVGcKBnasgLP5aYX7lBLZwJ9vZwNK/CWVNZCU6cbISyXp0jdqd/DQWpveX5qXp7P28lGPZj
 1Fi4q7b+w094irzLZueHReERrnBoo7CFyIUZtqkmSxsXsL0ckEOwE922h47kYAFbGJMKnL8bvja
 bFLXJLxEJL7h87iuU3AzfdHDs0IxFKaFNddK2XNTvImUo4//fqJRur4w8UoPbXHHfyczFW4FhvR
 WAGud/t+Bftrr5XLl4isIRzhVs9rvVCGEL78xfT55vgI054xInGzcaZ6JOpJhg3fmx4VshbAGvR
 dv6wNDs5U/fi1b89rPWjmcQ==
X-Received: by 2002:a05:6a00:1786:b0:7a2:8649:5ab7 with SMTP id
 d2e1a72fcca58-7a4e2fe7764mr9513754b3a.14.1761833071973; 
 Thu, 30 Oct 2025 07:04:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHOsm+Sq4JNvFojnAbXxBbvyUiQ9n1HBmXRQ7fcHIwRyOXUnsy9UNUn/WOnPgjzpqXGKHxy5w==
X-Received: by 2002:a05:6a00:1786:b0:7a2:8649:5ab7 with SMTP id
 d2e1a72fcca58-7a4e2fe7764mr9512694b3a.14.1761833062850; 
 Thu, 30 Oct 2025 07:04:22 -0700 (PDT)
Received: from [10.204.104.20] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7a41409c703sm18826520b3a.70.2025.10.30.07.04.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Oct 2025 07:04:22 -0700 (PDT)
Message-ID: <4b41cb16-858b-4fc2-8ee1-3a7171712808@oss.qualcomm.com>
Date: Thu, 30 Oct 2025 19:34:13 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/17] drm/msm/adreno: Introduce A8x GPU Support
To: rob.clark@oss.qualcomm.com
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Marek <jonathan@marek.ca>, Jordan Crouse
 <jordan@cosmicpenguin.net>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev, devicetree@vger.kernel.org
References: <20250930-kaana-gpu-support-v1-0-73530b0700ed@oss.qualcomm.com>
 <20250930-kaana-gpu-support-v1-12-73530b0700ed@oss.qualcomm.com>
 <CACSVV03HaKAvfDa5A5LqRZM4_o8g-haVU3A6GgWqfTO0QNcK2w@mail.gmail.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <CACSVV03HaKAvfDa5A5LqRZM4_o8g-haVU3A6GgWqfTO0QNcK2w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: xBwk6fnNnD8MEd5N7uzk1HCusGDI7MwS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDExNCBTYWx0ZWRfX0Z9TMZXtRIEL
 rCLmzGExrDRR++iunoAyw+VNe8mceadE0u6vZ/uLpB+4qO+CpfmT2qc03dvStGO/cHq0xR5beaQ
 EECNX6FG4pNdQpABspLNNdfti1Ean70uDfPJwUJm399WfSKvnGgUx9nnF7OUlkkCKklVb0ouwEE
 qVMvRDjQmIIfsr1BT6VWBJBADu/jty5gdCSt1g+TEx7EIJ+HWIWAIGAjBqEtfBSZ5QAaSc330w2
 Jflr6SF9pZxjXUsX9b8ZNoV8Y9QxYZoiW6LCkb0YQpL8qQDV71li8GDxkibRPRefV2eSCzRuDFH
 TCZoAm1Uk2j/rpDCzc/zAjX7K66avWveWe6OjfTNX7QFGRn7gLYLx2UmssolfFgoZdaBP8yw00K
 Ar1svGUKYnspccyLmRASwjNGcSQaHg==
X-Proofpoint-ORIG-GUID: xBwk6fnNnD8MEd5N7uzk1HCusGDI7MwS
X-Authority-Analysis: v=2.4 cv=ItUTsb/g c=1 sm=1 tr=0 ts=69037070 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=ktRuAwBfdPNgXckAlmEA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_04,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 suspectscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510300114
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

<< snip >>

>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
>> index 0b17d36c36a9567e6afa4269ae7783ed3578e40e..18300b12bf2a8bcd5601797df0fcc7afa8943863 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
>> @@ -46,6 +46,7 @@ struct a6xx_info {
>>         const struct adreno_protect *protect;
>>         const struct adreno_reglist_list *pwrup_reglist;
>>         const struct adreno_reglist_list *ifpc_reglist;
>> +       const struct adreno_reglist_pipe *nonctxt_reglist;
>>         u32 gmu_chipid;
>>         u32 gmu_cgc_mode;
>>         u32 prim_fifo_threshold;
>> @@ -101,6 +102,11 @@ struct a6xx_gpu {
>>         void *htw_llc_slice;
>>         bool have_mmu500;
>>         bool hung;
>> +
>> +       u32 cached_aperture;
>> +       spinlock_t aperture_lock;
> 
> I don't see aperture_lock used.. but seems like maybe a good idea if
> a8xx_aperture_slice_set() acquired the lock and we had an
> corresponding _release() which dropped the lock, so that we couldn't
> have race conditions between the users of the aperture.
> 

Yeah, I guess we should add a lock because the pagefault-coredump path
and gpu irq are not serialized. And both of them are users of aperture.
The other users are serialized already with gpu lock.

-Akhil

> BR,
> -R
> 
