Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F839CA32B6
	for <lists+freedreno@lfdr.de>; Thu, 04 Dec 2025 11:13:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A9C510E1CB;
	Thu,  4 Dec 2025 10:13:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="gQdRIHla";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SOVR8gNu";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E803010E1CB
 for <freedreno@lists.freedesktop.org>; Thu,  4 Dec 2025 10:13:44 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5B4A0E8j1097605
 for <freedreno@lists.freedesktop.org>; Thu, 4 Dec 2025 10:13:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 gFmCNQvfDV8zMZ4aEakyNLHUB0LSRMaEnMZW4uuVM5M=; b=gQdRIHla6fzrdg7o
 wSkQSYiYEHhxHlwoskxpUVNiXokd5YhFxP6L/oFYRcBRHliyJ8ZWdH+lBPLVrRbG
 L8cyZUfbHJJvTcqRoooQrOyVuD1YP5OgPGqrBH8Ua1UcWarobiY5IoVxzmJ80Luv
 PDXI631FHtfiTr+/Sd5RUWzsu7P59immZ4F62EnaWJv9Aj9IaZuTuaZTKmOwA6PS
 sU64lFkQOkfV81Dx+QSkIPXL769hkxL0Jomr7PbfnDiRO+QkgoBoM7rjlv6jj+k0
 Lq2fYhJRNgQR2SMEbtqBMBdOMlMQBMYxYR1boDwkJCwDTUjFn15EIZSuIGvGH3OB
 4BvhiQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4au1f01bec-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 04 Dec 2025 10:13:43 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-3416dc5752aso1888362a91.1
 for <freedreno@lists.freedesktop.org>; Thu, 04 Dec 2025 02:13:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764843223; x=1765448023;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gFmCNQvfDV8zMZ4aEakyNLHUB0LSRMaEnMZW4uuVM5M=;
 b=SOVR8gNustDug75OYjkY7o3v9AHY2Cm/KRz06bEIYT+nW/2VcsDLIdYt7YxE+Zdq0p
 LxYg2Tc7X4AO+ASj9DVNmpi9JEEmGy6vV1fB7bxcbyT1bZEhOEG7DZK3fWOqXVzETAIf
 LWVNVKfVISSXiQKM3P5ZR0sWtGwxZ11/0d/cT6LDoDLhzQrneSPj+K3nLr1h4UioS5BL
 QrPI3nGGGKYOinxtTIMl9O424H4KgqtRxkB7H5hbMlnlHmNhozFJQyt6mztTncghpWNM
 mzV5+lzhRtli1QcucxisumVoHK5ik1XeTaNGDdRzDzEp3BXGXS53cMmGUCw0GsDbTtSL
 KokQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764843223; x=1765448023;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gFmCNQvfDV8zMZ4aEakyNLHUB0LSRMaEnMZW4uuVM5M=;
 b=AP9Ynn8TRGQ7bNmiBw0jasFlQpenMAALdaElea/w2L3Vw36UnwXcVNlTMlqM7IpFAp
 I9nr4oprzE1Ahksm/iZCtyhwAeuw16cdXOm/RNA5TYT7tHM2IUyGYFN6XxNjtI/MP4Lu
 ICk3wIo+YRznsO3A8NbynlsYteS216e0g1nw9yKrMM2IcE+3fYKQTII+bFecMZ8ED+40
 3JQWxCs1NTwcUvtfOtbOjuuCL0KZjpK90/uvJOfLJI4vQqYTgKd5rub2k7Z1blGt49yd
 SfK/v2GiUmm5GeWc03diymbXP8Y+LnptxczvMLBvFEwP6mvqYnv0InpHEfNR6dL1iHhl
 iNBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUcibG29nN0c9hjogtNkp7g4CD2Y3e3nawy0xeHN8nCaxPX5F7Ppm38V6oE34KBtZ9TERpPzCvy3ws=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwMSwVefTsC3pdZlprabnZf+J/EirJIqbDMVOc7bzTLBcj+9UW9
 9UIafkUsFHBDm7R79CUwRFEm3LxhQD/G0A1QUU/WmZR2o88W5iA9cp1GBByCtkCwcrTZyMjg0l/
 fdpYw2/X8hVRg90dVnn778aMAwTpsJ4EjizqwQKvvqrtprWy0LG7Zyo16B6At9tUo0V/MFkE=
X-Gm-Gg: ASbGncvFB3qdIu9IUk0KI5whyE5Qeav4PNPEw+pQs77FVlip5RWwFiJ5H+Sj4dzZFfZ
 4tvo3qCui9d/00hvjw4NxqjrDlniOgwYyHyAhsvS7gJ3HZEi/C2wOYByMRLWCt6N9LTJk9XliEY
 1KgepFYlwJHNKR+lVw6OulI3yyIvLtQKHAtMlEmAWJxBIGKIgsBDYeOpsb+B3S3EEQf+piJz9PL
 mErU5mGFPntJSjHFzZYVBjiNCm4bvVftwLVbHZInejQKREDn3g0SmqhzVJ43HYz/05sDkaByGlm
 1KycmgCQT9XZpYHicbyUSka0pcPIPSl3lydzxLu6Pef+pOsLG15FTjfbFnDAto8W3oKxKwmpA2V
 Naa8m16owrr2Hzkk2gAcXugXZoO29Jaueiw==
