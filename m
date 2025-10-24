Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C78C0531F
	for <lists+freedreno@lfdr.de>; Fri, 24 Oct 2025 10:55:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEAA910E240;
	Fri, 24 Oct 2025 08:55:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="bnBri4hg";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20A3C10E240
 for <freedreno@lists.freedesktop.org>; Fri, 24 Oct 2025 08:55:06 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59O3FKLn017639
 for <freedreno@lists.freedesktop.org>; Fri, 24 Oct 2025 08:55:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 QLEqj8vg3DpwyQO+fKvM+2N23Csi21bAOUajBQu74n0=; b=bnBri4hgoz4+rBAk
 vFnPyynJEUe9WRgARX+rMqoYM8KaZ/M1MF5QmTz3hudKIaQSTrHo/t25UzM5R1u6
 TSsKSke3zTvVtqMX1P0/NGJTE0x+TvUMvucmFGPsfehqjLeZ7d3xxRSvoOQfDM7r
 8aNjdp0GJ7IZQkkR7ypwSH+9lgFNJrLUZVHXY94O2Fu3ZtH89SXWRC544xixwdbA
 ODR6HqY5EFBZIXxv0JCJaD2tbrbYlL41/J2g63OcWa3DaZmzfQ9dzvHKthGAGqaw
 ZREGW2/Pz2+Ypha/jSoaA52BsObqVMfjKf+vXB6xHpNdNJckD5W33rbyG8mu4BQQ
 YyerDQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49yp6k2p3r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 24 Oct 2025 08:55:05 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8906754b823so60382685a.0
 for <freedreno@lists.freedesktop.org>; Fri, 24 Oct 2025 01:55:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761296104; x=1761900904;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QLEqj8vg3DpwyQO+fKvM+2N23Csi21bAOUajBQu74n0=;
 b=dIyaO3WEbZIGQ8SEkzniB63FSXswiLvcB30sYRlHMX4HHpDrti772MCEFoRiMt1hyM
 0PEUK7ED9FFMn0h//DvMnfsgzuZ/1qy7ci4uQr2I5SwdJN7/3daVn7tqAZtdnWnsfdpq
 YYAP63AT+NPUp11AnMLHo3VTfjvs61gx0DT4N5zegOsoLTKcAgqyJhiiiHw8AGWY/D1K
 8BRmBAoxrZcZv10Q2h6AwZwHItRCzs+7DAd/rC0TwSo7bbTUsoPDAKomtJNvyS+00P4S
 tlLFIW/1cs7nAvil/bovVWk4YPvU1kryfKd8BdG/thS/vDAJ4vjMn9alSOTgQyCVH3Tk
 +UUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7jaqMfnlkSd7/kC96yPXG03gTI09trJINQrScGSQUur6Ek76L7XkUKgxTNIcmSf3Uo4CzODMwQvI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxi468PmjSOCklFM38LpZRwKTVpzQZOPVpB5AGig4kv6nyf9o8b
 MSPVDTVBgqreDT04t69UsTjctB/bLuA8YTVUl/c7YUbGZrOldORutfeoTemjSD/pudXgKQ0+C0u
 6YQ6Z/tIN9sZ0CxLBKqldnQtn3jXIeyl5h/j77+msk6w28ji+HFEVxaqtN8UDT9PHqs6vltI=
X-Gm-Gg: ASbGncvmfLtmFwDaJDOy89EbrkWmce4yRI8IZmWEnVJ0CEdEUkOd/fi3NjKkLgzyzLN
 l67kc/Y8JDEg8bXLr6GJniwtq4QnOiK96qJ6+iO8+7huNejcrtdKI7yJM/6XEFSakafNNKoP+Zx
 SXjtlhiCTqN6aY3LlTHhJyYUwphZyvru0XtaHmVZ6ZfUfcgF6QVwFNcHtOHizp71zL6ZZRW+sIH
 BH0M8XmDbciirPmO+ANx9e1KwC5SXpzecLNC7GPA2r7o45lQankWkJqFDaTCvR9MHky523tEIE5
 vJXc5fBPDaVsWJbFbcc8o+8gPEz0/fTSdi+3hfs8WTE714XYdSlrN0vKLK+QZG1i7ExnV1i7Muj
 F0T4pHgt2qZsKUEfmZCxMbdwUxYnTHIXgzXwZKPzgz9DEfGiNdKOvsSMh
