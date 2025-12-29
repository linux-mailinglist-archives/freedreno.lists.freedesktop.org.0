Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 735E8CE81B5
	for <lists+freedreno@lfdr.de>; Mon, 29 Dec 2025 21:09:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F2E610E69F;
	Mon, 29 Dec 2025 20:09:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="WKS8R7U0";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dBx9tDzJ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F88110E69F
 for <freedreno@lists.freedesktop.org>; Mon, 29 Dec 2025 20:09:34 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BTJr3Xf2285911
 for <freedreno@lists.freedesktop.org>; Mon, 29 Dec 2025 20:09:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 f9tLp6hB3CCjo6tl7cSfSd8cgyhOHRdEAok0lYgrgqk=; b=WKS8R7U0ELykYWeg
 Rk4296f0hNNWP+N8zzag4y6s1ujDPXjrEDOv0QQV08agymcEPJ5xJqpFvkT4JZyx
 CAS9/LVqE7mLe3aV4ta5mOaaYicWhRjJbb3NeObo2a1/jjv3ObcZN1qsWVD/WV7h
 t9+T+nJhoW6QsfaIXqO2cWeQH/N61XHVGYVNCruZRoNDLh6bjc8HBs6BLW8e5bKH
 MRNEyeRzEocpHfH6jvQkCr1PtaVxspAumvsimH034KNgljQGiq9uwSPKDDEOw6yK
 YunUCiY9gmSnAlA2+zRSaKGARZC1usbGioje+NRHKvrkZu2wj5noFmFgis0G67fF
 GGUMuA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc06gr131-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 29 Dec 2025 20:09:33 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4ede0bd2154so29979521cf.1
 for <freedreno@lists.freedesktop.org>; Mon, 29 Dec 2025 12:09:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767038972; x=1767643772;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=f9tLp6hB3CCjo6tl7cSfSd8cgyhOHRdEAok0lYgrgqk=;
 b=dBx9tDzJXiiOR5o7gb1WmVUw8+FbT7RkmzKOqcmcvntrOtbbFlFd7J23pGQWcEg56X
 K4d9phXAM6xgMBBRWWYo+5ULgUYzcTmU34pRdEoq4bC+1Xa8UABavk3W3VWW1ilW/8b1
 KW6kAWlIKOtqS6KOrR93LnGRLI4JhqsCjI5bN87M0cFPmrDxRSrXvHTA0U3DKVuwPVSN
 woty4LK24T43ekzXFIhbZEIW01yAecemjigfj5koyZxDT/gLsaD5BluNwJUKw2IYbhjb
 A0zOUpygqeBpsmACgBFtzhSHw6w5KWnmTif1RXFnY4Ol8NiHAGt7cQ5phogJdG3A5Xta
 HQGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767038972; x=1767643772;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=f9tLp6hB3CCjo6tl7cSfSd8cgyhOHRdEAok0lYgrgqk=;
 b=Zsr515H2Ql2RWevgfq6TR1KNU/jTMbnqnXGyz19+HYz045xQhD6gezsPFGw+d6Q+NB
 ixQ8huJP1he2DaN2jM7lZmsgNKdfb7GJw27p+/zflGjIlC56qAo1injthHXPIziq1WgS
 8olJFMNvG5BBWNHlxJuk4BEV+5NJFHYsU7mjIGNFv+PnRqmmEoxFMez9H276ifSDQH7J
 XLpA9tPd4waGcv4ntLfWUXwlbN6452FHpP0RXLBVYkJCtSOrJyOM52co2niEoPkH6lYv
 Y1p46F6ywgPaQVWuPRB3fP4fGwtL4KSDOxCBS2xg0sxEeVlpVecgcvtjX74fwQi3qCFR
 rflg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQhT/b8WigxBOWTCxxPBk/WyiW5N0Jnvxn4H8OlPg5rnmuBmqB6mi/uLujUCoRUfX4w8YHED7orJQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzG/HyBIa9c8K9laxD7d3I25S6wIZJOZ1Uzf4mjZVTTBIAuUFpK
 8ji9pe+hkMJCBiXXdRqP9FtTnOxSZmcjOdtYRccrswK1F0IJFC8pcDJ3kyRbNZntqRpiV/9o+dg
 dhMkpPATncc6k3gkgbwxycxkEnOD45Jcms/yMoj4A/PDgz1yhQ/Trm0nuC7czasW7WYS/KPY=
X-Gm-Gg: AY/fxX7givlRLAeLAGFoe9xVEzAotb4zvqzlw4UOdWT5Qd5q8l5HbRs1Z5aWnlt0nJS
 RBKdybW+S6vqVvzDHlgC3dV7efcC+9A1XfqrUgoTN8e4XCRLPYSEmWZWHPq38Me+lNI57+s3+qQ
 qiOEpX4Lp8NkqMTN7K/HpSePX6rr5aSwIjI1xYjr/LQuktKt6bhy8cqiOIsJQz/bLijY+v/6kbD
 5w1BsDvDMGlwULENE+TQoGdvi+OBAw7hmkz+Rn8+l+f6NzLu/z0MOf/UI7v/WEwaFaSg6LvGy6B
 NlTm0Vq4rOKiDdLEcmZW3/gWmJQXx2l0FwKdak7sSbVhHJPdULjH8xQ916jaQ0xzcQtoWijypaA
 U4YlhKvDXLPBfljTOG5UTOZre/FiWWSX4WqSFuTN2QKPXtLEg5EN2qz1jwJ+9Q62zLw==
