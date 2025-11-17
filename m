Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C670EC63FFB
	for <lists+freedreno@lfdr.de>; Mon, 17 Nov 2025 13:10:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5B8910E38D;
	Mon, 17 Nov 2025 12:10:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="NgExG8mv";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fogqungQ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FE8410E399
 for <freedreno@lists.freedesktop.org>; Mon, 17 Nov 2025 12:10:06 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AHB5fsA3040318
 for <freedreno@lists.freedesktop.org>; Mon, 17 Nov 2025 12:10:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 4iYwG9oA1iME99ev4F64MEe7+HABQKRNZKdKfPqrzJY=; b=NgExG8mvhfViX3ZJ
 MdUNTLo1DrHc0SNn5ONL8SAh4PgSH7q5EIv4V/GhXogLZZk2aizP8sN2YaLLU7s0
 Fj+BfXIEQb3Ron61xpPL/3JdXnGZ0bZW1whWnvLboNyQrm5MhSTQgh7O0HXzjtAs
 b+TBpap7q6/qHZEXvxBephuhYr7fLwaOsPXsjWxOrAxjqUEu40JnBPsgCyptld2Y
 nabhC6kB1Da8Z5egpJeTAu8PlfUSxqz+QxY7WVxUDhaGWiC2R9S2S669WKau8oiy
 bF6By+WCswahBIMMe6udTwX+RiiOvKZAEIUl2c1c+0Wr1Wr3wggRVZXXkY21MfC3
 CVwd8A==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aejh04n3g-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 17 Nov 2025 12:10:05 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-88057e35c5bso12866056d6.3
 for <freedreno@lists.freedesktop.org>; Mon, 17 Nov 2025 04:10:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763381404; x=1763986204;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4iYwG9oA1iME99ev4F64MEe7+HABQKRNZKdKfPqrzJY=;
 b=fogqungQw/iqoAxp2xR76BNvnIlwcQcU5QnmWmxaPB4Kr5Q1JIq/AOiEgWbaDL2dhU
 CJz+bu3gIc9PcJCI7YeXPBxzQ7SqYeZZpTO79UDE+2AHUp1PFTcf2KBvy6/wc+o8lSxZ
 jGrlBAYBpfnxgieL0Q/BsF5Iyhdv8Pc0M2bFSRmbBNu5JMSaeYGchjIgLXZRHWJz54I4
 vvfCUmHtw08HUzYnf3Z9ibCcmckuLQ6eMa2qsovrhh+aMZ6YO8FK6D+JYY/WK+tfm2jZ
 lS5h6C12NwG5ht9Ggqg+Im9HtSZ6dr9vqiW90yaaHp/Uqr7SmEYGdcFc0hlcbfwQvsHS
 ALlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763381404; x=1763986204;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4iYwG9oA1iME99ev4F64MEe7+HABQKRNZKdKfPqrzJY=;
 b=RfJhL7srWa4ylT4gjCcfPE6NnQuHrz3EPDfIQIfLhAq8cWTd4X6AN/Oym1uJnzHmPC
 A4TO4dE0KWiK/h+7svVaPjsg+MHLKjBoNojY0i2aQKpBl43bZBnDeKWIn0b0kHNMzijw
 CSMna6ICS1CgYstRbKt0PI7pMGmwrSdj1+nm4ZGt3RanKpGDFPLuRTLS3/ajWEjJKmzz
 JrmKw+PPOyl0YteRgBqUBhx72SMWfaLMtQA52KGLmKaH3ulBOJVLevgtQVrnxc2AZPSv
 nPllsqoi/44g8wDqXS3VQgTs14qtPahKRkj555LRqxzsD3D3J9FiWgzGrOQrVWWlCS8n
 dNTA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMkYN6Uov6yvtiz10iqsuV2GwHBYNBfqIwQrL9o1XGx4ihDz8+y2vJIBFJW4GZx4b88EMvwcJvdQw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzZU5+PobxZwACtPsjk8KvXqp0p01z8Sb3NrOk5s0blKIBRtS1J
 aQ+yZkP19Y5e/klAPdugJkJVOsRsfS1oEnkhhKgVMkYxZMqkmnHKEbKCd6s4vii79EtvJlwXu49
 fRWzVhOVK8C1fweGhJbUDQ7ca0G8lOiyQUtX1e/WtVF2oUo7sKk3ygAaa1z8BKyKr7M4AfFA=
X-Gm-Gg: ASbGncuYJQ/nn3QuOhvgGf6fGi8XHpvSIh4OhgpOnUcs1WVAI8xnruqYBZApZlEnDno
 5vwGR/3zhOGZLWJYjf2/D2/fNPrHseJ527nOaCLSBuT+kGznjmKJqc9NZfg2I6cPHQ/tVZ11H9e
 xJ1avbhDe0GBRk74vzCsz9lwGsRV4+UeQhvp712ocZ98KG4dm39qB0XvpnNNYwfQqBQG8hkNTuv
 pH/dYudPZsrro+A4KN+WLX4ZMp5VqxqQk8EDixQmHBqYl6b/rxkVSGaLJvc+vApwaQ/nuhyYP6y
 tAXhAJizKoTGZFADkznOjrk2bjpYwq714EB/Vd+nZnuXwCrXkt8X/BiF1miW5AOihRCjgYEFpIt
 SfjoewSzGuGmjnPxPi7uq53Pa7eh0gU6ouTC42gCznhuKaof8NMDfl/9n
