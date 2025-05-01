Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6044AAA60FD
	for <lists+freedreno@lfdr.de>; Thu,  1 May 2025 17:53:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DA0F10E872;
	Thu,  1 May 2025 15:53:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="GIa/SO1O";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85DB610E86F
 for <freedreno@lists.freedesktop.org>; Thu,  1 May 2025 15:53:22 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 541D292x009416
 for <freedreno@lists.freedesktop.org>; Thu, 1 May 2025 15:53:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 e0jMJ9FtUEXRGsb2EEzfZbnaOe4VQC+t/gPRLz2w9wc=; b=GIa/SO1OUyCaIcmV
 2ikfWvOTGD/N41J0XUg8htRQ+32zMAJlt5xgSd1pppFAQ0J0HBndSzJj+GEwkdMK
 yHgB+qnm4uesnWnNyumId93IoL/16Gt7tOqXXLQRALBycBb1GZ+CsTcSD3YI1iOX
 GociqsyQszeyYfULj+5QbqSShT2sXAkIdnaCeiZ8b/DSWWi0TBZKIFTkLTdLFT0q
 qnEiipu4VWuvutXvpor8i98ym7jHoK/JcBkzknSP2MXbtC+Pz/Z5P17RhabBGG3E
 m49ubLpEz8nFLsVkYxzIGOjrR2B5oiheHuZuX+Y9XzJWTRBsLTkzcw9YlR97WZPj
 vT+z3w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u3wnmp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 01 May 2025 15:53:21 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c5466ca3e9so25557085a.2
 for <freedreno@lists.freedesktop.org>; Thu, 01 May 2025 08:53:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746114800; x=1746719600;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=e0jMJ9FtUEXRGsb2EEzfZbnaOe4VQC+t/gPRLz2w9wc=;
 b=uCaLDC9ZFdks/yJd7TyQU7JO5Y2qm3kyll11Z10EUy/kf72MkAGtWUqNssD3GhGPk3
 cbsDl71Xc835gUKjKf7YXIJB993De0bsOcipdYbg7AibTOIF2XM63Ne2Q+rl9Miz68DH
 FKY/eRJ6ytRM/cCXG7hyK4fHTd4pKTiHOTobeRgS+TGZQKvMf8gzawCOecmwNMHKJDz2
 bNt4ormBA32+huY3/s22EsBoT2NlrMj5jtO2mMtNinX7NEQfMzpwenO/96vAGHtX5RD0
 7dQFocyFdCSE32ydoVMBuV1wEZHbjXNbTMJoL5foqRvC3JV957POM2YZYV2mFvqDawib
 KGgg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUkbCWRMaZgD57Q6yHx/qn2ZJybnqHPvWTFac/GEQek+vyZu1vthz/qXNRJK1nwJrJY+0mhS5g+y1U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyb6qZieyV9Wy7VtlQW8vUyXR2/9biTa9puVelIJ/YhhcIbFi+q
 ddXn2vPIbOlhynRW6IblBB9KdojSqUq8MbjOHdhcqXgNs3ngxR6qgj3O0h/9zgxDWwLTrH1AGw8
 wC4G1J8t/iW+QxnxASBa6s5cHbHNkYGN6cVOvdS3MBA7t2KIsEE1ggE6zYr8BYR+36oQ=
X-Gm-Gg: ASbGncv1EQrfHhUDzG/XNWGVhulPdnAtOy/Ju7Bn6/9LZiqCuxPRnDnLunTwgt8+PCZ
 rZHva9jd5RkbVG9dDTZRGb9ajuzUDvMr+xkNnfS3/EIXDLywe+c53lQTqxi3cNnZDuSdNA0SS2O
 SkG7U+29btCt1UZLee9EY7l4Lwk8uwY3DLzc8+f5TNTPvt4svzBHtFVdfFVLa/gbGDv680LXrie
 6iHoBkOD/O46dCGXlLMhIV6aDjYFgzsLj8EhSGnlonJjnkrGj38tTUqHmlzUAuHskofH1CKLZH0
 cDobfNbpD5CmLG2MdE7+aIuKmz2LNwQCM7/lnrgHFK55sjUObsmDphcTyT6yR7gVAug=
X-Received: by 2002:a05:620a:40cf:b0:7c3:d3a0:578d with SMTP id
 af79cd13be357-7cac88397b7mr412122285a.14.1746114800358; 
 Thu, 01 May 2025 08:53:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGjkDWZYxp5ISUoJ4Ti9lg9jEL3XcSgYQbAqGImU3wp6ixHLFW+pV+VENpXRoH9ZN2mgChWRA==
X-Received: by 2002:a05:620a:40cf:b0:7c3:d3a0:578d with SMTP id
 af79cd13be357-7cac88397b7mr412119785a.14.1746114800013; 
 Thu, 01 May 2025 08:53:20 -0700 (PDT)