X-Received: by 2002:a05:622a:1819:b0:4ee:87e:dedf with SMTP id
 d75a77b69052e-4f4abdc433cmr358682411cf.8.1767038972466; 
 Mon, 29 Dec 2025 12:09:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGm0o4PJ1efZdK7cCCaywgTcLp9LChUwOU7faNlTclPAySRBXp99GhA9cWhyaw0KrIm5+FEdA==
X-Received: by 2002:a05:622a:1819:b0:4ee:87e:dedf with SMTP id
 d75a77b69052e-4f4abdc433cmr358681971cf.8.1767038972051; 
 Mon, 29 Dec 2025 12:09:32 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8037f0cb27sm3352659966b.51.2025.12.29.12.09.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Dec 2025 12:09:31 -0800 (PST)
Message-ID: <8a64f70b-8034-45e7-86a3-0015cf357132@oss.qualcomm.com>
Date: Mon, 29 Dec 2025 21:09:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: display/msm/gpu: Narrow reg and
 reg-names for Adreno 610.0 and alike
To: Krzysztof Kozlowski <krzk@kernel.org>, rob.clark@oss.qualcomm.com
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251227110504.36732-3-krzysztof.kozlowski@oss.qualcomm.com>
 <CACSVV03H_oii=fuhaeBhUZSJk-2mr08jGqAs30Z_h9tzeDgdtw@mail.gmail.com>
 <2a35d31a-1a3e-4cd4-ac3a-27104ff12801@kernel.org>
 <CACSVV03FfvZVzuKGfaJrsXmE7VVxEF5zN4-R7h1PXA11jOO3gw@mail.gmail.com>
 <8288af85-13da-46e3-8d89-71995fbd17f8@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <8288af85-13da-46e3-8d89-71995fbd17f8@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: AlDyvEoD4Ao11WVAfBHT2vJSmKHQs-yq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI5MDE4NCBTYWx0ZWRfX8P18A6lV6Mpp
 tKGgDkeM3piah2xFonvt901/DTZPtv9vymqQWKTXdqEmJAg/utgdqtEPdX/sp62LRJ3Zg1cgd9m
 I1PCnIbVLetzx1wsTQrvgCY0Z5S9woMl7xetyomdZdWW7f1772wylv/XmWYmTJYwfHBp3yFXqI3
 PipjFuk8KeeMOnRqfb+e9+FKrCyaCZmrRnQMPgNlFQjOE8J9MKxVr7Q6S1FXqAVhV7W/m68Saej
 1LS4BTqIR7pVgSnUeSPFo5bmMKbEFpfjIV+mTxX+m4x0PUhtpNQIIfZXEJkiWULISsPHvuFKJLC
 +e5LRZjUU/wuficV3hi+2epmsHHg7hJSHvp6oBv/gsXBavD1ZjKpkzsuHucsws8VgSa17RoWutz
 LfHNNIKiUAdcbqKb3TNdU78jY8ry9zhkWB+PUU1QnkzPgOhUR2TYk9IRvQX5mXJQJNqw3xa7eRe
 JbynU124Tm7oHfKUoqQ==
X-Authority-Analysis: v=2.4 cv=A45h/qWG c=1 sm=1 tr=0 ts=6952dffd cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=wQVahuwBDa5KTzDLV_QA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: AlDyvEoD4Ao11WVAfBHT2vJSmKHQs-yq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_06,2025-12-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 bulkscore=0 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512290184
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

On 12/29/25 8:23 AM, Krzysztof Kozlowski wrote:
> On 28/12/2025 15:59, Rob Clark wrote:
>> On Sat, Dec 27, 2025 at 11:56 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>>
>>> On 27/12/2025 23:01, Rob Clark wrote:
>>>> On Sat, Dec 27, 2025 at 3:05 AM Krzysztof Kozlowski
>>>> <krzysztof.kozlowski@oss.qualcomm.com> wrote:
>>>>>
>>>>> DTS files for qcom,adreno-610.0 and qcom,adreno-07000200 contain only one
>>>>> "reg" entry, not two, and the binding defines the second entry in
>>>>> "reg-names" differently than top-level part, so just simplify it and
>>>>> narrow to only one entry.
>>>>
>>>> I'll defer to Akhil about whether this is actually needed (vs just
>>>> incomplete gpu devcoredump support for certain GPUs).  In general
>>>> cx_dbgc is needed to capture state for gpu devcoredump state
>>>> snapshots, but not directly used in normal operations.  It seems
>>>> similar to the situation with mapping gpucc as part of gmu, ie. not
>>>> something the CPU normally deals with directly, but necessary to
>>>> capture crash state.
>>>
>>> I don't get why binding was added with cx_dbgc, but DTS not. Neither
>>> binding nor DTS depends on actual usage, so I assume someone
>>> intentionally did not want DTS to contain cx_dbgc and binding should
>>> follow. Otherwise we should make the DTS complete and make the binding
>>> strict (leading to warnings if DTS is not updated).
>>
>> I'm not sure about the history.. but I can say that cx_dbgc is only
>> used for gpu state snapshot / devcoredump.  So it would be easy to not
>> notice if it were missing.
>>
>> We have a similar slightly ugly thing where gpucc is included in the
>> gmu map.. only for devcoredump.  Maybe we need a different way to
>> handle these things that are only mapped for state capture?
> 
> No. Either hardware has it or not. If hardware has it, then both DTS and
> binding should have it. If people decided that DTS should not have it
> (for whatever reason), then apparently that's the desired hardware
> description and let's remove it from the binding to match the ABI.

I don't recall why it was never added. It's

<0x0 0x05961000 0x0 0x800>

for both 6115 and 2290 though. I'll send a patch to fix that up.
It seems like (at a glance) that there shouldn't be much of an issue
with the crashdumper, but I'm not super sure either..

Konrad
