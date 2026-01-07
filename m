Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B74CFDC3E
	for <lists+freedreno@lfdr.de>; Wed, 07 Jan 2026 13:51:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2D3610E06E;
	Wed,  7 Jan 2026 12:51:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="fMHSwdWB";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Uc1/LMxc";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D58EB10E06E
 for <freedreno@lists.freedesktop.org>; Wed,  7 Jan 2026 12:51:32 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 607BMYWK3152892
 for <freedreno@lists.freedesktop.org>; Wed, 7 Jan 2026 12:51:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 QUZTglwraTogm7+NgckDuNvX5948M5h70ehV8ZhNvJY=; b=fMHSwdWBpysbeo1Y
 mF8qyROaNIEzcjL4hAE8pAe+P1p8MOtxFc5wlTL4c3hL4B8/Do9jQ9lx3EQ/wi5u
 lih3FIeUOI1OwzuiQsGlpB/inhpS675SxzIY+Wgb8YB4+5/5HP2c0TMpNEyx6+xp
 WWmnauN2GhE1N5U0uAG5drADfelQ2lXw7jBzSVMgsbZVOHdLBSSJiLgdmnN00v+G
 xy6sp765mn4GbWbQR+aB4MBNowGeY6cU6jVJTEMcxYAeVet02Wet62zNUd+bYrn3
 AN4FWCB6INMaBMKOdyMUC5I8ZkXayss0HHgYqFjfWXdt2Ec2MS4980kuD6BVYXBW
 SZX3vQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhpjar716-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 07 Jan 2026 12:51:32 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4f357ab5757so6607791cf.0
 for <freedreno@lists.freedesktop.org>; Wed, 07 Jan 2026 04:51:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767790291; x=1768395091;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QUZTglwraTogm7+NgckDuNvX5948M5h70ehV8ZhNvJY=;
 b=Uc1/LMxco46Cen92oPwOB+gOiImkk0drnW59JBp8R+CHLq8ISJW/5E5qffkdhZtI/x
 PgXmC9ej8HguOGYvioW5AQQUesfn/YLnFixVkbvoMTJOOg3zI2CU7Q12GeZc+h2KOMMB
 s1Bk2ZnK9dl3GZlv9f0Lm/cR/hbR01NC6XyiwK/6roj/xGx7NEFVsTWrAkEQ9bzeVINa
 dDs6WfrnUL4GVfbiBvsKV/u03n5RIByqcJfQwlwZD2G3DLuFnZDeJrYgiJSutllJyRXV
 /hKFkSvjXmJwMCFDz45W9TT9OKjP8x5NSthpLjKVsMBL7SwO7HSnuRrehtmncNZKsv0I
 A35g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767790291; x=1768395091;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QUZTglwraTogm7+NgckDuNvX5948M5h70ehV8ZhNvJY=;
 b=bcnloz/jJV2rn4AIddwiR7jreqGGqECe7FA5uYEDXqp/OKjBpJWrka2ZMuZk7ylQTS
 IJ14tbak3yySVd0gA/8KPJqoP4cY79sfbfYjW2vXQ1QfqdYoNgHzSKWTYONHuF0v1kXC
 nsdTPxCLzAj6422eztkocMNBbQIx/kHZroGxhWL6BJYbYlmAfaKAlKK/enMaRmlOZXpS
 7jyCN8fqe86ry/+shK2vMl5R2Z/U0LYW3RtBmsdb945ce41eyBZufESvfFB0YYM4w2NC
 NLbKqibZZLcB9BboSo36mnpPDBFg03RCntqDyjrdRE07LMqXo7zBhr4d+eMC/s5nI5uz
 xIiw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWnz40oknh79vHmG2i2M8CU503ielJ2gN7GO3HvsiuD3Kx2V6qAsLRAYfT4bIDIrZNtudB71k1DuNM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzesFFFzSIc56Cd4RVlknVtB55eYmhD1aHIs7guC63kDgOEoy6S
 j399ZniEnUT1vBsUblSbHr112KHWzxFtJFHjqXEmNMmqpq7HGJqi+0kjzaD8VuzqhcgApxxcfRK
 3AvomPEFki650pquimFMx2tIY0yW3ZxJniOHZ9uQA/62fnz8SbHo94U+9cxFJHS0hKrbfRY4=
