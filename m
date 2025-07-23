Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BAC3B0FC17
	for <lists+freedreno@lfdr.de>; Wed, 23 Jul 2025 23:23:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC8AB10E077;
	Wed, 23 Jul 2025 21:23:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZRh9zb5o";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5330610E1A7
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 21:23:01 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56NHvhp4021374
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 21:23:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 5/z+nOL74D8w9vAYW+IhxAClZgEjiAjEMElrQIQE8RM=; b=ZRh9zb5op1HY/obI
 UCGTeWI5u9C68rNnudRJA34p1jMqbwcBS3oO0Re3H2Bwvf6ubd3nDCmPJZaQE9Qx
 FBYC6VP1VnBlcGGQlJdg7NOqrDvab9MLLvYYuAL8f4rsBZPVyrVTp+3fSwYmtPn4
 e/pQaDhpbOnS5/CIGWcm6mctTuLCPhSuZdVNc1Fe7yvd39HycAOnbOw08ictgRza
 lChhdyVun5sAXIEi6peN11qjkgxculfH3n0CBBhS+45FQfO0FMuCHkBJ2IoiRZwf
 ep9Lqjh02Tmn6/nMojFb81fg9n7OkKxAFrBObXS4TRCj3IZnjhqEf4CMWWrCCAH4
 l+ysnA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481qh6rr8e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 21:23:00 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-23494a515e3so1885295ad.2
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 14:23:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753305779; x=1753910579;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5/z+nOL74D8w9vAYW+IhxAClZgEjiAjEMElrQIQE8RM=;
 b=Yw9OLgf520SF2taQ4tzhYokPi/UaAQHpxDrJhCnNPY2oig9qNrGoccgHzn/eE1vCwm
 f5+PBJrgLjqL+mV9mr8mZMQPYX03Jn8PrAllXr1VerOtYaixi/ELh8G49nRD79AqMYSf
 ZpLN7lk7bfUPxq9OG2ZEODz3kmN8ktmQWbVANcxNCGMEIV5h4ZDIIeaZBRrCf0gM4t3m
 sBQ6mil3/4HD3tIAOfMr8Lf5TgTDm1Q+DlamVhxSic2FCSiAOHBDtx+DEtspFf3oGEwd
 gVmUnSMkif9ZK0/qKfZyRdW7Zzq2PQWZ+ap996i2PCBCk/RIBFDzU3oT6c6Tb2yHmfC2
 38uA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUM2ARkBAZGEcgeOS6nyCMl5yh0HYIY7PnTJsasqiRVIjeeF7t8BA47XQP4AJGLOfiJVaIdNjXPDic=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzAHOgibCZYQBnECxS9WC/rL4FMbb+S/a9LhvGfRZV8ltzZed/S
 57jldrr2g18fNEwlOZbtWaKU90iJ3Ti5lQoMZ4oqyJLldA7IaJcTdGkvhR54rYKX1XkClFckbdG
 mbsat5eceZqzBUI4+nzWFGy7C6L0v2UdwF8UMLA9LsH080yu3g1Zkl7+/h9zvl/7r9R0Me80=
X-Gm-Gg: ASbGnctSwIeKAW2HauhlHXgXdsOGZBOxD7+z0U+2A82ChSMGUE/Epyt/Hd+ZNA/0tv9
 u5l3beVYO4uPrxjWRhPYyHVBs2TFz8ubTn0eaQUGnyWIXjmjSF6FVrmwUE7wWR15SYow2vEo9OM
 6xmDzelITmSwW98MlO29ERTVeTo3de9JXVg9XOKyJBNSC7mEboWdjsSvDe6x7zy+H7dEztCdii1
 2fh41yUKazzb3ukGMEhXNFFGfpbguKrFwIZfAG9shejN6mz8UshKN9Ew88OaBIlAENtbipTR0qA
 P5EHF1oiQhdgbU/s1Pj7/nI51bSHemO+uj7hmsh+LdoEuUgSctevaiUtQWXKTQ==
X-Received: by 2002:a17:902:dace:b0:231:d0a8:5179 with SMTP id
 d9443c01a7336-23f981ab03dmr63604555ad.23.1753305779181; 
 Wed, 23 Jul 2025 14:22:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFAnCXs/FfPCFuiouSfivDnKR2aZyEWeXP92FqAGxP/yYXM4uPOB9jhUhkeFLnVtSM7YSM/Iw==