X-Received: by 2002:a17:90a:d44b:b0:341:8c8b:b8e6 with SMTP id
 98e67ed59e1d1-34947da3374mr2797360a91.16.1764843222961; 
 Thu, 04 Dec 2025 02:13:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFTI+FXsDrWaan75rn1W1zOHKGsnyM2nQAIHGhx3Y/oa38TATUtOTFlY4ZsHtBd5TpA4INomw==
X-Received: by 2002:a17:90a:d44b:b0:341:8c8b:b8e6 with SMTP id
 98e67ed59e1d1-34947da3374mr2797316a91.16.1764843222506; 
 Thu, 04 Dec 2025 02:13:42 -0800 (PST)
Received: from [192.168.1.4] ([106.222.235.197])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-34912a1cb94sm2500275a91.2.2025.12.04.02.13.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Dec 2025 02:13:42 -0800 (PST)
Message-ID: <6fa1da5d-9ea7-4d72-a03a-82edc4bef099@oss.qualcomm.com>
Date: Thu, 4 Dec 2025 15:43:33 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] arm64: dts: qcom: sm6150: Add gpu and rgmu nodes
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <z4gqro2bx6oq2ht75m2klogo5dsirb74tmc3u3shjyalxmaxil@5sy7ufmqhdgw>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 9jEJVfBifcRQCv9rc85T8_fY74tBYMcO
X-Proofpoint-ORIG-GUID: 9jEJVfBifcRQCv9rc85T8_fY74tBYMcO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDA4MyBTYWx0ZWRfX2KBtXaDn/JjD
 xUTO7M7AQqLycQLVijsq9b2MR+n7XOdycv7KKC27rDm2BGlHb3yOk2EYdaXpk4IAqpGqfpKXHNK
 vSI+yriTrKFn04MhGyL311WBn1XXw28URXSGwYLEFew71OA3Ud5Da8J+0XKYOKsCLuQGvzTJwfz
 SNxHtPOYPB67xfjRDYieS1eqgGexFPUE1rFOotFjM6zuTMF/67GMm9P1nUxpoTZtNS8lMTCN3W6
 8m92ARyB30MlJreUVyHz4YtwNp+pkVGww0agIumWpIZRTp4RQTQbHRrKjW1aC6naXKjvCCa4x0U
 HDegBhj+bmJndS7g/+Zl7mhSAzrnsI62RGNusYV91ya1pWbhmlyYU7MagUAJICTZsH9QaWMRYVr
 qxsfmDFG+xFVQ4reu6DYyA2GmpPr/Q==
X-Authority-Analysis: v=2.4 cv=Scz6t/Ru c=1 sm=1 tr=0 ts=69315ed7 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=jBSxni06C9HboLYAjQ55wg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=PRsBwnEcORHDhoN9PnoA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_02,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512040083
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

On 11/26/2025 6:12 AM, Dmitry Baryshkov wrote:
> On Sat, Nov 22, 2025 at 03:03:10PM +0100, Konrad Dybcio wrote:
>> On 11/21/25 10:52 PM, Akhil P Oommen wrote:
>>> From: Jie Zhang <quic_jiezh@quicinc.com>
>>>
>>> Add gpu and rgmu nodes for qcs615 chipset.
>>>
>>> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>> ---
>>
>> [...]
>>
>>> +			gpu_opp_table: opp-table {
>>> +				compatible = "operating-points-v2";
>>> +
>>> +				opp-845000000 {
>>> +					opp-hz = /bits/ 64 <845000000>;
>>> +					required-opps = <&rpmhpd_opp_turbo>;
>>> +					opp-peak-kBps = <7050000>;
>>> +				};
>>
>> I see another speed of 895 @ turbo_l1, perhaps that's for speedbins
>> or mobile parts specifically?
> 
> msm-4.14 defines 7 speedbins for SM6150. Akhil, I don't see any of them
> here.

The IoT/Auto variants have a different frequency plan compared to the
mobile variant. I reviewed the downstream code and this aligns with that
except the 290Mhz corner. We can remove that one.

Here we are describing the IoT variant of Talos. So we can ignore the
speedbins from the mobile variant until that is supported.

-Akhil.


> 
>>
>> [...]
>>
>>> +
>>> +				opp-745000000 {
>>> +					opp-hz = /bits/ 64 <745000000>;
>>> +					required-opps = <&rpmhpd_opp_nom_l1>;
>>> +					opp-peak-kBps = <6075000>;
>>> +				};
>>> +
>>> +				opp-650000000 {
>>> +					opp-hz = /bits/ 64 <650000000>;
>>> +					required-opps = <&rpmhpd_opp_nom>;
>>> +					opp-peak-kBps = <5287500>;
>>> +				};
>>
>> Here the freq map says 700 MHz
>>
>>> +				opp-500000000 {
>>> +					opp-hz = /bits/ 64 <500000000>;
>>> +					required-opps = <&rpmhpd_opp_svs_l1>;
>>> +					opp-peak-kBps = <3975000>;
>>> +				};
>>
>> 550
>>
>> Konrad
> 

