Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D536A858B7
	for <lists+freedreno@lfdr.de>; Fri, 11 Apr 2025 12:03:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E55010EB55;
	Fri, 11 Apr 2025 10:03:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="FFjd0heH";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 920F110EB55
 for <freedreno@lists.freedesktop.org>; Fri, 11 Apr 2025 10:03:11 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53B5c8tg031978
 for <freedreno@lists.freedesktop.org>; Fri, 11 Apr 2025 10:03:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 TChXZ6jQnWmn2gjeO8rx1Bx0hrnCDqPo46JM3visYYs=; b=FFjd0heHTi5a3EYd
 unZ891elrIymmhwRuD77Z8YwUdTRanoczY0QVd38q9z1pVI/YDa4uNdGPODFedym
 HU82fi8CsN/eAfFVmJP5+UED2p42tmmp7SO0BkHwwerMo1oMT7MPeHf1RHqtCtJV
 Ypmo9iQbnnh5rrhcmL9mAlsgpSTDCcc/m8Kr3/leJ7q3GAcWcTJgQp/owAXa6CcP
 mSH4kwBIIr6e4X/Mv8fQzaG9mGWcAMfor3A/SgYa1YlSw1hp6qtgtLgPYuyvvkwW
 hZg9H/AsZVo9Jf0DFbqDa0RKnWdx7aX6sGIoZDowrxHLh6MlhpzCkv2bjEUlfmj4
 eClHEg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twpmhx7e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 11 Apr 2025 10:03:07 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c76062c513so40390485a.3
 for <freedreno@lists.freedesktop.org>; Fri, 11 Apr 2025 03:03:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744365786; x=1744970586;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TChXZ6jQnWmn2gjeO8rx1Bx0hrnCDqPo46JM3visYYs=;
 b=JuMtWimFYVqw/j/wTuqOwzRpHf8BKA2mmcsWrnjHHxU21SZO8+rEVxw1aN/oKcCvIf
 v1P+dRiQxy32Wrrd2EttoHp6s4OMxZvnhPLtfrJu/e0W1sKYQo4q+o3aWj4W87nTFIC3
 /q6mC5Isp8OBBcyggVUv4ey3eCrlJ7cdoSuhA251+U2Zq3oIllU1ddGxfGB8lka9FE2e
 ZXB4TYFvBRD5rk3J8YRjTay65pKAsyad5RxyB8L3U50UDsfp7pSOJ7v7R+zFMG1HTXzs
 VJY1K7co3hT7+W2wd/jz080hm7Ppqmmmjp3rwAQ4bhZWb0hVS/LapJpFPB4Thl+gIXOM
 VkPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUEFgjBiVMXlKTizPuUt4w+nffykYuwrcG/5tZEKvOeRK3DvZkEOFKhqZMHdqz6px5U2Vy3/GBmlp8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YztSlsgF3T6IkCZPbbjXJFk/GBFDtSa4rlI9pX6Zhi5Lygml1FS
 4T6/IYvcrCvyHSpAovpJuMria7cWkd3q4NAfjOioi+DJBdCquVBDBAHfJ6+xwXAaokxlJb5Tdy+
 TsdoyLL4sEHG1jeuFtfoGYhFDLR+hoZR1RRr1CUwrngncnNE1/DToFwBvMdDqTwjfLmg=
X-Gm-Gg: ASbGnctHTCsv1cz/m8uzzfp4lDEce5IW+Dq9ez2QqCCpDvpqMO8HhNm7G7x8UsHNwat
 /5cmkE5N5yTSP4w+vUPbYkbgCIsS0qTwFmW5U7JuNXs3qicWJZHWDo9d25icurWOTMVLVoSleML
 t96jWisB53eUG/+4LElnMjF+cT3RYANaQcHjO+AE9ImpuvgXNoDK/9IsdufGuOw7zS6zoVp2mAI
 cjyNhh4vS+9Sc9pUXPOjg98yKyokQB3vwNVYmOGzTiQwLeuPQB3fZzB20n1bZDUFbRJ7yslUXgI
 nXEKFp9dVl6SWT1xVxpYGVkIdePeX/u1H2vBpwjncdBfoymVu9A5cDS/R8TPXUe87w==
