Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5AAAB1B23
	for <lists+freedreno@lfdr.de>; Fri,  9 May 2025 19:00:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE88F10E2D8;
	Fri,  9 May 2025 17:00:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="XY/8Tn/a";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6779710EAC5
 for <freedreno@lists.freedesktop.org>; Fri,  9 May 2025 17:00:45 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 549D0EBN009418
 for <freedreno@lists.freedesktop.org>; Fri, 9 May 2025 17:00:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 sZCclbDtuXk9uHIUI669lCG2hQrQh9WYUvwIrH+clp8=; b=XY/8Tn/aYV3Ofq9X
 WU3p+L4S1yA/xRIs9s4IGEGI1zc2TqjVJklhJVqHWjz90ZD0pMoaMJ/AuMpSlHC1
 t7fiLaM/ROGzxy1Kub/YFNvAQu8hNrBsP0rWud4eTvd98K/zllLMeuG1tb8c/jz+
 5f0zJOUBlSgp4AnKtK0JefzmrFZqmqd64dBEu0Lo1gHLOWiLgxClV3ZteRS7zlMm
 qedj9JXW2FFrfcq4OIM9N17NT3N6YQJXf/qAxeycLGTfcYbwP9KvBxk6yH9Xk6fc
 cF758Lbgyohafe3vhgaYCEaUuPSAtpbA+YdVOH0syJ6p97ZBoGojP0CuNBMFQ48y
 wJ1QoA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnpew6tn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 09 May 2025 17:00:44 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c5af539464so60395185a.0
 for <freedreno@lists.freedesktop.org>; Fri, 09 May 2025 10:00:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746810043; x=1747414843;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sZCclbDtuXk9uHIUI669lCG2hQrQh9WYUvwIrH+clp8=;
 b=H29uWrO3MKI43xjmwMwjF2GtxKbc223MntxzcA+SuKyRZOd+VKoXLBOoXlLge6nXJS
 QUtSIWSWjrG6ETrNP+gSycSYfcIopFNA7xkjD1/7AS6Rl4mDjHbT5Goh/+EazcIDZ3vv
 by7xJfxtsf9JrZlsC2+sfGGOFnPhPkhcev8BB+OuXNhnZAOkt0y+s1+PBPOcgau/Ak5n
 zEtWGiBCoKhzLOMAcMXBEYd873AFl88bF7OlqV7pVmSgYQ/lxfoZSPdBqZyOT1wujGCu
 ZqBWxhw+Beqejqi3Wfe74TKnSU37TGCTnFQHwZTo8FO4EveKKrZNZswFPitR3J8KoAUo
 sIbQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6IiC8FAXWj6Ra1w/+SVcCgNDAtqG04DOcX3RjzRzxBAmh+LMaupv1MdPypXfc1CSql2JFV7VDBJU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz1w4jQBnATpm7XPbKf9X9Jsct7yFrqenZNlO0iytfSscnMano6
 8hhi6EWLBaHJ+bF6Ekw7qai9GwcCVq9PvBLVd6XtrJgw/ZMTYVI80E4An1v5fwt0tWaKKTnrQYt
 HpEP8GhROx4eEJNUCxIgouYrCjUZK0KXqD52817xMy8XQ1u3kyU8mBgUomLOwxZRzBS4=
X-Gm-Gg: ASbGncsXqMbS8iGtBnlJT51I9aMbd7w9hA35OWbpogn1BfGOWb4dR+FK5a2/pm11uzJ
 +awU7vGZvdtvTLtB3UyvjuPHNxUVQII/P84gtxHHvf1bndDw5UYMu9l9EoggkG1gzH35+OMes8l
 zrIMFaNjx1HqgpfGP4JMuuhq2L6qdvaO0GjjNMShPEcxe/6fgCUBFJAfGY8vjoRbLqtF+xUMf9b
 tnrkhLC+TX5AqmYPjagIjWuLlVX7PBlacMu1JyY8gtBG5tnFVNRE6y0EiTSwkRRfzkii+eGVims
 Nx/0LdRa+F+qEhuv6cEJCwclHwcaz/XURjZrKGrAquk/MIlUpnSvuXYe8i29j8s3eOw=
X-Received: by 2002:a05:620a:1708:b0:7ca:e392:2a1b with SMTP id
 af79cd13be357-7cd01284a67mr256687985a.10.1746810043209; 
 Fri, 09 May 2025 10:00:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFsdbLUhxiiEOyjW3uhYLvePup2YHDZuESeQh4lqLxFOX19Wsqo/GBeavRtbTUa5Ayco/hoSg==
X-Received: by 2002:a05:620a:1708:b0:7ca:e392:2a1b with SMTP id
 af79cd13be357-7cd01284a67mr256684485a.10.1746810042578; 
 Fri, 09 May 2025 10:00:42 -0700 (PDT)
Received: from [192.168.65.105] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad2192c8b8asm177791466b.5.2025.05.09.10.00.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 May 2025 10:00:42 -0700 (PDT)
Message-ID: <b7bd0f7a-854b-4464-abd6-51f932ee2998@oss.qualcomm.com>
Date: Fri, 9 May 2025 19:00:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT 04/14] drm/msm/a6xx: Get a handle to the common UBWC
 config
