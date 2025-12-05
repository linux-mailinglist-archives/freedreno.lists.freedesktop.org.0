Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7FEBCA7CE0
	for <lists+freedreno@lfdr.de>; Fri, 05 Dec 2025 14:41:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F1FF10EB3E;
	Fri,  5 Dec 2025 13:41:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="CNO5wwU9";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QAtxUrIP";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83C8910EB3E
 for <freedreno@lists.freedesktop.org>; Fri,  5 Dec 2025 13:41:54 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5B5DX30O3522580
 for <freedreno@lists.freedesktop.org>; Fri, 5 Dec 2025 13:41:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 n7/xg9hqfz7IojW9i45R+MaisCn64mYGvJ5VCnPDFQ8=; b=CNO5wwU9h2eskiEr
 vYWmoIAldICyZRL4DG/u3MZE5BGRA4jICxrdFat9ph96ZwMgxbM12v4gp/eELArN
 6v+XfzOkq3UnalVvZ8IcQqYWYeqreAYLhosJd3X75+nivy4KM3rsG5f4okUu0WBj
 HCrwrNdLol2bdS/ujyjdeNA2xgD1qJE0ed1F45mav+VJgoFan7MXz5SD1XVVAVOB
 H4/8/2xvJPzoYarf7Qh+5ImPxzHhp/3MvaLilU6yx3urj3CUHbt/z0PBaZVyZepW
 0AifDaNFRu4jP8bBA+I/KWPVeT2C2IlTUVRzfH6EMizfIF87FlzTh7WdirPl9zew
 PeG/Qg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aurwvhbpm-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 05 Dec 2025 13:41:53 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-297f587dc2eso49877805ad.2
 for <freedreno@lists.freedesktop.org>; Fri, 05 Dec 2025 05:41:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764942112; x=1765546912;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=n7/xg9hqfz7IojW9i45R+MaisCn64mYGvJ5VCnPDFQ8=;
 b=QAtxUrIPt754GKaccpnYzTBvf+zjc3j4oGCOd8vRG8U+lZ6c/aVRA1XX2TKz7W13gw
 jam6J9bmQZkKTWIgilLymCwLDuC8naP3ZJ3lBUApvW+e3kLmykQ+RJWPflVczCEisHNj
 le+6k7sAstoEwjYSF01eB+Fsf7KeuF//JV2qRCyKbs3qL8xI+a5lbuNFsSEOIzWMNTXs
 ooPdkyMaoubr3WCRZNu6teMhFkifVjH026xfykeXlDgd869EYvAt2sX0JtV/4xm0xnVK
 PqFJRROBGf1WxQ3Cr07G/BrnFqWqRc+IQAQ55wtwujPqC+Uigh/vibHgHeYYHT7R9cW8
 EO+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764942112; x=1765546912;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=n7/xg9hqfz7IojW9i45R+MaisCn64mYGvJ5VCnPDFQ8=;
 b=Tyf1LB6XF80W0RMJa9DBRzpK2uUf82BI/wtGmGq8yPYeGkHq+6Yisnzm8ioRhDuWbx
 ZiG/kS11v7Pg9haMsmQ76UsPRCqcvJWTefd7RNT0y06GGwWJZwEM/OonZciGEY3W3XqY
 rZE4TRXzS/MdPNyUSt/hPIxB/uyNHN8G+wjiVUF0MLePTG2IR3QyAWm8tV8D4sz7l0p0
 tuHc71OLNtFce8Qm5EKEN2HRYLLN9r3uU7Xvup+xtYMr739cQqR1ubslbvsrwgNN7T04
 7j9SwuRTv2oP5rvHdW9WG3UB318JNAYnkZzQShjid7zmixw0kv1Hc8zUgOTGXQaiatTZ
 K+3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVbmdiBE3mPTLhyVIXuJFeASzRrZqJcF+dkScfWRTzqDUR8qzgj6zP2l2xybIc/B8z4UPOiMv+jUHI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx7j3PiVtR3VD2mu1uOxb+Hrd36xBTO39Ud4nZY81kr/g9i5Wy+
 fU3lfKAvh78i1ITHnwkVLZ+J3dXrg5Hr5nEVlcLgFB7niMcq/RIRkbhM02qa2Iu4KLV2FiNYyFx
 dDht4c1AqvUHEM9xRNOTFCWesMU2NRDN2rG5sNKrKqJcC0xaJLFV0BRAp6/xFSWwOKUgLpHI=
