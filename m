Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E378BC64687
	for <lists+freedreno@lfdr.de>; Mon, 17 Nov 2025 14:39:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 684A810E0D5;
	Mon, 17 Nov 2025 13:39:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="FXri2I17";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eK6w3fHh";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B21110E0D5
 for <freedreno@lists.freedesktop.org>; Mon, 17 Nov 2025 13:39:38 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AHB2jLp3917049
 for <freedreno@lists.freedesktop.org>; Mon, 17 Nov 2025 13:39:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 madWQ8LNSH0zkc6V66UGGR8dYDx8zrt7q0Rlr0n4JSQ=; b=FXri2I17p8o0uSsa
 l756g/4+5dAWAWNQ2+yzKFFJbeFnX0OcY8nt2wrOHncflCEMfcadsVQ2P/SGy6vU
 mnTGiW9+xjiI68V8h3X1XOZiKREAQ1IW+YZN/tpNOiDE6iH7RUbYUmWu37x131c2
 FUwZ08Su9AnYFu1SV54el7jvH6d2bRVuahSmGzJmColFRy+6eTuC+wnbzu5Va8eQ
 /10TW+AX8HjDcurmhOD8OdqtjPP9YQYhXZJXao5nl8PjL4VLYlLQg96hurZQRVNW
 J6EKZ7BoLRVTrkqHXF7PxgMMKlLkfYNjj79g5HIJKS21gSqgSuOJKF5R2xigR3/b
 u7gqZg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag2fx8e04-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 17 Nov 2025 13:39:37 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4edace8bc76so12375761cf.3
 for <freedreno@lists.freedesktop.org>; Mon, 17 Nov 2025 05:39:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763386777; x=1763991577;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=madWQ8LNSH0zkc6V66UGGR8dYDx8zrt7q0Rlr0n4JSQ=;
 b=eK6w3fHhnjOHAMbDv2lFxOVG/BxCQ2LYs6EiIoLy3r672SfxwwajkwqbKmDZOzbMIj
 4n8IYFsQfD5RRVCKawTkDkMz93IYDejTgTkK87wi4Q0HwnLe5xV+RLuBEJ7lQigbX7xA
 oadpWM2KX1MMEizgl0pyGklKTAM+8pect4c+0mCxUSHw8p4MfmP1LY9EEMxLzb5CEuHE
 X1QUdNGNUrESpeepHfJjS0oAR5y8cbhThp60yN65ndVICHSFTq3Dn/i/rviro8AiozU1
 QQag0tuhulQdyh0Ev5PuE9USDz9ABFFMykAKjs7eywS18iTh1Th1JQbwL/NH0jdES+Dy
 yOnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763386777; x=1763991577;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=madWQ8LNSH0zkc6V66UGGR8dYDx8zrt7q0Rlr0n4JSQ=;
 b=i0SCW7xZcgjzsuXk93CODjHrPao5MCuNhsIkNykHRcdHryMQCE/zvZRze5u7a4YEAB
 BoJV3+ug/b87Eusfr/R3pQUOBHPZ6CkDgAnqWJJyNMtNLGZmhQ0V0RXJLij1zkZuJNH/
 //pgRNALuS0WUWLLwVif3875cOdWzpLn4DES/sDcLabdcywRRpffuIgC7pCAj4FH66Qg
 O8QkEUFSZ9AmR+1vweCYVHdTFaTB1B39i5SjXgc+PKyF6C2jF7Wol2LjZEsYnYlsh10p
 MJS1kKOQtNO8PyzsTctU4yJJiW5C38vJf+WNyXgOLJwb3JIIWJ1vFDSdvnBLG4lHAhxF
 WgRQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYs3HaLDeokgXLgZ5Q7XF23IjDtbOwRYmt35kDzn1kgvdzfKUzjecPuN5pbV7ckjMKRmd666aOEQk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxKXm/TZaWvyZ5Ov6T15nlwsZZRIYJrQULiSvzkb4bKDUwoHfa2
 9rrMlbr2hfbAjwbYkwvfj/T4GFjS3N1TZQXpfQPhpydhkCyjXEggsz7qj88AuQW3EW6DgU7wLau
 5WhhE2U6MOLen1Xgnzn9PbLT4ormhOo0rkYaEltJy9Hn2BGkXTLikNZudU2JfpruDeWDhm0c=
