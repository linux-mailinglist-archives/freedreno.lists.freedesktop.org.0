Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18258B49510
	for <lists+freedreno@lfdr.de>; Mon,  8 Sep 2025 18:22:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B811C10E565;
	Mon,  8 Sep 2025 16:22:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ljPZ4wD9";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ADAE10E565
 for <freedreno@lists.freedesktop.org>; Mon,  8 Sep 2025 16:22:11 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 588G5O3f009916
 for <freedreno@lists.freedesktop.org>; Mon, 8 Sep 2025 16:22:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 4+rdrikp7bBevt5yb6lYYZbNkqBe9kBUGdXeaOgnPNc=; b=ljPZ4wD9UTrVeaVC
 WMB9FhYLf1+jhrLCFecGC8ohUOenUwWLiNNTyZOJFkJgzsUCyCQHnygaWCE3OXAJ
 y6+kqB3S9EU9hbj4yDTuIcuPZYdfblyPeMSd6gSCIjU57ZwR37+oXeFiIN6vDSZr
 WnA7YdfHncMFewSH+f0OU6yRow5AQoowIdm8wZBRaB6WagkFMUP2kxS2zpv2aM0Q
 krNbm5Jud8TduKECJZkufnR6U6sEdTToV83O5YgFnOzrMKE/TADUqcs6xPIwR5NQ
 bnWty3Syj4y6x1QGs/Cf6jh9ET/wvAOwsewh+7TtDYGyVYOh3n1tzaDnEYH3wMvo
 7eSE8g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490aapdggh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 08 Sep 2025 16:22:10 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4b5eb710c8eso8525841cf.3
 for <freedreno@lists.freedesktop.org>; Mon, 08 Sep 2025 09:22:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757348530; x=1757953330;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4+rdrikp7bBevt5yb6lYYZbNkqBe9kBUGdXeaOgnPNc=;
 b=t022wvCXJWpgUYR+YlDdd2xbSjMpfpvpgP2SPOKaPPbSa+4LeAVlYYpWy32tR7dDUZ
 VBY98W5KYWBQDURfjGBlZUl+11xrQZIxE4fny5Ka6zyp0ly2XYPcmXDaWzUQNMvkfuFI
 4v7K9yyENvBNQGb7xC26etsj5OrLEjyJk+XwEOHVxK7vEhUccH4Zpn/4zQwTVVws7w/Q
 AuGAKyFRnm1RKXyIXxD3X04MdRM7f2L/Oadji108sg+3LpEadfiD3Fpc5WicuTDNdiso
 3lcAU1vGj3OiJodIGERnabaUErjK6rTPSc9sF1aPVu23ueXqPWatSh5I+6lVLJgdhVk3
 1fEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVK3PS1eWUNemwHyJNuPB2oCyDGwtV/KuJfsu6vCrYrTHo/sJAPSCya442ilpPe+kJrTaIXpzOdODU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxMgh7kgT/rO6rP6gVIIYyOywf9f/gJkBCLiRmWObvXMyIHlqQh
 ClZzahAA3XrWNLKERJojVsy2kzPDo6OSusmnRcQKXKiZnpEFJOtICf+AWnsLSAZiM4uLTOOJbNZ
 RMsEbUYTrxB+Ms4w83zq6mGi87+i8HQsI4m1QidUEVA/a26GnF2qw7uITrZnURoAWwr7/1yQ=
X-Gm-Gg: ASbGncsLzPTX2rbML+TYbA/vQYv8AgPD2oM4BLqwtBEnPtkrDN1ArcvA4kzTZYwPVaJ
 VmRX+TzFGtJm0OYSzQ5eN+YXJYgKiGaOBRQoP1eUpJQQJ173e+GM4V20/3Z2q5TlUzh8wjLZ0F8
 PSMZolMs+IbDTalv6TMEGuhfF9fkG686yg0DsiTP3sZPZa2DXdqNrKxpooNPiYf5cz+Kl7/jx/m
 90HliVIUoHTRFNgXnb9Ccz/Sgdu7pev49OiIOrQ6JJjnfH+EX5bLJlyKfCFIvWEaQKgvW2lDPON
 Ncn6uWhSaLmKEHCVlAAsD/rdT3fCXonisWF4wm3D5bCbDJU9137IBH7X6+V7vFr71uUqm+1KA+K
 QOeTwJQ3vhSsdaxXFCDJw0g==
