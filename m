Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C16B402AD
	for <lists+freedreno@lfdr.de>; Tue,  2 Sep 2025 15:21:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AECD110E331;
	Tue,  2 Sep 2025 13:21:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="I3U9eeT5";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FB4610E330
 for <freedreno@lists.freedesktop.org>; Tue,  2 Sep 2025 13:21:52 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582Axxhf015204
 for <freedreno@lists.freedesktop.org>; Tue, 2 Sep 2025 13:21:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 JaC59KBlwwCcOLBxHtuji6zgMyRa9S7aKGEwvTUep20=; b=I3U9eeT5pnO4RJAg
 owJhVON8S/oZBIKm6nhzL1ZvqAWe5rQvOUY89w70y679wfzHeOg8OuSz4aXNokMI
 lA9NsVKj1PSM2bIiNQAics2u4s6NdTKUcXU0EgbeRwAq9LfpI2F/vdgHNubsirq3
 sEf1tqYfIIM9GnqxoNULC6ksTxsaXc1gmH+a1OjO40JwbcN0VakdTrM3WTpoqB9A
 MCGkNFSKZN3S0n9I1Xs5CJ1+GblJMn8Eg7objwj7zhl28mtKONd7SCNQJkPuQvz7
 rwz9TmesLzyO88D/AmiJ7sZ45EOTO1zMtNpLjXwU4E6ycwAcdd6FL1KLEnCQJ5WO
 r6jg6A==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urvyywga-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 02 Sep 2025 13:21:51 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-772642f9fa3so1251504b3a.1
 for <freedreno@lists.freedesktop.org>; Tue, 02 Sep 2025 06:21:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756819310; x=1757424110;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JaC59KBlwwCcOLBxHtuji6zgMyRa9S7aKGEwvTUep20=;
 b=oXFcso/WhzyOebBTF9M2fLD/4t/CO0y7PYpjuJtgcHxq4rrCFP7urMB4GuQGZa0sr4
 qbOgOPJBOM6yV4uJPlznmmNVNYRRpBKH091uCGpO3uuGCPaNlcjjlJGsXtieC1xWBLiT
 +nLo4aYudXJ2iKGER01EpVZ8479+elf3Lx1z2ltVJv43IzrhFZYcuy2TBU9oio4r4sIB
 TY6Os4JSGg/o4fuiHmJLM5ouRKkXr7fh5LHPpFdczzRXuoF8g5Bxasaph6YAeeq4xDj1
 6+MHqUBaLQZFrXYH4LMc9RptLFiqixL1MJdHaa+rxAHXLWEg8cxB1YXYtYjcmksfN7iQ
 wabQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXD6netiVy3pHlpsYl59dHwaN3sIb6xB0Erz91nyBk1C8i18tYEUIN+093dBykGSECFzLM7RKuNeWY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyJZY+D1qVd5uP02nWJt6VeOTcXfEi0gYejQtG8PMTMIrhrsthM
 AgpBX7f6zK6a/lXDr1UOWrlki364rAxXVCKFT+XgbLoNvVTHhcD3EO4jgPxNdChfMbRjqDixTjX
 PB3hHc8U/hTUG6L3NAUfF2u6CrR3UTLFkko24BvGxqzGNVrHQmd2IF5R2JmTSz9aaA2rbJJQ=
X-Gm-Gg: ASbGncszGXRLK76OalJUxA412JxAhwqY04lU6pu1lrAW6/DsCJhCAg41Zkmsskvxfw3
 EDSh7KSRHZOsQRWXncOMfgsal97NE5aaOZI+aoN7ZS7AvHpRkaWiwIg7facBUbyMN1ToM40l5Sw
 VqGkjuJeXm890JEhvjSINrA3QR4Xlqi9kXErIDinZr9NLRqoVbL+T220klLi04OtvvIZX2FL6Tg
 AH+QvDuUc7IJKBAHWRQ3IcwdxqgZ83URw/biT7nS8GexWfhKwDm8msnSO6eF+ipRqJRzc1z4Phj
 EnuaGRNtrIFKdepKx5Uw0YXH0dg+2Is/5LudyhmuqcJCXgPXShV+vL/G/BBqnQ==