X-Gm-Gg: AY/fxX6Bq93FzRTsz1BeTmpYNKqzQuoU+DpRhzeZ2WtzbNuX7juA0GC7QIcORbhqoLP
 JObK2E3puBeL7QVIyKUtFAtlaWEA5kN6VqZ+nrRUBxWRnJnDLcUS1j7hP8WTDv/wvo9YC0qstqj
 uwn9OtJtyouxZ2WZpWy1BlKnw40qLQiwxivZ7T6P9XgbR0NxbxAdv5UlEoc2110UmtBOX6fZB51
 gDcOWcrbcRnOQHPwTdG3zbbofVsrKWjEa0EjFS7xZwmdF9zpv/jDAdtduf/Ktsbrv02/TB7wHv8
 0Usc9oXQjUElHkHhzCZCBlWI2MQPeU9K6bWVIaKmmfWoyPoF7xMMoDNtRQwJTNoJbmONK4ap5zn
 rKURlvTqmbLfXmuLMvM3PCmLUelHRAGO3k0cIKauI6To7K6NBGUM4+Jm2AopKbr3r/4M=
X-Received: by 2002:a05:622a:408:b0:4e6:eaff:3a4b with SMTP id
 d75a77b69052e-4ffb487595amr24143911cf.4.1767790291411; 
 Wed, 07 Jan 2026 04:51:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHiICMonpfvJ/R/ogSG1ceuU5+Ajgk2M561kN++MvOVvu6wIhe7i7YbrcIT4yFCVxsLVoB38A==
X-Received: by 2002:a05:622a:408:b0:4e6:eaff:3a4b with SMTP id
 d75a77b69052e-4ffb487595amr24143771cf.4.1767790290995; 
 Wed, 07 Jan 2026 04:51:30 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b842a563f0esm511541866b.60.2026.01.07.04.51.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Jan 2026 04:51:30 -0800 (PST)
Message-ID: <af654d22-92e9-4ea6-8431-c76ee844d32a@oss.qualcomm.com>
Date: Wed, 7 Jan 2026 13:51:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/5] arm64: dts: qcom: qcs8300: add Display Serial
 Interface device nodes
To: Ayushi Makhija <quic_amakhija@quicinc.com>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: robdclark@gmail.com, dmitry.baryshkov@oss.qualcomm.com, sean@poorly.run,
 marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
 robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
 conor+dt@kernel.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonathan@marek.ca, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, quic_rajeevny@quicinc.com,
 quic_vproddut@quicinc.com
References: <20260104134442.732876-1-quic_amakhija@quicinc.com>
 <20260104134442.732876-5-quic_amakhija@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260104134442.732876-5-quic_amakhija@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=efMwvrEH c=1 sm=1 tr=0 ts=695e56d4 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=OIU6w6j0321fZR4p8lUA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: c8qjXGS078yFYcpt-IyR_hvgwb3RdkGl
X-Proofpoint-GUID: c8qjXGS078yFYcpt-IyR_hvgwb3RdkGl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA5OCBTYWx0ZWRfXy2ngntC5h7qi
 2DLyMD5C/fmZpg3esjVKSdCAsUmBooMhwSgDpskSxM88PRsW2oJ49TAPIgdkxVIG1VKhJUBpkkt
 nEpebXGy5ff62F9iJqxiRUu23Cs9zw+c/ZgpFZbpd+XEwi0VPom1sdEMfQgohMwwBNNsGuT1kxF
 YcdoXRharYPln9MUXu04xY3AHYmBhVtHbr/DGpcUR9CmtzdiJw65WPb4+DIx3GAr+EdO0nffutP
 8xhuPmuj7cQ9HhhwAiSe075LMxFmTf1HoFWJj2beXX9GlnUQ3Mw18VLaZT3rUOdB3BME/Uguwgv
 Hudr542HyUdfQeQGheFbKc8BRLX5nLow96MJsXz/ycl5DmbcqoUgw+A5GJFVyccwUY+bdQuD2Ws
 QZWbT9WEsirENhM1AKTdo7lOSSCqacjqX1fPtuF/KUreqRM35CxfqVk4kb3YwxoEsr+swCPr9YL
 qM4dOGdD51b/3n6OvGA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 adultscore=0 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070098
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

On 1/4/26 2:44 PM, Ayushi Makhija wrote:
> Add device tree nodes for the DSI0 controller with their corresponding
> PHY found on Qualcomm QCS8300 SoC.
> 
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

[...]

> +			mdss_dsi0_phy: phy@ae94400 {
> +				compatible = "qcom,qcs8300-dsi-phy-5nm",
> +					     "qcom,sa8775p-dsi-phy-5nm";
> +				reg = <0x0 0x0ae94400 0x0 0x200>,
> +				      <0x0 0x0ae94600 0x0 0x280>,
> +				      <0x0 0x0ae94900 0x0 0x27c>;

size = 0x280

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

