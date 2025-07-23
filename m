Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A83B0FAD9
	for <lists+freedreno@lfdr.de>; Wed, 23 Jul 2025 21:11:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BC9610E854;
	Wed, 23 Jul 2025 19:11:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ej0NzkNI";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22C5F10E854
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 19:11:53 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56NHi4aK019476
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 19:11:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 V9jA6Mn1SUrOwM4UhmLUB7hjDyvroazQdXjiBfsPsCw=; b=Ej0NzkNILdycTX5T
 esuaRP1GVX4zJvOHh8fOZB/+MpZnGQecrdbCk8vy/8otih5K7GO/k0FKrWARUsTj
 bwKdoLFdhLYDnntf/gqU/InnPDXFshmXQG5tMb/uOK/gygRBFZ08xctthVgijDcu
 oPnjpRtyg935NMbiUlFSgcmQ4use9cVUtD+SYC8npC3IjlR5D9EIDRrCssMR4elf
 V4ZXt9nWXPEqdO+YlPN/zGVdz30g6U3iUGjvqwMayeainleHSlvhHnz/KxLBu5CX
 wDJLCt+oNAel0kyA4NQIe1oPzsusSZrmhIw1dpjyp1jD4BOyMxgYp+Aqm38ZfIlG
 wC31cw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481qh6rfex-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 19:11:52 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-23689228a7fso2263595ad.1
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 12:11:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753297911; x=1753902711;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=V9jA6Mn1SUrOwM4UhmLUB7hjDyvroazQdXjiBfsPsCw=;
 b=Nogz/503LQaAgDBMCio77J5yMTdgU6gNhLsTiQ9X0bw/NIBDYg/0GCZSFPp59tH4rL
 PjmXSpUcD9T1DZlWChnqhAytyniWuETASANtg67MwH1IAYbtTEthFRKbTX7PrYjIVcAQ
 RogUomBveFVW7fudVDEo7vHpZmummnWo2G0rDsyHIyZlEXse+UgBuS0oM02cDAF/X9g7
 KXoW2JfWGwR6JNiSvndF5zAMAfZY5h6TJ7cCbZUv62Ba3CHeu81QZOXzHGEvLMz7i95D
 LetDiHNRzFk7CQf2D6juyy9Nb07xgdsSpQt2z2akHM/0OvFp9FebypP16DGFi6o8qwn0
 vZrg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXoY550FI5IbvRakrokNNc3I9cgE+5nzOqMaf3Ra4u3W3LvyMaRqgbWQlj9RrVrxcKS2e1S9exmMlo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwH8ULQGlL8DlKvw7mfApbv6E5VVj/PXiFjMxtyLf+Wi9LvyIWa
 QhwAmrrqjXvOCcsqTm4PbGddzTb2x3+IJIdveOFcCz1+g2dTyAcNDSW6RxKhaoXTQiy6aRGZJ4u
 2NUvPFjTFUIjRvLlTKQCGO2ytyggRq7lLv+o0lwjyTp2JM2EgGy+q6BZPyYshzTa2Br4ixMQ=
X-Gm-Gg: ASbGnctobCCsA24pRryddBqaMO2jut2XbQsw1CaUWgCzeSllJOSSMBA6eFq9j/U8Wpq
 GpPSJIsQ081dSuHP8Uvf0rIteEY/ej16FLhhfZ8I61BNakDX0rWjwiAaKmwdZIZpnVRyHjIlhes
 2SzDldPGgszpVxM0T0K72skhva8OMsAhfeFcmU2TEug4gUcPhHftJWzcELGkXVwbix+3qW5EGUs
 fHGFI2C4M5OLuOVV2eptxa1xnlxnrJIvHDio9PaARKrTuw5f4M9P2qaMfVKhAdWkL3FgqIY7xx6
 bKEVYBP9UcWGmjDdZmFm5MTFNjI656p0rt5srqJDBSr1UpG1q0aaIrDEGSEPC40S
X-Received: by 2002:a17:902:e885:b0:238:120:134a with SMTP id
 d9443c01a7336-23f9814034bmr71876895ad.22.1753297910885; 
 Wed, 23 Jul 2025 12:11:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFE6DGeXECpuu6lms2ga/Vg8TctuO58RgApUp7nY5NpQJNo+xZQMgkHkcbiQe/1P/POntb0nw==
