Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9EAB9C8DEF
	for <lists+freedreno@lfdr.de>; Thu, 14 Nov 2024 16:27:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95B9110E7FD;
	Thu, 14 Nov 2024 15:27:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="QLaNurCU";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67F4E10E7FE
 for <freedreno@lists.freedesktop.org>; Thu, 14 Nov 2024 15:27:31 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AEA1mTg031583
 for <freedreno@lists.freedesktop.org>; Thu, 14 Nov 2024 15:27:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 mqwK68QV7anZkYzbtQsmbmF65JaW6sNQSHhAt7zMFpk=; b=QLaNurCUlcur9Jdd
 kfj4Le3TFv3IHYqfS+72nDuDb0Vn8O7uf9HCC4ZUEwQ0lWXe80Y/k5JTWYMbxl4b
 7WH/6Sn4DZchxSNXPN06oEub2M2kTfSR5QRhc/BGNpcCrZlVR4OxYbAbMB3dIjqr
 Da088Qb2fHc129+yi2OSA2WZLPRWcqb4IwU7eq1gas/NvylcQTdFdMKpU2fcwyoY
 aZN6AW8pZli2VIBe0MHYN7GqvBXqjQFIhAvKpdAU/gyvsYw8nv1tpHDgL821dz/U
 /6DfmslTL1w0FgnmhC9ldRAsayfR9+wCIcJz1rPKyzyFlc8GL/sUG32Hn/2CUWEh
 D6yZZA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42w66gu7tb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 14 Nov 2024 15:27:30 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-460abcbba38so420681cf.2
 for <freedreno@lists.freedesktop.org>; Thu, 14 Nov 2024 07:27:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731598049; x=1732202849;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mqwK68QV7anZkYzbtQsmbmF65JaW6sNQSHhAt7zMFpk=;
 b=uk/K5cIRdrrnj/rPdWOMBI6sN7UhvRLWeqAc8s9BP37CY3q7WL6pk9PL0qwXsN8tVm
 38WpwpNaeXBKk2+T5iu6rSnDNAumPWZJaDi0zCHIBade385YwghasLQg7Fvd2nHduLzZ
 pkwjjDrUf8yKQ7JsMhFkNPB/lj984yOmXqbZ4pu3mbHpuMWgvIGu43BfrQI1tN1ZMmF/
 hwq12sWIUzpg4PUMHEeeTr2iJE2MDwAbA72WCjeoE+pT4UUSocY3pGThtrbF4hd9LyEg
 zVDXMzbaby2dHN8lH7WETXBQ/3yqGVGhQSfJkRKCI4qRc6Yo/TMcTPVWev7QJA+0jvpH
 cixw==
X-Forwarded-Encrypted: i=1;
 AJvYcCULPe8nwlJm+lSIAu5O5wXJ8d0O1KnbetTDUQBoIrUUgmipchWE40JPp0yzTc3p4QBqUlXWRSDfTNA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy8Vwi/r5kajrcitftAs1iMEQvxNjwqiLJt00aZjWl1ccA4St87
 u3CMJrapSBz7emKxFBezjpG9LLCKkiBTvn4zkpZVqmGi7a51JTYTIhAnjZGQFrNDNQP64Lde239
 ZdNR/bxpNeiGGQcJ/h86Nucd5niCXUUS16qJijRX/0HxfGz3FgyM0UiRpLxE8qHcdDv4=
X-Received: by 2002:ac8:58ce:0:b0:460:bb96:dd02 with SMTP id
 d75a77b69052e-46309316034mr164398591cf.2.1731598049393; 
 Thu, 14 Nov 2024 07:27:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHSfzrBG+lhdGHrTTXrH4knwlu1OmK8TQfwcDQEvioxl9razUvy4nRX1r6cZkneejShWoIBYQ==
X-Received: by 2002:ac8:58ce:0:b0:460:bb96:dd02 with SMTP id
 d75a77b69052e-46309316034mr164397861cf.2.1731598047583; 
 Thu, 14 Nov 2024 07:27:27 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cf79c1e3d1sm656722a12.89.2024.11.14.07.27.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Nov 2024 07:27:27 -0800 (PST)
Message-ID: <9d690e39-2bda-4f5a-b7a5-2c9cf90a8065@oss.qualcomm.com>
Date: Thu, 14 Nov 2024 16:27:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/msm/adreno: Setup SMMU aparture for
 per-process page table
To: Akhil P Oommen <quic_akhilpo@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
References: <20241110-adreno-smmu-aparture-v2-0-9b1fb2ee41d4@oss.qualcomm.com>
 <20241110-adreno-smmu-aparture-v2-2-9b1fb2ee41d4@oss.qualcomm.com>
 <CAF6AEGvD95RyUXDBjgmoefgO6QyeRw3tpa7EG1MLFKdxcoZ-4g@mail.gmail.com>
 <5a959c08-cc90-4a05-88b2-e1ee666561e2@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <5a959c08-cc90-4a05-88b2-e1ee666561e2@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: m_kHVEwVdDVSSGX6Ib_IFi4r0CVDmwYY
X-Proofpoint-ORIG-GUID: m_kHVEwVdDVSSGX6Ib_IFi4r0CVDmwYY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=999
 mlxscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411140121
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

On 12.11.2024 10:15 PM, Akhil P Oommen wrote:
> On 11/11/2024 8:38 PM, Rob Clark wrote:
>> On Sun, Nov 10, 2024 at 9:31 AM Bjorn Andersson
>> <bjorn.andersson@oss.qualcomm.com> wrote:
>>>
>>> Support for per-process page tables requires the SMMU aparture to be
>>> setup such that the GPU can make updates with the SMMU. On some targets
>>> this is done statically in firmware, on others it's expected to be
>>> requested in runtime by the driver, through a SCM call.
>>>
>>> One place where configuration is expected to be done dynamically is the
>>> QCS6490 rb3gen2.
>>>
>>> The downstream driver does this unconditioanlly on any A6xx and newer,
>>
>> nit, s/unconditioanlly/unconditionally/
>>
>>> so follow suite and make the call.
>>>
>>> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
>>
>> Reviewed-by: Rob Clark <robdclark@gmail.com>
>>
>>
>>> ---
>>>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 11 +++++++++++
>>>  1 file changed, 11 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>>> index 076be0473eb5..75f5367e73ca 100644
>>> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>>> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>>> @@ -572,8 +572,19 @@ struct drm_gem_object *adreno_fw_create_bo(struct msm_gpu *gpu,
>>>
>>>  int adreno_hw_init(struct msm_gpu *gpu)
>>>  {
> 
> SCM calls into TZ can block for a very long time (seconds). It depends
> on concurrent activities from other drivers like crypto for eg:. So we
> should not do this in the gpu wake up path.
> 
> Practically, gpu probe is the better place to do this.

Do we only have to do this once?

Do we have to redo it after CXPC?

Konrad
