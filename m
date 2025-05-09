Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F97AB14B3
	for <lists+freedreno@lfdr.de>; Fri,  9 May 2025 15:17:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9621010EA3D;
	Fri,  9 May 2025 13:17:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="lWHmYOaD";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B40C10E0CF
 for <freedreno@lists.freedesktop.org>; Fri,  9 May 2025 13:17:49 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 549CtCNP009383
 for <freedreno@lists.freedesktop.org>; Fri, 9 May 2025 13:17:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 SKPwnoZ4z7Zq1QPdVARuUad4atOXjNSus5NyMxTgizU=; b=lWHmYOaDVOS64iQx
 gAimpzphqGRZjeVZBWY4fj/6W2tWL3efI9HtoYbq1lVhmARYW/pB1HLANoqVpYnn
 AtCEvEQnViELvI1v7t3y/astKCB2e+3OO6fSjgs8SDIrHx3S+yVC4iJGLWMp9Uuw
 647S1BnuCRvVuBAHlb3Wo5ElUmdxM5xvOsFxt4HcJhTnHN6OhK3OR2vBFfH5ZlAt
 nun+a2aOBAhFd05k3wvSNsq/u9ylOrkC0bm8ck/Rswd6sucP7oojzFG6XsXInOhq
 BdTM+3SzEf3u4sn6q3slL0T8a3Ly2czqt5C8ZPj5JE0CK6UNJlnBgGoLigmUQw/S
 EZ+Jew==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnpevnsj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 09 May 2025 13:17:48 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6f2c8929757so5598916d6.3
 for <freedreno@lists.freedesktop.org>; Fri, 09 May 2025 06:17:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746796667; x=1747401467;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SKPwnoZ4z7Zq1QPdVARuUad4atOXjNSus5NyMxTgizU=;
 b=iPjzTu+VGQQZXuefxI4U2PdEbAoiph1Z6EtK6tjxc1sBniNML8hdskhbCJid0h+zht
 DbQm8uCmugqTsk4075gCUb5dMKM6orI4U98E8lAOMRful5/sMzU8WRmubXArVkAXJIiA
 6l/beYvLppsHqNGS23QM6SYLz2VoWYkmX1ViVB7ly27n6VWpUWY2uGdUHPU6PIjKdP2J
 Ka2CSz9lhzYV8T9AziMtwAESS1IsHug4lNSCvt+dblZNn3n+xg80+/6xU7Pc7D2Hvnk3
 j9y3chGEaa/FcLftZnB6q+RZVeqkAE4+LqOiuhhnPfLy1MLvBNDQejOJFKS8s0hooKaa
 sp3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2W3e1CtYbBfLkX38gYCrBHlyMmmbdD/cfPb6H1erkglazFTni9qXgR181JvoUDD8TZsWbDjZJjxk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw+pHKCvk7+vZOrxSl5ErBRgNWhF8V1bSX3C7M78uB/Iz7vBAts
 Tf55msLOsdIYYpYdH9PhYx7ocvpEHwyndV5TgCKdxlmgK4qbkbtSb093ZzF1AgBje2ZTlbs+tnw
 Tcz5pb+1SKpnQX/GeRWBdHjyBPLlUlF+pSVkzhBf2GRt+0xitL1SlEv2LI8t8eeyCiKE=
X-Gm-Gg: ASbGncuNtsifCVPhmlueY0rz3B/buYNiiqILOMUfJAByT5kPKHZNVr/adEUIWqDnpcz
 uUOIr3BHL+ZYh+uI1P9NpSTOfmHiwNwqFJZZBKdy/3OsOH4BgvHOvzIwVEblmVaS2CHCK4lzlAP
 lTqjZ+izzx7Q7ILOxmnmC1bkGo7WkBkFIiTvyhOFup9L6cdNPmgR9vHGuSoLu7p/C4ffcrknx4H
 Oc0cMPatfbiNIhayhUP3+YgV4xumoGF1dwlGtednuIWIa888XkKtWmP0nuoUwtQn0B5JbwEIOCI
 tJkbxVM32pNrFA8arBuiqpkz5kCHZjbRX6KT0fAH3B0p6tYfQ1eNK6b3ZSKWde3fEE0=
