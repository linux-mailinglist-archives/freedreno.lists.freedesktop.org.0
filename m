Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B688CA82A17
	for <lists+freedreno@lfdr.de>; Wed,  9 Apr 2025 17:24:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EB9510E217;
	Wed,  9 Apr 2025 15:24:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="EFiRCzNG";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00A2110E962
 for <freedreno@lists.freedesktop.org>; Wed,  9 Apr 2025 15:24:19 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5398Bv7S028988
 for <freedreno@lists.freedesktop.org>; Wed, 9 Apr 2025 15:24:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 iSEdhEE9O0vxrvoKCNZ6yKSgTtfiEfE0Zo5ss4pb3gw=; b=EFiRCzNG6/T1PPJA
 TaQUktXzRdoz8uFOk3nWY0YuaWLVIzx5OV2bfrjrPmo2bfGQUuwT0JA9o/u+eeLL
 lPkG8kjgw02LisBnRg5CTQEkJOyWpHjwi9xY+RdrYR/H6iGdMk2SZSRuxmyrzmal
 nfYBeKgs5mq8QiA36bi5lJluyr76AZkIL0em8ddACBUYA7BiWxbblGqWGTRwvMr+
 G5t/mY30G74h5IqQpLGf0h1foCMuYFDg0Kp6vmyS147vq06iSfPh5GaNxYKucDaJ
 ntqIFy6n/A597J7RCNJKzLZG0b8EMOx4F/Cjywu0xf2wtCYrqTPOTAHRBKuDr4nC
 XD5t5A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twpmbqha-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 09 Apr 2025 15:24:19 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c0b0cf53f3so1060799585a.2
 for <freedreno@lists.freedesktop.org>; Wed, 09 Apr 2025 08:24:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744212258; x=1744817058;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iSEdhEE9O0vxrvoKCNZ6yKSgTtfiEfE0Zo5ss4pb3gw=;
 b=Jeo/vIOKpFIS9N2bJRRNUuY9ib/JVnq/hfuibkrKG4S69ugegmFXdpzxdrMYuIvQ7R
 J8ftCdMIn5dCg6KrBI77L9YF8nMGHrFDeK1UWoqLJoPZH9YP+GPLlkKcwMtMaIXqDXcZ
 1pqctz67Sw/6k7sz/fdFjeu6ulM7WZ65oMz/X/0qMcyLP0qzDzMPKB5jdTMxHfULXLRb
 2XyHTWj5lMcKV6aYR6Q/prkkghf/F6kpf3PzAAZl+1bU/bzdwLSb0Z1wKuNrrTStrVoa
 PKVcbOjss5XRsGamtco+P6hzKmFiL8GlpaDyQsH1FJu/1qo8L9NqfDr8ebKUjQnyzDqU
 IZeQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUj6VOtCAtw6Kob4lZHo4QeKvTGoRapQGy7NIfi+nqcKkKWk6RNJfdSPK5Ck9Fp6npCGZwVxQHJDoU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxTl871STz8Fw+mlkAdtTujlU0eL/i5nwQHbYSFils3u/eTsKRz
 BrjdCSV+KieCU3yOFVHjnYB+6WhutjEvbvuv9kSMlyESTv+MFSBxJmwy/O4Q+008r7jsvifcgZi
 WJDdte+COUpICx0pPEqlm550QBce/SewVThFlMzurfuOX8d5VhrRzwOH/hFh9nwcfnRQ=
X-Gm-Gg: ASbGnctQaNwPPPkxeD/JFLlGgR9cTC3cfgM3lWwe4lHS7tR3aVs05Qej3byl+6wOuoQ
 bmB1AJ4PP3qSz6MVh+4OnVuF9nn6c1jcfUwXltA3b9mByql+TWPl6ajUphd+uIMH48NbX6CbT+r
 qRSY5G2u5PcdvDCbtltX+/51sEzdAJA3IKUAcQzGIU8rYgUtGNV4Tb4tp3n3+SDetYF4bP54+CU
 WVCp+Xer3edPQM3EKvTJw60uhjQ6rSIVFYrxs0/QyPNw6TrgHokwu7mSCgnBDXSFQ92BM61nmIn
 pLFCgZv/yCMMYK2y0YBV9ZB5nKpirK+2CpszAbEmxQD0ek4ITRtBxsgWw3psMlXGFkE=
