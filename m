Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DEDBB0FC5D
	for <lists+freedreno@lfdr.de>; Wed, 23 Jul 2025 23:57:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C0E310E864;
	Wed, 23 Jul 2025 21:57:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Yufwob0b";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63F3410E077
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 21:57:25 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56NHBuux004492
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 21:57:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 OJ+IYU0/ojEVW5G9zuKC8BY7swUqGdFQH23X2V5IKK8=; b=Yufwob0bDJ0w5GdB
 hm0F8+3TFob3MdtZgWS6cMYBLdvKv5Fts8AocKCXK4LgymsH5kvtHT2UWTEOq67E
 yXFdvBoS9yVC0zuLi62tjyaV7g3wDxrJ5e7zlQAwU7IFcgmSEzeOy2C/sqVa5MVO
 +Y1Mevz1D3P1UF+lBgOR5XcF/Gjdrys1rq0pYVRYw1F0l6012olMXSZVAb0tXE1+
 81FwbRcLFkN0HSVha2rqEerBXhWcZQVHdtvx6UjlPeYjZh7KOTjpDjUFPF+bbyR7
 TUX26bcaBskO/1xcRzdedmyaOQ6jQOc/C18YYQSaB93j0l8oXcnj754E6FRBDdg1
 2+DzaQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481qh6rt7w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 21:57:24 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-75ab147e0f7so319410b3a.2
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 14:57:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753307843; x=1753912643;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OJ+IYU0/ojEVW5G9zuKC8BY7swUqGdFQH23X2V5IKK8=;
 b=BqRfdmpXvdBp0XuNLuGbXuQ7mJ/RNSjXE7Np7PLSA98JzbLbXZxdh6krYZFWRr/s+z
 Ko/+u4f6XIT6Ak4FF2ZBxZxuNVh10LOh+R0485TNU7j0zLGL0Maz1MXKTa1D2FhxZAio
 sJuRF1U7Y+nFSzVd4oYWF5AqXBAKFVyayTMdzkA6XJDB1BL4JPQUCP4vr2QnIYIe2y91
 SePHn8hprE2QXfhPTy/CkHaKXLsYYbVQJidJWq52fALSyvlSZzFkRZ3pQsErjAf/bGp8
 MpomWGWL2KGPfEeaq9oBzAfAniv9jr5QwR9XXql8IyXPw29D8PXWaIt5lgIJInLTq2nt
 oDyA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU9i1jVaf0fEtfCjbKDAV/AlV9SPIjaq3NcKwVDQnl6+rlxUVZ5+81rYroeqZ7nwEc0VF+H3tabHVc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwYqksCXeEUrh3hh3lJhUKF8tjqJ69r+OE78xi5r1j2deseVZSy
 boP0x6+L+6hCaaSHi3AAdoErI3z/KGYNNtBsZYbSGKSFzfYYpHlCq++S0gz+qDoM07nwjdN5CAm
 USJTLvEl2WKCLI69KaS1zHmvXG3wn3gH4PfBpVqEvgirZ5AbuNuPiC++9sP9e3WTEAx3g7jM=
X-Gm-Gg: ASbGncu+91pPcmCQz5VDE+n1K3p+4isw5wSVO/QD/giquhOvLgSPHV9wlLYyZ5ukp75
 BdUyZunZnOlZxh6zIDS7mVipIFQVX8bRCj7bZ63zhPMEyQb4u4Xnxn7SofMRaKwDsRTyd/tvw95
 2S61lUPTTcqC+scmsvKgaVmjybjHNDsrkGcm9BN03A7fyedJ17NdFIIp4CT4DoT0iRDckpx2TsQ
 KBuFlB2wIzxnbihhr0Wa7zossXDNV1Nlux1Ps9QjgFyVGFS6teeYcGNtCjzPvXWemCahvXVy6ld
 2sRYUFlS1QiUrFcZvBYRr7x6XUaP7iIOPaMhouiYdcabHebqgUNnDVV3elrMgQ==
X-Received: by 2002:a05:6a00:1914:b0:75f:8239:5c2b with SMTP id
 d2e1a72fcca58-76035ff3a9dmr6809754b3a.23.1753307843095; 
 Wed, 23 Jul 2025 14:57:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEWT5EGhznLq4VFRgdd229b0EV7FZUBLIcTF0ozLJKJ43/pxYlu8O0H+tTREYzCfpQFAEhI7A==
