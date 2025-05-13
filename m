Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF299AB5F21
	for <lists+freedreno@lfdr.de>; Wed, 14 May 2025 00:11:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96CDF10E5F9;
	Tue, 13 May 2025 22:11:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="iG2fw2id";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 119ED10E5F9
 for <freedreno@lists.freedesktop.org>; Tue, 13 May 2025 22:11:46 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54DIbJKj010483
 for <freedreno@lists.freedesktop.org>; Tue, 13 May 2025 22:11:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 QuIBju/bfcvSH9aFOhrzW1870PZVgl8/kD81ju5wzh0=; b=iG2fw2id1IOkZA8h
 0hE7DbARmiWn1fxBv7lVsNAyIs2h4byXpCjOv4iY1EulQUx7Wag1PWcWvG+cOvGU
 c1dEP/iWCX+f0lWyRSXFIyU1pa42b8qDVUUACMtv4sWV73WSyGtjjcagZja9Twvd
 S72J/I8I7PDtnFoHrS3jDn4MKAgYpc+DLYiCU+K0JqrjvALXWi0FOrCcqi4xBUJH
 1naxbwIboeUDfr5c2tkdW1Xueb6AtDAfpNgD8QFXK7Zl2/5Kwdbdqk/jgKO1nofU
 tyreaLGfOU28Pztf4PSlDFJI+em2Kx8ehw76rOvlbpSPLx49CYuBvEBl48gRqY/1
 rm4nIQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcnrjt2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 13 May 2025 22:11:26 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6f2c8929757so16858236d6.3
 for <freedreno@lists.freedesktop.org>; Tue, 13 May 2025 15:11:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747174285; x=1747779085;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QuIBju/bfcvSH9aFOhrzW1870PZVgl8/kD81ju5wzh0=;
 b=Wezka+G4Ah7Y5m/J0/riG3OdXHA7zB3BgoCnV5/7wlpEf/uzX+GZsRBF8p0KidDdLj
 4RV8B69pP9n9j47R/gUmX82be7hyNcjlacPJr8Fwt8IPANojCDmz3WqoY7qg1a5DpIbx
 Mbv8hVThhFBwVmDiWh5NX50lW9rSEbDcb4ptHUmP6W5D7fU/j+AGcZdV8zCzIhw8Q4mm
 m0zmHWCCMsPq1wIIIXXPSCFpnpKDEmGvaPeNYCSNV6m8G+u0hR8ejWYGgCdxE4AFf02G
 WG1wY9oYf4VmryB+jy0QEO3GV4NlsgluVj/ADeqc5KkYdb3FBsqBvjDriiRS9Oq4URiT
 KJcg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1x5iCUdoqp4YloP5EBLMewVBmF59WZ6zSwL5ttiSIwPMtv0d5Ad5k/91uPR/kzmLY+KQGqRn3IKg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzcNa2QqXMCmqDWiSvcsctIBbA+1TeO3hYA37bZt/lPhbxcybKs
 8Mm6Vq57k8Jrj7QAwWW1VVVjEC8HnaXYMN+oJbK82WBrH8n9AO7rJqD1A+3sEC7N1j37WUw6Z+a
 t7CDYQ7MOW5oZYvokCYVWPSRe553wv0OE29UdySSt34niYAhy92MPf6vLbqybXfWkcCs=
X-Gm-Gg: ASbGncvTbtvnyVNhOrmoaaDvYbknqbo2dIYkkMH4rZpTdprk50H7P8BswFK/7A2d7Px
 LViHdCyD+86koUN6xNM4rU3qQwwa0wy5948iwk/yYPIdY2V4FnJKGwn6ZQ8mthe73ySoAPnJNmY
 dGjM1Io1SQOgIDScMs2VgZ/1mOyIKAL08RmBQp3nAMsvDOvWC5aKut4Ek6v3N7Z9slJotcKeeo8
 zAOoZVqf1ZAVtfApAUYQBZjymYXN8hi/J7k/gNRSm+Wt2KtNdC5rG2NIauWydsUeW37EoWkV1R0
 KGzqehJ5s2CHYyp4moWO85Xud0F11xQIvKzUFBa/xkdlVQ9M7TU4KzCPzPPFsZoJTg==
X-Received: by 2002:a05:620a:4902:b0:7cd:2992:1fb7 with SMTP id
 af79cd13be357-7cd2992200fmr24750285a.1.1747174285171; 
 Tue, 13 May 2025 15:11:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEoxVDAJLBl9VwPhZr5BfNm1jaShPv13zbF6MvwOx2I5M4qz0J8tyiQARWXPmbeg+uDu4tdyQ==
X-Received: by 2002:a05:620a:4902:b0:7cd:2992:1fb7 with SMTP id
 af79cd13be357-7cd2992200fmr24747885a.1.1747174284714; 
 Tue, 13 May 2025 15:11:24 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad24677c9e1sm511489866b.88.2025.05.13.15.11.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 May 2025 15:11:24 -0700 (PDT)
Message-ID: <fd7747c5-1e16-400c-95c5-e1209f58352b@oss.qualcomm.com>
Date: Wed, 14 May 2025 00:11:21 +0200
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
 <b7bd0f7a-854b-4464-abd6-51f932ee2998@oss.qualcomm.com>
 <CAF6AEGuDBdmyS+N4pR3gEYz0mSLkKqYZjCASk8am2atdGKq5UA@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAF6AEGuDBdmyS+N4pR3gEYz0mSLkKqYZjCASk8am2atdGKq5UA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: cOv-TCKX8xXXMfqXoCbuK_kxAJt-l9jK
