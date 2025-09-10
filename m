Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96980B51739
	for <lists+freedreno@lfdr.de>; Wed, 10 Sep 2025 14:48:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32A5110E0E7;
	Wed, 10 Sep 2025 12:48:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="eb/iU509";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01C8410E0E7
 for <freedreno@lists.freedesktop.org>; Wed, 10 Sep 2025 12:48:47 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ACgZ8i022280
 for <freedreno@lists.freedesktop.org>; Wed, 10 Sep 2025 12:48:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 2hLzDCHQ287+835m55C/xeetdRQfkul00hmOXMYpJPE=; b=eb/iU509PSQTrGCB
 gdxgseS4bxmqf6d5tCf6/BZIv7GJhIiXcJ7IDFYc1VPr0rVPsBaZoFxQckC6ChUO
 8xrxv+71kRnFabbee08/GiUHWb5FIYLLyzEJsb0MFYUZmL/r4FXK0l5oRoiQk4UG
 H1gn7e0SKV37BmH6ssECSBzyWkgnA4Z2UBH6GHV6gQ+Ikfx31PEOlQHbWPxlEQMw
 8XveI8/zo+/rblh0B+Fc5HRAwfRRs2qobZBldpVhJIoLzlq4BUlPzNWVRmsoeSs3
 tbCgv858lHWRhFV3vDyJF1UbWr6b3LbJHfM05+5NMoeddvMGdQbXLrqTX8qBRUak
 4apKKw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491t380a5e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 10 Sep 2025 12:48:47 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4b604c02383so17201331cf.2
 for <freedreno@lists.freedesktop.org>; Wed, 10 Sep 2025 05:48:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757508526; x=1758113326;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2hLzDCHQ287+835m55C/xeetdRQfkul00hmOXMYpJPE=;
 b=DDXMp6Ejzw4a2oJxXbgVHFpAnoocWHX2GOcw66siS2vtUbfvLUe05MXicgZCuWBxjE
 Qq+XUEKrAVaqi3YFcC86wCOv/9cEM2l6/Ew24tQvcCnrMTvQYucUc6rf4ID0zLhUKme4
 Czue1mrFogm2ZgDWblQJjSAwRAGL+Z7ftAFB4LfIa5cAvmqly8LEBkHbYWsz32GZb7Pl
 GpAq0dLt44nHFEHnFX0FccjEYPwLTsjATyl5Cen4EIs16bkvJx8YV9penBRK3EkeTMUk
 6TiVcFHk8rhU+vco0kdb7UgACR/vHhB/ot7ZSYaTu2df8oPEFUOil9vw6uCn00RFz+yy
 dVXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJnUXgodqZ+/EAzE716v5dotknJQy58jA7svH9xA8VuB23mOa8ub+nOPJrGo9WsrUPENmKN1plRHU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzw+8kNWxeHa4uoI3RKtVfxbIyXhTZMgahs4TR0rYLO5YM1Fsw/
 +8sXOCKLVJtSMuvmpUkWbopNsWdfRZsrzntGyDLcMQm6iNNjEFHscKvxxWz9nRS8AHaHn33tGGH
 aQBqMqoEYHUaxKzxxcBMAdM5yO9Z3y0O2vgb0Kg01oGPQqw6vQdGN3Uj9zBpRkyHY+Aur0yk=
X-Gm-Gg: ASbGncuj5JeryOixtmZcufygQGrzKj4aGknhZqRfzcUWfMotu5ePwOe3MpdSg50N+/F
 jhrj1LT+6y9pd4c/t8cCNAlkk8adRaIB8BnqX9N5/bm/uhz+T2JkYPefYR4u38OLvhraAa2pafE
 IpmLdAmIcC/a6n8r05UEdGYhs61+7zO3t/enm1rToW1BSRWz0HpfgOLkHfwZIlyFFUNsrxhhI7s
 E5pKEKJhnewcjVeu5zNnEB2Xxcf8EJT4T+rZFy6nu7WfXj1NOtlbaxVG2miMbton/fc0RPzhS2p
 VJWaCdEgL3+H8zqYTYw1BzSzWrf039O7YNemh4MbRjogQRXEXiFGSah3hIDyE6PGA6w8x2FSfiq
 URqtVI86tz6SmcrznDrhKlw==
