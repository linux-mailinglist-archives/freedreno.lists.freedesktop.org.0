Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38FBAAB139E
	for <lists+freedreno@lfdr.de>; Fri,  9 May 2025 14:39:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBCC910EA30;
	Fri,  9 May 2025 12:39:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="KnLUUF76";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED60610E971
 for <freedreno@lists.freedesktop.org>; Fri,  9 May 2025 12:39:48 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 549BfuFc031489
 for <freedreno@lists.freedesktop.org>; Fri, 9 May 2025 12:39:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 4G1RV5OSQbBgLbkxXdEz6RKY+uaAPac1V0RoEspl1mc=; b=KnLUUF76t2PuxaRe
 ypLdVnGyaLLu66zSCesTwxcmWkL0OyupdYnP85RjBJqaRGr3Y9mUdsW+WGmBbHZm
 wws1I6B3PDr+y9fMgwCJb5FCfEkN8nQux7Ehj8rJ3IQjl32nEaRzJ1u3BprW+mOo
 V2LS3XUHbvTAglhtFTLVcH+eM19dSORNU1foWMKmfzu+zdhQZ4lLFfcgZg04W8An
 VlF+ir97v0BI3kxI6xJzWKEvOcamssCsPKrjRjcsQhRPtUyjQ/6hIz+c2c1GtnjE
 KTum0rXo7u6+h16SjVjI6XOvOhY5pcWGcl6CeIK9gs7SVOyS9JrWusCcMu2UMqgw
 /aeATA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnpgmmfd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 09 May 2025 12:39:46 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c552802e9fso50663785a.0
 for <freedreno@lists.freedesktop.org>; Fri, 09 May 2025 05:39:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746794386; x=1747399186;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4G1RV5OSQbBgLbkxXdEz6RKY+uaAPac1V0RoEspl1mc=;
 b=UunJU4wEVlJXeq5Wei7L2HwdVlmD0sCG6zHr8hUT+74nEqlgg9xp9UkKLk2xDewTcI
 EkPvu35JKfzslu7WgkSA2JQ7IQJMGxiExf7f1PdNOODLwZfcadAKKife1IjvdnApUzgj
 erZIw67koDyail18HTLCaU0Rj7XhVV1kOUR0yEmClEd7Z+YAngScov0Lj2INaKc1MJqE
 5OY2dePPAzSj6eemwZHE08dSZ2P1YQ5lzARgRusH4gbj8WQFdj4LgKbcjbrGtIf3bnJr
 HYiU1MHHbrVckc8FIlgaSpu64z38PGXzxkabFc+ymzE3Kxhr/x5CfjPMGbtmB28wOt8w
 5j5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUkIleRzaRUp/pTVHpSrpjM0HEXO2HCPkiEEKbnIbquUv4D2qmVBjLyUtcf852u/apuRdTn8b3tX+A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxlCrSA14hMt4VBhy39dRt9j5gm2NNWcniQabTnzyTl/aXqMudS
 I9sEkRZ6iaQ7P4M2NNGlIsH54f8HmznuG8xW0FQiDGmMy4VyQuhe25r5vorOyR/5BF8nB+8qcsg
 C0bEw6HXfntYSQGi2U8Px2w3E4eaJ0IApbRl0+EbbkmOUXGTxaVqYF1RTf+5wr+WSCgk=
X-Gm-Gg: ASbGncvu0LFbxZwHJz2MGN4uOL1JuZE7VZEQw0x8NgKbpyVtCzYwfD4IWS2DanxK1Gj
 0fppY2cED0IvmTydCW4dmv/ace5YQArHCMDaZFxlpj7TvjXu6iNS2aTR9qqW8IdzZW7lNRQHPMi
 xZLfWIQ3gQEhWJ7K9ignFfdZr0MZi3kuPvDyxU7z+5HsCfeHDeUUGHs4i1H/dnT5lgCI6hhQnRh
 NtvJiQz87YBbBv0b9U+z95UFHPDKRwB+J4Dez02ZhtS2ou9ClV0GP3ScKREjlNLJCImDVY5V0Kq
 wX1px2QAH1CovjABcPxLtVRFU9/6BJh6LzyLklscbgDtiSVlGszKEwPSM0k4DiPOv00=
