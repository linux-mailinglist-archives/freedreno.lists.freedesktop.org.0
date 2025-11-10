Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B82EC46036
	for <lists+freedreno@lfdr.de>; Mon, 10 Nov 2025 11:43:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7A1310E13F;
	Mon, 10 Nov 2025 10:43:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="D/MhN+5F";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iOi1Jt51";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E0E410E065
 for <freedreno@lists.freedesktop.org>; Mon, 10 Nov 2025 10:43:07 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AA99JK61809228
 for <freedreno@lists.freedesktop.org>; Mon, 10 Nov 2025 10:43:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 eSqXKqt4w5CGKMXelCEmeHZsf36l7BOGUQpou8ggYx8=; b=D/MhN+5FBDmQwyrk
 yi8sgc/Z54izzyQvKikz3VpJaZAEosoUWlESfrTOsSbpkE7HwWTuuQpmgusrDQdY
 vbqd+7oqP9K97GOyzT3kEazUqnyODoaRT9E72MJDwkFGwZ2zin+TQ9qwcjDrkHPV
 ibm/DiITFTiA+r8bzgysLVaG5o2vtuUyvRMjlhtHXg7MdK2B9QtgOULdaSBwbJMe
 9Oym9tBjAuT4P5MAaq2v+uCtSSmDShgROhL4wpz7zmoqqp2dqr7ND7DOQDkFLR96
 44iX0YOEn3lAkp9LBanGb3QQeUP/80rAHKpjM8pyhpldsDaH2q4eCRBwXuQ2qdM0
 kfm+Tg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ab5m1hhwq-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 10 Nov 2025 10:43:06 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-297b35951b7so51022955ad.3
 for <freedreno@lists.freedesktop.org>; Mon, 10 Nov 2025 02:43:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762771386; x=1763376186;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eSqXKqt4w5CGKMXelCEmeHZsf36l7BOGUQpou8ggYx8=;
 b=iOi1Jt51VbszOW/BL/Qn/+1KbQn+hTxrOVm9ow6KpBoYOjj5GH/+e3kihszGtMPBsr
 BZxmKjLrkfAg96rtPTM3Ml/6yVRFVCMSC1v4nS1JhZ9BL51lSSpd+U0oG1ujG4wHgUJ6
 J9mOJVPgb0vhf7Ew4jzUS+JcN5Dl7zcz22bFnfvk+pQE9mdSq6E5bMj/hHTiKxy8uVZp
 tGRyjkjgNQB6zlm/dwLuE3idkoCyvBGbgLqfWutkSyN1ZrFgyfMYpGmRvw6v1BFly/Ee
 6krIcoMqxCs2voX65Qqp/q+C5t9zqQpZRcwtXOHWF0aCxyDxoL7ZWuftFwTZKnoMHA6H
 oOlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762771386; x=1763376186;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eSqXKqt4w5CGKMXelCEmeHZsf36l7BOGUQpou8ggYx8=;
 b=DR1oAIBg4GuoyC+5+ZVIXE74jKr6sWrtkdGWohz5JkK3nKud67fCtUFf28BxBSfo3j
 zcyFCDoWEbOO/T8yPTqX7/oPdI46YQeZa5uYS41HPdgplnW13o6wxfmaP/48Dcxys924
 RVtZEi1+CMVCL6dmzy/a3Y+08Q7WYuA/DWp+D05jmehQaqwMU+IK6HEs/j3rBQc5xBtJ
 cZsH0/j7sttXuAOwYrl2aqOgoQV5wD4p3pZgaBHJPwVmap1VxMFiysiYJLF0ztEbOIkN
 tr/zByQ3X5tFWO5rl2Mu7ZpsS2g2Rd7EPUW8U+npbV6eaXn/rM9XglgaVFK1/cCk1/BA
 7SZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVv8NqPEjlbe1stUvZNFTv96VmCPUhWDOhIh6CkNxNz3Q5GDSumm9R4aKkjNfysgsKDKg7jDHeVmcM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwiZ+P8pYK9tMc/zww8cCb6Kovs+MKZW4uMDMCaRw0+jvviDoxl
 12m1lYRW852jjiOTBfMcgYbyGX8mlfZyiWd75tnG/yIYnlrHwC5RlXXoEWh/oI8p6dYsiFraY+q
 xfKMN5HXnS5NWVZnFAZ90+UYNhR/H1n/VBBVk/p+v05k7exdwFc4MAsnwc9UTENI1nqdcia0=
