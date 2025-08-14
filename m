Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEDD4B26CA4
	for <lists+freedreno@lfdr.de>; Thu, 14 Aug 2025 18:38:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E56910E8B9;
	Thu, 14 Aug 2025 16:38:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="DgD3YFgW";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A780910E8B9
 for <freedreno@lists.freedesktop.org>; Thu, 14 Aug 2025 16:38:34 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57E9bK8F023968
 for <freedreno@lists.freedesktop.org>; Thu, 14 Aug 2025 16:38:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 jaTQfIJ1yVIsO9S61XfkZRmWT+mBRLlhDRy6dXJpoxk=; b=DgD3YFgWJFQFRh1m
 hGf1+FIo04Co6vUTW+fhtdIbSuyhnAGxW33sLBlzoDM7UglZcHUvJOG9+3DmxE9/
 8WKWrvmWg60Q17oFHxtnY9Wvqm98uZnTDd7/IFscWIwC9Mv67pqmfNKMocrL1MhT
 DDSFiZAOLvv3nPg/OMRJJlVqaHhOLZ0XC09/Z1WrWrXdQPb8h6T+9XxKkOBl71s5
 ASLQPsYfyMZdbGIeGJSyy/5Ksc7dvyNsatzr6cRVqr3hJ6ZeSvn2ndrWF1uEUh6p
 O27e9tRl4i/oTTApczcM1e3J4c33c/iw+/GXyK5F45RmtpAaTIrXOLmatCmftUUN
 V82GWQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48gr9rw39d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 14 Aug 2025 16:38:33 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-321cfa79cb3so2089103a91.1
 for <freedreno@lists.freedesktop.org>; Thu, 14 Aug 2025 09:38:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755189513; x=1755794313;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jaTQfIJ1yVIsO9S61XfkZRmWT+mBRLlhDRy6dXJpoxk=;
 b=ZTsERuLDadsLwcGKy3DEn7Ey0Otwo6F4f9up4Ioki6pdQnh9ksMXAEmOKbfnCxcnHq
 28InVMfd8UDOARlb4URvpd/e+MmsIF9PM9vQmq3tsIwEnWGYOQBHHJPMzGpCVnGlnac3
 NjsrA5OVEsTtLwIQO0GHnFZEGxQXNvPuiWq1DIIVHL4+HN+r4V9yDKSK+ujmiS9i2i7K
 t3VRHEUuAzONyGv3stmDGM/R702LynWH0IY72YUhuGhMII4Ht6YiFqaWmz+Nf+G8r7S3
 xd8t1bSp2UEn5HQc/nscy6FrWQ4Ow7RMPBbRDdCRpBzefmbpfVKv1TAz4BbXB9voy1TZ
 VfsQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmbt19jJlpGxbHuQq5fLFTPIeJrlyWQTuixVG/eKzXf8RaaPMk3U8B6MDIvkppiqr6D98BZ21QNOw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxDwkaVw5IcA/6vIh2LCDCOyPFvDV+rV0eppdgz/MiFzLBU9pE6
 Aa4BAFv8hZnNY2A5qadZ4mv7+Yb6bDd6JMWlR9rFBIl5lUB9AoarrNbmumvPFjn+nUpJ1dPAK+F
 woXkd31T1j8mrq4/s3XvunsjjSRNQrFsm9J6DXP8j8v/p8KyzQ8g++zx+gESyL50xq+hBD2A=
X-Gm-Gg: ASbGncuO+h2bncykSidMunJw/0HBcJw+CY/qBCYnMBDvHU3ZWXL3aFt6XEhLPDMdgMt
 BKQ2WZ19y7CgXJPN0Cx5zsXmVjNFvXRW8cFNr9PB7+EW3XadzIwqZNFJEWUj+d++cdg8rO7oOsO
 Z+qtA8xUdUUV6vM70epMIXwNcoj0GpckYbfca/+aTyD3CgZmRRNvKwOWSP83ztkFKpunfYDSVIK
 rjVKQ8OC5MbznYKz7TbJRvUf9BzuEI5df6ofyUcXtJ+BM1FOcwD6S1yNCypOCETcqMGlh0PQnlv
 BHoS1ChSHymWwQGhQ+fF1DfGl8zfoPVkGku08efcR6xe68D/31y3JAzJQWUwIRA=
X-Received: by 2002:a17:902:d483:b0:234:1e11:95a3 with SMTP id
 d9443c01a7336-2445978c8ccmr56761455ad.13.1755189512854; 
 Thu, 14 Aug 2025 09:38:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFA5KjhREwZxocKHlp81qbREqS5IgYM2U1497mlRdma3ow5tbSm83x7BFjlpFu8sePsAp2J/g==
X-Received: by 2002:a17:902:d483:b0:234:1e11:95a3 with SMTP id
 d9443c01a7336-2445978c8ccmr56760915ad.13.1755189512299; 
 Thu, 14 Aug 2025 09:38:32 -0700 (PDT)