X-Received: by 2002:a05:6a20:9145:b0:246:3a6:3e47 with SMTP id
 adf61e73a8af0-24603a66346mr664551637.12.1756819310269; 
 Tue, 02 Sep 2025 06:21:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtkIfOFvD0HUzJY6Lkpwe4Ds7LLmmdnhloqIvQ0PtyT9neILbf8iU/dMY87XxE3U3HYu3y8w==
X-Received: by 2002:a05:6a20:9145:b0:246:3a6:3e47 with SMTP id
 adf61e73a8af0-24603a66346mr664480637.12.1756819309536; 
 Tue, 02 Sep 2025 06:21:49 -0700 (PDT)
Received: from [10.91.118.43] ([202.46.23.19])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7727bce1b58sm143396b3a.9.2025.09.02.06.21.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Sep 2025 06:21:49 -0700 (PDT)
Message-ID: <72cc7f71-fe49-411f-9a7e-71c4f51c283f@oss.qualcomm.com>
Date: Tue, 2 Sep 2025 18:51:43 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] drm/msm/a6xx: Fix GMU firmware parser
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
 <20250902-assorted-sept-1-v1-2-f3ec9baed513@oss.qualcomm.com>
 <9df42327-b417-454d-9f4a-608979498f79@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <9df42327-b417-454d-9f4a-608979498f79@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: KquJzpb-zpyyV9PcNOvQDbimIgT83mfM
X-Proofpoint-ORIG-GUID: KquJzpb-zpyyV9PcNOvQDbimIgT83mfM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNyBTYWx0ZWRfXzq/fnUE5nznB
 rDKTH2T1s9eI8urJQluaDGGLdDQWpRKZqAUr6jKv6J7QQCLSnktMfJJhjyG9nqCs80WhCf0n2KM
 dn0rMppP8dbxMDVFMP+JqHFRLsgIl6heNM2mhJcVj5K2gnf8KVvtSEwvd1EiOwi+YUCsa3Xk0ID
 r6UV/zb1Se9pMFHVdKxfMcyXp1PO9Wr22K/p8ztU88H159bZ0bseUhiGbqrQdI+bx5+pNeknyrU
 gOeOqvwPQv9LYJsO211Kydrnzz2Cqjgu7b1uzoNFQe1ba5SXbPy/K3F4A+G5g6LMTBMRevTVzCn
 VnEw9JfHH6kvyIsrnTcIgPBAhiowggA4e4pKOQu/v1qhYMj4R/beq2UhDbSuhLY/SYU2R9zD2vN
 nntZyg5C
X-Authority-Analysis: v=2.4 cv=NrDRc9dJ c=1 sm=1 tr=0 ts=68b6ef6f cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=L25_lxYj0dBuOpUmPZMA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300027
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

On 9/2/2025 5:59 PM, Konrad Dybcio wrote:
> On 9/2/25 1:50 PM, Akhil P Oommen wrote:
>> Current parser logic for GMU firmware assumes a dword aligned payload
>> size for every block. This is not true for all GMU firmwares. So, fix
>> this by using correct 'size' value in the calculation for the offset
>> for the next block's header.
> 
> Hm, I haven't seen this in the wild - do you have any specific examples?

I saw this in an unreleased chipset's fw. But felt it might show up in
newer gmu fw versions of older chipsets too.

> 
>>
>> Fixes: c6ed04f856a4 ("drm/msm/a6xx: A640/A650 GMU firmware path")
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
>>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> index 28e6705c6da682c7b41c748e375dda59a6551898..ea52374c9fcd481d816ed9608e9f6eb1c2e3005a 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> @@ -758,6 +758,8 @@ static bool fw_block_mem(struct a6xx_gmu_bo *bo, const struct block_header *blk)
>>  	return true;
>>  }
>>  
>> +#define NEXT_BLK(blk) ((const struct block_header *)((const char *)blk + sizeof(*blk) + blk->size))
> 
> CHECK: Macro argument 'blk' may be better as '(blk)' to avoid precedence issues
> #146: FILE: drivers/gpu/drm/msm/adreno/a6xx_gmu.c:761:
> +#define NEXT_BLK(blk) ((const struct block_header *)((const char *)blk + sizeof(*blk) + blk->size))

Ack. Thanks.

-Akhil.

> 
> Konrad


