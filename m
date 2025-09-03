Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2948BB41F49
	for <lists+freedreno@lfdr.de>; Wed,  3 Sep 2025 14:39:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E58210E7F4;
	Wed,  3 Sep 2025 12:39:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="jP8bZfTk";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CE6D10E7F8
 for <freedreno@lists.freedesktop.org>; Wed,  3 Sep 2025 12:39:35 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583BEtHA013485
 for <freedreno@lists.freedesktop.org>; Wed, 3 Sep 2025 12:39:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=oB5zz3RfytAZkiTmGBlOmVi4
 cyClShFOwbxdsuokSZg=; b=jP8bZfTkIU6+CM9/1SrD5yO4OdWZSsNZBiMFUweO
 rmVyZ5TMqda6N3bHDJCAfnxH5MmcliWCFu0OLbCKCGYDA/zdWhdd/Sz/hPATj33G
 GtFZGbk/S4EozmQ+ksCCkNV1aebzoLat1wMP/iwS2PcduBR+HiQNouUeTJ9iokXc
 XEhvxkdzTL0RtAxIZaK+XrkDb58wvNEKkpjFb7lo+Oie6///iTGPSjVNwyMlb4NR
 b4OrT4Uvc/lZAg0JlQXS3VMNYLUk2keeSA/KilcyF/32bZF2JTAeS01AxonLkG4a
 aN/7Qo4/P4voZE8fTljEs70fB+vVvZtGfXYlFK4+1ojtkw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uscv3t0g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 03 Sep 2025 12:39:34 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4b31ba1392fso108283151cf.2
 for <freedreno@lists.freedesktop.org>; Wed, 03 Sep 2025 05:39:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756903173; x=1757507973;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oB5zz3RfytAZkiTmGBlOmVi4cyClShFOwbxdsuokSZg=;
 b=tCVcxSB+YPUgfmNoWq8xpfXM9CzRrlgjhUH3TYaKCzhiH038dg/qfFegt8egeWW+B4
 mOVejHynrAIUx2EJNnBNbQNfX82F8HKLXkyACrw26yvghFSzZS+6OCae1gc6ZwF0cZuW
 R2ZHSnxAWSmn5VeisNuQTR+xu3EIlQ3c4cNdRXHHys119vT7Kq58GpTJ9m60q71cnKWl
 C1J32Gi4OFqB65AuZZ75DqaAALAuNxMYiXbYGgxwr/brL54w2GFx3lhJ/2TPGraXLkqY
 b/QvP8E1Mb+CbpjPypHLpJ4TIgjSortLMo3k2yIwWk41PWQJLcT03B79LIdNyqn/rC8p
 Gx/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXwtSR2NuvLHG58bWJ0QljmSWdgOPjfzmg9sgj3x5dLmjoyhzFtqPrs6fv0eSou6swXhuPiOvVPsa4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzNEm2DDpZMoE4SfdU5MW+XFEIg4B/D+XeDqqylCE21tVdEjhSl
 /MBh7vpdj2X65arWUbu4KQOF7JMNddOhVWyM8YE0EpB2aN+I/cTW9XLEDG60Sh88qokjurXpJ27
 E+IUB0MgDGDgK5tTzNrkJLLA2jBB4m/ztElejCNDdLZICbPMCGAlZT5IGYgK7I0SpvIQI5lg=
X-Gm-Gg: ASbGnctZ3pDcrpUHzeEBtWZf1exjWfLXx0DorFZjtpu6ggzp8wKn7loTQvmzvQsdqq8
 LVbjVMo3ICwO+GItFs9HGPJA8427B8zaCUc/4YQb3GUpPsOv3euOl7bqPjQg2BYOUIElUyAOK0r
 FoyN0/0uEPu0xmSrsOmQErmvMpupdtzEmcgbMSiinh+yW3WNjBZRt/biAe1Jztu9YKmb3XhKu73
 XWtO+fUo/upNrMAAN8FhQvaMUulAknsaA6kfCo1K07NzZWTAI73hZ0QW1KXI/By+SQOwiZCrh7F
 hTy6JqEZcoCuObOstIkJQIpv6nCMVsV9a51eMoLew8VX736ELZqyZTzLicXv+8DPp7Us29exbF3
 eXwAOTmv8MyGMzURC2egr0HSxjglT7c5NQ8neAcF1oquR82j7B+u8
X-Received: by 2002:a05:6214:e8c:b0:71e:bbb8:9db7 with SMTP id
 6a1803df08f44-71ebbb8a459mr109507186d6.34.1756903173350; 
 Wed, 03 Sep 2025 05:39:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG63LR9Aapde9PYpVYUZt99aQbJ5sCqnamanQcH/5zSG/5fKAEXGXcfQRfuN5dgQfaxo69CWw==
X-Received: by 2002:a05:6214:e8c:b0:71e:bbb8:9db7 with SMTP id
 6a1803df08f44-71ebbb8a459mr109506366d6.34.1756903172631; 
 Wed, 03 Sep 2025 05:39:32 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5608aba1767sm503270e87.49.2025.09.03.05.39.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Sep 2025 05:39:31 -0700 (PDT)
Date: Wed, 3 Sep 2025 15:39:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
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
 Dmitry Baryshkov <lumag@kernel.org>,
 Gaurav Kohli <quic_gkohli@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
