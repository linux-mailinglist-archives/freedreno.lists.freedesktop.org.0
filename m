Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6390A9FC14
	for <lists+freedreno@lfdr.de>; Mon, 28 Apr 2025 23:19:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A902E10EA6A;
	Mon, 28 Apr 2025 21:19:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="eNTaQp8O";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 170C810EA6A
 for <freedreno@lists.freedesktop.org>; Mon, 28 Apr 2025 21:19:39 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SACUMp027132
 for <freedreno@lists.freedesktop.org>; Mon, 28 Apr 2025 21:19:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 1p0DQQl3Uv/CeewEIX8WmFJDpqWu+zknhFq+jDxcqzs=; b=eNTaQp8OWPZ8bjaJ
 siO4gZnXx47CjAcBmt71c18UjDCk4ZVh/jMyqSEZUJzIvyn/7fefYAXn/pYrF1bl
 p2KMxaJaRMThp2AKhC59qPuHUKcQGa4trnmhLTtIiY/T6e3EOD5T/a1bIHPuplle
 XPySL3CsCCVI21Q0dsmwg8TjaTRk3d2xk+CDoE2Wmci0cdhAR0yNWZtf8sYTQ4CV
 0RiX4tWV2+LjX2zdXzHlspi9TvxrvSPJkeaddZ5dALUxBNAif1H2ySlaJ0MlfiKW
 LSV5Ro3kfMHAOT55MgOnsnVtbBSI234SnKXf1Ns8JdkigwMqJCWzaxtOFUfhwIHS
 h6fGvQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468qjwtccb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 28 Apr 2025 21:19:37 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-476a4a83106so6762741cf.2
 for <freedreno@lists.freedesktop.org>; Mon, 28 Apr 2025 14:19:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745875177; x=1746479977;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1p0DQQl3Uv/CeewEIX8WmFJDpqWu+zknhFq+jDxcqzs=;
 b=pAT0evdR2FoYU3TpppYvdxz4hkxFk3+Ihkg8tbimctsoByMmRRSVnKq8nV9TqrPpNt
 FnqmxKAwYhUcTO7iJDqyjRYRvyY3FQaTch6qa3aTmsQnVmRJ6yF6Ds9W266aVenVYTOv
 RNX140gLNbAHV2+c2BG1tEk8IoolVaVyzTcDUdtXs6mxkVGX66HJropBYDVTzDrubC9r
 Qq+gS4LolQlfTmK8zhgdVUb5qDPfn/ONnlV7nZvjkAoA7hhKv2OJxD0HGLI6DDgDJzLu
 xOHdDht4ipAo4jmhanKDcYGPW6/B3zewMkBzgQaGHcy+fShS3Z2etEEFLz4nspYl5sLS
 G2YA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUcH24Uu+ddUr1UhQcIZKGSN9yvW8gv+V4Cio+xnEsyL9Sr63wrZDZmwnJyiVrEOvtVSxTv51Bd1Xw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzox5M9+zbqWvFz59XVkxCBX7fgR1Hmp7DXfUqlr1Sd2bqWPv4I
 WjIce3tVB7awL/DNROzBrP5UJJSMyGyE3hasH5Pq1G8z1JDL7/X6Wt5daFjZ8A/IYd401KekCtR
 3pQbPTM6SFDW73rpDC1I4lZ7jEvJQNkYRso/s35Y4Hy580b0gV+tvZ04BAHO++kbownk=
X-Gm-Gg: ASbGncsTTffozEE0JVarjnBOejCczKv0yz2GOGW5A+XjdIw318texfAyOpllW6ygJHd
 azubXw4o6afrkyWNX03HjLd1+C7iPcJosQOST3sq3cwi7y8xYAFilBtdfBl85urevFS/RfM8p26
 MVx5TvRLGDwKy8oSf3Rb8EfI8aObAo0veAnRcibhLK+Pe2NHp2SErAYmRCbv/ZmHCl4pomkrDJP
 IR5NTG3LowDDmvrZkA9I9w75ngAuw+LoAuwFtJi6AKoWF/X+JGXcZHEDCuvvHmFkNSmAskQfrCA
 plzmw0V3yaozjxBH7UUqxAM4RwG4XFayJalWp3UYUHnmG6aOGWVz6FNDEwQgCPgYkQ==
