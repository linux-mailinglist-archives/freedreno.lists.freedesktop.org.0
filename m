Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 898DEB419E4
	for <lists+freedreno@lfdr.de>; Wed,  3 Sep 2025 11:26:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02BE110E3CB;
	Wed,  3 Sep 2025 09:26:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="IM2RCMQj";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C4DC10E3CB
 for <freedreno@lists.freedesktop.org>; Wed,  3 Sep 2025 09:26:28 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5831pFbm024047
 for <freedreno@lists.freedesktop.org>; Wed, 3 Sep 2025 09:26:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 UjHv5Rny7NYvIIV6SOi+RWSfsQ+PhjUoJoUt/TGYKPk=; b=IM2RCMQjbHLbuwvm
 2BmlzDGPZayYsO2J1lR9qLo22+LH1D5ZvmuGZAYEa8W9HqsGkDBEDlylPrQPBvIb
 YE6Uo0ykRkO+REHUELqP0sSvnEEDUBogf6jmygOCaVqcZPZ26w9qM3idbW9WfL2u
 ZVuQt/N5CtCLuZt38SaCCYbglU/f0VEwphCzt77mSgJZB9jop3y14cEb+tCeRk9b
 WqUKC/lvGQetvcIbVaty673cO/NdMVs1rsbj11RlvTocqg6/DzMBhiBZtftQBzmX
 zIBjkmxrDwKtY/819dqGMpYgQBCXSPgy4Wo1AT+NDRYTZNN5RqSHj+se4zm5EaEF
 8lSUYQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ush32vr1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 03 Sep 2025 09:26:27 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-721eb9fecdcso3530786d6.0
 for <freedreno@lists.freedesktop.org>; Wed, 03 Sep 2025 02:26:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756891586; x=1757496386;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UjHv5Rny7NYvIIV6SOi+RWSfsQ+PhjUoJoUt/TGYKPk=;
 b=wB0enw2EIz0+C4WUjlnaICLJ3VRz6rZbLo+eufs5dSFLFI30V1I0J399q2hE6TyL3D
 FJIbeQC0dYZqFWsSN8EHntgeXyIPepMDsRDiyKh4hN9k6ktwoRJG6VdEbFj7S6Wgk5qL
 Xk/A697QKgymdDjxUQb/yRi9Btx2jPR7F26DdLrSdQB/ElUcIdBT1JXJF+zerqivps2+
 xRMrMhBliYt22CciAX4RddJv8jVfY4IpBqBppUzW4YioE2diJ/7PhmiBNMocunyktlnC
 vEQHV+C5mDCN1Co9/6qakvSTzPX85lEDOxHT3HS1KfFPG68OEMHPVYOZY+LP/OHd5WL0
 DKSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnrY6/KBE7kCCfLFJ1/1qSP9uQdgB2E15U2SicScNgxljHj91gdfrv7dFhw2CCAAZfuJ2M8W0HEcI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxaSoFKvt0DOKGZSuoB+L0fMP2dgpDLw28Arj6iQwjX4QeFGks4
 vDf75Ixp+wmqzxNZSK506TpKA0z8JBVDZFrfSwYsdSnQ13a8mr/N7Q+Dp8qygX2M3C9AoKGujqm
 m365ZAAMArhYirPudG6k9dN8xm/C/Iw27DYwH2uM93vKVWl/ajGNlw1Z7x/0b44FB1VJwrQI=
X-Gm-Gg: ASbGnctHYeTXQ136ku9eiAWsrYCMb1lJMlNrzOgCnIwvIfarrGvrOu+5NSH1TcOO1fN
 x8ufK7+mZ5/lRvPHl0vEIy32o1rYVh984qm2BD2q6QiL5EsYzX+QVhKa/lE7ehB3ejYJBOTARWV
 O9w+XO2rL+x8ykkKjoueazjdQ/utgDRKPbCWuDTBoJETL+i6WV3DnlrtyxF5pitbtiu75GH0a2o
 K73XeYiuMkOyAc/AFqseHI0TsoG3BvjNBiHjAzKngi2Ww4Bi016hQ3elFAZp7M1iCl7PKoFfXzf
 PP88L//K4z7fcEekiIAFDfinXvjtBFVmYV4jN+lMbuvuO0OtBwTCdSCtaL3P+oOx3hCXTL929j3
 3RyYR6sBDp+/pAX+4QW/PKA==
