Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F758CD54B1
	for <lists+freedreno@lfdr.de>; Mon, 22 Dec 2025 10:19:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7491D10E600;
	Mon, 22 Dec 2025 09:19:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VSaJ5ahw";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Uc4AFgno";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 679C410E5FC
 for <freedreno@lists.freedesktop.org>; Mon, 22 Dec 2025 09:19:39 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BM7QJJp3153964
 for <freedreno@lists.freedesktop.org>; Mon, 22 Dec 2025 09:19:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 vr4o7vIUQRCHjNEoxlOElT3p7hjKLLaLIHeYAGpakxU=; b=VSaJ5ahweJLzr49j
 8JsM76SNDh7vetFymmgYpCl7nCFhyrhe81FPg/ljk10GAchrPbnVjASt7jh5HcBO
 KTFkJ//NgqUDoDexPO+CRjfPA80MCurqMvLbvnJMBF0tAB85hhmrEG5NDyCdFfl9
 AW+AQ0sJV2OUXSyg7oZKf1tfuCp6sXSenw6JfvGWmEcbbTFGndjuq3bSb+k3BLGC
 buqJ0v7YnYjmQJviyhlInKvJ4vcKubECyC2NuPDA4XcgEqjPup36Cw079L1yUUCs
 LPzYG2P6afVg7RZsz7lNoDDN+QcKvb5zaQdBzlLBfCrgNk5Bbr/HEBR60xus65oo
 EZmNmQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mtqmg4g-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 22 Dec 2025 09:19:38 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4f1aba09639so11378871cf.0
 for <freedreno@lists.freedesktop.org>; Mon, 22 Dec 2025 01:19:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766395178; x=1766999978;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vr4o7vIUQRCHjNEoxlOElT3p7hjKLLaLIHeYAGpakxU=;
 b=Uc4AFgno1ZTIBPu+u29uVQmw0oi7nsqMBq8vreMoBqkBikXGvtxu7tgYckx8IGgyQY
 jHpd31qh8WQHtgsQ2CWzHRqYly7ZKU/SATXdQZVVO7U/ImgdV9ojounm+ICBatYItqhR
 1MYXmLeE4qk3DkWK21rhORYHTzaS552pKviXlIvrir7HLuVRNe4at9kMujIVGKAEhiTR
 5bR2XHcfDDBjxNmu3yVEA4Tu/V2cSIwcyF9WrVNrcEVCgRaRzMo059kS4iVsW0oB3q17
 Bf+FUW6fJU48a8pHSpOTD5IMMk+FxMJkBgtQ0VHJxq36N2DZ3u87jj6KOCQOYFCOr+3O
 Vx4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766395178; x=1766999978;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vr4o7vIUQRCHjNEoxlOElT3p7hjKLLaLIHeYAGpakxU=;
 b=dR0pAu77dXh2VRMfrvuktKq7RRooRltl7zWqutuFoo8IRQK8KleHM9rO8PxOv9c3tv
 /NtJzSO8u5W6llgOu8Z4HvonSHABBtRdWuTEHMI97GtEIldncY8EWLMiyOdXkyQHfDG2
 u+GCOq9s0AzhWTR2LxpH4xvb2RlN8S6FvSj1xtYNV1VZPd/vGaBGlYHyo6lOjQOzKxGE
 3AoEF9pC0PMHm4i5rTQ6CDePO+KeuqQODiNqxXfJOKqTf+lqv2KH15q/obKwA67iq7k0
 RFm79FJIjpCc/+AwIW3Al+m20rACZrVWjJy1bCg7JN/PHIoDtAsGd9PCdK8NykdDqV4A
 /XBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXjn6kl2ShsU3HufRsNZ2G3L1ma4DpldSj4fs76q8rgqsrv7fCukcOmfb/WTaW2w7R/eHBb7GEL3Ow=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxiDJPFkmjaLtpqS4YeK9WlB7zP97iz34b+VEwJv9BFh727RTmu
 TWZRay5k+QchfzhiBkhH30aH55TYeK+Bq90zxLv6HjDbtc84ClllH9Yb1n5z9aevknjKwMDlwfa
 d1PoYX72Bibtv260XwcKsxDtAlawzWylCOOy2MuFdeTz7JsA7yjIThbaatOkBWiBplw5FIpA=
X-Gm-Gg: AY/fxX6ZCPeLpk4gwtwlhslPcTiFSeAZC3UTFO6vjxQLnDHIuS0Jh+tCrD5v81H5DPn
 C9o67YzMIe/2e9sDko0dmIi7FN3w3Lj5PO7HrVT59rb8/TavnQZASlQVnIkLwbLznl7Y81hq53e
 SeOgA01lAldbL9ugnTPpFwIUFN62Qb/ukKIKY3ddCxqcQCrmb55huDY8qZ6U8r+VuRqUDtzni4M
 F3Uxkk8KAcwBnzBZLVaZ10LB5Q0kFj/iTgF7j/mmkDR6Kzzr7oKFwbocRjHR8KXqTEEVvqQbs5F
 Sf8p2h1Wyzx+cKXGFfgQmcRtW/8MpVFgvJT9ftRWivqdYyL1TfpZsCVfzZ/CwvVfNtbTACPri54
 wJkshr+ulDilu7oNJDdvHAWl5oD1EEFsRgGwXFrwe1bJTj+DtT4Ty/kIY19cdiAqa2w==
