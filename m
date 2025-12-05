Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76FD4CA727F
	for <lists+freedreno@lfdr.de>; Fri, 05 Dec 2025 11:29:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C11710EAA8;
	Fri,  5 Dec 2025 10:29:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kxcX5H4y";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HfkFpnSz";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ED4510E1B5
 for <freedreno@lists.freedesktop.org>; Fri,  5 Dec 2025 10:29:19 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5B554Hjj3529435
 for <freedreno@lists.freedesktop.org>; Fri, 5 Dec 2025 10:29:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 T+P9UihzOlxTBT4XtK2QWIlMPWzgt0UAZU+mnK6obDw=; b=kxcX5H4ywgSX9OBY
 QH0Tob7BhgQrSNpKOE10iCo30tGUGekHrB4z4ilYFsMy54VaVx4wZyJ+TSRbGa3h
 RzhPMRvNf8FS3ZLxeAQbvomHIleBpKgxjMHk/Xbb+6rddAcVz8MTRzPcoLoxNjzP
 KE3kn2G9vDkW8tsBVV062h9MSCwEGtfAgp4KGiv7OZDKo7I+0rgQ1Svj1dH67cdL
 jnpkgW0Nl2baxSxO/4aCvwoLrVXSNTYAO/9BSDgzNNPUpF5H2pe4kZNC2zwP/Aow
 p+i53KvxELwPQuC/+Lhcxdfo34yW3NXj5qZDS+qCRSfcMq2dPjMt0yE2R7R9fbLC
 obnXRA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aurwvgux8-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 05 Dec 2025 10:29:18 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-29806c42760so58446675ad.2
 for <freedreno@lists.freedesktop.org>; Fri, 05 Dec 2025 02:29:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764930557; x=1765535357;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=T+P9UihzOlxTBT4XtK2QWIlMPWzgt0UAZU+mnK6obDw=;
 b=HfkFpnSzL5oV4WbBsy27WUjsgC21tDkA3uMaZa3ELFSiRGNjuloTCjmJjQvhVPE/mp
 RlkUYfGKqLROj7d9kkYLiOi9bbk+qiXM0gwRhbs3ZjsC4RcripUQvgYbvIb0xqQwQwyG
 BdT/cFeqNCgEca95KEKfloNS8BfswkXaTxsUdYsJP8vMBboBUvrNJIxxllDFLXh3eTxi
 ZcdI63o6yAxkJ1VpDRDRzAb/adkgON9zJWjMAxwtop7Cm9tyZpImkyGlT/my+gTKU4pw
 4xo0TdZKyZZ5jLP+BMLgP1uIw0vOOjdVpV/WWI0aMu1OSYu2x0kkbrjz5xGbXEjZCU8a
 sTpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764930557; x=1765535357;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=T+P9UihzOlxTBT4XtK2QWIlMPWzgt0UAZU+mnK6obDw=;
 b=qkUBjg85SthhVR49+ruKDh/DuWlzCGweCeq9oc5YODbApKrAAczmneIzNRCeGhGTHC
 HWAsZIjDBwWiKBUhIBXAGGdXgvW9PiCZeHTzSPzkCPmCvHQCTY6nQCInkZkbPs9TqneU
 cg5MC15PPIEHqU7TBtUGNRsxtXB52SxRja71gCWuLD3KK9AGOoUhd173pNpB8b1wWdoU
 T6EOG7rN1OdJFoPQwtWOTkHcbe2bfffPRWMfCGNrN2MTUEDTGBQodEeKvzwTxkJ83Rbr
 SkVLHaZJAcQ8WG2Z2Hqab1io9AeAsU8vNrOIurSMi7x1mKV1u6kg4NV2NgZumWCBlciY
 nLIg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXIaq5c2ceegGz6/BEQqmUgSUzzTAXPKhkrj7vN5lY7U+Ndo61Fjan11c5jUQkCayj2Xq300rXR5bU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzg9o0K5FTa/rYJzcYHoW+to90OMgy4B5BSTyWAmFZuaqru9cHu
 Egfq+SvNEE8HRTw+uODar4axKlIfUtbC9otXof93J1J6vhP+4JwFWt3SLlTEHJpgyZDrPB3D0B9
 sfCdAjx2ttQ/QOs0bhym9HQQBC0Trpw0Pj7NVN4Cmn9qux0TOkcknV8VvB1qN58S2kG6J/Zw=
X-Gm-Gg: ASbGncvEVzH/ND9mkvCMT10bDP3XVng398cRBi/pZO8UFMnTmBP2yA5m8Uqrwj5FINq
 YZcn4H5kbZ5iWm9RLkQaNymKcLUATnsLKVcSucmfoDB7KwWYPU4m2mlqTPowbAcL0ErOy/aQ40E
 0UX5r6qCpCa078jmEssf6kDmqBXr51sGFM1/xgEME9r6BRH4XRAWXwpXsucQmudd+ftfw8cx4Er
 vAEvyMT/vP5SZdrcMJgOViks3DlOJATmROze/w81SMTOt+TIV25Y4NYAtpb2LmlQBsfi29TKTkc
 AFaTR4yAkuoET+MUDtdk9NE9Nq0qH677ORkXmgYnj03xaJnGuKvujBmHFguzt2l00w+nIFRhPfR
 tHJ8e9vzvjHRcOqvspNieU34vFxiVN0Vh9A==