X-Received: by 2002:ad4:5d4e:0:b0:70d:bcbe:4e79 with SMTP id
 6a1803df08f44-70f5a5fae45mr157318016d6.6.1756891585971; 
 Wed, 03 Sep 2025 02:26:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEnGodqLINHIr1ti5AIWKv/NvUfg7lci7ZbbtsKiF5IU1s9PYba1/SeEbO5pfCLhRpYbPSD1A==
X-Received: by 2002:ad4:5d4e:0:b0:70d:bcbe:4e79 with SMTP id
 6a1803df08f44-70f5a5fae45mr157317826d6.6.1756891585382; 
 Wed, 03 Sep 2025 02:26:25 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61cfc1c7a27sm11650300a12.10.2025.09.03.02.26.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Sep 2025 02:26:23 -0700 (PDT)
Message-ID: <7382b6e3-3872-4e18-a1bc-b2c75c888a5e@oss.qualcomm.com>
Date: Wed, 3 Sep 2025 11:26:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] drm/msm/a6xx: Add a comment to acd_probe()
To: rob.clark@oss.qualcomm.com
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Jonathan Marek
 <jonathan@marek.ca>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250902-assorted-sept-1-v1-0-f3ec9baed513@oss.qualcomm.com>
 <20250902-assorted-sept-1-v1-4-f3ec9baed513@oss.qualcomm.com>
 <694f0989-64ea-4c3c-8613-863da1dd286a@oss.qualcomm.com>
 <CACSVV037e-GquRk7P1_qT7T4HF=f-TF93FpJ16NiKShqicaCfw@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CACSVV037e-GquRk7P1_qT7T4HF=f-TF93FpJ16NiKShqicaCfw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMiBTYWx0ZWRfX5gy0YtET8TA3
 Vu9aVpnM98vNCH9ao2jxh9HjoeoGV/YCC/9L7dEuMry1POOZhppRbMPB+UjU7mjz9MxoY9iBsgS
 H4rq7QsDrFCQhLjLCJQTDGq7oiJzuwCdPHsjGMXvMgZqMgo+nrVLceZnscjHMadF4DuaSGlPsri
 QcWG12EmsCGi9tmwOaxJvMVE5h7Oo4Z1w7Y4GUbDmj9fpT5kL+IZVJdO1Ve0uaf04Y9WzQMuWL3
 s4tjC9U+plDXXMHbgNvyvj8MdKZpcoroXg/ImEJidN0X+QiIJ9rEI+xdz54NHwXaDc9Xy4zan2y
 6BRZPUCvzPDzwtK+epE7Xxr1ElQyRrlc46W9Ym33yA9AWR+MwzQt7fJzSBycPF4/jycaV3+jGL8
 /VjHh3/5
X-Proofpoint-ORIG-GUID: eUI71VtSShR_T1ovgIkt45E8OvZbVyGw
X-Proofpoint-GUID: eUI71VtSShR_T1ovgIkt45E8OvZbVyGw
X-Authority-Analysis: v=2.4 cv=M9NNKzws c=1 sm=1 tr=0 ts=68b809c3 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=5-JTw_7GLCY5IPuysb0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_05,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 suspectscore=0 phishscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300032
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

On 9/2/25 5:57 PM, Rob Clark wrote:
> On Tue, Sep 2, 2025 at 5:33 AM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 9/2/25 1:50 PM, Akhil P Oommen wrote:
>>> It is not obvious why we can skip error checking of
>>> dev_pm_opp_find_freq_exact() API. Add a comment explaining it.
>>>
>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>> ---
>>>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>>> index ea52374c9fcd481d816ed9608e9f6eb1c2e3005a..de8f7051402bf0fd931fc065b5c4c49e2bfd5dc7 100644
>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>>> @@ -1694,6 +1694,7 @@ static int a6xx_gmu_acd_probe(struct a6xx_gmu *gmu)
>>>               u32 val;
>>>
>>>               freq = gmu->gpu_freqs[i];
>>> +             /* This is unlikely to fail because we are passing back a known freq */
>>
>> This could probably mention that known == we just retrieved it a couple
>> function calls above, but I suppose the reader can come up with such
>> conclusions
> 
> Also, I think s/unlikely/not expected/ ?  "Unlikely" implies that it
> could still happen..

Yeah, "unlikely" as in "cosmic rays" or other kinds of mem corruption

Konrad