X-Received: by 2002:a05:620a:270a:b0:7c0:b106:94ba with SMTP id
 af79cd13be357-7cd011186f3mr194763785a.7.1746794386262; 
 Fri, 09 May 2025 05:39:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHhQplMN/T2Kquk8OAgFmlti7cmfd722WmVfsRvtwRfluidvoeB7ua1lUBaXYSIjte577KX6w==
X-Received: by 2002:a05:620a:270a:b0:7c0:b106:94ba with SMTP id
 af79cd13be357-7cd011186f3mr194762585a.7.1746794385893; 
 Fri, 09 May 2025 05:39:45 -0700 (PDT)
Received: from [192.168.65.105] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad219746506sm143082866b.88.2025.05.09.05.39.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 May 2025 05:39:45 -0700 (PDT)
Message-ID: <b374b468-819b-4f5a-9ecc-0926c3696db3@oss.qualcomm.com>
Date: Fri, 9 May 2025 14:39:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT 07/14] drm/msm/a6xx: Resolve the meaning of UBWC_MODE
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Connor Abbott <cwabbott0@gmail.com>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
References: <20250508-topic-ubwc_central-v1-0-035c4c5cbe50@oss.qualcomm.com>
 <20250508-topic-ubwc_central-v1-7-035c4c5cbe50@oss.qualcomm.com>
 <CACu1E7H9_EkGFkjL1MRU9M-_YFHnPb5v9SxDg6fXm0m-imzC2Q@mail.gmail.com>
 <1f6fcbed-c7c4-42c2-814b-3834b08c5977@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <1f6fcbed-c7c4-42c2-814b-3834b08c5977@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Ao/u3P9P c=1 sm=1 tr=0 ts=681df792 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=sEJkFV_Ntms1zBwlKkIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDEyMyBTYWx0ZWRfX2bk+qdK9KKwd
 ytAcV+gOxCQxXUlGwtFo/6bxMKDK/F7G2nwNfSNW/r/T/5ePg7t/rZgY9ixjezvLgjkaYJRP6/K
 Gy6DRZe7yrOffhhw3llyRUPUk/4/kEkO9Koe8ZOoZCFx4IeiHbR+3oE9QaNzi2bz87V5LElVN8B
 +vC9Mc1iSu8YKoUATBbTGBINVQFQBTuk5ZFZ68+RhpMxI5mPA8zouYVcaaQWtZkk4ABMlGOinl0
 OZrMma6cTA9QM1XeeBGmEODPGqrh8q0btGNc9N54wRGUmCqNtRCaTzJHAnm8LlYTmKGpI1OPUgq
 2qF8DIhBUrwQK3bu+/289lH1e1yrkrvUNTmcE0eFPvTjsgtGWCbN+gjQ6QoYRPNZB2m2zxgQsuc
 mCF0ApaPd+gtNf3J/ptYxjrtRPJ2TwczkjxajWLCOA6doqjapwwV6MhlqNkoTDOOzJgC4+4t
X-Proofpoint-GUID: qMPCmCMu4qqjvxGv0h3jj-xKDUbFjFXL
X-Proofpoint-ORIG-GUID: qMPCmCMu4qqjvxGv0h3jj-xKDUbFjFXL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_05,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 mlxscore=0 mlxlogscore=901 bulkscore=0 priorityscore=1501
 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505090123
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

On 5/9/25 2:37 PM, Konrad Dybcio wrote:
> On 5/8/25 8:25 PM, Connor Abbott wrote:
>> On Thu, May 8, 2025 at 2:14 PM Konrad Dybcio <konradybcio@kernel.org> wrote:
>>>
>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>
>>> This bit is set iff the UBWC version is 1.0. That notably does not
>>> include QCM2290's "no UBWC".
>>
>> While this is technically true, AFAIK the only difference between UBWC
>> 1.0 and 2.0 is that newer UBWC disables level 1 bank swizzling, which
>> is why I originally wrote it this way. There's a bit of redundancy
>> between the UBWC version and ubwc_swizzle bit 0.
> 
> It turns out to be a hardware matter

Well you just said that.. in any case, i can do either (or both with a
sanity check)

Konrad
