Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6E4AEE31F
	for <lists+freedreno@lfdr.de>; Mon, 30 Jun 2025 17:56:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C30DC10E234;
	Mon, 30 Jun 2025 15:56:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="F2tLCm6O";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D8D810E234
 for <freedreno@lists.freedesktop.org>; Mon, 30 Jun 2025 15:56:22 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55UFTrFI002215
 for <freedreno@lists.freedesktop.org>; Mon, 30 Jun 2025 15:56:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 D0Fl5LewKcARD32i6DxdJAAOcn3ZiRpvJ9i+gosfreA=; b=F2tLCm6OVgJ5uM3o
 +7t/kkc3XyFSQA7vLg6R3KpOKbVMDK2sDZ3waa1SM22IyjoviFRGFE8XzamBmUjY
 PU2acpGUm+JVTTlD4DbAz3S2kKKuX/2bmgMViYatB+qa2B0pHlC7pELi0v3NxToO
 9mVK2iBNj9RjGVM8SfBmRUo3TnRBk+V42xUV+Ct+JToMQ6XgpyFx0e83x6w8ufNz
 TsETeG4+G+b626dPwfu/xheR9fUlvdpAgxfv0cBNKE8eLjpoE1VPNxhSY7JHeK+I
 3h+Vzsslh0KL/PsFIwBpfhtU8oLnqkczSgV4Ns5G7J7stufuHVwTI5Z5Pa6pStpI
 4Ah0IQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j9pcn96v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 30 Jun 2025 15:56:21 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7d21080c26fso56857485a.1
 for <freedreno@lists.freedesktop.org>; Mon, 30 Jun 2025 08:56:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751298980; x=1751903780;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=D0Fl5LewKcARD32i6DxdJAAOcn3ZiRpvJ9i+gosfreA=;
 b=Q0sOYyyt/Xi8X/034FNNXmkQQB6pt9yF3QzMT3VbuXHD+FIxpu4MONKCTVAjlkILvd
 Jo7nZ4x3l1vBVlledl98eEAuU8wDAejQxlcXSWbF5qxBpqhQb1aet9CRvXAlyBppEkJJ
 vefj5iIJY40aO8VI1tBecTMfm5S4kzbG0XmiSQpteR4pFR+6Ndb+bZTnarRBRlKVQwua
 lYihFTTiiDnqrxHT4QPi3V3LnmafiQVhq37jZwsJ4asQaVevNGlZvls6/JVOUWNLKY1H
 vBRiGDLSf1X19HWzbq5jwnC088KCnuJd0JJ82ZyOJWeV+8K/gQQxu0Qb0YufMqqsXBRS
 R9Ow==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6Jtx0xXVe1xH8YzfHbk6p8DTBV/tw+xsy8/2wbBpaX0Hjbk5FoPE1HSPRszCAIUnSAZC1H5dZQaU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz4ilSqXLAPFFNsnoBiVsoWAKFioLHhtJJNzsTkjM9DdKYiyqv9
 UIj92OfOOueg9Bapp0Fpscfx03JXITKzODZFDUhPh4hZ6mF+1dFOulMNDuoFd5VoTMUGqKwlr9j
 iOj4OMAva2JHHGX8baFHzh97leVsz3+fVzKSLni4jed2FQXS5/Ip/jKHYGj3yethDomWWxOY=
X-Gm-Gg: ASbGncuVFIqNyzca1JHLMAO4UWZ+7gFSTQyTBWSz5TFbI+oyJ3SPVyNf4+pENyxyd1Z
 P2YMNiIT4RGFOnrwGfqCVlobRD36nut4Ld23ZwM/LJRkcGWwfXgaNVHgmUhnO2hB5gEN7RcR+GU
 WrrFgx4STVxcUBghXtNZl+yO/8uHM5dOq5qdwNxhKvhddTTSZBUSfCY7XeR4zZAHmal7EpX20EX
 3puxqzRTagWzi7bYcAALcmnkp1swp3tlvM0ML5GWFe6YNUln/HbuqNRdY5qqUGlxQW13kcJ7uNG
 IR/nFBGX7o1enwDQ81v1AiNd+ffqjBH0VpAbLIlFLBDDLixY91u9ZmBhiLbLVg3q+M9ihtJwpxC
 araXFpuNY
