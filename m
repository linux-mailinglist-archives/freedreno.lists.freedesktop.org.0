Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF832C3F0D6
	for <lists+freedreno@lfdr.de>; Fri, 07 Nov 2025 10:01:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5D3710E1AF;
	Fri,  7 Nov 2025 09:01:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="I8q9+gFl";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CCvps4nf";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13D3110E1AF
 for <freedreno@lists.freedesktop.org>; Fri,  7 Nov 2025 09:01:49 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5A74huvM585051
 for <freedreno@lists.freedesktop.org>; Fri, 7 Nov 2025 09:01:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 7Xwdlres7UKZJumX+U/fUtnUAYm89N+blgEZuA7qA+U=; b=I8q9+gFlQqTjsN8F
 KhoD6sB3C3NlEz+F7BhoABfsklg1CZH2Ih0raJ8k5PnWjUq6B5sux54Ow67qkL61
 g0TtnetH8cxQjfldn+drdhMRKmZMDAIHWse9W+2793zrOLb6TTTOUTO4fRAZScnu
 Gtx82Ed2i1XtACO1P62nQ1fj64zrFNTEHLWoAIp5nmGmnEoacdSgUL5dmEbFEV1d
 guk+My7kHsJq2uxOSBv5nrxaGBgrTnCk6Q3X09/70+b3bsJpOYzP5chx8A3KBGTZ
 65FgVZ3KbdbL/MzBx/Vy8p0iJrT1ZsDgcUTx8j/Yyy5dinvabtkhizkL/hht7dj9
 8N1C0A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a8yktjegf-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 07 Nov 2025 09:01:48 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8b1be0fdfe1so19317385a.2
 for <freedreno@lists.freedesktop.org>; Fri, 07 Nov 2025 01:01:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762506107; x=1763110907;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7Xwdlres7UKZJumX+U/fUtnUAYm89N+blgEZuA7qA+U=;
 b=CCvps4nfkDTG7jwtN2rjWXTb/rtb0+2WAfcGDKH3q5e2E497mMlxwIaGbXfTUf6Jb2
 n++KpA6Mf/fHUsEHYpDhpvTM0hVb00SFyVT0km8L0todD46ErMkNIq2ASlvx/a2D/pSt
 G49T/XsYFSVjVVDjbv44eiieyVYqdgOYsw8FBvPCJ0+pKTAxWwJd8JB1PqLpza9VYpIS
 1UMOMdFT4PrzyCnN2cAzKSzwuqOcwXbnBL1tIcwb8KNbtkjaxsdJY8IQiEjYiHCg8nAG
 47PKlWcR7GFriELi9Wuoon4nEiG4R4i8Zv/25G+ma6JSRXCHnikx4jyOJDSxP8Rj1e0G
 qy0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762506107; x=1763110907;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7Xwdlres7UKZJumX+U/fUtnUAYm89N+blgEZuA7qA+U=;
 b=ZibZAjY+AK3WfSPP8yqPLkAio7vXTxVA927VHQxS3hZaCTSjkbsoOjespHtosEkFYj
 jmyuKV2Nj9sEJVl3B4V4x3DQL6MalCC8xv0UYqkvaD4N3HNCYW2OXhiKj90oQrxaPBTy
 Nj+7eN0rtjXgICwHwSY55wN+yyAayOaDR+A+b2la6PtoJSXXwrMY2tdgaMN0U2bEmYBf
 /UumHo3ulAk6INCbMHLyDtzxCK/5tJ3DcCHn2yX4ELzsby5kAe916zCwlfF68TpjgHsT
 Ay+0heAhFoiPaNIStah+q7qSfcBcvVLlZSS5S20IXhIPWBhFFajz2X77F1ky3HxtAcZz
 i1Fw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXOeH4F+ZMWQXtg2QZ08iv6nnKMu7Fb+pzPvjyl8nLp7g9yZou804nPmRnM6q9yx/NwmL3N7hwu2I0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz2Wx01/J9rZP4P1Mp1SLqV71HOVZ1/5KF5CUdch4VmAvyX/EHh
 mnInDCjAxgfZSUXGMcvTT+uo82HXzXD69D8kS4wcddlvQpnB6FMOaTtic7FjQzYT0PxKd1CRT+o
 eRbGOOFMxlL9FTTxOjsabUGmIE11+qom3heffeg3TimUCA4xWmetxbOO2L97m7GQLi4ReEDg=
