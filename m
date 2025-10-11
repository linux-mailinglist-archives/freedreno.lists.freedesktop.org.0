Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7427CBCF5D5
	for <lists+freedreno@lfdr.de>; Sat, 11 Oct 2025 15:46:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E10910E2ED;
	Sat, 11 Oct 2025 13:46:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cfrTd9G0";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19C5810E2ED
 for <freedreno@lists.freedesktop.org>; Sat, 11 Oct 2025 13:46:33 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-b00a9989633so499688166b.0
 for <freedreno@lists.freedesktop.org>; Sat, 11 Oct 2025 06:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760190392; x=1760795192; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=V7baLPO6ldN0wytk+dLo0ZV9RZqTyWkuy/xpv05pZ3Q=;
 b=cfrTd9G0Rj/UXCtM0B1Z3x2b8iO9Jl1ddyJq3O6Ranww1sSw7I8crRYnjwY19nWmb3
 F30WLZsMMmYmql0NuDWv7N3VmEEaM89dGjmZUClARqiorWylLSk0ZwFYJ0ykPlXDFSxV
 8RzPHJ0jprdE1fZuGooJQ4et2OQFQMEO0SQ5BTrzg7flu/6ORgApkiyoQ5lJW66R5D1P
 D87nXSHIFcbdIaSYiBAtBB+mGprn164uqAXLE8+ZHFE3EcuinF7bhhdA7x5kNwxJ4vOg
 xA+85Q1YgxsvJRf/Qka40wMAYbiAUsk6DeD3ryGiORLD115HUoYkaGshdGKtkWHSs6wU
 YVdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760190392; x=1760795192;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=V7baLPO6ldN0wytk+dLo0ZV9RZqTyWkuy/xpv05pZ3Q=;
 b=EP8UNOZxL5IvnFdYQpG49N2efhnEF7gPPleVtmfzHOilkIjXcU3yZziBBv4yrP0lrz
 ElajqiNVGbJPsHrhSWGyumPJLkRIdt1cMP/Qee4oICtghlV9QG3uNV9umrYPeMi9XznP
 C6Ye6rHda0Iv67uwlsXDIRvJxIH6EPMjHPuxhhmBvCb/QvVbOhoTe9p9y95urg0In704
 2BX4LwnrRUC6MyKy2un3wLxs6hz3WkTqxY1gtXA0umGwkjTUEEOX9O2aezl57m/mEGJP
 2cPRRATulgvej8bfUoqoqN60NH3/wicVAGliWQN3r3rvTiE59ffYPMiTQT70PiMDsbjv
 B+3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWetfMuWItnBRDRCH40/b/EyK04YuHkg/SVQzcPR8hNUAGJadLcq1kFjeQuMsRxGNdzPFAc/YXlrsM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzDYUI6BZc9oZ7RmRgfqBj/CsT6v/5ED8q98W7n7/trxWIBlm5M
 8Ixm0BsXZIxhiQkP/lnGBceZeVLYEEtrVUaAsZpcBkqOd5Rr3dXZ59Q=
X-Gm-Gg: ASbGncu5F3eRLtlZmEUefAeb64zunwniuoiQ5TZk45WmF0v+CAqnjxjb+RyELL9XpF+
 sp95o0t+UJMG0TVY0GXj2A7RBYW9AsfikQ4SJ1/6ofd+t/LYO9uih10oRCjIiu3wgI2Az9iRqHR
 KLuC4CJz/AqNjhd7kJFMgw+eVs8yMbESOiPDQLQy/YBsvSlRqShTBGhpCrbRtiDbC5JMpCGlfJm
 39pX/iGUivj+S4mAxS7t9m4k+N9/89GooMFHjDV3MvJFwTBOZ+YHB4jBqeU7297MwRuOhxYj+hZ
 Fa8FnQlPb1HQCHwzH16ikWAeSeX5sFqizALZBCbbr35ukcn/WlOMN/9m8EWb4qtQpJtPhqeINjE
 kemWzZtdP4Ma2x9GYoNfNx3bqlAZTfIflD5U716/NMItjh7B4VtHabp1LGn9YCzRmwZ4GdxUSGI
 /84ley/YWwxNK1fN4pPSn4MGJgcoo52rW1jsYzeYM=
X-Google-Smtp-Source: AGHT+IEeOXQezqtJMQ7hsE05lMpf7I93JoBsZfK1rO+E+6ZkZi1qgfeP+uOP/QAPO7I5q02P/gEzWg==
X-Received: by 2002:a17:907:6e86:b0:b04:48b5:6ea5 with SMTP id
 a640c23a62f3a-b50bedbed80mr1895801866b.17.1760190391512; 
 Sat, 11 Oct 2025 06:46:31 -0700 (PDT)
Received: from [192.168.1.17] (host-87-19-169-144.retail.telecomitalia.it.
 [87.19.169.144]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b55d67d2cb1sm479786366b.34.2025.10.11.06.46.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Oct 2025 06:46:31 -0700 (PDT)
Message-ID: <9b074160-68ea-4c19-83a5-8beb6eeb3768@gmail.com>
Date: Sat, 11 Oct 2025 15:46:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/msm: make sure last_fence is always updated
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Antonino Maniscalco <antomani103@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251010-close_fence_wait_fix-v2-1-adb332dbff65@gmail.com>
 <eb15cf16-f51a-4eb9-992f-158e2510184e@oss.qualcomm.com>
Content-Language: en-US
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
In-Reply-To: <eb15cf16-f51a-4eb9-992f-158e2510184e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 10/10/25 7:30 PM, Konrad Dybcio wrote:
> On 10/10/25 4:39 PM, Anna Maniscalco wrote:
>> Update last_fence in the vm-bind path instead of kernel managed path.
>>
>> last_fence is used to wait for work to finish in vm_bind contexts but not
>> used for kernel managed contexts.
>>
>> This fixes a bug where last_fence is not waited on context close leading
>> to faults as resources are freed while in use.
>>
>> Fixes: 92395af63a99 ("drm/msm: Add VM_BIND submitqueue")
>> ---
>> Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
> Your sign-off will be removed by git, as it appears below the '---' line
>
> Konrad

I sent a v3, thanks for pointing this out

Best regards,
-- 
Anna Maniscalco <anna.maniscalco2000@gmail.com>