Subject: Re: [PATCH v4 3/6] arm64: dts: qcom: sa8775p: Add gpu and gmu nodes
Message-ID: <exkrgx6rdotfrrsnklsd7zk4ydehsk5vaoevibpqisyq2dwbd4@sa4kgnuexlna>
References: <20250822-a663-gpu-support-v4-0-97d26bb2144e@oss.qualcomm.com>
 <20250822-a663-gpu-support-v4-3-97d26bb2144e@oss.qualcomm.com>
 <f11b778d-eba1-4712-81c7-b83f2cb38b46@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f11b778d-eba1-4712-81c7-b83f2cb38b46@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMSBTYWx0ZWRfX/Ms96acfPLr3
 5mZMhy2Ua7ENY6ZbCT+jJEkeZwX/oXZ6IywocnvRVTUBH6EOAoqVMNqnUFWcLvXLex9uElKgRcH
 2rpOCpKZs3XCNWM56pYA+fmV66B3+S/uqOsjZ2u0HzYubqVLAviK1s1OvXOPJgglrc3/hMaclYr
 Xl4HyQTCmpuaTjmH1FLhGXpvee3cwm6+MbUemGbhfBCJsspXyIfphlxoIACd/CxjoTU5YpEXcrc
 4ttNhhvWpmB7HW/GLqoQvDGas0pGWuQRWddzHY0BvP9dOt96r4WODrL/Ssv6ErnCiuFZBLbg/k3
 Xkb4SSpny28fNaHR6tKqykZv/6T3Bx40EHHGHMvqhCZc7mW0qks3voTf437O9Q3YjfABpRvDNVa
 RzGM6GwQ
X-Authority-Analysis: v=2.4 cv=A8xsP7WG c=1 sm=1 tr=0 ts=68b83706 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=eIaLAbkvAzmcLstrs1gA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: a4wZc7CGEgtwkdBBeIOP4FsiTRAV0TUB
X-Proofpoint-GUID: a4wZc7CGEgtwkdBBeIOP4FsiTRAV0TUB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300031
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

On Wed, Sep 03, 2025 at 02:26:30PM +0200, Konrad Dybcio wrote:
> On 8/21/25 8:55 PM, Akhil P Oommen wrote:
> > From: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
> > 
> > Add gpu and gmu nodes for sa8775p chipset. As of now all
> > SKUs have the same GPU fmax, so there is no requirement of
> > speed bin support.
> > 
> > Signed-off-by: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
> > Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/lemans.dtsi | 116 +++++++++++++++++++++++++++++++++++
> >  1 file changed, 116 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
> > index 8ceb59742a9fc6562b2c38731ddabe3a549f7f35..8eac8d4719db9230105ad93ac22287850b6b007c 100644
> > --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
> > @@ -1097,6 +1097,18 @@ ipcc: mailbox@408000 {
> >  			#mbox-cells = <2>;
> >  		};
> >  
> > +		qfprom: efuse@784000 {
> > +			compatible = "qcom,sa8775p-qfprom", "qcom,qfprom";
> > +			reg = <0x0 0x00784000 0x0 0x2410>;
> 
> len = 0x3000
> 
> [...]
> 
> > +		gmu: gmu@3d6a000 {
> > +			compatible = "qcom,adreno-gmu-663.0", "qcom,adreno-gmu";
> > +			reg = <0x0 0x03d6a000 0x0 0x34000>,
> 
> This bleeds into GPU_CC, len should be 0x26000

gpucc is in the middle of GMU, see other platforms.

> 
> > +			      <0x0 0x03de0000 0x0 0x10000>,
> > +			      <0x0 0x0b290000 0x0 0x10000>;
> > +			reg-names = "gmu", "rscc", "gmu_pdc";
> > +			interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
> > +			interrupt-names = "hfi", "gmu";
> > +			clocks = <&gpucc GPU_CC_CX_GMU_CLK>,
> > +				 <&gpucc GPU_CC_CXO_CLK>,
> > +				 <&gcc GCC_DDRSS_GPU_AXI_CLK>,
> > +				 <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
> > +				 <&gpucc GPU_CC_AHB_CLK>,
> > +				 <&gpucc GPU_CC_HUB_CX_INT_CLK>,
> > +				 <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>;
> 
> This clock only belongs in the SMMU node
> 
> > +			clock-names = "gmu",
> > +				      "cxo",
> > +				      "axi",
> > +				      "memnoc",
> > +				      "ahb",
> > +				      "hub",
> > +				      "smmu_vote";
> > +			power-domains = <&gpucc GPU_CC_CX_GDSC>,
> > +					<&gpucc GPU_CC_GX_GDSC>;
> > +			power-domain-names = "cx",
> > +					     "gx";
> > +			iommus = <&adreno_smmu 5 0xc00>;
> > +			operating-points-v2 = <&gmu_opp_table>;
> > +
> > +			gmu_opp_table: opp-table {
> > +				compatible = "operating-points-v2";
> > +
> > +				opp-200000000 {
> > +					opp-hz = /bits/ 64 <200000000>;
> 
> 500 MHz @ RPMH_REGULATOR_LEVEL_SVS, 200 isn't even present in the clock driver
> 
> Konrad

-- 
With best wishes
Dmitry