Received: from [192.168.1.5] ([106.222.235.33])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-24300f8c9d1sm71788655ad.129.2025.08.14.09.38.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Aug 2025 09:38:31 -0700 (PDT)
Message-ID: <1727374d-0461-4442-ab35-9acb8ef7f666@oss.qualcomm.com>
Date: Thu, 14 Aug 2025 22:08:26 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/msm: adreno: a6xx: enable GMU bandwidth voting for
 x1e80100 GPU
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20250725-topic-x1e80100-gpu-bwvote-v2-1-58d2fbb6a127@linaro.org>
 <e7ddfe18-d2c7-4201-a271-81be7c814011@oss.qualcomm.com>
 <33442cc4-a205-46a8-a2b8-5c85c236c8d4@oss.qualcomm.com>
 <b4f283ce-5be1-4d2f-82e2-e9c3be22a37f@oss.qualcomm.com>
 <269506b6-f51b-45cc-b7cc-7ad0e5ceea47@linaro.org>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <269506b6-f51b-45cc-b7cc-7ad0e5ceea47@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEzMDA5NCBTYWx0ZWRfX+o7rCWvW4U9O
 snrARWgATpoRNZRBOC9deelD1AQiiVnxE/ziSzKZQfT4nLxoRaB/ul92sjE30vfAv8nd4eH8vDq
 u/hTA2IYQq8G8f7zD6GMPxmLiEeSX7XaCTMz3JaSQ8WkdPgzkOaGyzyojfNbM4jhOV6JvYlaK0d
 0dW7iimOyoYAdD3cGXj+P3RTJ4+vxU23wt2mRGLXJoewh77rtZygQZz7bXl0+0Y7YDmpacyIZJH
 vN/EJp/+AFry+6E1/04F819CFA/ZQjqrdivKDGLzR0lgfaXE4rN/DALY/ubOp0XOBMp0bOndxzS
 a1aVxNmlZlx/F97AU8/e5vKDnoDHY/EM5gnXhrPO9njnun3aKi3uui/5fGcvkZnGpoocSfr8NQQ
 vIICNwpm
X-Authority-Analysis: v=2.4 cv=NIrV+16g c=1 sm=1 tr=0 ts=689e110a cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=geSN8yY6MFID4zSGlH7RRw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=7lXMnOvvf2IE2kTxY-AA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: Rzm-cyohwMRqDZ8y1Oe-_tw93I73zIfz
X-Proofpoint-GUID: Rzm-cyohwMRqDZ8y1Oe-_tw93I73zIfz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 adultscore=0 suspectscore=0
 spamscore=0 malwarescore=0 phishscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508130094
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

On 8/14/2025 7:56 PM, Neil Armstrong wrote:
> Hi,
> 
> On 14/08/2025 13:22, Konrad Dybcio wrote:
>> On 8/14/25 1:21 PM, Konrad Dybcio wrote:
>>> On 7/31/25 12:19 PM, Konrad Dybcio wrote:
>>>> On 7/25/25 10:35 AM, Neil Armstrong wrote:
>>>>> The Adreno GPU Management Unit (GMU) can also scale DDR Bandwidth
>>>>> along
>>>>> the Frequency and Power Domain level, but by default we leave the
>>>>> OPP core scale the interconnect ddr path.
>>>>>
>>>>> Declare the Bus Control Modules (BCMs) and the corresponding
>>>>> parameters
>>>>> in the GPU info struct to allow the GMU to vote for the bandwidth.
>>>>>
>>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>>> ---
>>>>> Changes in v2:
>>>>> - Used proper ACV perfmode bit/freq
>>>>> - Link to v1: https://lore.kernel.org/r/20250721-topic-x1e80100-
>>>>> gpu-bwvote-v1-1-946619b0f73a@linaro.org
>>>>> ---
>>>>>   drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 11 +++++++++++
>>>>>   1 file changed, 11 insertions(+)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/
>>>>> gpu/drm/msm/adreno/a6xx_catalog.c
>>>>> index
>>>>> 00e1afd46b81546eec03e22cda9e9a604f6f3b60..892f98b1f2ae582268adebd758437ff60456cdd5 100644
>>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>>>> @@ -1440,6 +1440,17 @@ static const struct adreno_info a7xx_gpus[] = {
>>>>>               .pwrup_reglist = &a7xx_pwrup_reglist,
>>>>>               .gmu_chipid = 0x7050001,
>>>>>               .gmu_cgc_mode = 0x00020202,
>>>>> +            .bcms = (const struct a6xx_bcm[]) {
>>>>> +                { .name = "SH0", .buswidth = 16 },
>>>>> +                { .name = "MC0", .buswidth = 4 },
>>>>> +                {
>>>>> +                    .name = "ACV",
>>>>> +                    .fixed = true,
>>>>> +                    .perfmode = BIT(3),
>>>>> +                    .perfmode_bw = 16500000,
>>>>
>>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>
>>> Actually no, BIT(3) is for the CPU (OS), GPU should use BIT(2)

You are right that BIT(2) is GPU specific, but that support was
commercialized from A7XX_GEN3. Anyway, the Win KMD uses BIT(2), so lets
use that in Linux too.

I know some docs show BIT(2) support, but lets not bring in untested
configurations.

-Akhil.

>>
>> This is *very* platform-dependent, goes without saying..
>>
>> I see BIT(2) is also valid for X1P4
> 
> 
> I'm confused, Akhil can you confirm ?
> 
> Neil>
>>
>> Konrad
> 