X-Received: by 2002:a17:902:eccb:b0:297:fc22:3ab2 with SMTP id
 d9443c01a7336-29da1ebb0bamr73863315ad.36.1764930557399; 
 Fri, 05 Dec 2025 02:29:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFh7HpsBEyO6ilZG7nPGO6ymE5SmKKfCKSfDxDslOX7vJaR3rccD+YDhq2XPNdO+dSiRh2JWg==
X-Received: by 2002:a17:902:eccb:b0:297:fc22:3ab2 with SMTP id
 d9443c01a7336-29da1ebb0bamr73862905ad.36.1764930556932; 
 Fri, 05 Dec 2025 02:29:16 -0800 (PST)
Received: from [192.168.1.4] ([106.222.235.197])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29dae99f6a9sm45456135ad.65.2025.12.05.02.29.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Dec 2025 02:29:16 -0800 (PST)
Message-ID: <90bc84e7-19ca-450d-b41f-fd96367e8cce@oss.qualcomm.com>
Date: Fri, 5 Dec 2025 15:59:09 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] arm64: dts: qcom: sm6150: Add gpu and rgmu nodes
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Jie Zhang <quic_jiezh@quicinc.com>
References: <20251122-qcs615-spin-2-v3-0-9f4d4c87f51d@oss.qualcomm.com>
 <20251122-qcs615-spin-2-v3-5-9f4d4c87f51d@oss.qualcomm.com>
 <8560ad26-4756-4c2a-97c3-2c5c0695172c@oss.qualcomm.com>
 <z4gqro2bx6oq2ht75m2klogo5dsirb74tmc3u3shjyalxmaxil@5sy7ufmqhdgw>
 <6fa1da5d-9ea7-4d72-a03a-82edc4bef099@oss.qualcomm.com>
 <3gqq3w6ovy5srgvabyeugsjbwrhaxmjvicykhjmlcxd74gtsaf@5u6wvvzeq52z>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <3gqq3w6ovy5srgvabyeugsjbwrhaxmjvicykhjmlcxd74gtsaf@5u6wvvzeq52z>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDA3NiBTYWx0ZWRfX0bTdNvSsKd0P
 AiUDlGr3YLKzFoe/ugrHwU+e689i3En5zH90LN8lkwB11wirc7uij0oyybIaSfk7nERCi6kmlCo
 yh4Fp8OfjdBZSPBmg/s3bQEfyaKI9yNRcyT+S6qZwoahOEK5Nw0TrlIVOpwQrefbH0ZAkPeBzWK
 RW0bcUsz0yO5QVfjWh0YJJ7tAMcNwLMSXNVKVljzeGtGACPEGUGoiP9RKrk8sSBEwfTvK9nWvYC
 BYfkx77NAg36HE5e9lZfzg8p+pDcPfW2Mo16icM2+2JF4GpZqJdVl0UlU67BBiGzTg3tm0/qh0l
 dT8/J8XfoFFMnIc87ypRr18d9lFmdoUu3yUcXsCIon5KZhPbsZ62MW6bWjGyEbDTJV+zSb4EgSS
 1PlZMTqoyqx+8FfSCvFPkDh+9rmx5Q==
X-Authority-Analysis: v=2.4 cv=Yd2wJgRf c=1 sm=1 tr=0 ts=6932b3fe cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=jBSxni06C9HboLYAjQ55wg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=PFMJV2I6qJKDnvYOCoAA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 9tWvK3DT6EW_xI9px0TDDjHlwXFHEZ40
X-Proofpoint-ORIG-GUID: 9tWvK3DT6EW_xI9px0TDDjHlwXFHEZ40
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_03,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512050076
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

On 12/4/2025 7:49 PM, Dmitry Baryshkov wrote:
> On Thu, Dec 04, 2025 at 03:43:33PM +0530, Akhil P Oommen wrote:
>> On 11/26/2025 6:12 AM, Dmitry Baryshkov wrote:
>>> On Sat, Nov 22, 2025 at 03:03:10PM +0100, Konrad Dybcio wrote:
>>>> On 11/21/25 10:52 PM, Akhil P Oommen wrote:
>>>>> From: Jie Zhang <quic_jiezh@quicinc.com>
>>>>>
>>>>> Add gpu and rgmu nodes for qcs615 chipset.
>>>>>
>>>>> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
>>>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>>>> ---
>>>>
>>>> [...]
>>>>
>>>>> +			gpu_opp_table: opp-table {
>>>>> +				compatible = "operating-points-v2";
>>>>> +
>>>>> +				opp-845000000 {
>>>>> +					opp-hz = /bits/ 64 <845000000>;
>>>>> +					required-opps = <&rpmhpd_opp_turbo>;
>>>>> +					opp-peak-kBps = <7050000>;
>>>>> +				};
>>>>
>>>> I see another speed of 895 @ turbo_l1, perhaps that's for speedbins
>>>> or mobile parts specifically?
>>>
>>> msm-4.14 defines 7 speedbins for SM6150. Akhil, I don't see any of them
>>> here.
>>
>> The IoT/Auto variants have a different frequency plan compared to the
>> mobile variant. I reviewed the downstream code and this aligns with that
>> except the 290Mhz corner. We can remove that one.
>>
>> Here we are describing the IoT variant of Talos. So we can ignore the
>> speedbins from the mobile variant until that is supported.
> 
> No, we are describing just Talos, which hopefully covers both mobile and
> non-mobile platforms.

We cannot assume that.

Even if we assume that there is no variation in silicon, the firmware
(AOP, TZ, HYP etc) is different between mobile and IoT version. So it is
wise to use the configuration that is commercialized, especially when it
is power related.

-Akhil.

> 
> 