X-Received: by 2002:a05:620a:690d:b0:7ce:e99e:bc87 with SMTP id
 af79cd13be357-7d44c21cdd8mr551567185a.6.1751298979911; 
 Mon, 30 Jun 2025 08:56:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEmRmTmwWyC/XAvDEJJwe50p+zxnhcywcSEGqHClp/yN/qqSKZwbpDjpuECX6rKycQCNqvXGA==
X-Received: by 2002:a05:620a:690d:b0:7ce:e99e:bc87 with SMTP id
 af79cd13be357-7d44c21cdd8mr551564485a.6.1751298979335; 
 Mon, 30 Jun 2025 08:56:19 -0700 (PDT)
Received: from [192.168.1.114] (83.9.29.190.neoplus.adsl.tpnet.pl.
 [83.9.29.190]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae36ffe2981sm484430166b.120.2025.06.30.08.56.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jun 2025 08:56:18 -0700 (PDT)
Message-ID: <aaaa42ed-989e-43ee-8d45-2908f52e8584@oss.qualcomm.com>
Date: Mon, 30 Jun 2025 17:56:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ci: Remove sdm845/cheza jobs
To: rob.clark@oss.qualcomm.com, Doug Anderson <dianders@chromium.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Helen Koike <helen.fornazier@gmail.com>,
 Vignesh Raman <vignesh.raman@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20250629135843.30097-1-robin.clark@oss.qualcomm.com>
 <92314f06-e6a8-4882-a31c-914438d7761d@oss.qualcomm.com>
 <CACSVV01AUOp7vZ7kLt+gwxvfv4CYLtAQg6MhUccygbi1NpVJMg@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CACSVV01AUOp7vZ7kLt+gwxvfv4CYLtAQg6MhUccygbi1NpVJMg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: CPzps_zDUmDo2OA--6LZcte2pcQ9lWJM
X-Proofpoint-ORIG-GUID: CPzps_zDUmDo2OA--6LZcte2pcQ9lWJM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjMwMDEzMCBTYWx0ZWRfX/1WGFhNyEaAI
 tjfhyBtDKal1/wTu7MwdrgMmMncuFk284wAAdaSUcRuG23ek20X1K/YuskKSYQLCoTW5/EVHg/i
 J703E851cRLBO9socsDXBokVhX+NZd2YvtRoinyNcZzZt62lx2m5wOFoOMdp2fQCR6kYrEHVn2N
 m2Xb5K8z3vtzV5k2DPy4YHGH+XhFJJPQ9XdtU8oeAIY3derzzHKW1huZdqrj3XofpxiJq5KtBpL
 9wHuaYbDVRmO31AEWKyeUm7Th032QMex0wuN403eHbfw5tQqkt6HISVXsnYyqZdzGO5hxrRe1Ns
 48mmd6v7K7tk6OxWQb3NASAfQXsaev67oFe5vCH5dElkso8wDNug/abdSfkhAiDq7gOIXniMBWl
 4n0aT8iwYp5edpqwK6jlOMe+TkXWQ3Rbp0D8w2czeToEdbvyH8M5D8gQemRCJ4CUpwwxrSrn
X-Authority-Analysis: v=2.4 cv=QMFoRhLL c=1 sm=1 tr=0 ts=6862b3a5 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=fKQzr7EGRj+VoE0XNsDNvQ==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=_ijeUKsmqluwEKimemEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_04,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0
 mlxlogscore=824 mlxscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506300130
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



On 30-Jun-25 15:46, Rob Clark wrote:
> On Mon, Jun 30, 2025 at 3:34 AM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>>
>>
>> On 29-Jun-25 15:58, Rob Clark wrote:
>>> These runners are no more.  So remove the jobs.
>>>
>>> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
>>> ---
>>
>> Do we have anyone using cheza at all anymore then?
> 
> Probably not

Adding +Doug +Akhil +Jessica, if we don't have any users, we may
get rid of it upstream, as it never made it to the outside-outside
world..

Konrad
