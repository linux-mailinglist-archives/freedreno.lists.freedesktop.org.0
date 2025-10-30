Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5665C1F647
	for <lists+freedreno@lfdr.de>; Thu, 30 Oct 2025 10:53:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20F1110E8CE;
	Thu, 30 Oct 2025 09:52:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="SiQEN4RF";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aNIFjLzY";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9673410E8CE
 for <freedreno@lists.freedesktop.org>; Thu, 30 Oct 2025 09:52:58 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59U7mLer1656152
 for <freedreno@lists.freedesktop.org>; Thu, 30 Oct 2025 09:52:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 v7Q8Gm4q1rlF4zxFf+h3/o0rNZAjE7F9daCHt68XXws=; b=SiQEN4RF9xbpJ1w9
 ooeOXGozPjTyHk/CPlMcm1ta05F+QIx2DzgNqWZYlDpcCjRqAqGcy+dyftb+Nyp0
 aDHX6W+XeNsxr+B/loSsfqhe5mUUGb+5xkc2hmKgkRtfYZgU7UlsUzS9ywvBEz69
 YrZFHq1IYQMGfQ1lUi9YO+b4qKPSm7qJU5x8oTZp3PwPrBWWC/DjSZxtXIGjnIHU
 uJnNykCqajYoLlHjuGuensKCBZS0mXYeTkSG8pZqRiamm9usd/v/mtFvythb6EiY
 pKe/A0+VwZq3h45hlMfV9bvbsdCT/WpYpBK2RA9n5SzNjuOpGh1y1vmatxvXQ7xZ
 S9DOkA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3tptsvqe-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 30 Oct 2025 09:52:58 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-8800460ca8dso3235366d6.3
 for <freedreno@lists.freedesktop.org>; Thu, 30 Oct 2025 02:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1761817977; x=1762422777;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=v7Q8Gm4q1rlF4zxFf+h3/o0rNZAjE7F9daCHt68XXws=;
 b=aNIFjLzYlwnMlTNWO44Fp75y7HY0zVTVTSgcxbkcD3uYowiPgfu+GRQolXN8RlW/vl
 0rx5L4GW2tRCkj48SjXZr2qvXn6HLYby+gnn3axfHs/yicQlCKDGeDcy+U203GPyktZg
 qEpRM9svQ7mn3Jvwz/2l4cMZ5X/avzmd9xRHSBGSlo0dtmj0AWxb0yz3JLiAS6qi7gZa
 oFtoMOl0SucVX558QsMAgcyGoBsZFIJkk1TW+TMxj203MI4cPyTOpA/XvnJUI53417gR
 bbm0RAHeldURELS3OZAbn20GYWKVKVZInIXtxenLebjVIQGywh0CyjhtIa6m3F/7WEqV
 cm/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761817977; x=1762422777;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=v7Q8Gm4q1rlF4zxFf+h3/o0rNZAjE7F9daCHt68XXws=;
 b=NjSxDbHnHmYDA61JRt3+TnK9cV3v1ROtx+C9wmsMBxMQecJCIe/mctCTivMi5GOI4h
 +i8RheHSd/iruioQJFuVFGd28fCPgeL7yRmRHdESXasECOXEfvkEIn83LFI1SA314IAW
 KjzjiqY+KJxL5bybhpsi46v+MQoCPg2f0XQHIf5wv8/RcRA0SB3PEmbAB4YTW5Ef2xC8
 WFQ28+Gt7YyHf7SCCEKsqFX6+M1oA6j0Q4/R3exH0izUDKRQ4GuJz0d2iwlnBS5xpf6f
 Wl0MeacXZuQFBRIsae/kZflxAKgKas9Il8RCYS1lkoxdbaNjdz304+/dsrMET8NfdPJ7
 DOLA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEiw093sLbqEm1yDeJw+TLmvzsqn+v0tS5RQbcbvLEs6zuNaFtO1xrynrXWI0GZnij/t/ay9EttlA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyC7ETdMoDaCK9rd2lilJKes8bLsXpTtbHAozrh6MJJB81qh1x4
 9CrGCL9/ENBg93h2MsKV27+kPQ0dfo2aSL9b2igIW9xtFZ6e3G4gDAJ8GhXtx8iSeumaanj7Iq0
 jKwbUPXl9/149NM8Ee8qRWm54HKwC9c1RUyZQgGu4Zs3HZ4//nxGp0RT8EVKU4vFC44lqhkI=
X-Gm-Gg: ASbGnctRXJy2sQUpg8znEFr0snas6UOX2/8jjvMJTDfGgc9uvVC7AAi+G25LXpU10vq
 Q8YRHfeMKkRXviiAOmTGp9SuZV9wnm94z9KS8K4jzDQICgSxxSg31JDFnJ2bVtrFJel+Lm0gL7X
 iVoYQ33OMI+aOYI8L/esmylqx0gp3LQkSNMAqu5YLUcYy4T0NQOJtVKwLUzzC3KqIEMYOVEdWVB
 KXWvu85byYetVUtH7XaxN4Yo8PCoDAiKewIJZ3TardNTGz9qnCarc8DzB8ecHohTUHO++o3TCbq
 T6LuVDXUuWnzk5Dewh3iigNLg4frfqasMHBNzyn8yx+TxMx8F51iICHFn2QytlEYjNvzaJgrRZR
 yjCY5jqRFB8LC8uRoyGTb2ke1AIph7OL9z94RzQnYvsB/ERQ4M+mSJwkn
