Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD01FAC1092
	for <lists+freedreno@lfdr.de>; Thu, 22 May 2025 18:00:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9F9010E169;
	Thu, 22 May 2025 16:00:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="oU+woLYe";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EFC410E169
 for <freedreno@lists.freedesktop.org>; Thu, 22 May 2025 16:00:17 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MFor4F000808
 for <freedreno@lists.freedesktop.org>; Thu, 22 May 2025 16:00:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 7N+FGlZ9YEzA9ZHX/TLPLBdk4t047N0N1Qpwn5XXC+M=; b=oU+woLYeFfndo2kf
 XnuV1qbSDQvFkpe/i4K0ds7cZgeaASsDu0cuERuVSyLWg3+NepsviU8skqN5DkYN
 gmIi/OaSOfBIk1xi27BqZEhH04ZC25y9h4v/iaEWdvABy6jjFs/fkqxj9ov6HCxV
 e0Jh24a7094+GQ/2HhhF2wHE0TfU3s85xZr/oTvQwXgsy668Wk0R5XbAMpNracUC
 3QgKDA5ppl2jsWvDjJIwIJcOqc0FC+gQ9nEExPplBOolkIyALViUdgHHxkP1x74E
 5z91DRUyiczp/fkl7NaokpRWJgiPKkzL9MbKaA2GObfDjqTVe4RgVuP2N7daloGD
 3/4pBw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46s95tn8rk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 22 May 2025 16:00:16 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c7789335f7so39034785a.3
 for <freedreno@lists.freedesktop.org>; Thu, 22 May 2025 09:00:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747929616; x=1748534416;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7N+FGlZ9YEzA9ZHX/TLPLBdk4t047N0N1Qpwn5XXC+M=;
 b=Ucc2ziK2KtOLGhAGetPaWYIdeTl9Wovu9F1Vq2Fw2eCDDwJPEbWlYU7c+QUveE9QSX
 BTMt7jp0O9hECQMBydnOEqTHa4mh4o00tdfKT5agwAoPADwcy7WmBTX/7Rr4G9XVPoEd
 48nNuAMqqltJkk8PHMZMNf2WRWbcthXSTKaBGlRi//AzR+oJhO9P/xZgYujBARIB9d3V
 Q48qw6utxuoFso/EYwDrOiISJfjqwM+3p1flIx4kE2dy+RxvBJfRvibWHZHYH7o9keSx
 FnrKYGpH7khJmHTsUwliNUbULnlroTO4HXc5p4KaUsgHTr2jicm0/BuXFyQMtk00zOoZ
 9Ikw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXoMOqUx1V4O+2dBKnHshO8ExF1zJ0V5rth9amuEZwhU+4jBmnG+dYD2OODRAIR6wSYJr5Dp6JMysw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy1g51LdUyVW+nitBw5s3DUzRL1BD2ffLCBwWHDVjf/nYmL1XNK
 t5BxUkF7Pruqj5psfMn1oGtUKaxEnDahRM6JKSeWbgHf3zi5m+sIJeBVV+2bc+9VcV5mG8AQjsq
 d/D2NCLYpNoxK3CXUqE6dsfiNbAdDCkQdFTlnUllGAPRRO2/VwU/Ri0xpVGD2PBAS3AlRGgg=
X-Gm-Gg: ASbGncvMxLuHxWM/gx0vKvjGRpDRb3BKR6SQMjzAzWE3P57ipolORBjQJuKwWdmc4yR
 KaRfDV60wdxOxHHDkijbDE+D4dhHTP7FR1bPZefCE/6+SJOTJY7GiBdvlSMoyKR+nG/160S2ZBm
 cc5OLy8AWWiN5p1j+0u+53Zh5wYjAW0qyo4t8f73cWpy2AJ4G2jqf1z1d1/Yt3WaTrCx2e32CNW
 ZzMcnkrz8U/XJdlXMil7NEApIoNyIbHcf4mCAqYEL/lCy0ndXHqQFf6AUAIqmD235rwvnMxWD9P
 hhctbI/dp9R7fQg8vF86aojU3cjhWbt1rXdTqhgouoxmgvIh3hnB18POInwFIrGJGA==
X-Received: by 2002:a05:620a:690c:b0:7cd:2992:1fb7 with SMTP id
 af79cd13be357-7cd46706827mr1766208585a.1.1747929615720; 
 Thu, 22 May 2025 09:00:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF5+tilRMybZTSJ2vZO7ClkxMjtcE63vyyPyT+Nkt9wppDzJGnDwFUds1W8+fXmRlfGibyqSg==