X-Authority-Analysis: v=2.4 cv=D8dHKuRj c=1 sm=1 tr=0 ts=6823c3a1 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=oFLY9Wx-2Yq6dO1YmhEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEzMDIxMCBTYWx0ZWRfX9z+F9m3pW4XH
 gG95AF/6Wc/Sn9ynD7TvPEeLevuY2w0tWmorJifoYv0tRa4MA1jlqdaC6TSsAYSHti0eUHlaAwl
 UHS3Z0e8QaxYMih+wyUR5TW1Wu9egj6dgckCknwa/GGWmRhltXBktCEYQU/GuziSiYacqaptlTz
 3SUcSgRySOP4o1XCFidMYN58FlNryJ6zA/NmI29Kp6sEx2Q2A5QaBl5MuD/0I6Qe/ur8DeSyCbW
 J0nsJKnflzZGIApoLoMx1IUcnNST8hO/WUHIrxrcBOQe1zsKcLVsubJS0ovE6qAB9/oq4F43Y5D
 Nhcvu0vG5vu3tHsDomzhNG37Mo7e1vxTvZnlBtxg9Gi+iH3yYCkX30jZmA27heS1le9ayh+Fy4+
 lJSqhwT9o6WTXTa7/0S5NAFyKdZK+mrt/gJFf1pJ0R/RWnQ2TBeWmfBn7kPJgX/sZL2xEOb5
X-Proofpoint-GUID: cOv-TCKX8xXXMfqXoCbuK_kxAJt-l9jK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-13_03,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 spamscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 malwarescore=0 mlxscore=0 adultscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505130210
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

On 5/14/25 12:06 AM, Rob Clark wrote:
> On Fri, May 9, 2025 at 10:00 AM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 5/9/25 3:52 PM, Rob Clark wrote:
>>> On Fri, May 9, 2025 at 5:31 AM Konrad Dybcio
>>> <konrad.dybcio@oss.qualcomm.com> wrote:
>>>>
>>>> On 5/8/25 8:41 PM, Rob Clark wrote:
>>>>> On Thu, May 8, 2025 at 11:13 AM Konrad Dybcio <konradybcio@kernel.org> wrote:
>>>>>>
>>>>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>>>
>>>>>> Start the great despaghettification by getting a pointer to the common
>>>>>> UBWC configuration, which houses e.g. UBWC versions that we need to
>>>>>> make decisions.
>>>>>>
>>>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>>> ---
>>>>>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 16 ++++++++++++++--
>>>>>>  drivers/gpu/drm/msm/adreno/adreno_gpu.c |  6 ++++++
>>>>>>  drivers/gpu/drm/msm/adreno/adreno_gpu.h |  3 +++
>>>>>>  3 files changed, 23 insertions(+), 2 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>>>> index b161b5cd991fc645dfcd69754b82be9691775ffe..89eb725f0950f3679d6214366cfbd22d5bcf4bc7 100644
>>>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>>>> @@ -585,8 +585,13 @@ static void a6xx_set_cp_protect(struct msm_gpu *gpu)
>>>>>>         gpu_write(gpu, REG_A6XX_CP_PROTECT(protect->count_max - 1), protect->regs[i]);
>>>>>>  }
>>>>>>
>>>>>> -static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
>>>>>> +static int a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
>>>>>>  {
>>>>>> +       /* Inherit the common config and make some necessary fixups */
>>>>>> +       gpu->common_ubwc_cfg = qcom_ubwc_config_get_data();
>>>>>
>>>>> This does look a bit funny given the devm_kzalloc() below.. I guess
>>>>> just so that the ptr is never NULL?
>>>>
>>>> Yeah, would you prefer this is changed?
>>>
>>> I think having an all zeros ubwc cfg isn't really going to work
>>> anyways, so probably drop the kzalloc().  Or if there is a case that
>>> I'm not thinking of offhand where it makes sense to have an all 0's
>>> cfg, then add a comment to avoid future head scratching, since
>>> otherwise it looks like a bug to be fixed.
>>
>> So my own lack of comments bit me.
>>
>> Without the allocation this will fall apart badly..
>> I added this hunk:
>>
>> ---------------------
>> /* Inherit the common config and make some necessary fixups */
>> common_cfg = if (IS_ERR(common_cfg))
>>         return ERR_PTR(-EINVAL);
>>
>> *adreno_gpu->ubwc_config = *common_cfg;
>> ---------------------
>>
>> to get the common data but take away the const qualifier.. because
>> we still override some HBB values and we can't yet fully trust the
>> common config, as the smem getter is not yet plumbed up.
> 
> So I get that common_ubwc_cfg is the const thing without fixups (and
> agree that it should say const), and ubwc_config is the fixed up
> thing.  But don't see how that necessitates the zeroalloc.  Couldn't
> you just:
> 
> 
>   if (!IS_ERR_OR_NULL(adreno_gpu->common_ubwc_cfg)
>     adreno_gpu->ubwc_config = *adreno_gpu->common_ubwc_cfg;

Aaaah I read into what me-a-week-ago thought and realized I did that so
that I can still make overrides in a5xx_gpu.c (where this data is
*always* hardcoded up until now) - I can simply squash the last patch
with this one and we should be gtg without the zeroalloc

>> I can add a commit discarding all the HBB overrides (matching or not)
>> or we can keep the zeroalloc around for some time (i'd rather keep
>> the function returning const so that when things are ready nobody gets
>> to poke at the source of *truth*)
> 
> We can keep the overrides to start (although the goal should be to
> remove them).. but qcom_ubwc_config_get_data() not finding anything
> seems like more or less a fatal condition.

Indeed

Konrad