X-Received: by 2002:a17:902:dace:b0:231:d0a8:5179 with SMTP id
 d9443c01a7336-23f981ab03dmr63604205ad.23.1753305778738; 
 Wed, 23 Jul 2025 14:22:58 -0700 (PDT)
Received: from [192.168.1.5] ([106.222.235.3])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23f8c3f14d5sm41141445ad.192.2025.07.23.14.22.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jul 2025 14:22:58 -0700 (PDT)
Message-ID: <9322badb-9f94-4bd1-9e3f-447a9134cd7d@oss.qualcomm.com>
Date: Thu, 24 Jul 2025 02:52:52 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/17] drm/msm/a6xx: Set Keep-alive votes to block IFPC
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
 <20250720-ifpc-support-v1-8-9347aa5bcbd6@oss.qualcomm.com>
 <jvn44gmttkidyy4emnz6mytqqjbwltlxibywfr6bfbqjfbq35e@fuvvefesqbzw>
 <0427769f-62a1-4a20-af94-b340413296ab@oss.qualcomm.com>
 <644a81ff-bbce-4cc7-a364-8e0c591898b3@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <644a81ff-bbce-4cc7-a364-8e0c591898b3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=CZ4I5Krl c=1 sm=1 tr=0 ts=688152b4 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=pSIa2sKh8ADkebnh61Ypzg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=CLd7HrSr3Nb56GcGzJUA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: 6yty3H-Kjohyg0-YqEj0i0UqaqwXXiR1
X-Proofpoint-GUID: 6yty3H-Kjohyg0-YqEj0i0UqaqwXXiR1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDE4MyBTYWx0ZWRfX2B0cLz12iDtH
 8cfLvKdWGLXNr0grahYL2kUhIae8xBV30VUJK287+5JqwHk06yM1EHXGeWgAwxWwG5+jA7SaCt+
 00p8R6MvdVoUTys+KuhNYMeeIKj8zMHKTbueYWhjXYSfW3CVx6eaY9jpr1ytQQA9hAro/cJb4Xm
 kRu8s/2+3y6YpaiAUvsWPRsyo4eqzI0jb+drn4NK1egq6Vvp/JBU+z5IRlqtijBWSvvq96uh7kw
 Ii2ZZ+mINlaAQjzf6Co4hMt48fs0ZX9lR9KWM8VF5irZf3dBNkoCA45LLPbVX0GyyUFhpRlMK0S
 VM6PKCeMk6ZKjbR2qXUTNmykjJZcWS0Btiv2iAMycGmucnC+N117J74m3BpIOZ5PuZ0aAlq0+in
 7kENNKDSqPSqguho90wuDXyAYdpI2G7coQEJ6dNvux3yu9yoGkCIV69AdSuOfsK9xXflrF4F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_03,2025-07-23_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 mlxlogscore=748 impostorscore=0
 clxscore=1015 mlxscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 bulkscore=0 spamscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507230183
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

On 7/23/2025 3:35 PM, Konrad Dybcio wrote:
> On 7/22/25 11:24 PM, Akhil P Oommen wrote:
>> On 7/22/2025 7:14 PM, Dmitry Baryshkov wrote:
>>> On Sun, Jul 20, 2025 at 05:46:09PM +0530, Akhil P Oommen wrote:
>>>> Set Keepalive votes at appropriate places to block IFPC power collapse
>>>> until we access all the required registers. This is required during gpu
>>>> IRQ handling and also during preemption.
>>>>
>>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>>> ---
> 
> [...]
> 
>>>> +static void set_keepalive_vote(struct msm_gpu *gpu, bool on)
>>>
>>> a6xx_set_keepalive_vote()
>>
>> static fn! Why do we need prefix here?
> 
> It's good practice to namespace-prefix your functions, so that you
> can more easily find them, e.g. in a backtrace.

It would be obvious from the parent functions in the backtrace, right?

A bit subjective! I feel that the prefixes are unnecessary for small
local helper fns. Prefix for *every* single routine in a source file
makes the code look a little bit bloated.

-Akhil.

> 
> For a prefix, adreno_gmu_ would be even better, as the register doesn't
> seem to have changed across generations
> 
> Konrad