X-Received: by 2002:a05:620a:690c:b0:7cd:2992:1fb7 with SMTP id
 af79cd13be357-7cd46706827mr1766204685a.1.1747929615145; 
 Thu, 22 May 2025 09:00:15 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d4908cesm1101387166b.132.2025.05.22.09.00.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 May 2025 09:00:14 -0700 (PDT)
Message-ID: <b2057f2d-3dfd-48e4-9f1e-539604b5e891@oss.qualcomm.com>
Date: Thu, 22 May 2025 18:00:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/msm/a7xx: Call CP_RESET_CONTEXT_STATE
To: Connor Abbott <cwabbott0@gmail.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
References: <20250520-msm-reset-context-state-v1-0-b738c8b7d0b8@gmail.com>
 <20250520-msm-reset-context-state-v1-2-b738c8b7d0b8@gmail.com>
 <1d615331-2d60-415b-8f53-0d3a7b5d5fe4@oss.qualcomm.com>
 <CACu1E7G2sYoGZcFG8YTHp+UXk1fLFTAG=uX+mdU==SxwPntmAQ@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CACu1E7G2sYoGZcFG8YTHp+UXk1fLFTAG=uX+mdU==SxwPntmAQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=QKBoRhLL c=1 sm=1 tr=0 ts=682f4a10 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=PwPGRmcspp1eyaL06aAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 8x38RYsxVxt-aLyStbjCBq_xCRFX1qzj
X-Proofpoint-GUID: 8x38RYsxVxt-aLyStbjCBq_xCRFX1qzj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE2MyBTYWx0ZWRfX+wSe4QjNe2Ih
 ldsxQRxq8/OLr1K1EnK/x87NWd7mv8CTdbWfcOxJpZfa68NPHGnu33RMZlLgcT6zuB0g6Q1Mmif
 EIi8NlQunuADdBMDi6OCsTiEnsDQIqEgxb5SKFQJORVE21HmqwHQ786hzHUT2oKcfySNiAvTFVF
 jTPhFJhGzVVdTA6SFOqBHVHb8ZJHp2OZLlNqeeZGM944PJoSnZA67YP4MKVkJXbgg7t11K6iapp
 MzSjmRMniExiJkY+1FKLQDU7+c0oMoSrJVgdDU6pOm2Aux5Jv6ss0KH/StyRfuPZXO2uh1bo4Ab
 4VdTWwD8aztpxtTqQX6DSWB9XgB6JT8NHbwThkNENeVFVmSRbbGsZ6AWTCyfPe8zZR9WpTOTP7P
 IykCLyYb4Lsv5C8Xnki5VSZAnINcOVaKY9kacEGqrE5+IzWJaDJPG12AAY9nc8cHBdCCOtsC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_07,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 adultscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505220163
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

On 5/22/25 5:53 PM, Connor Abbott wrote:
> On Thu, May 22, 2025 at 11:46 AM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 5/21/25 12:28 AM, Connor Abbott wrote:
>>> Calling this packet is necessary when we switch contexts because there
>>> are various pieces of state used by userspace to synchronize between BR
>>> and BV that are persistent across submits and we need to make sure that
>>> they are in a "safe" state when switching contexts. Otherwise a
>>> userspace submission in one context could cause another context to
>>> function incorrectly and hang, effectively a denial of service (although
>>> without leaking data). This was missed during initial a7xx bringup.
>>>
>>> Fixes: af66706accdf ("drm/msm/a6xx: Add skeleton A7xx support")
>>> Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
>>> ---
>>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 14 ++++++++++++++
>>>  1 file changed, 14 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>> index 06465bc2d0b4b128cddfcfcaf1fe4252632b6777..f776e9ce43a7cdbb4ef769606ec851909b0c4cdd 100644
>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>> @@ -130,6 +130,20 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
>>>               OUT_RING(ring, lower_32_bits(rbmemptr(ring, fence)));
>>>               OUT_RING(ring, upper_32_bits(rbmemptr(ring, fence)));
>>>               OUT_RING(ring, submit->seqno - 1);
>>> +
>>> +             OUT_PKT7(ring, CP_THREAD_CONTROL, 1);
>>> +             OUT_RING(ring, CP_SET_THREAD_BOTH);
>>
>> Downstream does CP_SYNC_THREADS | CP_SET_THREAD_BOTH, fwiw
>>
>> Konrad
> 
> Unfortunately the rest of the sequence downstream is slightly
> different so I had to adapt this somewhat. Downstream does this as the
> very first thing whereas we have a CP_SYNC_THREADS | CP_SET_THREAD_BR
> beforehand so the threads are already synced, and there were a few
> other minor differences iirc.

Seems you're right, thanks for confirming!

Konrad