X-Gm-Gg: ASbGncs4v7e4gwuO1xzr6Qz5Y+tZ8ZKxlPLgH6XgyZVOnd4sbUX5njoKCG1+C1WQUT5
 BGR7XTSYEMfYNanrgXb7tNVrc9/gcYzqyb2gY7a2TQrIR8ceK9zjO84rmxSocvl3JjQufwK9i7N
 xMtIV72pmTW2OmvQrGDxMkbUXokCsTBNwfbRSxnLNmgFE2EFYtNvyr6A2cYCr7lJyR3SyHfRsPH
 djcwIxXNUCKq6litw9yp2Bx7kAzjb2q/nuPo4iuAKOQRq2+IJvZtL98ShGjIBcjQlDwPETKIS0+
 JP6sZbRydjQ963qkG1Vbx1HPWI9KnyvKEa/1pkksLXpNloQwmCgl2J9NoTcK7istzyTlzUcbjpR
 d1lvsOOB/7pJflMH+weFbew5BwjzEvMsFOA==
X-Received: by 2002:a17:903:3d0d:b0:29d:9755:9bd8 with SMTP id
 d9443c01a7336-29d9755a07bmr74505105ad.22.1764942112409; 
 Fri, 05 Dec 2025 05:41:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHshUqyeSZa92V5Aaq1utR9alONTZF9h0tJSM8m55U93erdoJiSrDaKE4FgBRRU6fmmE70fbg==
X-Received: by 2002:a17:903:3d0d:b0:29d:9755:9bd8 with SMTP id
 d9443c01a7336-29d9755a07bmr74504875ad.22.1764942111841; 
 Fri, 05 Dec 2025 05:41:51 -0800 (PST)
Received: from [192.168.1.4] ([106.222.235.197])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29dae49cbdfsm49762375ad.1.2025.12.05.05.41.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Dec 2025 05:41:51 -0800 (PST)
Message-ID: <d087dfbc-fcd9-4f01-8cc4-b206c2e87f28@oss.qualcomm.com>
Date: Fri, 5 Dec 2025 19:11:43 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] arm64: dts: qcom: sm6150: Add gpu and rgmu nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <9141e67d-2837-4e73-bd3a-9a9c5b8f72f9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDA5OCBTYWx0ZWRfX5GJYGD+WYoP5
 ZNdsyEm54i+Yx/0paf+pQf2z9THXwf5xdihXIpM1414MPwlk1VSBhG/tKZh/6zK1HpGPVjlqOh6
 C3Wp9dxxCE3HC8f8OJcHLhnHg5wzf2JEsGlt3XbmbHyMhRKpEEbbFNfj9b6d2ue0MGJ23R4LKM7
 Oslsu/nebpRxxSKMjCo3/b1iOveURmAdU1l9gYk0ufd3MrNIZ2Cpri8mI2mCesUI4K814a1gV3L
 ousgMNOFOPmGns4S+cJAm7wqTjtsMik+mIHNHBNXfjzYHWTvCRNv5wII7nFVn/E4tyhGrLPP3v/
 9XmRwoBz9qI7FNdyrjRYPiV9bi0dZ5hJY+qhBiVWz8ZH+tWG/2HJRMfetLgL4FzHlQsqvCsp3BL
 fzP31J10uWVFnHwbPr12Lgqt+wIMNQ==
X-Authority-Analysis: v=2.4 cv=Yd2wJgRf c=1 sm=1 tr=0 ts=6932e121 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=jBSxni06C9HboLYAjQ55wg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=PFMJV2I6qJKDnvYOCoAA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: acKb2tjSSs116mVJmos3Q-OpZmUecoE6
X-Proofpoint-ORIG-GUID: acKb2tjSSs116mVJmos3Q-OpZmUecoE6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_04,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512050098
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

On 12/4/2025 7:01 PM, Konrad Dybcio wrote:
> On 12/4/25 11:13 AM, Akhil P Oommen wrote:
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
> Writing this reply took probably only slightly less time than fixing
> the issue.. I really see no point in kicking the can down the road

We don't know the speedbin fuse register and the values applicable for
this IoT chipset. Currently, there is only a single variant and no SKUs
for this chipset. We can add them when those decisions are taken by the
relevant folks from Product team.

-Akhil.

> 
> Konrad

