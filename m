Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA95B2A898
	for <lists+freedreno@lfdr.de>; Mon, 18 Aug 2025 16:07:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1102C10E45D;
	Mon, 18 Aug 2025 14:07:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="D/UeaWEp";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7186110E450
 for <freedreno@lists.freedesktop.org>; Mon, 18 Aug 2025 14:07:01 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57I8VgUa013454
 for <freedreno@lists.freedesktop.org>; Mon, 18 Aug 2025 14:07:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 chLwK+SsPQhHTytM+7iGONL6X0o4wGCEiPMrGgw75ts=; b=D/UeaWEpAUWr/gmE
 WZwGHoUPLUcKr79Zd51wp7wQI0dwsdSBaOAHu78btslcr/KrdR/bGGhyK46HZqo+
 d7CcZ88NvoPaijN+ZaCV8SJ4Zoj3k42YheITNwu2EepURGBWsBIFaUTcebUiIHLb
 veAudXcNEk8HxCuQxsDLGlmR4tPaVw/UrcHpJ59RwxUDMnybMAmOYjfuT2tRS3YF
 +Z7W4DKOF2aMyJ98APKMORCikS8re5V3SDR/IIxj1CzopHIGKJgRGXIXnNxACm9e
 Crv+BISMW5jApN6gq6ZqrIOVlOMeklP7vUddhJ/ES0OIpOdFZGY5XWuNmliBTg3v
 RSDmFg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jjrfvwss-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 18 Aug 2025 14:07:00 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-76e1fc66de5so4516720b3a.0
 for <freedreno@lists.freedesktop.org>; Mon, 18 Aug 2025 07:07:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755526020; x=1756130820;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=chLwK+SsPQhHTytM+7iGONL6X0o4wGCEiPMrGgw75ts=;
 b=ZzeVcRW+E3MAql8tkHbwT5JJVoHPHcFiLo++DNN7SJyGXDelKEYZBJKvezB5TXbKjI
 UHr0YjRb1LEZAldf8SM10Jzdq4jUIeX+7pr0G1mysyDUV6JBgYPN15Ld6JPrl8qi0Aq6
 Q5XZHIjZwwcodpNLeTUAau8jdgQhmSTY45zYoKvs42hrxObzPJpfSex4lhus+QxkWOWP
 pMuDcOk7GXIbmWWIJ0hPA5nlLnNbvFJFNrXJjfJshoWPWnAC6jkNsUml1zjVRx4Y6E5b
 hT6bSUNi1IP0LtUqH63Mym3D28zEIfY/idmZtfGxkVRDoJTpT6g7qgoT2WmXz4MNJFCN
 3gMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUI1SbV4ft93wGSTjxoxsz4XYesr1Pd/6oSXn1GBIbUOXepGZ9Dtf44jiViQtzMbiAj4JaT/uWIsLY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyJiU/bSPKOiw17rZEZ7Vxa+UpyG8uP48SR28CERIq6JkKTEPIg
 XKo4P6KlrxG1NYnYi68p16hVXxrZOBAELqQtBnhFwUIyQ5vBbhvbseVynjtqvo5JG0H6gLO/Z0U
 2m3hzSA2guLCHfXQFqOzeBNn7dHWbqVpMm694Z5KMdXkwsLjGvzt9XCZhXQYVxpvotkNtU1k=
X-Gm-Gg: ASbGncu5ogVtZRdOSU/+wZnGiyY2KIhXuruqHbAmHo5vSFIY7Orap6BWghBXwcIwwen
 Ok1lOjOZuSbgMSAa5GtN71+zk2Ci22w6cqiH1Z81uMG8CnuQ+6vJ63/fLtplzFCbMrlPJwy8rwY
 5fX+OiYyZTnlloPQ0S/7UQ2R5hPI0oOH0UKMNkJyNLF3oIUCP2xo906YMVl3Kmzc6gHYDwgT3m/
 CCqJkTIuIHOOCoKwLkmBcPrPGyT1TySl3lkPaTaWHm+J4fNTbb4Cb4aH9Td8gqDleX18hl10DW1
 qyiVG0L7ElA1pB9ww1q44+ttpHWCFXSRhtDlc9bx8i8wvNAKQCfq+ru+LYpjLAt8
X-Received: by 2002:a05:6a00:14cc:b0:736:4e14:8ec5 with SMTP id
 d2e1a72fcca58-76e438f0ec5mr15651400b3a.11.1755526019861; 
 Mon, 18 Aug 2025 07:06:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEaW5O7M2POFlUVEtIHKn+I++/iHZWm/6mA4hEC46cPlJZweEv7D5U88CqdrtLREpBxLoXmhw==
X-Received: by 2002:a05:6a00:14cc:b0:736:4e14:8ec5 with SMTP id
 d2e1a72fcca58-76e438f0ec5mr15651177b3a.11.1755526017550; 
 Mon, 18 Aug 2025 07:06:57 -0700 (PDT)