X-Received: by 2002:a05:622a:19a7:b0:4b4:9070:f27e with SMTP id
 d75a77b69052e-4b5f826059cmr106840891cf.0.1757508525909; 
 Wed, 10 Sep 2025 05:48:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFQJJlCuiyW/pcIWNAfk0Cxu+p3Dd7IMOZXLW6sjV+Sj7pqR7+0vV4WzKU91XkLNccK+WxwgQ==
X-Received: by 2002:a05:622a:19a7:b0:4b4:9070:f27e with SMTP id
 d75a77b69052e-4b5f826059cmr106840241cf.0.1757508524991; 
 Wed, 10 Sep 2025 05:48:44 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b0783049ecbsm163687966b.8.2025.09.10.05.48.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Sep 2025 05:48:44 -0700 (PDT)
Message-ID: <9463ba5b-f305-47f4-854e-2ba0dd41bb32@oss.qualcomm.com>
Date: Wed, 10 Sep 2025 14:48:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/6] arm64: dts: qcom: sa8775p: Add gpu and gmu nodes
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Connor Abbott <cwabbott0@gmail.com>,
 Srinivas Kandagatla <srini@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>
Cc: Gaurav Kohli <quic_gkohli@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
References: <20250910-a663-gpu-support-v6-0-5da15827b249@oss.qualcomm.com>
 <20250910-a663-gpu-support-v6-3-5da15827b249@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250910-a663-gpu-support-v6-3-5da15827b249@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: lhiUCdNo5AOTkpjQa0DRWdM4j_68uzQp
X-Proofpoint-GUID: lhiUCdNo5AOTkpjQa0DRWdM4j_68uzQp
X-Authority-Analysis: v=2.4 cv=NdLm13D4 c=1 sm=1 tr=0 ts=68c173af cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=EGTmXSwiq2C_3XJcCkUA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDA2NiBTYWx0ZWRfX/xtWbp3fABDJ
 TDJ6nzGiBDbEsp/SVwSa0ym50Q6s/PjDgdVyX7Qm8ZvpGESat7uYpMG2k23JnzqhUwYqkMl4SvL
 CpzQr9vIZC9eUTmtt7CvpIXhBCL0WePPrMOjnWpqwy6+yo3enfUgtD1WWqPQghPgota3PFVzUeO
 tRoms+M4qsMPULn1BWxXKQoF7TdoxGcRBYebp2OTvkMrVVJdG8rPjT3FnROcqC2RxhGbjqrcFPE
 0omaVRBm6vpzm0B2wc1rwjZarUmDYNiBEYzR1YKvMXyPZnbbzToCXAhcJFsOvftAXNN4lg5IdPO
 hklM60OEERJqLudclj4Y+KAyHJPtPxcCUItu3f6EsBFw5PHX0Ou0okIgP4wmYXfYA0SyvNDLPCF
 O0iLf2qD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_01,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080066
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

On 9/10/25 1:25 PM, Akhil P Oommen wrote:
> From: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
> 
> Add gpu and gmu nodes for sa8775p chipset. Also, add the speedbin
> qfprom node and wire it up with GPU node.
> 
> Signed-off-by: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

[...]

> +		gmu: gmu@3d6a000 {
> +			compatible = "qcom,adreno-gmu-663.0", "qcom,adreno-gmu";
> +			reg = <0x0 0x03d6a000 0x0 0x34000>,
> +			      <0x0 0x03de0000 0x0 0x10000>,
> +			      <0x0 0x0b290000 0x0 0x10000>;
> +			reg-names = "gmu", "rscc", "gmu_pdc";
> +			interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "hfi", "gmu";
> +			clocks = <&gpucc GPU_CC_CX_GMU_CLK>,
> +				 <&gpucc GPU_CC_CXO_CLK>,
> +				 <&gcc GCC_DDRSS_GPU_AXI_CLK>,
> +				 <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
> +				 <&gpucc GPU_CC_AHB_CLK>,
> +				 <&gpucc GPU_CC_HUB_CX_INT_CLK>,
> +				 <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>;

Akhil mentioned offline that having this clock under the GMU node
is a hw team recommendation that's rather platform-specific

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