X-Received: by 2002:a05:620a:3945:b0:7c0:c024:d5 with SMTP id
 af79cd13be357-7c7af116677mr129314085a.8.1744365786423; 
 Fri, 11 Apr 2025 03:03:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGAMFmbhBPTTCvhJj0P5xFnbrJJ/hfR7pw3RAhhVJwTUi6Q679ffPasjTr0Us/aTCC0PySNjg==
X-Received: by 2002:a05:620a:3945:b0:7c0:c024:d5 with SMTP id
 af79cd13be357-7c7af116677mr129312285a.8.1744365785908; 
 Fri, 11 Apr 2025 03:03:05 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-acaa1ccd1ebsm424629266b.140.2025.04.11.03.03.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Apr 2025 03:03:05 -0700 (PDT)
Message-ID: <b04464b6-2ad9-4866-88e9-437e96645726@oss.qualcomm.com>
Date: Fri, 11 Apr 2025 12:03:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Retrieve information about DDR from SMEM
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
References: <20250409-topic-smem_dramc-v1-0-94d505cd5593@oss.qualcomm.com>
 <685e784c-3f36-4cd1-9c34-7f98c64d50f2@oss.qualcomm.com>
 <0bec3e62-0753-4c3d-abe1-1a43356afc80@oss.qualcomm.com>
 <e7bd2840-dd93-40dd-a1bc-4cd606a34b44@oss.qualcomm.com>
 <CAO9ioeUeNeSxz7ADZ-BbJbhEKkszVS+SmbqaZCgTpL=csak=hg@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAO9ioeUeNeSxz7ADZ-BbJbhEKkszVS+SmbqaZCgTpL=csak=hg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 1FdE66AIQ7LzgCK4kkao_Bt9leJmVRgY
X-Proofpoint-ORIG-GUID: 1FdE66AIQ7LzgCK4kkao_Bt9leJmVRgY
X-Authority-Analysis: v=2.4 cv=MpRS63ae c=1 sm=1 tr=0 ts=67f8e8db cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=uBBskLQT7c7fgIZri1kA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_03,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=936 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110062
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

On 4/11/25 11:57 AM, Dmitry Baryshkov wrote:
> On Fri, 11 Apr 2025 at 12:49, Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 4/9/25 5:49 PM, Konrad Dybcio wrote:
>>> On 4/9/25 5:44 PM, Dmitry Baryshkov wrote:
>>>> On 09/04/2025 17:47, Konrad Dybcio wrote:
>>>>> SMEM allows the OS to retrieve information about the DDR memory.
>>>>> Among that information, is a semi-magic value called 'HBB', or Highest
>>>>> Bank address Bit, which multimedia drivers (for hardware like Adreno
>>>>> and MDSS) must retrieve in order to program the IP blocks correctly.
>>>>>
>>>>> This series introduces an API to retrieve that value, uses it in the
>>>>> aforementioned programming sequences and exposes available DDR
>>>>> frequencies in debugfs (to e.g. pass to aoss_qmp debugfs). More
>>>>> information can be exposed in the future, as needed.
>>>>
>>>> I know that for some platforms HBB differs between GPU and DPU (as it's being programmed currently). Is there a way to check, which values are we going to program:
>>>>
>>>> - SM6115, SM6350, SM6375 (13 vs 14)
>>
>> SM6350 has INFO_V3
>> SM6375 has INFO_V3_WITH_14_FREQS
> 
> I'm not completely sure what you mean here. I pointed out that these
> platforms disagreed upon the HBB value between the DPU/msm_mdss.c and
> a6xx_gpu.c.
> In some cases (a610/SM6115 and a619/SM6350) that was intentional to
> fix screen corruption issues. I don't remember if it was the case for
> QCM2290 or not.

As I said below, I couldn't get a good answer yet, as the magic value
is not provided explicitly and I'll hopefully be able to derive it from
the available data

Konrad

> 
>>
>>>> - SC8180X (15 vs 16)
>>
>> So I overlooked the fact that DDR info v3 (e.g. on 8180) doesn't provide
>> the HBB value.. Need to add some more sanity checks there.
>>
>> Maybe I can think up some fallback logic based on the DDR type reported.
>>
>>>> - QCM2290 (14 vs 15)
>>
>> I don't have one on hand, could you please give it a go on your RB1?
>> I would assume both it and SM6115 also provide v3 though..
>>
>> Konrad
> 
> 
> 