X-Received: by 2002:ac8:5d43:0:b0:47a:e81b:cca6 with SMTP id
 d75a77b69052e-4801e5ef61bmr86239911cf.10.1745875177210; 
 Mon, 28 Apr 2025 14:19:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHGM4Gsyyf3DoqVCxTr5c/Fx29SX0hifWAwRSJIcxlPqb02dtB8cwcCNR+5BkrZ9k/UWtLcg==
X-Received: by 2002:ac8:5d43:0:b0:47a:e81b:cca6 with SMTP id
 d75a77b69052e-4801e5ef61bmr86239641cf.10.1745875176771; 
 Mon, 28 Apr 2025 14:19:36 -0700 (PDT)
Received: from [192.168.65.47] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ace6e41c431sm693197766b.18.2025.04.28.14.19.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Apr 2025 14:19:36 -0700 (PDT)
Message-ID: <41df5398-79f6-484a-8ad3-f3488eb1b71c@oss.qualcomm.com>
Date: Mon, 28 Apr 2025 23:19:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] arm64: dts: qcom: qcs8300: Add gpu and gmu nodes
To: Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Jie Zhang <quic_jiezh@quicinc.com>
References: <20250228-a623-gpu-support-v2-0-aea654ecc1d3@quicinc.com>
 <20250228-a623-gpu-support-v2-5-aea654ecc1d3@quicinc.com>
 <e22daaae-57fc-4523-b594-87d202d255f3@oss.qualcomm.com>
 <aa8ebd50-683b-4043-9494-5675a2d9a01e@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aa8ebd50-683b-4043-9494-5675a2d9a01e@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: _QcqBle7a5LrLajoOWFhL2iGtAiTyQDl
X-Proofpoint-GUID: _QcqBle7a5LrLajoOWFhL2iGtAiTyQDl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDE3MCBTYWx0ZWRfXyIUREQSD7vE+
 Hv23LNzIH9BJZW35mdOiPjNEZJr2JqFK5d/OXcFz8ny8wH3hdkZndqHC1vw7FdXGJoTk/krrov/
 CzdTdFDPfRCATFufQKxHCN0zxjZGoA27rl3SZ4PeKCrVlejs2FmRYK0yFpJlgThpU7KczhCvD5Z
 Ms2iwBe2Sc+rnlTvezuRnGAl3jdgGv7WMvXEcp23pe2rjdPBsafe/HEznDjfX+ocnA9Me0iA1ds
 tFDln0G1F9CO5zh/x6GUmU0kARRZtLaVie6FGgJW6ck9OweoVcxEAH/LZMRv9HsOL0kqyga6XNR
 AY1LpOaGVjQlUGg1TJBY9XDHWYDS9Xb//INxaMXs+q/v6XX7L91RCu9QgVRRPc2uRVj/dm2nD+4
 N/HjkiMOzzgrEDNqkvrrXPprPqxDyQwFCgqDa9YcQwds3CXIxkquU9yXRq6vk9H28kRcX0Ae
X-Authority-Analysis: v=2.4 cv=c/urQQ9l c=1 sm=1 tr=0 ts=680ff0e9 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=dalwKpVopYczjXflRRgA:9
 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_08,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=683
 phishscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0 malwarescore=0
 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504280170
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

On 4/28/25 12:44 PM, Akhil P Oommen wrote:
> On 4/14/2025 4:31 PM, Konrad Dybcio wrote:
>> On 2/27/25 9:07 PM, Akhil P Oommen wrote:
>>> From: Jie Zhang <quic_jiezh@quicinc.com>
>>>
>>> Add gpu and gmu nodes for qcs8300 chipset.
>>>
>>> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
>>> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
>>> ---
>>
>> [...]
>>
>>> +		gmu: gmu@3d6a000 {
>>> +			compatible = "qcom,adreno-gmu-623.0", "qcom,adreno-gmu";
>>> +			reg = <0x0 0x03d6a000 0x0 0x34000>,
>>
>> size = 0x26000 so that it doesn't leak into GPU_CC
> 
> We dump GPUCC regs into snapshot!

Right, that's bad.. the dt heuristics are such that each region
is mapped by a single device that it belongs to, with some rare
exceptions..

Instead, the moderately dirty way would be to expose gpucc as
syscon & pass it to the GPU device, or the clean way would be
to implement an API within the clock framework that would dump
the relevant registers

Konrad