X-Gm-Gg: ASbGncvsci/25Q5h7qk6zlyvgHpoBw7GuvjvR2v+lLR/YQ1BVJdI7YF5DcieN5WPJtD
 u2P+7qvmHpGyni9qlc4sYq779Sv/EXas09IKFJS7dup/koR0iPQcqmgf+gpKFmMNZjc5bWEuatE
 btyE9buEzm1ve/DRjdNQH7QNw9ETfSaDBT46locSIuTE159WTEXhPC3Cho0kHDQXgRCXpBBPIWr
 zFRMQuZ3P6Veh+Nj8ZNk35gs4q4W5947zZ37sEh7d2xryhXp8+3Hne5vdgL1/wTxJySGInzdOuf
 DW4DKbHQXJNeSZmzwFuCz7/tzgDWTnG52QaB3zljT6RXyTzOhOTiTO1BVfz8mFWLkVssTKm/DAv
 ONyhPVgGRC8Y56FV38kuiE3YbrcL5x//BENAUS0OzqoBBxSkRTAQd3EFv
X-Received: by 2002:a05:622a:8e01:b0:4ee:1588:6186 with SMTP id
 d75a77b69052e-4ee1588686emr42287311cf.11.1763386776954; 
 Mon, 17 Nov 2025 05:39:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGT8ylpMPqKnQUlh0IndGHgSMmDdm1g/UFqOcl+Eqo38NWcx4OZT9FwONF6B4ZL7MlT4U9B4w==
X-Received: by 2002:a05:622a:8e01:b0:4ee:1588:6186 with SMTP id
 d75a77b69052e-4ee1588686emr42286991cf.11.1763386776246; 
 Mon, 17 Nov 2025 05:39:36 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6433a3d6f5bsm10176335a12.6.2025.11.17.05.39.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Nov 2025 05:39:35 -0800 (PST)
Message-ID: <d49d449b-7bbb-46fc-8e10-f04649d852f2@oss.qualcomm.com>
Date: Mon, 17 Nov 2025 14:39:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/dpu: disable gamma correction unit on SC7180
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Federico Amedeo Izzo <federico@izzo.pro>
References: <20251115-dpu-fix-gc-v1-1-0a4fd718208d@oss.qualcomm.com>
 <6457c60a-2ede-4df8-ad82-d974690eba89@oss.qualcomm.com>
 <CAO9ioeUfZQVy7VFUp8FEVHN2_uL0ZB9jbkuexWY4D12YN_O3Jw@mail.gmail.com>
 <8541a10d-99ca-43d2-bafa-8e33bba01382@oss.qualcomm.com>
 <CAO9ioeVT_1qGedvdACkE4pqbsP8VReeArbe=-zaH-SHfhi3pkQ@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAO9ioeVT_1qGedvdACkE4pqbsP8VReeArbe=-zaH-SHfhi3pkQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 0XIalhAa2HhC8YWRigL1pUPlTfNmHTPK
X-Authority-Analysis: v=2.4 cv=EIELElZC c=1 sm=1 tr=0 ts=691b2599 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8
 a=emW-11kZ4ehC4T1iGCQA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: 0XIalhAa2HhC8YWRigL1pUPlTfNmHTPK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDExNSBTYWx0ZWRfX42bJV6Jk/FmS
 J4AF+DsBtasD67u0du0DeeTPteldwCrpjN/fz0loUMAuMLymyI4AjKGK9o8OAddXqvNCcpfiPWQ
 JM+pCn6D9qEnjsD7oZFyLoSUJMzkicDGulVeBm011KUmrNfXpvFIjZIPE2Eazk/aSB52y/BMaz2
 y+kjcKlPSWlFheP/TzYZ2KGUxs/vttFwMHFiXgb9xUeloq/easl/fs9MQGYxMWowT4S3oF52vTW
 pk/DuPI+XydirdtXox6/4m2W1qlp3TiITlb03ESt//KhLHiz22vJcKvfXsEhvawit5qvGuBacRr
 4SgJYVuNR1aiu4NkAiqq7ggPUUgbQXDoTGJpvRcT26Vuj1r1MPb4Bk9DIqF1/bYpypuUMvTbORP
 QUgglEHReGTxWoC01sZOE0w2nHhqfw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 impostorscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170115
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