X-Received: by 2002:a05:620a:40cf:b0:7c7:a574:c0ac with SMTP id
 af79cd13be357-7cd010d4ea3mr193943285a.3.1746796667397; 
 Fri, 09 May 2025 06:17:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+qsfdtZ6DmZdlZShEv27vJFf9u9wNMnx8fyO0XHAbQLPHn8efyDQhYxt7i9+0FpxG4WsvJA==
X-Received: by 2002:a05:620a:40cf:b0:7c7:a574:c0ac with SMTP id
 af79cd13be357-7cd010d4ea3mr193940885a.3.1746796666870; 
 Fri, 09 May 2025 06:17:46 -0700 (PDT)
Received: from [192.168.65.105] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5fc9cbe4c83sm1414304a12.8.2025.05.09.06.17.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 May 2025 06:17:46 -0700 (PDT)
Message-ID: <5f5e512c-ae0e-43aa-856f-06820ac4b147@oss.qualcomm.com>
Date: Fri, 9 May 2025 15:17:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT 13/14] drm/msm/a6xx: Drop cfg->ubwc_swizzle override
To: Connor Abbott <cwabbott0@gmail.com>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
References: <20250508-topic-ubwc_central-v1-0-035c4c5cbe50@oss.qualcomm.com>
 <20250508-topic-ubwc_central-v1-13-035c4c5cbe50@oss.qualcomm.com>
 <CACu1E7E9yU-cygZxBqVypP7aFkXJCNTfXA2uqdvU84mi9T51Xg@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CACu1E7E9yU-cygZxBqVypP7aFkXJCNTfXA2uqdvU84mi9T51Xg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDEzMCBTYWx0ZWRfX2NTMVKRyjsF3
 bxkADKqIa28Hm2ngkl4BcUgebHU51HwHVI8M66yldehRRkC29jeSNCQ7ZDh3ZQiBg62UX+D0466
 adPsFIyiphj+7lBowcRdaoKXzv7Kl5LTwF8is1tqFYMpfDvBT9L6aOQXk5l3ThAjbv3QoupCfwD
 IixjYYt+Wur3tciroMQM/5Of1q1qryQevoFgWqdNYv5UjQqRftzEqBPmLLub37f8j43rGG5aRxN
 h6SQECe/OhJ0J2VmRY0SdB8sJIOWeTW/zQZwJ62FT4WgiJ++0lBaq+i2IHyg4t8I7O7WQySVTxY
 PzILkHUnKbDvdgGB2OonshfFYmVwbgTgMJatdqveaXNcPrwztMJZqZLVAPGYWr3PjOoK9yiTAxf
 KWFfG8h/fLplRThfV1WYMMikGRt9qZF/4rFO2j5aKtiU5bTbuHLYhrziZjhNgPfkM0HY3wBA
X-Proofpoint-ORIG-GUID: f-_1HDOAC9st4SvcKJlyPQJLRbDQvnwP
X-Proofpoint-GUID: f-_1HDOAC9st4SvcKJlyPQJLRbDQvnwP
X-Authority-Analysis: v=2.4 cv=Yt4PR5YX c=1 sm=1 tr=0 ts=681e007c cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=Olu6NZbg64VfH8RIhVIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_05,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0 adultscore=0 spamscore=0 impostorscore=0
 phishscore=0 lowpriorityscore=0 mlxlogscore=919 suspectscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505090130
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

On 5/8/25 9:26 PM, Connor Abbott wrote:
> On Thu, May 8, 2025 at 2:14 PM Konrad Dybcio <konradybcio@kernel.org> wrote:
>>
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> On A663 (SA8775P) the value matches exactly.
>>
>> On A610, the value matches on SM6115, but is different on SM6125. That
>> turns out not to be a problem, as the bits that differ aren't even
>> interpreted.
> 
> This is definitely going to break userspace, because the kernel
> doesn't expose the UBWC version, instead exposing just the swizzle and
> userspace expects that it sets the right value for older UBWC versions
> before it became configurable (0x7 for UBWC 1.0 and 0x6 for 2.0-3.0).
> It looks like the data for SM6125 is just wrong.

Oh that's sad.. I'll drop this commit

Konrad