Received: from [192.168.1.4] ([106.222.229.157])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76e45588c05sm7492056b3a.82.2025.08.18.07.06.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Aug 2025 07:06:57 -0700 (PDT)
Message-ID: <9f94c6d7-7b39-455c-83d1-81c694672775@oss.qualcomm.com>
Date: Mon, 18 Aug 2025 19:36:52 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm: skip re-emitting IBs for unusable VMs
To: rob.clark@oss.qualcomm.com, Antonino Maniscalco <antomani103@gmail.com>
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250813-unusable_fix_b4-v1-1-3218d166b8a8@gmail.com>
 <272d2a39-19ce-4ac5-b3c6-3e3d6d9985c5@oss.qualcomm.com>
 <CACSVV00Yo=cZxUztB5Jf7153bsnnuATrh3L1utw4SrOQmYERug@mail.gmail.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CACSVV00Yo=cZxUztB5Jf7153bsnnuATrh3L1utw4SrOQmYERug@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: eAMRssV4-CYIcSlrIIKoJCTnZw0-U3lI
X-Authority-Analysis: v=2.4 cv=YrsPR5YX c=1 sm=1 tr=0 ts=68a33385 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=9Q8gPALlkHEzzDxkdHlyxw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=1QxSUWC4Tu4TNCmoOX8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAzOSBTYWx0ZWRfX9kENcD9AaG3T
 fqxFfV742gcSQQywBh/onXqAMd4Sx1Y86iMEWHZGcyJbFwfa7W+nMhq7MNPLxwP+Cp6su3D7jJt
 ZcAl/sruiznm+1ZoqdfybJpIFwwWCj/LXOX3eGFPcO+AjrvTsWR4S0oKO5OzXIj8l69EWWOkbSH
 aIOd4603cdq4PBzbFpDePw/3QCgXSDu/R6D77ga1PvCZ/ZEoaOAf3u0RyQ93OFsAx9iRxBuHzC0
 wbc5f1FlPrOrm3lZ5ENqYUpG1FTQNdnEO4jvP27Oh99yvKTLZ2koiClyH79VFUaVY+hFNSNqJc4
 IFqcc8S/RGhPpaA7rYGVSGeQcN3dSQW5Rw8x68kFkIwBZCnd+XL3GVDYrMa7L1/rpA7yDHBA2+g
 0mvQZvx+
X-Proofpoint-ORIG-GUID: eAMRssV4-CYIcSlrIIKoJCTnZw0-U3lI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_05,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501 phishscore=0
 adultscore=0 bulkscore=0 clxscore=1015 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508160039
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

On 8/18/2025 6:48 PM, Rob Clark wrote:
> On Mon, Aug 18, 2025 at 5:10 AM Akhil P Oommen <akhilpo@oss.qualcomm.com> wrote:
>>
>> On 8/13/2025 6:34 PM, Antonino Maniscalco wrote:
>>> When a VM is marked as an usuable we disallow new submissions from it,
>>> however submissions that where already scheduled on the ring would still
>>> be re-sent.
>>>
>>> Since this can lead to further hangs, avoid emitting the actual IBs.
>>>
>>> Fixes: 6a4d287a1ae6 ("drm/msm: Mark VM as unusable on GPU hangs")
>>> Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
>>> ---
>>>  drivers/gpu/drm/msm/msm_gpu.c | 9 ++++++++-
>>>  1 file changed, 8 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
>>> index c317b25a8162edba0d594f61427eac4440871b73..e6cd85c810bd2314c8bba53644a622464713b7f2 100644
>>> --- a/drivers/gpu/drm/msm/msm_gpu.c
>>> +++ b/drivers/gpu/drm/msm/msm_gpu.c
>>> @@ -553,8 +553,15 @@ static void recover_worker(struct kthread_work *work)
>>>                       unsigned long flags;
>>>
>>>                       spin_lock_irqsave(&ring->submit_lock, flags);
>>> -                     list_for_each_entry(submit, &ring->submits, node)
>>> +                     list_for_each_entry(submit, &ring->submits, node) {
>>> +                             /*
>>> +                              * If the submit uses an unusable vm make sure
>>> +                              * we don't actually run it
>>> +                              */
>>> +                             if (to_msm_vm(submit->vm)->unusable)
>>> +                                     submit->nr_cmds = 0;
>>
>> Just curious, why not just retire this submit here?
> 
> Because then you'd end up with submits retiring out of order (ie.
> fences on the same timeline signaling out of order)

Yeah, that makes sense.

Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

-Akhil

> 
> BR,
> -R
> 
>> -Akhil
>>
>>>                               gpu->funcs->submit(gpu, submit);
>>> +                     }
>>>                       spin_unlock_irqrestore(&ring->submit_lock, flags);
>>>               }
>>>       }
>>>
>>> ---
>>> base-commit: 8290d37ad2b087bbcfe65fa5bcaf260e184b250a
>>> change-id: 20250813-unusable_fix_b4-10bde6f3b756
>>>
>>> Best regards,
>>