X-Received: by 2002:a17:902:e885:b0:238:120:134a with SMTP id
 d9443c01a7336-23f9814034bmr71876565ad.22.1753297910432; 
 Wed, 23 Jul 2025 12:11:50 -0700 (PDT)
Received: from [192.168.1.4] ([106.222.235.133])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23e3b5e4918sm102288265ad.41.2025.07.23.12.11.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jul 2025 12:11:50 -0700 (PDT)
Message-ID: <135cbad8-6c33-4a0c-babd-31477d9be4b0@oss.qualcomm.com>
Date: Thu, 24 Jul 2025 00:41:43 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/17] drm/msm: a6xx: Fix gx_is_on check for a7x family
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
 <20250720-ifpc-support-v1-3-9347aa5bcbd6@oss.qualcomm.com>
 <84a33e15-edaf-4951-8411-24b17ee5f4f5@oss.qualcomm.com>
 <62391e11-2f26-4e30-9c8d-b47d4985b41b@oss.qualcomm.com>
 <jeg4dw6wpxpfaio5kd5vcbqswq5nlclor7tbbh7er7zlwgdgxr@ksrw7waxj3mp>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <jeg4dw6wpxpfaio5kd5vcbqswq5nlclor7tbbh7er7zlwgdgxr@ksrw7waxj3mp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=CZ4I5Krl c=1 sm=1 tr=0 ts=688133f8 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=4dphQItTPUswyQvINXrzgA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=R4_TJjaFeOAkSM8ik1MA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: WllZR2kZSKA_-Gnj9dDYuNHtWg1bnqXI
X-Proofpoint-GUID: WllZR2kZSKA_-Gnj9dDYuNHtWg1bnqXI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDE2MSBTYWx0ZWRfX7rzB2VjkeLhe
 xmT8zC5yfElj2hyRjh8bSTzd6S3oqP1FK+ZMttE+rRPurMX9gwDi1HOTiTV6CY6NzcgAS5QTIu9
 9huMxjWHD/czSJ/B1WyUkoOCxmfJiE7fj/KVfV6WbG3Prb9tOxWH3SVlGKJIJGWffE/UY+ToJlH
 bfUSUNmtdkCtcr4J3l6jzBqliTArq6djtqPS7kpq2ikqn4aqaupxbW76M0xOOK33odg1evevdb/
 4CUodKQERAbq0nXUHtDNPDdzqsF6TmlGXweCAXadjTQ2D4BkyqjSOkNfFJzO+O0L1BRtDfkxA9h
 P1ChisEvIdpfsFfx2ZmtWOr7IO6iyu+miIhiTBfHdVdfjyVICy3S4A7w+YWsjmfC5z3d/eXJoqq
 DyMnCD2GMmdd2+9fyjFarh49ZZBmFWRFRoHqbxoX51hPsoFbRZyWCPDb1+WYy+OG74Ga+FtX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_03,2025-07-23_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 impostorscore=0
 clxscore=1015 mlxscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 bulkscore=0 spamscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507230161
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

On 7/23/2025 4:40 PM, Dmitry Baryshkov wrote:
> On Wed, Jul 23, 2025 at 01:22:20AM +0530, Akhil P Oommen wrote:
>> On 7/22/2025 8:03 PM, Konrad Dybcio wrote:
>>> On 7/20/25 2:16 PM, Akhil P Oommen wrote:
>>>> Bitfield definition for REG_A6XX_GMU_SPTPRAC_PWR_CLK_STATUS register is
>>>> different in A7XX family. Check the correct bits to see if GX is
>>>> collapsed on A7XX series.
>>>>
>>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>>> ---
>>>
>>> This seems to have been introduced all the way back in the initial
>>> a7xx submission downstream, so I'll assume this concerns all SKUs
>>> and this is a relevant fixes tag:
>>>
>>> Fixes: af66706accdf ("drm/msm/a6xx: Add skeleton A7xx support")
>>>
>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> Dmitry/Konrad,
>>
>> We don't have to backport this change because the existing code reads a
>> couple of unused bits which are '0's and that is okay when IFPC is not
>> supported. So there is no practical benefit in cherry-picking this
>> change to older kernel versions.
> 
> Fixes tag is not about backporting. It is to point out that there was an
> issue in the original commit which is fixed by a new one.

Ack. Will add the tag. Thanks.

-Akhil
> 
>>
>> -Akhil.
>>
>>>
>>> Konrad
>>
> 