X-Received: by 2002:a05:6a00:1914:b0:75f:8239:5c2b with SMTP id
 d2e1a72fcca58-76035ff3a9dmr6809712b3a.23.1753307842602; 
 Wed, 23 Jul 2025 14:57:22 -0700 (PDT)
Received: from [192.168.1.5] ([106.222.235.3])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-761b04b3517sm124546b3a.84.2025.07.23.14.57.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jul 2025 14:57:22 -0700 (PDT)
Message-ID: <bd0d5470-04e3-4545-be5d-a71b9d3fb5a0@oss.qualcomm.com>
Date: Thu, 24 Jul 2025 03:27:16 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/17] drm/msm/a6xx: Enable IFPC on Adreno X1-85
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
 <20250720-ifpc-support-v1-16-9347aa5bcbd6@oss.qualcomm.com>
 <37nuk4kevhpwlzbpgm4tyhnmk6vi3a75oosz7l7xbvvn7qwq22@oomdnizhc673>
 <85073de3-3933-439d-9912-1f0ff145df97@oss.qualcomm.com>
 <50d6a7dd-46a4-4281-968d-d7df041f21ae@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <50d6a7dd-46a4-4281-968d-d7df041f21ae@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=CZ4I5Krl c=1 sm=1 tr=0 ts=68815ac4 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=pSIa2sKh8ADkebnh61Ypzg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=LD9g5RzjIN7if3dsUIgA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: KS7xhH5aOaAe_dCeybwYN3kkaKmv9QZn
X-Proofpoint-GUID: KS7xhH5aOaAe_dCeybwYN3kkaKmv9QZn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDE4NyBTYWx0ZWRfX+gNONjd/lQZk
 yRhvJb9NCCk5ACOHfhpS6OwSCW4LKI5jhpuvRPRDPXYphgFfDZLJ2Bvqx634buNgjskowX9Xj/n
 ih1MijQfGPMLSMfug+WsRg41+b85uqZzRTHR7pmYZIo/unFnYO58RMKxBh7MQ0VGKE2TtamTzQk
 4m6Timxm2gJskUhz5s+ztjI4zdS+n2n1CMaITlMTaZ/0or58ngziS0a8ApbzoqdEZQBjoYS/Xw1
 ToCsDmuvcACg/0zWejap6Uo8Y7lkGQP/UFR8zZlJjw8mz0BmFNZN1iCiPWHnUwoT1N2N9UZfFOM
 OFYNoCs/i5guQRI+1nJuWVPhWf2HWTlFxpjNVuw52eERyGzUw3KyYxdXF+4QMEJ/+CGRFV9lni5
 ZbsISt5kEbHVOtqeUawSUSeI59rMCv/z7AanpLX7SpjGLjCF8ToMUTyCZP9gJuKDl7pBii+M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_03,2025-07-23_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 mlxlogscore=768 impostorscore=0
 clxscore=1015 mlxscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 bulkscore=0 spamscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507230187
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

On 7/23/2025 4:03 PM, Konrad Dybcio wrote:
> On 7/22/25 11:37 PM, Akhil P Oommen wrote:
>> On 7/22/2025 7:25 PM, Dmitry Baryshkov wrote:
>>> On Sun, Jul 20, 2025 at 05:46:17PM +0530, Akhil P Oommen wrote:
>>>> Add the IFPC restore register list and enable IFPC support on Adreno
>>>> X1-85 gpu.
>>>
>>> Nit: GPU
>>>
>>> I can't stop but notice that KGSL enables IFPC for a bigger set of
>>> SKUs, starting from a630v2 and a615. Is there a plan to get IFPC
>>> supported on those platforms?
>>
>> Sorry, no access to those hardwares. But I can certainly help if someone
>> wants to do that. :)
> 
> Let's get the groundwork merged first ;) 
> 
> Nowadays you can reasonably assume we have access to at least one board,
> no matter which SoC

We just need to add a proper ifpc restore register list for most
chipsets. But the legacy gmu firmware (a630 derivatives) might have some
quirks.

-Akhil.


> 
> Konrad

