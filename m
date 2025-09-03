Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDCFDB41EE1
	for <lists+freedreno@lfdr.de>; Wed,  3 Sep 2025 14:26:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9236810E7F8;
	Wed,  3 Sep 2025 12:26:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="OET5gcK9";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C900110E7D9
 for <freedreno@lists.freedesktop.org>; Wed,  3 Sep 2025 12:26:37 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583BEuYN001978
 for <freedreno@lists.freedesktop.org>; Wed, 3 Sep 2025 12:26:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 OZ5GA5CDWjuk3FRi9xYTdj/A11GKAj2IoG13+xINrgA=; b=OET5gcK9yQVtfbjC
 9ljJgz5MHFvR8cDDUKF4gKMQjo/87UjlkPo4MzrVYQBaCpXIOlnzzwrBOMM/qprw
 r0jq66Rb1hI1GDKe282LJq6b0eXL4RvhxQlud9P94peY7coqbctEHF/WVByOjkb6
 Cfyzk6f/0mM7JGfbEceUa4YqYhcMXq/KUHJBTMWaJSkmvzHUlRMBy+AAfFoQwtmk
 CRj0cyYfM2NgF8iWcrIYdDtzcx83dkf9IicWVpUeio+ac/nJPVvCsCBTxbScn7kM
 vkJ5vgKDqqfOR/57NddXAKpZtCJk4UlBDoRpdSrCPgZ2p08cljodg2jeyt0Yed0d
 NV2wmA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urw03nqc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 03 Sep 2025 12:26:36 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4b32216a52cso11328021cf.2
 for <freedreno@lists.freedesktop.org>; Wed, 03 Sep 2025 05:26:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756902396; x=1757507196;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OZ5GA5CDWjuk3FRi9xYTdj/A11GKAj2IoG13+xINrgA=;
 b=h9DVrN2F1YYBLpHWXXK7UtUZM7p6XlJs4fK4nIhPPR/xDF+V93ZpwpKnEJ5kPxdcHu
 2fShn/IZqMul+5CZX9sjw4MVBWBLBETNvw5CDoSUKXcSFJbBl4ZYccN3iL5KsuMKWBLu
 fg1lFsqN6IN9CeQoaTNUZN5HXSHgrDdEneGy7BJtNsstAfjkkeQ9R45x8GH+/C1QSV08
 2FTJhB6YywyXTiYtlAPAyFP/IguJbfwXqS1MZb+jpNjFlT599mOVWfGgeS2oT/ajWyyB
 WvVU9k5+Vsemaa1LKa2c4jBp6aXo4r27LdaU/ENu+vEePEEgeaLbgkzbAzriYoGusORa
 f/Ag==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJ5silUsvlEr3b8pnOWmRMOjFnpAK/yAOVfXU2JYjO799CzQvMNOE9tDMIa7f/6uqM45w0SBr5L6I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YykSp5cGvMmcuhzDWm9YghfTa3tynCLQ8eQ/qXTGPF1hcxEL6M+
 Ve9lcEgGyuPod8IP9FAIzKKzVd/E5YMd/mvp6Ir0rV4phb+++8BPNF5kyPfe2HtxZIZh7vyZHaC
 SCLG0SrLgtx+h5sPucVL91Cg2pFPRxf8SYZVbRN9eeQCaUnHCWVg5GZPtyB4ZHMvTw/NY3do=
X-Gm-Gg: ASbGncvfJ49tKjpxQyKBhf35YcTT6+UnZSRl3h6J0wKHdw9KJ/WjYQJpjAu77DvoJVm
 dj7PwxFHLum0Cr2BvupSlPxLmfhPpfmeGDIJk0gyUvk/pXMiuF0a+u27X1Jp9FVwbO6tbTgV+X0
 FbqqA33o6H6k1IpG3UDTmeVew7jQFQIHXL5B11AcdEnfYPOuuKmRBP+CAtiMb7FR3PjXlBS50Tq
 Zy2tOil/4l51kTbXRppBH2GRK/pF7Shek5G73sw7u4DvLiD0tUcw+JJew//v5SmAGvDrnX+V/rf
 42tEtl3PvrRx3CgABCPNe4BOKSAr7pB7umXMZi1EnZ0n+tVqOB6vuDPjmYqfvkFRjXakZ9t2k+O
 22xPh95M64tigkXYGjV/dpQ==
X-Received: by 2002:a05:622a:3c8:b0:4ab:6e68:1186 with SMTP id
 d75a77b69052e-4b30e906341mr139109941cf.2.1756902395575; 
 Wed, 03 Sep 2025 05:26:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHFEC6NgbGYXkQKGTNQ8MIs7PdgRHgCWkfSpaRZJd1PT0vRXtJCGBVR5vOdjk5gYSmc6YfsbA==