X-Received: by 2002:ac8:574d:0:b0:4b5:e9b6:c96 with SMTP id
 d75a77b69052e-4b5f8485b15mr55798541cf.7.1757348529511; 
 Mon, 08 Sep 2025 09:22:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFYOBJx4IJkeJeAPl8HAgvgXSbH1A+bDveiyp+jDidpl9Ny8oP0uh/qo/0V2HKO1R7C2uho2A==
X-Received: by 2002:ac8:574d:0:b0:4b5:e9b6:c96 with SMTP id
 d75a77b69052e-4b5f8485b15mr55798281cf.7.1757348528898; 
 Mon, 08 Sep 2025 09:22:08 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6248711bfe8sm5192325a12.20.2025.09.08.09.22.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Sep 2025 09:22:08 -0700 (PDT)
Message-ID: <4fa44ec5-2792-45e3-af87-b3e4d2ed5d86@oss.qualcomm.com>
Date: Mon, 8 Sep 2025 18:22:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/msm: adreno: a6xx: enable GMU bandwidth voting for
 x1e80100 GPU
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250725-topic-x1e80100-gpu-bwvote-v2-1-58d2fbb6a127@linaro.org>
 <e7ddfe18-d2c7-4201-a271-81be7c814011@oss.qualcomm.com>
 <33442cc4-a205-46a8-a2b8-5c85c236c8d4@oss.qualcomm.com>
 <b4f283ce-5be1-4d2f-82e2-e9c3be22a37f@oss.qualcomm.com>
 <269506b6-f51b-45cc-b7cc-7ad0e5ceea47@linaro.org>
 <1727374d-0461-4442-ab35-9acb8ef7f666@oss.qualcomm.com>
 <df007b41-5c3d-4c69-81b9-27155485ccf9@oss.qualcomm.com>
 <pxigrjxtizcrhn4l25ph4yh4runebintfp4swqfiewfq5hqceo@g5cy3mdgjir5>
 <77db4861-4868-4110-8c31-eb2045ddbf4b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <77db4861-4868-4110-8c31-eb2045ddbf4b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=eMETjGp1 c=1 sm=1 tr=0 ts=68bf02b2 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=-rBNSpjuQUH0YdP2-XMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: bqW97rLZXWn9LEPEaKqKqHG-JQ3tBFHu
X-Proofpoint-ORIG-GUID: bqW97rLZXWn9LEPEaKqKqHG-JQ3tBFHu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAwMCBTYWx0ZWRfX4W8a2W5OgJnR
 0LFeMkhUjgUhm2p48A069WgG2x8J+/g3tcxB3IPhVe8w+Plq5KdfDriOIBp9NWa34qq7uWBdKOF
 Zv9OZ03/AMjN2IhLNeB4rs/IWN9gh4dkJoOBKhTaNvFa51mw0gQ+8Gu3h5Hd8CPtytOldhXj/UD
 DtxbRT8oydSACjDM6FLeWQf6k0Sz4Sv0jgY/amfYY4No37dD2g6ok+Tk+efWYckHsYJlgeR8IG2
 977wopL/HKDs2/D+R4gehjFrN1dKeNbK5/d+pc/lDKUiK962gJd9X99SS7Mr1wkYPrnG/+m+zDG
 ZBY2dyvnXPykdBQGQd+lWGHgaAG5PYzUuCCADNtlSANj9BAZLRoTulajW2G1tc7H3/sSImOoWVn
 KVaZo3ig
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0
 bulkscore=0 phishscore=0 spamscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060000
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

