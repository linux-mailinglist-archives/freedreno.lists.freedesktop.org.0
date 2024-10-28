Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1C29B2D08
	for <lists+freedreno@lfdr.de>; Mon, 28 Oct 2024 11:39:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4420610E46B;
	Mon, 28 Oct 2024 10:39:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kUlXvH7R";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E82E10E46B
 for <freedreno@lists.freedesktop.org>; Mon, 28 Oct 2024 10:39:21 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49RNRXhP008963
 for <freedreno@lists.freedesktop.org>; Mon, 28 Oct 2024 10:39:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 IvU7ZlrjHkB3EzPLVjXtJ5AQLhmlFJL/Cm51xZ+jJsU=; b=kUlXvH7ROgF8wWpO
 BLdgBIYYnFUd5HTp+kThsGnuyDXxXxavDPKSyGEh9/btwaKgZEOyw3GTHsGsMIrE
 qzumdr8gDR5BdMZqg39AiF4gaz7mkJmJ7xvck4zxltVHmIaktSSmgvRoQs10YqsR
 ikOt5aOBMYoc+hIqATR9RJZMNcd5IG/5KuNmUqYbw6Mp4jgn/hUlRsz3caQ2WjHT
 D7sRKonzvDJaTCKjRVtoFrCqB6Oh+ixRlZH1oi2nO3v0NmNuPEkAjFEKq5SK7GVa
 vnHGRHvxUqVTEsdJzZ3f2gsBFW4kLnVKjba+/uDzpqd2cMneRkY5Js2wUiA6sQVZ
 EdefOg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42grguchtm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 28 Oct 2024 10:39:20 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6cc290898adso11449006d6.0
 for <freedreno@lists.freedesktop.org>; Mon, 28 Oct 2024 03:39:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730111959; x=1730716759;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IvU7ZlrjHkB3EzPLVjXtJ5AQLhmlFJL/Cm51xZ+jJsU=;
 b=gQVoYVdJo9dHhcDUxeS+hf5QiEz8148JH91fTJe4qbsx8CumekQ7WU2KVzo0/KlKjG
 L3zmrB+xeHcjKNFZIXXT1f1rcHl3t9/2yLa2qIb9ZRoW2qeeEbwhccCU3GPFHU4rj5nm
 vUrxtdYVOdQTYv2VwwTbOwlL/Wv/xnoED/nqJ0tG1zhCmiw58IOr8CLLhtrasxoaYuQY
 L26LxV2X0i83b3VJ2G8tmaatENh1JtGJ34XABuj3tSHV5K6w9OY/eegvExq0l0XnGT7/
 72J30hseKeFRz9oE9HbSP8M3dnUB9sZbFXC6Dq4C7X44DYg6wezRH8w3yc4lLOSDpKNf
 UXbw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzPXdF75sMz1gclR07WmkDoPumE3jFACMbWFEGXR6LOOmdee/H3Z3p7P6tlY3q26U31BlBFKYnhRw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx8llt0iOAWZEK4C4db53UT5goQs67elBG/g/Bp0h4CzLEEbsN5
 cGQz9C7MHpIaw6qPSW9ikG5L2vK3mA2fTULmY2Jn85x5lURJUDPOts6tbVce0z6HxDXye5RpCjL
 cYbeuXUxT1rrss7rKs1pezrJiEQObl3v8/L/z3pKFeFte1MdsJSWjxvcDsjnq9C3gr+w=
X-Received: by 2002:ad4:5c6f:0:b0:6cb:f0f2:f56c with SMTP id
 6a1803df08f44-6d1856943c8mr65408876d6.6.1730111959501; 
 Mon, 28 Oct 2024 03:39:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGuXnJ9QctQQKnrr1B9d6Pnh3CdOC3tp1NlBtHDTDJwYz+DKoHJwok6hm3fQ7kNKdJ+ruWTuQ==
X-Received: by 2002:ad4:5c6f:0:b0:6cb:f0f2:f56c with SMTP id
 6a1803df08f44-6d1856943c8mr65408636d6.6.1730111959225; 
 Mon, 28 Oct 2024 03:39:19 -0700 (PDT)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9b3099ddb9sm369502766b.173.2024.10.28.03.39.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Oct 2024 03:39:18 -0700 (PDT)
Message-ID: <55ca17a3-8ea6-450e-8ec6-9bda97808164@oss.qualcomm.com>
Date: Mon, 28 Oct 2024 11:39:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/a6xx: Fix excessive stack usage
To: Akhil P Oommen <quic_akhilpo@quicinc.com>, Arnd Bergmann
 <arnd@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Dave Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
References: <20241027-stack-size-fix-v1-1-764e2e3566cb@quicinc.com>
 <3fb376b3-2db7-4730-a2e1-958f1ddd9f5c@app.fastmail.com>
 <6b7c2ae7-3210-4d57-a7b0-2efea594b2b9@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <6b7c2ae7-3210-4d57-a7b0-2efea594b2b9@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: iN7n82OxJzwH5BLIpe2cuidX2qG7ueP3
X-Proofpoint-GUID: iN7n82OxJzwH5BLIpe2cuidX2qG7ueP3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 mlxscore=0 bulkscore=0 suspectscore=0
 phishscore=0 spamscore=0 malwarescore=0 mlxlogscore=999 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410280086
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

On 28.10.2024 10:52 AM, Akhil P Oommen wrote:
> On 10/28/2024 12:13 AM, Arnd Bergmann wrote:
>> On Sun, Oct 27, 2024, at 18:05, Akhil P Oommen wrote:
>>> Clang-19 and above sometimes end up with multiple copies of the large
>>> a6xx_hfi_msg_bw_table structure on the stack. The problem is that
>>> a6xx_hfi_send_bw_table() calls a number of device specific functions to
>>> fill the structure, but these create another copy of the structure on
>>> the stack which gets copied to the first.
>>>
>>> If the functions get inlined, that busts the warning limit:
>>>
>>> drivers/gpu/drm/msm/adreno/a6xx_hfi.c:631:12: error: stack frame size 
>>> (1032) exceeds limit (1024) in 'a6xx_hfi_send_bw_table' 
>>> [-Werror,-Wframe-larger-than]
>>>
>>> Fix this by kmalloc-ating struct a6xx_hfi_msg_bw_table instead of using
>>> the stack. Also, use this opportunity to skip re-initializing this table
>>> to optimize gpu wake up latency.
>>>
>>> Cc: Arnd Bergmann <arnd@kernel.org>
>>
>> Please change this to "Reported-by:"
> 
> Sure.
> 
>>
>> The patch looks correct to me, just one idea for improvement.
>>
>>> b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
>>> index 94b6c5cab6f4..b4a79f88ccf4 100644
>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
>>> @@ -99,6 +99,7 @@ struct a6xx_gmu {
>>>  	struct completion pd_gate;
>>>
>>>  	struct qmp *qmp;
>>> +	struct a6xx_hfi_msg_bw_table *bw_table;
>>>  };
>>
>> I think the bw_table is better just embedded
>> in here rather than referenced as a pointer:
>>
> There are some low tier chipsets with relatively lower RAM size that
> doesn't require this table. So, dynamically allocating this here helps
> to save 640 bytes (minus the overhead of tracking).

I'd second this, said chipsets often ship with 1-2 GiB of RAM (which
is still a lot in comparison, but you know.. every little bit counts)

Konrad
