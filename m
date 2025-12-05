Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BECCBCA7D64
	for <lists+freedreno@lfdr.de>; Fri, 05 Dec 2025 14:52:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 867F110E8AB;
	Fri,  5 Dec 2025 13:52:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="UjSsiyO6";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N3BniOG0";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B5A910E1DB
 for <freedreno@lists.freedesktop.org>; Fri,  5 Dec 2025 13:52:17 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5B5DinDp3522346
 for <freedreno@lists.freedesktop.org>; Fri, 5 Dec 2025 13:52:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 o7V7r+I6IooNEU4koE9324VpoXcXhiIl5w5a8ShVyPM=; b=UjSsiyO6Kd/v6/N+
 tax2toYtJ/RVLXX//FUGyXlk95LGs8eh58dMyl5HiesmF7LntLBFOKUWrIX9DUQT
 OlIpC/FHsTk5jGCHbhnLkcn83qTduyPZ9u9lMcmQKu3wyF8KVmb8ShLbgKNu0Ktk
 HAV/wiD+SVsdGLPfKNnxLhbQgtacDS1foXORBW1vx+bfc+qEdgk25/o722iJ0O6F
 vBObym1B128TFOhdr8ZYJl2IEuK2SV69QuiJWtDcOBhdVpJwpdF0KvSSmJ686x0A
 N4vn+eG2KaznsuxGo7WLjPRwrz1XqPMyahnI4Soj7l6uv8Bu8Wi+SlmuAz6DD2qr
 z5y7Ag==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aurwvhcbj-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 05 Dec 2025 13:52:16 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8b21f4ce5a6so40993885a.3
 for <freedreno@lists.freedesktop.org>; Fri, 05 Dec 2025 05:52:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764942736; x=1765547536;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=o7V7r+I6IooNEU4koE9324VpoXcXhiIl5w5a8ShVyPM=;
 b=N3BniOG0AiyvNpQKJPHah+4dDcyf0KMTRBh+8wR0AgXwSP6FWBA0C6l2GX2ZKRQY0/
 E9kpEcFxgMZmL0PAl+yuNBPw0oPPdkPFjlvVgqEQQXvrcHEvCcdNnfGyJL7/WEPPI8Ti
 SCsEcD/YdRn1BTlPDMaEUyOwhQ2rdqx6En7C10kGJSvMZ6HaUlYvA4zOkLbe3rAPcmSQ
 4CkD6segrZgePWdP/PbYICXwp4EAaXxEce1qXKjxHlNcWjwee1VeajNlHm/fXI08iZMy
 9m/qpxhsfanRfrjf0XTar23hYN5bu6V7UbN0HIe20AnTxMEl74+4+u0YfyqpZM04D1EI
 2SpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764942736; x=1765547536;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=o7V7r+I6IooNEU4koE9324VpoXcXhiIl5w5a8ShVyPM=;
 b=kv00xyETLiiHd62ZDX7995tcNyHSxCm1ijsdzn8rdrBP+NixVEo8/B00RygwOYKuVY
 K6wqHU/7e8GTyRKsGA453ji5bSr01u3MieKnvw141mbYFNdsIxwmXMo2YdJ/fE7PBS3k
 FhlQeEtDL22pPm9MgFiGLKTQrWgqloNshbQSw2mCXrraAl5vucxbK8EWI1B7z8Gfsuwa
 nAsD9y7pFWbyC8gWzCNdHn+j3EFI91GU+ntN2IPVTba+zXTUguTbq1gc1VfBxrgyQu/e
 iXfrARCNGFXs8IWaO4SzubbYP+AOGdJwjTvoNswgXrs2t0N5JwtxY2auajDnMJfyAvDe
 ORwg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4sKJKKxTGWEt6kmOC5iFcSuq0Dm34GjUnX0WqH+ilYt5+LkmFIZ4qIKBM+bpNccBk6Hb2u/aU14Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyakyMqMnMIv6UrT8NAFV9wdaLScmUQ1TuEvgNhZCty5ZxuxUUe
 lOftmhYKQ9kVTvwHcfMQ7z8NAYcJ7CZ9CQp9XW19A4wAjOOw9MGL7JPs/0vhL86NoT6XfPTj2hE
 PvPzRnKp7AcWk2CWpHXX9xiatqbgpu8H58rrZLIYp6PVkX2qJlf2mjiuKAPXc7wJP1yBc2dM=
X-Gm-Gg: ASbGncvdyIPSHfKrPQveV3LCXjIqvqbKyDn3jBnygKdCLuIYlBC+b4vCjrezwKJVC9u
 k9LMo40Ed8NboYzq2IXzieqFIk+x3M5lhLYUSUBnXeJmEFUILjaDM1VILutoFFsCb6JgfJEza4q
 TWOICaCNUEUg7hg5lmv8JCiIbStWfGXmGiJUwfnWV1ykCHYkPUrVmreYJbmHWEGxLagx5HosZIM
 MJWguggXraDvRqdtVgPPNbPth5PkmRBhEFvn3TOknKfO3KAwkSGFG0+WcDBnqFmCEkJg1YoQaAu
 TS6lDbypFoaNW7Y6WcTSdv1yYnToRRktE2k3pUjwTru7NxsHtE/4gKjbklJ0n7fyMwbUUJxEPYI
 BpDepMGa2s4AS7sdwFcv8pLOGa5wDCXbVs0PaOLpgwK+ohCGA5MrWu11iEJXFk7nnGQ==