X-Received: by 2002:a05:622a:3c8:b0:4ab:6e68:1186 with SMTP id
 d75a77b69052e-4b30e906341mr139109331cf.2.1756902394836; 
 Wed, 03 Sep 2025 05:26:34 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b046f888b95sm82236666b.34.2025.09.03.05.26.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Sep 2025 05:26:34 -0700 (PDT)
Message-ID: <f11b778d-eba1-4712-81c7-b83f2cb38b46@oss.qualcomm.com>
Date: Wed, 3 Sep 2025 14:26:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/6] arm64: dts: qcom: sa8775p: Add gpu and gmu nodes
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
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
References: <20250822-a663-gpu-support-v4-0-97d26bb2144e@oss.qualcomm.com>
 <20250822-a663-gpu-support-v4-3-97d26bb2144e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250822-a663-gpu-support-v4-3-97d26bb2144e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: J6XHooyiR5y7tZ9RO5Jb6l1dAcQ1ajRp
X-Proofpoint-ORIG-GUID: J6XHooyiR5y7tZ9RO5Jb6l1dAcQ1ajRp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNyBTYWx0ZWRfX323YqL7d8JvI
 EAAYqPzB+TnjfaZYqrhlJVrWcMMKXvHA2qHQCcCT8/LHrf/+jb4n4BdLaX5JEKT3ZYiBRoTL658
 DNNHyhu+UICic1bwds3J/dI/xliEdTwSctlmfF4JOCgz5vGe0D/k5xd5Or3vvMwzHn1cZ0gghu/
 lIcoU6yVd+O4Se7cT8Mg5hyeF15L5MIXeNTqIg1gpwbeatqHGsdwlGgSsipbwRGHyGf1sdc7193
 weFgXA11Y1T8FeYNFj7K0QwhwdFwujO78H7mk0fMjjaGGxNNtUGa0w07vgdvaPQxKpqLydQpo2U
 Xe1aoVA59JwH/kfoXof3GZ5c8D1AODeEArF/mDIV55nbNsgiNd/OW603PIdCdNHEllFrCyxLgnv
 nRl3nhRn
X-Authority-Analysis: v=2.4 cv=NrDRc9dJ c=1 sm=1 tr=0 ts=68b833fc cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=-ORaCNUFwIs1vMjdVOkA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300027
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

On 8/21/25 8:55 PM, Akhil P Oommen wrote:
> From: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
> 
> Add gpu and gmu nodes for sa8775p chipset. As of now all
> SKUs have the same GPU fmax, so there is no requirement of
> speed bin support.
> 
> Signed-off-by: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/lemans.dtsi | 116 +++++++++++++++++++++++++++++++++++
>  1 file changed, 116 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
> index 8ceb59742a9fc6562b2c38731ddabe3a549f7f35..8eac8d4719db9230105ad93ac22287850b6b007c 100644
> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
> @@ -1097,6 +1097,18 @@ ipcc: mailbox@408000 {
>  			#mbox-cells = <2>;
>  		};
>  
> +		qfprom: efuse@784000 {
> +			compatible = "qcom,sa8775p-qfprom", "qcom,qfprom";
> +			reg = <0x0 0x00784000 0x0 0x2410>;

len = 0x3000

[...]

> +		gmu: gmu@3d6a000 {
> +			compatible = "qcom,adreno-gmu-663.0", "qcom,adreno-gmu";
> +			reg = <0x0 0x03d6a000 0x0 0x34000>,

This bleeds into GPU_CC, len should be 0x26000

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

This clock only belongs in the SMMU node

> +			clock-names = "gmu",
> +				      "cxo",
> +				      "axi",
> +				      "memnoc",
> +				      "ahb",
> +				      "hub",
> +				      "smmu_vote";
> +			power-domains = <&gpucc GPU_CC_CX_GDSC>,
> +					<&gpucc GPU_CC_GX_GDSC>;
> +			power-domain-names = "cx",
> +					     "gx";
> +			iommus = <&adreno_smmu 5 0xc00>;
> +			operating-points-v2 = <&gmu_opp_table>;
> +
> +			gmu_opp_table: opp-table {
> +				compatible = "operating-points-v2";
> +
> +				opp-200000000 {
> +					opp-hz = /bits/ 64 <200000000>;

500 MHz @ RPMH_REGULATOR_LEVEL_SVS, 200 isn't even present in the clock driver

Konrad