X-Received: by 2002:a05:620a:2993:b0:7c5:6396:f161 with SMTP id
 af79cd13be357-7c79dea5d09mr378449085a.49.1744212257986; 
 Wed, 09 Apr 2025 08:24:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFQkqDfpPuYUxfxue/jjgomLcIw9q6/vjQALlKCjI7C3s2CfhqPDQQmOQw7VtultNfkh28MJw==
X-Received: by 2002:a05:620a:2993:b0:7c5:6396:f161 with SMTP id
 af79cd13be357-7c79dea5d09mr378445585a.49.1744212257661; 
 Wed, 09 Apr 2025 08:24:17 -0700 (PDT)
Received: from [10.187.209.180] (37-33-188-210.bb.dnainternet.fi.
 [37.33.188.210]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30f465d5078sm1922631fa.69.2025.04.09.08.24.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Apr 2025 08:24:16 -0700 (PDT)
Message-ID: <bcc44dcc-8b8a-427a-9a38-8dc6d59c13e3@oss.qualcomm.com>
Date: Wed, 9 Apr 2025 18:24:18 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/10] dt-bindings: display: msm: document DSI
 controller and phy on SA8775P
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Ayushi Makhija <quic_amakhija@quicinc.com>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 robdclark@gmail.com, dmitry.baryshkov@linaro.org, sean@poorly.run,
 marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
 robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
 conor+dt@kernel.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, quic_abhinavk@quicinc.com,
 quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
 quic_jesszhan@quicinc.com
References: <20250311122445.3597100-1-quic_amakhija@quicinc.com>
 <20250311122445.3597100-4-quic_amakhija@quicinc.com>
 <20250312-calm-steadfast-cricket-fe9dd8@krzk-bin>
 <654d409e-2325-46e7-a064-ed9e64277e69@quicinc.com>
 <a168a473-c363-4041-8e3e-84fa44e92b10@kernel.org>
 <zpmr6cpiixyu2sj7r7oqpqsge6dcqw6xszldf7ugznmcrxqsme@efiwnggcn5qx>
 <a654d62e-502a-4a47-96c4-a44c14860e54@kernel.org>
 <767e11cd-e338-4e00-a8e7-2e15f3da84b4@oss.qualcomm.com>
 <04d90c1b-1b73-4b6a-b7fc-351754fbb16b@kernel.org>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <04d90c1b-1b73-4b6a-b7fc-351754fbb16b@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: nvED-0_T0Hz5BBnvxLUdEKLdg6ueeGSy
X-Proofpoint-ORIG-GUID: nvED-0_T0Hz5BBnvxLUdEKLdg6ueeGSy
X-Authority-Analysis: v=2.4 cv=MpRS63ae c=1 sm=1 tr=0 ts=67f69123 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=gh1egkeLKbPt9jDVRuYeUQ==:17
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=RsVwZTJSaPieSAYsOaYA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_05,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=999 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504090097
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

On 09/04/2025 09:07, Krzysztof Kozlowski wrote:
> On 08/04/2025 22:26, Dmitry Baryshkov wrote:
>>>>>>>> +          - const: qcom,sa8775p-dsi-ctrl
>>>>>>>> +          - const: qcom,mdss-dsi-ctrl
>>>>>>>
>>>>>>> Drop fallback
>>>>>>>
>>>>>>    
>>>>>> Hi Krzysztof,
>>>>>>
>>>>>> I couldn't understand the meaning of "Drop fallback", could please elaborate it ?
>>>>> Look at SM8750 example on the lists. Keep only front compatible.
>>>>
>>>> Why?
>>>
>>> To make things simpler and shorter.
>>
>> I'd prefer consistency. Previous platforms use qcom,mdss-dsi-ctrl.
> Then you should have objected month(s) ago when Rob asked for dropping
> fallback and since then we consistently drop it.

Well... It's still not merged. is it?
For SM8750 it kinda makes sense, because the clock handling is different 
from all other current platforms. For the existing devices... I'm not 
that sure.

> 
> Best regards,
> Krzysztof


-- 
With best wishes
Dmitry
