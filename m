Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5639A325CC
	for <lists+freedreno@lfdr.de>; Wed, 12 Feb 2025 13:25:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CBE810E875;
	Wed, 12 Feb 2025 12:25:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="bVDA3rhg";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 777D810E875
 for <freedreno@lists.freedesktop.org>; Wed, 12 Feb 2025 12:25:23 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51CAPU5P015721
 for <freedreno@lists.freedesktop.org>; Wed, 12 Feb 2025 12:25:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 UbcB1AWz3QueJjVm+z7IaoPIVQtiBjJzu3fLF4T7x4s=; b=bVDA3rhgotBg2MhX
 iN6EBS3a/I4GstUfJek3K6nklCSWSkTex/3ZfZGhpbx1v1HOuZZ8wqY31YGLZZO1
 VFlDS04Z9u+uE0ulMciZfHksofKHJZgoJSCNhV8riPdFEbbGHuitxi1aUvNNkWSP
 iLHlIe7b45GnthBJEI+YVM6giO0Zm11Ubk/GG/tYw5qGyrU6x1GsfdKQlLvREscQ
 nqb6zW9gwfwcYaigfWnfkphSayxlObNDOppqqZ2MUDOeueO9vzGv6jYgfmsY6dCt
 bgkozTzd3ODKFioxCdMKCFtJTE05XZy4Ee6Lnqmy4mee+kfFv1y7R43s9yuJnouh
 RIjY6w==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44rgpghswm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 12 Feb 2025 12:25:21 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6e44a0bfc3eso7385926d6.3
 for <freedreno@lists.freedesktop.org>; Wed, 12 Feb 2025 04:25:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739363116; x=1739967916;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UbcB1AWz3QueJjVm+z7IaoPIVQtiBjJzu3fLF4T7x4s=;
 b=VeXzTh2oieax3XwPEHTu3sbiuBP8aLWSlSAu0ssXny6Qxl0+kfowe7dlCym4T0vAFq
 Pz3s6U5kSCsgX/LEsu3X5cYT9Ylyn7zBBvdGcbSKFfSDvADjGiEQ5HAL3ydAxNAmyH+z
 +RD5MauFWpiE80UuTAATpRdKsxH43dDU3MJroSsXKc2zBzv/ephnsgExRPmIO2ywGIW8
 vSiRheOkoMM1mN4S54DNUXdLudNv5Bu5lY+Avfhc1cy2+MyJYYFN8wC9YfZNtxNW6FfC
 KkLSvMnilTZqUmOoubaFjbT6R69NBB4Yu4XLMRF+PRDBJWHsn3Dui9zcNG2+vU+IR9iX
 joOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMbocJQfhw5Tk6PWla03USKm3/ZHeM6tAxlTThKhMrTwaOFQKNjCxHUsYIrP1vgApQIHkol/xmjnQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyuzDsI+TIVWskKWIWx8gc/OPBP1kCNrGjPGZB49aldbGKikS3H
 RNXQTEmSmmSsrTlEenZi/Yb7yWLBIfKkaNcie14Kl04WCCbYO6+EYftWLDTh5KT7BeHR1UiwdTR
 M5/CHF3re5BY3VD4vGhNScpNd1248ws4+ggiy1Q5oq+70Waqh8inWi6B21fVNCCxlSdI=
X-Gm-Gg: ASbGnct/d/8D3itCAnIeN6XJI4rV+rPfXV0DO+mN6Gxpcw38JesqvdPxx+7TLtGWOAa
 FPPgC9FhDrAZHIQXCZi/9YDHjx3cM9sG3ytxQ5OfaA2KUBowpegQmg3XqVsvejo2kV17RQGMngf
 UqJrqSChknjC8qi3+aMuqvjfe3tdesYAMk6tXYehWNzyi5HQtsm6VJtPjRhxZPdEWVOsaAWddyp
 EKFNx7GRLHblXpvukLft27b/fgA56YwkmAH6YXuL+sDxX13mhaL1GyMJ0Rvf2iBUTkDTB2iOmlG
 YVpW1m2wcmjmcHuXvZlKU5fhaXkfAdTwXTdWHb7XYURkwPkzR+bLudRwl5c=
X-Received: by 2002:ad4:5bee:0:b0:6e1:8300:54dd with SMTP id
 6a1803df08f44-6e46ed7ed94mr19147736d6.3.1739363116095; 
 Wed, 12 Feb 2025 04:25:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IECkfJniEG1I6Ju5XhH0jZtnXEOb0hdwPP0TBFwXKQ/dTnxopH890xgz8LMEw9HIR+WBS3y/Q==
X-Received: by 2002:ad4:5bee:0:b0:6e1:8300:54dd with SMTP id
 6a1803df08f44-6e46ed7ed94mr19147506d6.3.1739363115652; 
 Wed, 12 Feb 2025 04:25:15 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab772f497c9sm1253695466b.7.2025.02.12.04.25.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Feb 2025 04:25:15 -0800 (PST)
Message-ID: <cba7e429-a54c-41d1-a7cc-5083cac6be41@oss.qualcomm.com>
Date: Wed, 12 Feb 2025 13:25:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: sm7325-nothing-spacewar: Enable
 panel and GPU
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Danila Tikhonov <danila@jiaxyga.com>, neil.armstrong@linaro.org,
 quic_jesszhan@quicinc.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
 robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run,
 marijn.suijten@somainline.org, jonathan@marek.ca, jun.nie@linaro.org,
 fekz115@gmail.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux@mainlining.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20250203181436.87785-1-danila@jiaxyga.com>
 <20250203181436.87785-5-danila@jiaxyga.com>
 <4a232b8e-f63e-4f89-aa4e-257165150549@oss.qualcomm.com>
 <no4yqmep3b6k2s4cnucbujso67iavv57d7vrlnq3qn4vfexfka@secyoh4eqjk4>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <no4yqmep3b6k2s4cnucbujso67iavv57d7vrlnq3qn4vfexfka@secyoh4eqjk4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: OCLcg3ZlX00v-OlBD9nP4zcnZwZDXtZd
X-Proofpoint-GUID: OCLcg3ZlX00v-OlBD9nP4zcnZwZDXtZd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-12_04,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=466
 priorityscore=1501 mlxscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502120096
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

On 12.02.2025 12:53 AM, Dmitry Baryshkov wrote:
> On Tue, Feb 11, 2025 at 02:31:14PM +0100, Konrad Dybcio wrote:
>> On 3.02.2025 7:14 PM, Danila Tikhonov wrote:
>>> From: Eugene Lepshy <fekz115@gmail.com>
>>>
>>> Enable the Adreno GPU and configure the Visionox RM692E5 panel.
>>>
>>> Signed-off-by: Eugene Lepshy <fekz115@gmail.com>
>>> Co-developed-by: Danila Tikhonov <danila@jiaxyga.com>
>>> Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
>>> ---

[...]

>>> +
>>>  &mdss_dsi {
>>>  	vdda-supply = <&vdd_a_dsi_0_1p2>;
>>> +	status = "okay";
>>>  
>>> -	/* Visionox RM692E5 panel */
>>> +	panel0: panel@0 {
>>
>> Is there going to be a panel1, too? ;)
>>
>> Please drop the 0
> 
> No, dsi-controller.yaml requires panel@[0-3] and a reg entry.

I meant the zero in the label

Konrad