On 11/17/25 2:16 PM, Dmitry Baryshkov wrote:
> On Mon, 17 Nov 2025 at 14:10, Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 11/17/25 12:51 PM, Dmitry Baryshkov wrote:
>>> On Mon, 17 Nov 2025 at 13:25, Konrad Dybcio
>>> <konrad.dybcio@oss.qualcomm.com> wrote:
>>>>
>>>> On 11/15/25 4:08 AM, Dmitry Baryshkov wrote:
>>>>> IGT reported test failures with Gamma correction block on SC7180.
>>>>> Disable GC subblock on SC7180 until we trage the issue.
>>>>>
>>>>> Cc: Federico Amedeo Izzo <federico@izzo.pro>
>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>>> ---
>>>>> Most likely I will squash this into the GC patch
>>>>> ---
>>>>
>>>> Peeking at downstream, 7180 and 845 should have the exact same GC
>>>> (v1.8).. it seems like there's an attempt to program it through
>>>> REGDMA instead of regular reg access. Not sure if it's actually
>>>> necessary or just an optimization
>>>
>>> I think it's mostly an optimization.
>>>
>>>> What tests are exactly failing? I couldn't track it down on FDO GL
>>>
>>> See [1] and other failed SC7180 jobs from the same pipeline. I haven't
>>> triaged it yet, but I assume this might be related to platform
>>> resources (it has only 2 LM blocks and only 1 DSPP).
>>> Another possibility is that maybe we need higher CFG bus bandwidth
>>> when writing LUT registers.
>>>
>>> [1] https://gitlab.freedesktop.org/drm/msm/-/jobs/87878393
>>
>> igt.kms_color@gamma.log fails, we get an ENAVAIL (-119) (which doesn't
>> seem like a good return value for this error but anyway..), dmesg says
>>
>> 05:42:13.199: [   75.472174] [drm:_dpu_rm_check_lm_and_get_connected_blks] [dpu error]failed to get dspp on lm 0
>> 05:42:13.199: [   75.481487] [drm:_dpu_rm_make_reservation] [dpu error]unable to find appropriate mixers
>> 05:42:13.199: [   75.490235] [drm:dpu_rm_reserve] [dpu error]failed to reserve hw resources: -119
>>
>> which comes from:
>>
>> idx = lm_cfg->dspp - DSPP_0;
>> if (idx < 0 || idx >= ARRAY_SIZE(rm->dspp_blks)) {
>>         // misleading error message, it's not LM%d, but DSPP%d
>>         DPU_ERROR("failed to get dspp on lm %d\n", lm_cfg->dspp);
>>         return false;
>> }
>>
>> which comes from:
>>
>> static const struct dpu_lm_cfg sc7180_lm[] = {
>>         {
>>                 .name = "lm_0", .id = LM_0,
>>                 .base = 0x44000, .len = 0x320,
>>                 .features = MIXER_MSM8998_MASK,
>>                 .sblk = &sc7180_lm_sblk,
>>                 .lm_pair = LM_1,
>>                 .pingpong = PINGPONG_0,
>>                 .dspp = DSPP_0,
>>         }, {
>>                 .name = "lm_1", .id = LM_1,
>>                 .base = 0x45000, .len = 0x320,
>>                 .features = MIXER_MSM8998_MASK,
>>                 .sblk = &sc7180_lm_sblk,
>>                 .lm_pair = LM_0,
>>                 .pingpong = PINGPONG_1,
>>                 // no dspp here, errors out
>>         },
>> };
>>
>> would simply binding .dspp = DSPP_0 to the other one just work here?
> 
> Only LM_0 can use DSPP_0, that part is not flexible.

OK that makes sense

> 
>> Also, would that mean we can only have gamma control on a single active
>> LM at a time?
> 
> We can only control gamma on LM_0 on this platform.
> 
> BTW, the other log is more interesting:
> 
> [3] https://gitlab.freedesktop.org/drm/msm/-/jobs/87895515/viewer

I wonder if we need to take a closer look at this hunk:

/* Disable 8-bit rounding mode */
gc_lut->flags = 0;

also, IGT tests XRGB8888 - any chance the X is getting mistakenly
(un)modified?

Konrad