X-Gm-Gg: ASbGncsMg9TWABwuWgZXmfkpkInWgwl6J90WNqDXYg5gZinl82QzZ7nH5DVRKP1BnF6
 ngm/hrYYOJOu69hdSpU1S1O0RnJgUqsVq2HoAfEQN/iVT+Gi/5jpi3G3uKAbKPDvdq72Gddpujl
 qZQd3YuvmiKnA9k2nyAsP79R7B+VFsiySFuxEsHGYwPrSaLTKE9H87jA7OXE2OM4Lrh/VvUHaYM
 5GD4C4gab5Cx8mF2s7IGCvP9u32f+0SsUDdl+q+p6PsX1bXlrzn0VpoBL77r4JpZ3MFF19cJu+I
 hdjnIb7BbDoW91w19gU5tlJknJyDOcqHKMZ3R4kZ529UjP9LRlaTl/4p9KrcCJyAAHurioayhiJ
 ip5ylvCpYfyBuZjABRLD/UnVd0s3dYgBbCUpsXEyeapIdq76vFCgLJjrX
X-Received: by 2002:a05:622a:181c:b0:4e0:b24a:6577 with SMTP id
 d75a77b69052e-4ed949225d6mr17918071cf.2.1762506107428; 
 Fri, 07 Nov 2025 01:01:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFBs2ARbegNGfxVipaDHjwLs6J9evX5dbivnH5xxAvdhKWOJJB0eRECaR784rSXA0QDalhnCg==
X-Received: by 2002:a05:622a:181c:b0:4e0:b24a:6577 with SMTP id
 d75a77b69052e-4ed949225d6mr17917561cf.2.1762506106773; 
 Fri, 07 Nov 2025 01:01:46 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b72bf97d43bsm191672866b.45.2025.11.07.01.01.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Nov 2025 01:01:46 -0800 (PST)
Message-ID: <defc450a-1699-4682-a41e-59035bafccbe@oss.qualcomm.com>
Date: Fri, 7 Nov 2025 10:01:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] arm64: dts: qcom: sm6150: Add gpu and rgmu nodes
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251107-qcs615-spin-2-v2-5-a2d7c4fbf6e6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=bOgb4f+Z c=1 sm=1 tr=0 ts=690db57c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=mufC2ag2MkhLk2B-SdYA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: pdnP5R77h2sjjr6UvQ6cTo5DHeFUqqrr
X-Proofpoint-GUID: pdnP5R77h2sjjr6UvQ6cTo5DHeFUqqrr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDA3MiBTYWx0ZWRfXzM6+4DLAodm2
 3gYHWRX+DVc2PNHBoQhhKACp294EUnVCfCTTquB65J6YSxHnl98W4l62m4tD6NUOOGN5yBn8QTT
 pcbrekhVvFaYF/WReeWaMKOHyhBrYcKZe8ptCD2OsHytpjIkeB67vMkOVTtWumqm32YbUomi70S
 tgbZgofx8Laf4owFJBMCvnS1c8jQjyImFxGKbjsOAfhd092qlpR11Jxr9XoBPMWIcdF1QloxR45
 ftSlFJt05r8aCftBJ0qWiLKNdlIrOgwQWrVTUHDkEcHBqBRTZYV6ZVQ00vprpgnm2qpn6V1pFVa
 KKI1drQZhf/1Zge1zHtjyFrSPW8yOVQmog8nG15+CvXCPPWMV6Qi7x+cj+b7rt+/HSX2fHaSJjq
 nmQLGh2rCuobPDoCCYaVgPQP7JkJ7g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-07_02,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 impostorscore=0 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511070072
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

On 11/6/25 9:50 PM, Akhil P Oommen wrote:
> From: Jie Zhang <quic_jiezh@quicinc.com>
> 
> Add gpu and rgmu nodes for qcs615 chipset.
> 
> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

[...]

> +		rgmu: rgmu@506a000 {
> +			compatible = "qcom,adreno-rgmu-612.0", "qcom,adreno-rgmu";
> +			reg = <0x0 0x0506a000 0x0 0x34000>;
> +			reg-names = "gmu";
> +
> +			clocks = <&gpucc GPU_CC_CX_GMU_CLK>,
> +				 <&gpucc GPU_CC_CXO_CLK>,
> +				 <&gcc GCC_DDRSS_GPU_AXI_CLK>,
> +				 <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
> +				 <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>;

Is this last clock really necessary?

Konrad