X-Received: by 2002:a05:6214:c6c:b0:815:e14a:1f44 with SMTP id
 6a1803df08f44-880099ac8d8mr52250686d6.0.1761817976906; 
 Thu, 30 Oct 2025 02:52:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGPEnRfdgeY9SqFksQVxRyzlmk8WoSCfnN23Yxc6FUxQBSZpZ7uQW7zVih/5H4U1d6Rw4R1pg==
X-Received: by 2002:a05:6214:c6c:b0:815:e14a:1f44 with SMTP id
 6a1803df08f44-880099ac8d8mr52250596d6.0.1761817976393; 
 Thu, 30 Oct 2025 02:52:56 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-640342e5acesm6138757a12.28.2025.10.30.02.52.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Oct 2025 02:52:55 -0700 (PDT)
Message-ID: <a15e8316-96cb-452d-b2b8-731eeb6d25d3@oss.qualcomm.com>
Date: Thu, 30 Oct 2025 10:52:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC RFT] drm/msm: adreno: attach the GMU device to a driver
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251022-topic-adreno-attach-gmu-to-driver-v1-1-999037f7c83e@linaro.org>
 <5d6e7303-cc57-4a50-a9ad-b45d3c89d045@oss.qualcomm.com>
 <25e829f8-60b2-4b69-8d57-ded846b5206a@linaro.org>
 <c79c55fb-3aaa-4256-a71b-fa86cd0166f7@oss.qualcomm.com>
 <bed92353-da4e-4447-97d2-10e8a333e4e0@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <bed92353-da4e-4447-97d2-10e8a333e4e0@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDA4MCBTYWx0ZWRfX14nsAwaLmlMK
 oAtzDOfpKlkxsw1GAg05CzeDQSTCin0ZjKJEaCKudPml3+alkrVP3zPBIfwqyF/bB9rF2MaI+iL
 3CB6VWiLLHnp9hL6hrFa6RF0nkAqeMAg41Oi3g56aQoDUQhw8l/xdU+uacML8a4FpUgzeY9vyoi
 lQV5e3vG1y2j2/aTrJ82Jib839vwhYEAHuLgnCgkZQeykrGNpaTN/0b5Bd4nA2a74WU3MvgX1Jm
 M1YL17HBOZFSlwcFvNvhqTs6EOpqSmVU9f+veceFIMxCF6v/rmU2iWoBcEH7up29s0WR1fxuDCw
 9RsXWcDynHrefJfeM/ZWeIt0AzyB8kCzOUIslTDWS6eXypw8mQycHD4YmBZEnCI9ioO//d5lLhd
 2t+wd+L23w/Y/uhY7JyzFSVDsgG+OA==
X-Proofpoint-GUID: taanWF2HLd6nW4tRMBiEaWqqPx-XBw1R
X-Authority-Analysis: v=2.4 cv=MuRfKmae c=1 sm=1 tr=0 ts=6903357a cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=M5-gK5ubkblMbbE14A4A:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: taanWF2HLd6nW4tRMBiEaWqqPx-XBw1R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 phishscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510300080
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

On 10/24/25 11:11 AM, Neil Armstrong wrote:
> On 10/24/25 10:55, Konrad Dybcio wrote:
>> On 10/23/25 10:27 AM, Neil Armstrong wrote:
>>> On 10/22/25 19:09, Konrad Dybcio wrote:
>>>> On 10/22/25 2:44 PM, Neil Armstrong wrote:
>>>>> Due to the sync_state is enabled by default in pmdomain & CCF since v6.17,
>>>>> the GCC and GPUCC sync_state would stay pending, leaving the resources in
>>>>> full performance:
>>>>> gcc-x1e80100 100000.clock-controller: sync_state() pending due to 3d6a000.gmu
>>>>> gpucc-x1e80100 3d90000.clock-controller: sync_state() pending due to 3d6a000.gmu
>>>>
>>>> Does this *actually* cause any harm, by the way?
>>>
>>> ?
>>>
>>>>
>>>> For example on x1e, GMU refers to 2 GPU_CC GDSCs, GPU_CC refers
>>>> to a pair of GCC clocks and GCC refers to VDD_CX
>>>>
>>>> and I see these prints, yet:
>>>>
>>>> /sys/kernel/debug/pm_genpd/gpu_cx_gdsc/current_state:off-0
>>>> /sys/kernel/debug/pm_genpd/gpu_gx_gdsc/current_state:off-0
>>>>
>>>> /sys/kernel/debug/pm_genpd/cx/current_state:on
>>>> /sys/kernel/debug/pm_genpd/cx/perf_state:256 # because of USB3 votes
>>>>
>>>> I'm not super sure where that sync_state comes from either (maybe
>>>> dev_set_drv_sync_state in pmdomain/core?)
>>>
>>> The way we handle the GMU so far is wrong, it abuses the driver model.
>>>
>>> And this is a symptom, whatever the impact it has, it needs to be fixed
>>> in a proper way.
>>>
>>> The sync_state is retained because the gmu device is never probed but
>>> has some clocks and power domains attached to it, which is clearly wrong.
>>
>> Yes I agree, however I'm only debating the commit message claims of
>> 'leaving the resources in full performance', which doesn't seem to be
>> true
> 
> OK so the wording may be a little bit extreme, perhaps something like:
> the GCC and GPUCC sync_state would stay pending, leaving the unused
> power domains enabled for the lifetime of the system.

The debugfs reads above suggest this is actually not happening

Konrad