X-Received: by 2002:ac8:57c2:0:b0:4e8:9af1:366c with SMTP id
 d75a77b69052e-4ea1177c509mr118203731cf.9.1761296104178; 
 Fri, 24 Oct 2025 01:55:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGWZ/AyCKsRVq/DeeaOVV3qlQdtXKIx3PeDH8Nx8c0mJpXsDEkee8YBg64b/7qGPs+6AarhGA==
X-Received: by 2002:ac8:57c2:0:b0:4e8:9af1:366c with SMTP id
 d75a77b69052e-4ea1177c509mr118203471cf.9.1761296103588; 
 Fri, 24 Oct 2025 01:55:03 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b6d513199d0sm462820166b.37.2025.10.24.01.55.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Oct 2025 01:55:03 -0700 (PDT)
Message-ID: <c79c55fb-3aaa-4256-a71b-fa86cd0166f7@oss.qualcomm.com>
Date: Fri, 24 Oct 2025 10:55:00 +0200
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <25e829f8-60b2-4b69-8d57-ded846b5206a@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIzMDEzMSBTYWx0ZWRfX7m60GxlfCygp
 4Oo1XAuK876dRsu8wtMrPedc9dBw+Bm2k5L5hS6NV+ooZHQBYvWbuyi4SZfnxUhQT5pWRitqmQC
 o4pbxm1FqrP5idpmv85zK80JYKkTLmEm4OPrB1f0auaGZSDsVo6Jy77G68v2o0RQoC4/b/tPf8M
 pFQ6BVjbutqHl/Z4kHDcjP2jR5x8h/BbP7fLw1x2tc2qdLYyWApEyR7J65AxgKXLJSILIKVFBP+
 PRgbLvLy2EIZOAbHCCDW04VAVdYaKHKGXTI9ravsWY02vAyGnZ1A4A0LckOlHAIjLZLopfZ69V7
 hrUMxX2wE/ZidYPyuN/mNg8ef8dcLVwjT314gQB/7K2Y2RGcu9ZvGSrzrAd0CWqdBFHMOUfQSSc
 SQDCbcZO9YlvWjuTIWLKlma5eVJXew==
X-Proofpoint-GUID: BMl--eEflqCCAM6Q3cZEBdugbay-ZCCB
X-Authority-Analysis: v=2.4 cv=bL8b4f+Z c=1 sm=1 tr=0 ts=68fb3ee9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=5e8rntOtLM__4sLSfr8A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: BMl--eEflqCCAM6Q3cZEBdugbay-ZCCB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 spamscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510230131
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

On 10/23/25 10:27 AM, Neil Armstrong wrote:
> On 10/22/25 19:09, Konrad Dybcio wrote:
>> On 10/22/25 2:44 PM, Neil Armstrong wrote:
>>> Due to the sync_state is enabled by default in pmdomain & CCF since v6.17,
>>> the GCC and GPUCC sync_state would stay pending, leaving the resources in
>>> full performance:
>>> gcc-x1e80100 100000.clock-controller: sync_state() pending due to 3d6a000.gmu
>>> gpucc-x1e80100 3d90000.clock-controller: sync_state() pending due to 3d6a000.gmu
>>
>> Does this *actually* cause any harm, by the way?
> 
> ?
> 
>>
>> For example on x1e, GMU refers to 2 GPU_CC GDSCs, GPU_CC refers
>> to a pair of GCC clocks and GCC refers to VDD_CX
>>
>> and I see these prints, yet:
>>
>> /sys/kernel/debug/pm_genpd/gpu_cx_gdsc/current_state:off-0
>> /sys/kernel/debug/pm_genpd/gpu_gx_gdsc/current_state:off-0
>>
>> /sys/kernel/debug/pm_genpd/cx/current_state:on
>> /sys/kernel/debug/pm_genpd/cx/perf_state:256 # because of USB3 votes
>>
>> I'm not super sure where that sync_state comes from either (maybe
>> dev_set_drv_sync_state in pmdomain/core?)
> 
> The way we handle the GMU so far is wrong, it abuses the driver model.
> 
> And this is a symptom, whatever the impact it has, it needs to be fixed
> in a proper way.
> 
> The sync_state is retained because the gmu device is never probed but
> has some clocks and power domains attached to it, which is clearly wrong.

Yes I agree, however I'm only debating the commit message claims of
'leaving the resources in full performance', which doesn't seem to be
true

Konrad
