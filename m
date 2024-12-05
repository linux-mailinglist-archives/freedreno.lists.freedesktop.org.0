Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 333199E5F0B
	for <lists+freedreno@lfdr.de>; Thu,  5 Dec 2024 20:46:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1289910EF9E;
	Thu,  5 Dec 2024 19:46:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="R08GK1uY";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC2A310EF9E
 for <freedreno@lists.freedesktop.org>; Thu,  5 Dec 2024 19:46:32 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5HaOi9004679
 for <freedreno@lists.freedesktop.org>; Thu, 5 Dec 2024 19:46:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 dSG1O+bYTyrcRa62Fx5O4atU7rZOKptw1L3OzbpcQAk=; b=R08GK1uY5+FmtGSN
 s8PhiOPI/EKtwq5qEQZn1LSGxgTA3SxOXP2QQNmEnT8CA68TVNpLOUttVXhtAk0K
 cuzmo2J93LWRE98UfyerMiDKaHwIWQPN1sDnH1wvP/FOgM/VRV1LeG/muNibm6e/
 zJRvvpM5/weru788Xx7sFTLYrSI2nZQHfXsDaqCl5T6Az4OxLf4pQgsFJ3Gpwmj6
 LuIVJoRBT3xLYJt8z5RjXhEsNhB0GffUki7g8btLKBdLZ8EjlisStMz6rdJJXAOS
 jzZJYLSve12J8wrM4vDnYzfGXPEmVeNw6H6GV449+231GXKPAxOKZMbcBaAhuu1B
 TSQ4HQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43ba141jut-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 05 Dec 2024 19:46:31 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4669114c62dso3385691cf.3
 for <freedreno@lists.freedesktop.org>; Thu, 05 Dec 2024 11:46:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733427991; x=1734032791;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dSG1O+bYTyrcRa62Fx5O4atU7rZOKptw1L3OzbpcQAk=;
 b=R62oeigh1hUlq1T6VAo4RuZKJ8zCmB1mdeIJWSH/Ppp4HNFoa9r+/WeqVxQwHBVWrA
 6+oC2x8MiAVlGLfqa/TFEK9iY4AvNVyk/40LRkeFvchj9IzLL1UrJMklHlLo2f93c75F
 4J7kkS7g0kQc+rIC67Zs2e28+o66Mr9OVnRx0pgc+W3xaQOlb3O+jPKkBC+CUJf8lU3B
 uFOr7dh8b4sh6AnxcByfV8rApzjxOZWNrvfyV7NjGzrCKzAwlW7UmjPmDll8L+3AAQzC
 dVICI2oxalfUXumLG+rZbMOQnzovYWLLquFOxQhNn3Wz14xVD8ZP3pVv4fmNV9nlfGjM
 hQwg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVySaW13uBydrR3EL55m5Aai77h28ZaOKPWkdlUDrkDBvLJd6xP54YLhztC34tQC8grBlM7z9KWwo4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw52ryraQGqLCIFTtu2wm6eSvJMXR4j5/SqKXAcGBmbOF7ab/oE
 6d1C+If+bptIsIlh9M19T6TgnvSc5o1yDCCEY3uVtXLQbN/oQgvbKlp6/1YRvmNqbQWAvI98met
 8WEeFuwSPmceaT2RF2mFUbZx+cZhU3Lft8Q+qI2XHfcTUGQMIYSby9iGDOA8r3n9hN38=
X-Gm-Gg: ASbGncsyEjWqRRQLnLbh3VcaFfVotCtJp4ljRJVMwEQSeEhXjDw2ocAiSzaKJ4rPPsG
 5Hsx8WrkK35XF/u/Debq+BybSBPn4cvdnWHu82crtGsS87o7HgKlOLJa+9QG0090rW6AttFBDO6
 70WRsCz5y0h2TQPOSZmr1fLcrp2yua8Zi7OQhB6fXRcg556k5UNLt5fuQG4B8k2qVT0c0LPepF1
 j+9ndekiHTskVFhKtJLnND0HpxQRNI8FkCibZ4fQemiIWVxz5RfiraGqtdFHUUxMwjdYXW5A1tu
 m+NjLJA0QBXi11Bvho73kg8dsFqePks=
X-Received: by 2002:ac8:578d:0:b0:463:5391:de49 with SMTP id
 d75a77b69052e-46734fa37b7mr2634561cf.11.1733427990999; 
 Thu, 05 Dec 2024 11:46:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHoha39Xn33F4EOwHF7vpjSu272E8a7iWXvvm8l9c6Uvl2FQwoxl3+j9ecdP6Kv90q1aqjorw==
X-Received: by 2002:ac8:578d:0:b0:463:5391:de49 with SMTP id
 d75a77b69052e-46734fa37b7mr2634221cf.11.1733427990512; 
 Thu, 05 Dec 2024 11:46:30 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa625e96aebsm134594566b.65.2024.12.05.11.46.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Dec 2024 11:46:30 -0800 (PST)
Message-ID: <573d254c-9478-400a-9811-d8de7eba6dcb@oss.qualcomm.com>
Date: Thu, 5 Dec 2024 20:46:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: qcs615: Add gpu and gmu nodes
To: Akhil P Oommen <quic_akhilpo@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jie Zhang <quic_jiezh@quicinc.com>
References: <20241126-qcs615-gpu-dt-v1-0-a87782976dad@quicinc.com>
 <20241126-qcs615-gpu-dt-v1-2-a87782976dad@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241126-qcs615-gpu-dt-v1-2-a87782976dad@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: KJAEs0VgySvAIjEGTdlJcS3Rwb8SkxNG
X-Proofpoint-ORIG-GUID: KJAEs0VgySvAIjEGTdlJcS3Rwb8SkxNG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0
 phishscore=0 clxscore=1015 mlxscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=853 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412050147
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

On 26.11.2024 3:06 PM, Akhil P Oommen wrote:
> From: Jie Zhang <quic_jiezh@quicinc.com>
> 
> Add gpu and gmu nodes for qcs615 chipset.
> 
> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615.dtsi | 86 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 86 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> index 8df26efde3fd6c0f85b9bcddb461fae33687dc75..f6a3fbbda962f01d6cf2d5c156ea1d1d846f310a 100644
> --- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> @@ -387,6 +387,11 @@ smem_region: smem@86000000 {
>  			no-map;
>  			hwlocks = <&tcsr_mutex 3>;
>  		};
> +
> +		pil_gpu_mem: pil-gpu@97715000 {
> +			reg = <0x0 0x97715000 0x0 0x2000>;
> +			no-map;
> +		};
>  	};
>  
>  	soc: soc@0 {
> @@ -508,6 +513,87 @@ qup_uart0_rx: qup-uart0-rx-state {
>  			};
>  		};
>  
> +		gpu: gpu@5000000 {
> +			compatible = "qcom,adreno-612.0", "qcom,adreno";
> +			reg = <0x0 0x05000000 0x0 0x90000>;
> +			reg-names = "kgsl_3d0_reg_memory";
> +
> +			clocks = <&gpucc GPU_CC_GX_GFX3D_CLK>,
> +				 <&gcc GCC_DDRSS_GPU_AXI_CLK>,
> +				 <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
> +				 <&gpucc GPU_CC_CX_GMU_CLK>,
> +				 <&gpucc GPU_CC_CXO_CLK>,
> +				 <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>;

This one belongs under the adreno_smmu node

Konrad