On 8/18/25 9:17 AM, Akhil P Oommen wrote:
> On 8/16/2025 3:45 AM, Dmitry Baryshkov wrote:
>> On Thu, Aug 14, 2025 at 07:52:13PM +0200, Konrad Dybcio wrote:
>>> On 8/14/25 6:38 PM, Akhil P Oommen wrote:
>>>> On 8/14/2025 7:56 PM, Neil Armstrong wrote:
>>>>> Hi,
>>>>>
>>>>> On 14/08/2025 13:22, Konrad Dybcio wrote:
>>>>>> On 8/14/25 1:21 PM, Konrad Dybcio wrote:
>>>>>>> On 7/31/25 12:19 PM, Konrad Dybcio wrote:
>>>>>>>> On 7/25/25 10:35 AM, Neil Armstrong wrote:
>>>>>>>>> The Adreno GPU Management Unit (GMU) can also scale DDR Bandwidth
>>>>>>>>> along
>>>>>>>>> the Frequency and Power Domain level, but by default we leave the
>>>>>>>>> OPP core scale the interconnect ddr path.
>>>>>>>>>
>>>>>>>>> Declare the Bus Control Modules (BCMs) and the corresponding
>>>>>>>>> parameters
>>>>>>>>> in the GPU info struct to allow the GMU to vote for the bandwidth.
>>>>>>>>>
>>>>>>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>>>>>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>>>>>>> ---
>>>>>>>>> Changes in v2:
>>>>>>>>> - Used proper ACV perfmode bit/freq
>>>>>>>>> - Link to v1: https://lore.kernel.org/r/20250721-topic-x1e80100-
>>>>>>>>> gpu-bwvote-v1-1-946619b0f73a@linaro.org
>>>>>>>>> ---
>>>>>>>>>   drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 11 +++++++++++
>>>>>>>>>   1 file changed, 11 insertions(+)
>>>>>>>>>
>>>>>>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/
>>>>>>>>> gpu/drm/msm/adreno/a6xx_catalog.c
>>>>>>>>> index
>>>>>>>>> 00e1afd46b81546eec03e22cda9e9a604f6f3b60..892f98b1f2ae582268adebd758437ff60456cdd5 100644
>>>>>>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>>>>>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>>>>>>>> @@ -1440,6 +1440,17 @@ static const struct adreno_info a7xx_gpus[] = {
>>>>>>>>>               .pwrup_reglist = &a7xx_pwrup_reglist,
>>>>>>>>>               .gmu_chipid = 0x7050001,
>>>>>>>>>               .gmu_cgc_mode = 0x00020202,
>>>>>>>>> +            .bcms = (const struct a6xx_bcm[]) {
>>>>>>>>> +                { .name = "SH0", .buswidth = 16 },
>>>>>>>>> +                { .name = "MC0", .buswidth = 4 },
>>>>>>>>> +                {
>>>>>>>>> +                    .name = "ACV",
>>>>>>>>> +                    .fixed = true,
>>>>>>>>> +                    .perfmode = BIT(3),
>>>>>>>>> +                    .perfmode_bw = 16500000,
>>>>>>>>
>>>>>>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>>>>
>>>>>>> Actually no, BIT(3) is for the CPU (OS), GPU should use BIT(2)
>>>>
>>>> You are right that BIT(2) is GPU specific, but that support was
>>>> commercialized from A7XX_GEN3. Anyway, the Win KMD uses BIT(2), so lets
>>>> use that in Linux too.
>>>>
>>>> I know some docs show BIT(2) support, but lets not bring in untested
>>>> configurations.
>>>
>>> Eh, then let's get the docs fixed if you don't trust them because we can't
>>> work like that..
>>>
>>> FWIW this is information from per-platform RPMh cmd-db data
>>
>> If it comes from cmd-db, then we should be requesting it from the cmd-db
>> driver rather than hardcoding it here.

No, what I meant is that there is a piece of configuration that reflects
what goes into cmd-db as its compiled and that's where I found that
information

> 
> Not really. This should be under the control of GPU driver.
> BIT(3) is correct for X1E.

BIT(3) is for APPS, see the interconnect driver which also uses it.
This will create conflicts and may cause unvotes when some other
driver requests perf_mode through the ICC API, but the GPU is sitting
idle.

Konrad