X-Received: by 2002:a05:620a:269b:b0:8b2:efb6:5ce8 with SMTP id
 af79cd13be357-8b5f95142ebmr865953485a.11.1764942736000; 
 Fri, 05 Dec 2025 05:52:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEQBcoM2c3cxIuFJvmEhsFRUeWlsckBDksGI+JesDNVEXzT3aBuxsfssWhwgRDIEZEb5suwDg==
X-Received: by 2002:a05:620a:269b:b0:8b2:efb6:5ce8 with SMTP id
 af79cd13be357-8b5f95142ebmr865950385a.11.1764942735544; 
 Fri, 05 Dec 2025 05:52:15 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-647b413b590sm3699006a12.35.2025.12.05.05.52.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Dec 2025 05:52:08 -0800 (PST)
Message-ID: <6dc39f3e-0a2f-42ca-a088-4b62a8153001@oss.qualcomm.com>
Date: Fri, 5 Dec 2025 14:52:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] arm64: dts: qcom: sm6150: Add gpu and rgmu nodes
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
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
 <9141e67d-2837-4e73-bd3a-9a9c5b8f72f9@oss.qualcomm.com>
 <d087dfbc-fcd9-4f01-8cc4-b206c2e87f28@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <d087dfbc-fcd9-4f01-8cc4-b206c2e87f28@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDA5OSBTYWx0ZWRfX3u24z9uhvOWH
 Zfw2adpGb0L3R+JCISNhz3hyqlzLK4AeGt32phzcW6s5vzyBZ+yql2zPBToVmpfkuaff+RjLm01
 i/zGCm8HawpEz+0yWkLZ9feweWRRQSeO1+mFzYbHAtC96pC8NZQT4R1gF+EuJ/bSI1GJJ86G+XF
 nr5ibJOq/Y2XbFpYxH+LFoAuKTAvkSFoSDd3kZfXQ/BYzhPkCcIxwvqgNIttUr+Tb0M7CPj5bpf
 Htfyxj0qJNM/krxBvPioLS34zsYVlHcSIpHZK/GZFYzSrHU9I7ksnitl20sbMgpQEeRkTm5Y6yx
 oTaquVqnLOnuICxqB6eyubwHO2TxSLb6VvjaN8WuNt+/dGSO6BmVKV4H62bpINhmfi5Tx5eHZFm
 LrwMPUUYp56ZY/UJEKRXOIG7ZpwuNA==
X-Authority-Analysis: v=2.4 cv=Yd2wJgRf c=1 sm=1 tr=0 ts=6932e390 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=prxyFuKMA2RouLmu0eAA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: EFedeMDORv3i6qV9A8kwJFaZ6VWK_4UN
X-Proofpoint-ORIG-GUID: EFedeMDORv3i6qV9A8kwJFaZ6VWK_4UN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_04,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512050099
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

On 12/5/25 2:41 PM, Akhil P Oommen wrote:
> On 12/4/2025 7:01 PM, Konrad Dybcio wrote:
>> On 12/4/25 11:13 AM, Akhil P Oommen wrote:
>>> On 11/26/2025 6:12 AM, Dmitry Baryshkov wrote:
>>>> On Sat, Nov 22, 2025 at 03:03:10PM +0100, Konrad Dybcio wrote:
>>>>> On 11/21/25 10:52 PM, Akhil P Oommen wrote:
>>>>>> From: Jie Zhang <quic_jiezh@quicinc.com>
>>>>>>
>>>>>> Add gpu and rgmu nodes for qcs615 chipset.
>>>>>>
>>>>>> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
>>>>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>>>>> ---
>>>>>
>>>>> [...]
>>>>>
>>>>>> +			gpu_opp_table: opp-table {
>>>>>> +				compatible = "operating-points-v2";
>>>>>> +
>>>>>> +				opp-845000000 {
>>>>>> +					opp-hz = /bits/ 64 <845000000>;
>>>>>> +					required-opps = <&rpmhpd_opp_turbo>;
>>>>>> +					opp-peak-kBps = <7050000>;
>>>>>> +				};
>>>>>
>>>>> I see another speed of 895 @ turbo_l1, perhaps that's for speedbins
>>>>> or mobile parts specifically?
>>>>
>>>> msm-4.14 defines 7 speedbins for SM6150. Akhil, I don't see any of them
>>>> here.
>>>
>>> The IoT/Auto variants have a different frequency plan compared to the
>>> mobile variant. I reviewed the downstream code and this aligns with that
>>> except the 290Mhz corner. We can remove that one.
>>>
>>> Here we are describing the IoT variant of Talos. So we can ignore the
>>> speedbins from the mobile variant until that is supported.
>>
>> Writing this reply took probably only slightly less time than fixing
>> the issue.. I really see no point in kicking the can down the road
> 
> We don't know the speedbin fuse register and the values applicable for
> this IoT chipset. Currently, there is only a single variant and no SKUs
> for this chipset. We can add them when those decisions are taken by the
> relevant folks from Product team.

If there's only a single variant right now, could you simply read back
the value and report it where necessary to make sure the internal teams
are aware?

There's surely *some* value fused into the cell..

Konrad