Received: from [192.168.65.219] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad0c7122a5esm57713366b.86.2025.05.01.08.53.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 May 2025 08:53:19 -0700 (PDT)
Message-ID: <d73c6151-91bb-4c96-ad2a-972ad392624b@oss.qualcomm.com>
Date: Thu, 1 May 2025 17:53:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT v6 2/5] drm/msm/adreno: Add speedbin data for SM8550 /
 A740
To: Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, neil.armstrong@linaro.org
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20250430-topic-smem_speedbin_respin-v6-0-954ff66061cf@oss.qualcomm.com>
 <20250430-topic-smem_speedbin_respin-v6-2-954ff66061cf@oss.qualcomm.com>
 <13cd20c6-f758-45ff-82d1-4fd663d1698c@linaro.org>
 <886d979d-c513-4ab8-829e-4a885953079a@oss.qualcomm.com>
 <b838f9bd-0537-4f8d-b24b-d96700d566c8@linaro.org>
 <98a4ad20-c141-4280-801e-015dafd1fb39@oss.qualcomm.com>
 <a26213ec-808f-4edf-bb0d-ab469ee0a884@linaro.org>
 <281ab1b6-498e-4b29-9e15-19b5aae25342@oss.qualcomm.com>
 <63105bce-6b8e-4b99-bca1-3741f27ea25a@linaro.org>
 <892fc1eb-efd3-4fb6-9110-2df3349960a6@oss.qualcomm.com>
 <b989522d-bd41-4d76-91a9-3cf680214003@linaro.org>
 <f5734944-1ed2-4acc-a015-0c638c331bbe@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <f5734944-1ed2-4acc-a015-0c638c331bbe@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Bv6dwZX5 c=1 sm=1 tr=0 ts=681398f1 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=-MVukwTEXeiimiWxaQcA:9
 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: rmO799dAHKm53Ia4LbnqDU1BIJfnoWVx
X-Proofpoint-ORIG-GUID: rmO799dAHKm53Ia4LbnqDU1BIJfnoWVx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAxMDEyMCBTYWx0ZWRfX9G3GDMnjvf4Y
 zikYd/4LRdsBPiBMF48DSnQdZj8dZ/9pfmVxvWzkIs3vXoBl3CZxo74swglTKGxA4sdNuRo2/EP
 jg5guZBYKWTniGiFgIQcZkpqbaYqMoYG2F9RovYXxAQoHmv35UXj24+N8JKZMeOL/2Z6R63/hX6
 N5rN0Kbh+I5oSkifYHYNPv8yK5zFSFSmCzWsF5L25fViJTGe4EW1iliCyg0vsKjJoy2/mgdRm/r
 qTOkJvXQdzhtV8n8hKZ2DoWxzIfBeNiZHEtJ8rsacuhJONTC0fCt0qc5lQaW48tr0pOtHDr7Lj8
 O6KdJ6oe6onRIeuFt6gzE9M1Nt6O78dj4PZP0e6PdleeXeOCn7vIBtm89nKi6Z9ipX1HpxrJLgY
 WPkX81evHUm1EP9Tn22FEd5MBP3zXSX+j38AoGwkaWnUtyA/pY7v0UE0jyDr0EUYUWpScPOD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-01_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015
 mlxlogscore=712 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505010120
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

On 5/1/25 11:29 AM, Akhil P Oommen wrote:
> On 4/30/2025 10:26 PM, neil.armstrong@linaro.org wrote:
>> On 30/04/2025 18:39, Konrad Dybcio wrote:
>>> On 4/30/25 6:19 PM, neil.armstrong@linaro.org wrote:
>>>> On 30/04/2025 17:36, Konrad Dybcio wrote:
>>>>> On 4/30/25 4:49 PM, neil.armstrong@linaro.org wrote:
>>>>>> On 30/04/2025 15:09, Konrad Dybcio wrote:
>>>>>>> On 4/30/25 2:49 PM, neil.armstrong@linaro.org wrote:
>>>>>>>> On 30/04/2025 14:35, Konrad Dybcio wrote:
>>>>>>>>> On 4/30/25 2:26 PM, neil.armstrong@linaro.org wrote:

[...]

>> This behaves exactly as I said, so please fix it.

Eh, I was so sure I tested things correctly..

> 
> Konrad,
> 
> iirc, we discussed this in one of the earlier revision. There is a
> circular dependency between the driver change for SKU support and the dt
> change that adds supported_hw bitmask in opp-table. Only scenario it
> works is when you add these to the initial patches series of a new GPU.
> 
> It will be very useful if we can break this circular dependency.

Right. Let's start with getting that in order

Konrad