X-Gm-Gg: ASbGncvBx88VZ1vz4VY3Z/xJbhwoIRkjJ+FGEJAi43jiVmsU1xr+XTEacVEfimIjkaO
 86GZgy7iAD6KL9srjsYjNGE4N76baCNofkgFbAL29vt7gg3pzRIRsyuvMPkzvUZinmi2RCc5FIW
 YLS0gSl/Xq/0tiZ5Hi84cUgzaZxPA04q/yx4AftUZ8U3VgDnJgq8Ce0XEMoVJtQRZrFF047Dps6
 V5M5r8oRZnwPr6hNC1JfHhjxrCFuUfFLGxI4vP2INtbPxNkrswvsOvvN3RVeEnOv+RUpRoeK7Pw
 8eHlqZIx2oiO4jhnsMtv6rDDalN6BNI1b1F5l1ncA7l2EFCzoFrOfeoERSUdviioJBJNVwipwzd
 1TvTet+arNskEp932OPP5Jg==
X-Received: by 2002:a17:902:f790:b0:295:9a46:a1d0 with SMTP id
 d9443c01a7336-297e56df960mr102724425ad.45.1762771385977; 
 Mon, 10 Nov 2025 02:43:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEF/4A52+hPm+KGskAyqtu2lioNjT9Bv0FG/S2i/1sn1bpC5Zjl0LIeTPyJfY/iBBpamPtPaQ==
X-Received: by 2002:a17:902:f790:b0:295:9a46:a1d0 with SMTP id
 d9443c01a7336-297e56df960mr102723845ad.45.1762771385447; 
 Mon, 10 Nov 2025 02:43:05 -0800 (PST)
Received: from [10.204.104.20] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-297ddde1e7esm82040835ad.77.2025.11.10.02.42.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Nov 2025 02:43:05 -0800 (PST)
Message-ID: <1d31c371-0b74-4584-9f2b-dafa76197492@oss.qualcomm.com>
Date: Mon, 10 Nov 2025 16:12:58 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] arm64: dts: qcom: sm6150: Add gpu and rgmu nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
 Jessica Zhang <jesszhan0024@gmail.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Jie Zhang <quic_jiezh@quicinc.com>
References: <20251107-qcs615-spin-2-v2-0-a2d7c4fbf6e6@oss.qualcomm.com>
 <20251107-qcs615-spin-2-v2-5-a2d7c4fbf6e6@oss.qualcomm.com>
 <defc450a-1699-4682-a41e-59035bafccbe@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <defc450a-1699-4682-a41e-59035bafccbe@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDA5MyBTYWx0ZWRfX5cHcnIP93xFM
 FWfIOvxjoQlfU4IAUtC/9CFhmGWiaN0tEr0cjKQMlC6zmIqbpV3wKojiEIjEy+xmBIT+DEbEkDr
 yYemJoxPs35Su8LzErBWob4wnJq99aBk/QCAgF0clnTDVeT06jDupLS4CmKJaYfrX4iBzJZQgmZ
 O8NC21czAukPICCtKRn5S2lkCQsb95sAPu2tpgWsj1exd1KhaACMjJepZ3tk4rhBEOdfNRJjBuv
 4Noa7d9zSoMAzMbxlHlQ01bhefbSJ06A9jZz17dHmIgBgM9/Pe+MOwObjDr+eINS2YbMMHLkCd6
 vWL95lPq8aai40rPHb44w9+HpeR6wyhJN45js2xVnNZahoXqpMSyvB/HIv8e3yCVgjAOykaiJ8X
 ChEebORrzs5KlXgpff7OR4usnquK3A==
X-Authority-Analysis: v=2.4 cv=TsXrRTXh c=1 sm=1 tr=0 ts=6911c1ba cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=I_p1zpMzltXwdS2KmfMA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: qxsNi6xETD9YdrSeAk5jidzge2dEog5s
X-Proofpoint-GUID: qxsNi6xETD9YdrSeAk5jidzge2dEog5s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_04,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 spamscore=0
 malwarescore=0 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100093
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

On 11/7/2025 2:31 PM, Konrad Dybcio wrote:
> On 11/6/25 9:50 PM, Akhil P Oommen wrote:
>> From: Jie Zhang <quic_jiezh@quicinc.com>
>>
>> Add gpu and rgmu nodes for qcs615 chipset.
>>
>> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +		rgmu: rgmu@506a000 {
>> +			compatible = "qcom,adreno-rgmu-612.0", "qcom,adreno-rgmu";
>> +			reg = <0x0 0x0506a000 0x0 0x34000>;
>> +			reg-names = "gmu";
>> +
>> +			clocks = <&gpucc GPU_CC_CX_GMU_CLK>,
>> +				 <&gpucc GPU_CC_CXO_CLK>,
>> +				 <&gcc GCC_DDRSS_GPU_AXI_CLK>,
>> +				 <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
>> +				 <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>;
> 
> Is this last clock really necessary?

Downstream votes for this. So we are aligning with that.

-Akhil

> 
> Konrad
> 


