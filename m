Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B71ECB0E59C
	for <lists+freedreno@lfdr.de>; Tue, 22 Jul 2025 23:38:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F7E210E719;
	Tue, 22 Jul 2025 21:38:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kOt82l1N";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 046DB10E274
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jul 2025 21:37:59 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56MKTPqc030717
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jul 2025 21:37:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 LxLJaMV7OXItal3Gz6wp6eY7p9oi9m5tlAOw82q3OnA=; b=kOt82l1NSr5ROuW3
 bSRdVdcSuPIGn/CQpDL7Cx3fTxSls+G/0PFu4oe+S7YnGvMzsnExL4A2JYMuU6j/
 FpvKW74RW5VJNw575g/fa5OHg38/3bjnCLhQ9fZNx7vmPUJkkpOpTQE3zXv6VPnz
 Ox7s1+WZOzueyqBvjnvUEaHWgF9g/i7VCJ1m5lRBeJsmaM6PHvDITBqnvDHWLU2k
 96ZQQQtrTtFQcIRLXh4qeBuRX5n2KAJgv40GtHJ+TaW7+2l+TjEgmdc05mrlSr3/
 eymp38UdfXg+FzSt6ZG3W1mEcedKzdh76t6gRHVvPoENyJ6tI4HvohhnFT8UjhFZ
 IFBzfQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48048v988t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jul 2025 21:37:59 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-74d12fa4619so5258285b3a.0
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jul 2025 14:37:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753220278; x=1753825078;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LxLJaMV7OXItal3Gz6wp6eY7p9oi9m5tlAOw82q3OnA=;
 b=rFhXukthrft+fCw4qUpRx7pV/esLr0AQBEYkAoaIJRvYqcBBzm3JDLmrF22dSPSkbs
 nl4QSiu+YJSwolTZtU0AVlboWiZ0vqAFwtX3EdtTOZxuqPo2LZ22SYNixtkPzz+sVZOZ
 6ALfbU1ml0UcfwbTLRWuKIjimu0UE/DlEiSrsLRH0tvu9cREetHsJzfaWj+mx+BAq+G2
 mOENGeOUCMWKLaRK+LbGb0+fO+ceFDzksU49N1YaG/EU57nu2zT00NXJrHTLGLThyX/B
 +EBQXghJY+yumHr4j2vS67xqhgYZWb9S1CMmJx9RdexIb0IxKPyr+5mzkdEV63YdW/oE
 uBGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWzpwrH/cSqG88daKkfd+9HMEd/Mbh3wCMsYagxvibfAymrXwZ1yBztbGHTa90k0dg6kHPNU4BqXyw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzqegf2gAFLKe3hP/gOr1Rmd2nAYHTz9jJcusdXG7zDfNFQ3HEW
 Ce7+u/nechdSUgq8Lrg7mP9Q9xFPxlb9aHwvuAtDF3Yt0/pH/+jjem8SSlQ10HOcQ5YMvGCxoSU
 lkGp0b88FXbFFbXkMFJr8qT9E/BcpGL6kPs0msm09Qp2fcPrJwmzQGuD6ZFpySwQFdq2DIKc=
X-Gm-Gg: ASbGncs9MR9LvCHdEqnTETfMrAm6t/DavaunpZM7aFsYCqTvC3tGfzD5h4c7BMg013D
 gAU/rwyoN3uToIfszmLZrNTXAxYSmH2afv34buXgH61ZcSwrnE2z4OjHTZLNhklKB8XVhmv03pP
 uvMwq1Rxj2SjL54Ae/5OPhP/OR3mAq3w6GDBzbxLoDiHw0kdCVxZnZC6+RePnN0qTvSuwvfR8ku
 4W8/HV4YxIufzPVhZdx/jabIyQgLxzU+KCprADN12PZ3OXehCDV+WzQdnazhEOKPxEPcmdmGJk/
 QhrKZoKVRiM40VihfgsgBz98HXeT394gCs1X0M2OluPlKbmKrgTN0zRk1wX2UryD