X-Received: by 2002:a05:622a:f:b0:4ee:1db1:a61d with SMTP id
 d75a77b69052e-4ee1db1b80cmr34880101cf.3.1763381402999; 
 Mon, 17 Nov 2025 04:10:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF+lM4RiA/uszIq5rz0kJglCgk2Y5+U6FHrUBKDfiMzHtGedL2M5TFrbseUbsKOh6X51HXKUg==
X-Received: by 2002:a05:622a:f:b0:4ee:1db1:a61d with SMTP id
 d75a77b69052e-4ee1db1b80cmr34879781cf.3.1763381402354; 
 Mon, 17 Nov 2025 04:10:02 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fb12c87sm1059268066b.31.2025.11.17.04.09.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Nov 2025 04:10:01 -0800 (PST)
Message-ID: <8541a10d-99ca-43d2-bafa-8e33bba01382@oss.qualcomm.com>
Date: Mon, 17 Nov 2025 13:09:59 +0100
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAO9ioeUfZQVy7VFUp8FEVHN2_uL0ZB9jbkuexWY4D12YN_O3Jw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=W9U1lBWk c=1 sm=1 tr=0 ts=691b109d cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8
 a=H1CbSrp5QckA0GuTRH0A:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: ncePZ_oA3LBbpWnD8eQ4MyvROqHTwgnf
X-Proofpoint-ORIG-GUID: ncePZ_oA3LBbpWnD8eQ4MyvROqHTwgnf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDEwMiBTYWx0ZWRfXz1jjImottjpH
 z7sWytSU4k0DVvwzAB8dmABcjnznCz7SuatdnsPl6l6DtHNikaL4WIvZe9N/jMocGNhuB4vQouR
 ql9ciVs0iROyl0Ite/l0wFvNEn+gSeSrheuQVeQIrXvzwOy4AEAmQdoqUuBte5RHllyRSv11UNf
 8s1bncGm/BJe9+MjOcB/wKzyPrQwf1ZN/XAmvldv86mItJKOjcgteOnoONdLBi5HtTfMdaYwSxJ
 xoZ1qqige2EXZvHm/I+WyF3VXD41IskfizBYjl/QosXvZ97pfaRS+TMWnLzg3/FN37L75OOYNwC
 6zTWMYRacCkqXZqMpgIKbEZ7cmW9/xSCG6awju3ACXQoYnOucq9QWs701VWWzEUyLaptYzmUSJ2
 aYqzUE8wz73huGrzKbLvmb2sI80ZAQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 malwarescore=0
 spamscore=0 clxscore=1015 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170102
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

On 11/17/25 12:51 PM, Dmitry Baryshkov wrote:
> On Mon, 17 Nov 2025 at 13:25, Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 11/15/25 4:08 AM, Dmitry Baryshkov wrote:
>>> IGT reported test failures with Gamma correction block on SC7180.
>>> Disable GC subblock on SC7180 until we trage the issue.
>>>
>>> Cc: Federico Amedeo Izzo <federico@izzo.pro>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> ---
>>> Most likely I will squash this into the GC patch
>>> ---
>>
>> Peeking at downstream, 7180 and 845 should have the exact same GC
>> (v1.8).. it seems like there's an attempt to program it through
>> REGDMA instead of regular reg access. Not sure if it's actually
>> necessary or just an optimization
> 
> I think it's mostly an optimization.
> 
>> What tests are exactly failing? I couldn't track it down on FDO GL
> 
> See [1] and other failed SC7180 jobs from the same pipeline. I haven't
> triaged it yet, but I assume this might be related to platform
> resources (it has only 2 LM blocks and only 1 DSPP).
> Another possibility is that maybe we need higher CFG bus bandwidth
> when writing LUT registers.
> 
> [1] https://gitlab.freedesktop.org/drm/msm/-/jobs/87878393

igt.kms_color@gamma.log fails, we get an ENAVAIL (-119) (which doesn't
seem like a good return value for this error but anyway..), dmesg says

05:42:13.199: [   75.472174] [drm:_dpu_rm_check_lm_and_get_connected_blks] [dpu error]failed to get dspp on lm 0
05:42:13.199: [   75.481487] [drm:_dpu_rm_make_reservation] [dpu error]unable to find appropriate mixers
05:42:13.199: [   75.490235] [drm:dpu_rm_reserve] [dpu error]failed to reserve hw resources: -119

which comes from:

idx = lm_cfg->dspp - DSPP_0;
if (idx < 0 || idx >= ARRAY_SIZE(rm->dspp_blks)) {
	// misleading error message, it's not LM%d, but DSPP%d
	DPU_ERROR("failed to get dspp on lm %d\n", lm_cfg->dspp);
	return false;
}

which comes from:

static const struct dpu_lm_cfg sc7180_lm[] = {
        {
                .name = "lm_0", .id = LM_0,
                .base = 0x44000, .len = 0x320,
                .features = MIXER_MSM8998_MASK,
                .sblk = &sc7180_lm_sblk,
                .lm_pair = LM_1,
                .pingpong = PINGPONG_0,
                .dspp = DSPP_0,
        }, {
                .name = "lm_1", .id = LM_1,
                .base = 0x45000, .len = 0x320,
                .features = MIXER_MSM8998_MASK,
                .sblk = &sc7180_lm_sblk,
                .lm_pair = LM_0,
                .pingpong = PINGPONG_1,
		// no dspp here, errors out
        },
};

would simply binding .dspp = DSPP_0 to the other one just work here?

Also, would that mean we can only have gamma control on a single active
LM at a time?

Konrad