X-Received: by 2002:a05:622a:1a9c:b0:4f1:96c5:eb29 with SMTP id
 d75a77b69052e-4f4abda6096mr112333841cf.6.1766395177798; 
 Mon, 22 Dec 2025 01:19:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF/2bnxdFBb/MQ/yS64tXg26YmjXwktYKlnrn7DI0rW66afHwTFNAr7ud/crT5sTAXD2eDuHA==
X-Received: by 2002:a05:622a:1a9c:b0:4f1:96c5:eb29 with SMTP id
 d75a77b69052e-4f4abda6096mr112333571cf.6.1766395177216; 
 Mon, 22 Dec 2025 01:19:37 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-64b9ef904bcsm9089567a12.22.2025.12.22.01.19.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Dec 2025 01:19:36 -0800 (PST)
Message-ID: <c6d9c05d-3c34-4d69-bb23-9c761858a2f6@oss.qualcomm.com>
Date: Mon, 22 Dec 2025 10:19:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 3/6] drm/msm: mdss: Add Milos support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
References: <20251219-milos-mdss-v1-0-4537a916bdf9@fairphone.com>
 <20251219-milos-mdss-v1-3-4537a916bdf9@fairphone.com>
 <475izg5bi56oefqtqkvqeyspx2por66zrw4tgqbb3f2ziaghyt@tccm73sl2u2e>
 <2f3c7bc8-8c7b-4c47-95de-7a8ac6dc3c57@oss.qualcomm.com>
 <9965e114-43c4-4470-992c-1051ff1b7f36@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <9965e114-43c4-4470-992c-1051ff1b7f36@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: YnXXVCZD8noR7ehvgWDKkc3wAP1A5n8p
X-Authority-Analysis: v=2.4 cv=dPWrWeZb c=1 sm=1 tr=0 ts=69490d2a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8
 a=lWcTiWiVgQmTcaRhBa8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: YnXXVCZD8noR7ehvgWDKkc3wAP1A5n8p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA4MyBTYWx0ZWRfX7V9kTVnz2/a9
 o6OFoIGaEpCk/Zcd69TnvGe3gIbdwu1fb8tnkQIiaF2dMWPnhD2Ses+fezq9jr0adRAHE4f7TO4
 DhjYEDa7lHFZFK9iAcYJxUbg7/6vM+Wbp8ZNMjvwzgURDoFRZzEY4qeniU0g5tMSy9T8h1xUs9j
 epaVhrUbyMltXkj4tfV0I/uQY3ZWNcADBWWoUaeO1s6ATOu6Fm36WicbPGsxExwxo63IwDskdgG
 8zGsR7pcusdEWQJtshg9yIFIABmp0MKBPfBC+sdkloVsrnwTj9W6TWSHo4g7LuJtcqEXPQVGp+C
 ZEYdvYWdSzSrlx2B6qr32OchQ5Iko/ohhGBT6eOlduXfNgVpgS1dalCYyfX9DJlpip3eP+tf4VU
 u7+E33KNeWf7DppV4KLtkue+30bGnK1s97VPGZWsKu9oDa1DNYBj13CCn1utraIkfOcspdZpGWf
 k2+9goxcAZ1cscVEIEA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512220083
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

On 12/22/25 10:12 AM, Dmitry Baryshkov wrote:
> On 22/12/2025 11:09, Konrad Dybcio wrote:
>> On 12/20/25 5:52 PM, Dmitry Baryshkov wrote:
>>> On Fri, Dec 19, 2025 at 05:41:09PM +0100, Luca Weiss wrote:
>>>> Add support for MDSS on Milos.
>>>>
>>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>>> ---
>>>>   drivers/gpu/drm/msm/msm_mdss.c | 5 +++++
>>>>   1 file changed, 5 insertions(+)
>>>>
>>>
>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>
>>> Though 14000 seems lower than the value for all other platforms.
>>
>> IIUC it's essentially "nonzero" or "first-level-above-just-nonzero"
>>
>> The downstream DT also defines a 140_000 and a 310_000 point.. though
>> the middle one is never(?) used and the latter one is only used during
>> UEFI handoff and upon the first commit after (runtime) resume
> 
> If I remember correctly, those are also used for programming the LUTs or other big tables into the hardware.

FWIW this is an interconnect path for non-DMA accesses so that only
makes sense - huge writes could overwhelm the bus

Konrad