X-Received: by 2002:a05:6a20:3d88:b0:23d:480d:1c8e with SMTP id
 adf61e73a8af0-23d490f610bmr649751637.27.1753220278605; 
 Tue, 22 Jul 2025 14:37:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHUzh0+F2fFC/OFAdVApFhTjPc/PEurlH2lfCsWMfZmPW8kbCHDDIcYhoLoJAcVU+iy17tT6A==
X-Received: by 2002:a05:6a20:3d88:b0:23d:480d:1c8e with SMTP id
 adf61e73a8af0-23d490f610bmr649724637.27.1753220278164; 
 Tue, 22 Jul 2025 14:37:58 -0700 (PDT)
Received: from [192.168.1.4] ([106.222.235.133])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b3f2fe62d9fsm7733090a12.1.2025.07.22.14.37.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jul 2025 14:37:57 -0700 (PDT)
Message-ID: <85073de3-3933-439d-9912-1f0ff145df97@oss.qualcomm.com>
Date: Wed, 23 Jul 2025 03:07:50 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/17] drm/msm/a6xx: Enable IFPC on Adreno X1-85
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
 <20250720-ifpc-support-v1-16-9347aa5bcbd6@oss.qualcomm.com>
 <37nuk4kevhpwlzbpgm4tyhnmk6vi3a75oosz7l7xbvvn7qwq22@oomdnizhc673>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <37nuk4kevhpwlzbpgm4tyhnmk6vi3a75oosz7l7xbvvn7qwq22@oomdnizhc673>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: k64BfzB1f_d68uuknKJOf7f2eZcWvpVV
X-Authority-Analysis: v=2.4 cv=SYL3duRu c=1 sm=1 tr=0 ts=688004b7 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=4dphQItTPUswyQvINXrzgA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=0HPixKO5BHaGtdwfH9wA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDE4NyBTYWx0ZWRfX72w+wxjhKW0Q
 AYCoVur1NkoINDk+urqe355/jTnOAWiTyUbOs9ujiNCpAbVpb1fuYpTo25aUyFV5HIc3Q5Yd4uf
 Ds1aacL8gZ5/zqZ3N8mUr2+AS7VSTVLJZ08PGOpk/NVfKk1g3bRWtnXdn8ktWdmon/Sh01rfe3J
 7om5hj8ZAbYnoaMREyQkOHFGzdkkWrc8WtG4IffA9/WKr78IflMp8glNjPeygQmL94rCEBV+lxU
 ig/SP1TYcu3LUhS32ZbRpHrkZFHVdhFnlnmcq7r7cF3ZP/AB7RHTCCXUvGDv2WzT1hqR17OiBee
 UTzq4kdQFVnHnUQq5GUypgQ5MFY8sMOH43sybq/85qLkJSpwGdiX1NgFqIcqoQMuYreISAgJ5/X
 2RO5fZ4O4W+xKPVuJTG7I85JfJHEKFgDaPVjHjTbPiVj/k3uJg/4Chx9QChZZTAenZcMNgu4
X-Proofpoint-ORIG-GUID: k64BfzB1f_d68uuknKJOf7f2eZcWvpVV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_03,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 mlxscore=0 bulkscore=0 mlxlogscore=677
 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507220187
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

On 7/22/2025 7:25 PM, Dmitry Baryshkov wrote:
> On Sun, Jul 20, 2025 at 05:46:17PM +0530, Akhil P Oommen wrote:
>> Add the IFPC restore register list and enable IFPC support on Adreno
>> X1-85 gpu.
> 
> Nit: GPU
> 
> I can't stop but notice that KGSL enables IFPC for a bigger set of
> SKUs, starting from a630v2 and a615. Is there a plan to get IFPC
> supported on those platforms?

Sorry, no access to those hardwares. But I can certainly help if someone
wants to do that. :)

-Akhil.

> 
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
>>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 67 ++++++++++++++++++++++++++++++-
>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 15 +++++--
>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  1 +
>>  3 files changed, 78 insertions(+), 5 deletions(-)
>>
> 