To: Rob Clark <robdclark@gmail.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
References: <20250508-topic-ubwc_central-v1-0-035c4c5cbe50@oss.qualcomm.com>
 <20250508-topic-ubwc_central-v1-4-035c4c5cbe50@oss.qualcomm.com>
 <CAF6AEGtcoMZ+WiW5_BA4NFpLZsoOrDbkY4xyvENGoS2FQVwQxw@mail.gmail.com>
 <5c3d3682-8378-486d-8af1-4b884b81f3d0@oss.qualcomm.com>
 <CAF6AEGvmEP4oGytfsCHYDCtOUDYq68y=vS7fu0jzP+=oajeq9g@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAF6AEGvmEP4oGytfsCHYDCtOUDYq68y=vS7fu0jzP+=oajeq9g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDE2OCBTYWx0ZWRfX849hYRxJqXqd
 CmK93aUbBYHo7q0f7CVq0qpT/sqmHj/zfJQA6nXbiIQajvnDAA2BDiob6t/U2fZxoKJp9bjjTwN
 +t9Ws4mwvWTZKp2zX7lHvnTugE8CenFe+PhCUuzaVLz7K3UJX02/wlf5BpmEOfOs+luvzSefHSg
 1D7jbl8RuTQCzOXO2n5FICi177fSF+EffD8LbvzDYIaDdA13+3zA0rie8Orst8hL5VynzTpRV9/
 dYTMCpJrc2vXwb9BPiyW+Jzz9MMxkvrFyT3DNq07xQ0843/dJdqARFVEu7jEyj04HR1H2vZ69g1
 iQIQ1hysco1XPt8puyeaE77KwpEdNxVxs3jm1T9GTBflSz4d/Dkzqk8IGQs4OaAJLf8vxsGwS3T
 GebkNTcCdHEFqMl80BViPVTcYBY3Ag8fQbVIu/JD/nLnB1SvoyHjsyzf3XMXBRFbSLvqO16p
X-Proofpoint-ORIG-GUID: bd71Ja-ZNC5CnUQ3OBj9SOmmRsOrMPQN
X-Proofpoint-GUID: bd71Ja-ZNC5CnUQ3OBj9SOmmRsOrMPQN
X-Authority-Analysis: v=2.4 cv=Yt4PR5YX c=1 sm=1 tr=0 ts=681e34bc cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=Z4pxUwbP9fZFGfhsnTMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_06,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0 adultscore=0 spamscore=0 impostorscore=0
 phishscore=0 lowpriorityscore=0 mlxlogscore=999 suspectscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505090168
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

On 5/9/25 3:52 PM, Rob Clark wrote:
> On Fri, May 9, 2025 at 5:31 AM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 5/8/25 8:41 PM, Rob Clark wrote:
>>> On Thu, May 8, 2025 at 11:13 AM Konrad Dybcio <konradybcio@kernel.org> wrote:
>>>>
>>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>
>>>> Start the great despaghettification by getting a pointer to the common
>>>> UBWC configuration, which houses e.g. UBWC versions that we need to
>>>> make decisions.
>>>>
>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>> ---
>>>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 16 ++++++++++++++--
>>>>  drivers/gpu/drm/msm/adreno/adreno_gpu.c |  6 ++++++
>>>>  drivers/gpu/drm/msm/adreno/adreno_gpu.h |  3 +++
>>>>  3 files changed, 23 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>> index b161b5cd991fc645dfcd69754b82be9691775ffe..89eb725f0950f3679d6214366cfbd22d5bcf4bc7 100644
>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>> @@ -585,8 +585,13 @@ static void a6xx_set_cp_protect(struct msm_gpu *gpu)
>>>>         gpu_write(gpu, REG_A6XX_CP_PROTECT(protect->count_max - 1), protect->regs[i]);
>>>>  }
>>>>
>>>> -static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
>>>> +static int a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
>>>>  {
>>>> +       /* Inherit the common config and make some necessary fixups */
>>>> +       gpu->common_ubwc_cfg = qcom_ubwc_config_get_data();
>>>
>>> This does look a bit funny given the devm_kzalloc() below.. I guess
>>> just so that the ptr is never NULL?
>>
>> Yeah, would you prefer this is changed?
> 
> I think having an all zeros ubwc cfg isn't really going to work
> anyways, so probably drop the kzalloc().  Or if there is a case that
> I'm not thinking of offhand where it makes sense to have an all 0's
> cfg, then add a comment to avoid future head scratching, since
> otherwise it looks like a bug to be fixed.

So my own lack of comments bit me.

Without the allocation this will fall apart badly..
I added this hunk:

---------------------
/* Inherit the common config and make some necessary fixups */
common_cfg = if (IS_ERR(common_cfg))
	return ERR_PTR(-EINVAL);

*adreno_gpu->ubwc_config = *common_cfg;
---------------------

to get the common data but take away the const qualifier.. because
we still override some HBB values and we can't yet fully trust the
common config, as the smem getter is not yet plumbed up.

I can add a commit discarding all the HBB overrides (matching or not)
or we can keep the zeroalloc around for some time (i'd rather keep
the function returning const so that when things are ready nobody gets
to poke at the source of *truth*)

Konrad
