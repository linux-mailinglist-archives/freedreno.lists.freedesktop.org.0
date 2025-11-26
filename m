Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B9EC879C8
	for <lists+freedreno@lfdr.de>; Wed, 26 Nov 2025 01:43:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5FE610E4CF;
	Wed, 26 Nov 2025 00:43:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="JZs7G1i0";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hnxjB0vA";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 542D810E4C9
 for <freedreno@lists.freedesktop.org>; Wed, 26 Nov 2025 00:43:05 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5APHAfCT3890204
 for <freedreno@lists.freedesktop.org>; Wed, 26 Nov 2025 00:43:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=qy2M96A8lh9VMre3hbAFE80w
 QaeuvpNU7FsXvM6eX44=; b=JZs7G1i0YBRH4/T0xuW0LTTE8gSxxeJC+GSlqypT
 bZOCxxmieWIKbJStxfin5iam69MFT3682fyqJ2vXEcRdpsKhBcU9svUS8h29ycKn
 bQxKn2TdwtJ5CMp5PH7LVEIl8aQtrSQGmc9W3qZ0pwTpMOu1OuPZJWuaVX2s9j8E
 aPmp8smwvRc2j+DnegvITFvsiW0WBssxzGxgZ+m4SkxplEx3KygJiOkwTgXPSXD5
 GwTKfQ4hU/veme9iFZ4Ies3W0pVDqa76g7TZWg2LzQn3JvCcVTsr3c6QY3n/1pGD
 ZD6ukyIQUOKcCUDRoN9F+/lstY/lKWzuU6myoOVcRoUA4Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4angme8yww-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 26 Nov 2025 00:43:04 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8b244ef3ed4so1735701585a.0
 for <freedreno@lists.freedesktop.org>; Tue, 25 Nov 2025 16:43:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764117784; x=1764722584;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=qy2M96A8lh9VMre3hbAFE80wQaeuvpNU7FsXvM6eX44=;
 b=hnxjB0vAlVWCG/eQ4apn5B7husaO4KtkLBPIaKU4RDCHOTmf9pS8JQJixEunm+pnor
 K6bALHRF0Wl1a6503mLa8ZUsyWhGBm5/k54b3aIqGft92Y3sG2RG1M4GnPZsh83MLyAn
 L9ZDNHhMt8Plaj+T4tFwreELMH7kggCaZMTL3vIASBIwcNWDxl8sIFStrvNnaPI5mZvD
 s6Vo6j+hu9VfLjI1NafiyQ5GjxOCijee38kIkgQLCXqPaSGh7hfzCCTqaeOces/uqE0R
 kI/DP34bfWfPYovvUhplQ44NRINU4SzLaE/HSzQPdndFC0groXqqBLGA11x4jkNXrnyd
 EqmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764117784; x=1764722584;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qy2M96A8lh9VMre3hbAFE80wQaeuvpNU7FsXvM6eX44=;
 b=p8iaClhw/DYQY39E0ZkrNN7HOvFGl1yXUpNrsIKatMzG5Z2r78fPVe67qhZ1Augq46
 tCdhRaOh/ImdQyueldigGer/xSndGnwvLTe+7fyynK4HOmqxoBJqksNWxp51eBT9n5si
 LRE+Vbqrneb01zT6D7SUJy8J2B0pzPsiAQU7EGfPXRuHfpiaJVMIE5bOOUNy+g53JCJC
 ZPGZRVUUVT6IWn1IbSAEuyuzsHCZZFqtycJNzgwq1AT5TsjEqWB01hSnLpEfdFdNPfKN
 VckgFur99G0tfr460SAbQMSF5+812m7qPMMuRH7lorFADfVt/nuBIf6HRBxU4w5hzLvI
 yl7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJI9sMTdE4bAsceUmfFCYQV3NOvu0hb8GRSeb2xIurpLGxJNGO7S4FPKl8xc9XUSX7bmpjioC6yAg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw+gSndDXWzjM2RmXdb1oU/IwOXnvIMyuFOKZeo9RXg/rllhiOY
 J0V6zlUPv3lfUo4GhGpp7yF7/cHM3Wr4Q+wQ+G1ELjh9Xn1m5x2FcMUwR7NyhAOWSsv/gSZ5CmL
 zgO3Q6R0Ba0AQODE4+Ti+DG1cCIcLsZBtI2XzwyKN4qkfJin04CY0n33rV7oWuIPiX0vJe8k=
X-Gm-Gg: ASbGncs6DbAFyWV9tw9vp0ocI9IiEGSYRSj3nUwswBHPZ3IH4gwxbdLng3bFIRgvBv4
 J8uJG4sxpMh4fiLmEQ/aCv9ULyc/EOsb1VEkNQ97evB/gbM5nHTn/uNaQHC0VcAZeBtpt9TqrDG
 TMIP57SFU5zDkT4jxkqFU0anoYOdnYiVrtw2IX6r0DxrDYf3V2mjNtxR3KkvMPz1oltnHBsFl+M
 5EZowRTt3m6fkmSglnXk/BGYrP4/Gok5GhmbO/wxWgjhit9R53ym7vWjkv8mtOxIEQbtZLosmpg
 naFXXf20qcGrs2e00MCmzkb5tWjCAWpfbDdHChNIaJh1J3k6iafCtWkXJrsMy3beiJbhI4Ugu+M
 1Sr/CcXDvoQJ3EWepBp1ClWeXcBxypizm5aHrfSy1BwfuBPnQ/FjcvzUnlrusaoHyOnMvpuEUJg
 Zz+5mU5u3/Rmq7yh3lmrMjxZI=
X-Received: by 2002:a05:620a:4409:b0:8a1:ac72:e3db with SMTP id
 af79cd13be357-8b33d48394bmr2022357285a.72.1764117783687; 
 Tue, 25 Nov 2025 16:43:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGEFjd/YjiG1JQBTrJawicWskwexI3xdbFSrP7Gp0E1UbGnlmMPWV2ZcK1AsIjtnnEn6wyEBA==
X-Received: by 2002:a05:620a:4409:b0:8a1:ac72:e3db with SMTP id
 af79cd13be357-8b33d48394bmr2022352285a.72.1764117783165; 
 Tue, 25 Nov 2025 16:43:03 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5969db75627sm5451693e87.5.2025.11.25.16.43.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Nov 2025 16:43:01 -0800 (PST)
Date: Wed, 26 Nov 2025 02:42:59 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
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
 Jessica Zhang <jesszhan0024@gmail.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Jie Zhang <quic_jiezh@quicinc.com>
Subject: Re: [PATCH v3 5/6] arm64: dts: qcom: sm6150: Add gpu and rgmu nodes
Message-ID: <z4gqro2bx6oq2ht75m2klogo5dsirb74tmc3u3shjyalxmaxil@5sy7ufmqhdgw>
References: <20251122-qcs615-spin-2-v3-0-9f4d4c87f51d@oss.qualcomm.com>
 <20251122-qcs615-spin-2-v3-5-9f4d4c87f51d@oss.qualcomm.com>
 <8560ad26-4756-4c2a-97c3-2c5c0695172c@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8560ad26-4756-4c2a-97c3-2c5c0695172c@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=PJgCOPqC c=1 sm=1 tr=0 ts=69264d18 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=kOBCTNg5yw7rtN7J0wwA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDAwMyBTYWx0ZWRfX+bOxyVsmpIkv
 BpnTBoinvmcpn+qAoofGe8QmaSeqfMVIYBOIWWDEhdg5RVfBM1v3Svcapw12wq19E3R3/Zd7m7L
 8GF1CqvzQLF157HLiu/tYuR/yP1rgyOUeQ2lYf37PjSWyYG50JbsKMjnb6iH8PN64DWF1oIO81U
 SE1hDFVxcWqZEKDy2TP2CuFjNFgCE9U/IQbfSLw9mfIRMTnO3nD29BQJrtCkENR7noApaIVA25F
 pFprHytC4+EJr8P8MerYWpj69n/B0U2Nz7Pmxg2rgtZhER+dUBg13jw/hiTjQuQ+fiCP3IyuCF+
 ghppsJSj4QEG+Q4r8an9IVDbihU+BUN+oD02JwuuOPQs9pJ7T2trXxVMQpLohszU4shZ7l3UwCo
 BZ7ohPCU4sFtRCNq6zBQHHRMSlfZUw==
X-Proofpoint-GUID: IQPHtgFGgoWBkg2X0l0TKauLjtEbLzA_
X-Proofpoint-ORIG-GUID: IQPHtgFGgoWBkg2X0l0TKauLjtEbLzA_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260003
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

On Sat, Nov 22, 2025 at 03:03:10PM +0100, Konrad Dybcio wrote:
> On 11/21/25 10:52 PM, Akhil P Oommen wrote:
> > From: Jie Zhang <quic_jiezh@quicinc.com>
> > 
> > Add gpu and rgmu nodes for qcs615 chipset.
> > 
> > Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
> > Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> > +			gpu_opp_table: opp-table {
> > +				compatible = "operating-points-v2";
> > +
> > +				opp-845000000 {
> > +					opp-hz = /bits/ 64 <845000000>;
> > +					required-opps = <&rpmhpd_opp_turbo>;
> > +					opp-peak-kBps = <7050000>;
> > +				};
> 
> I see another speed of 895 @ turbo_l1, perhaps that's for speedbins
> or mobile parts specifically?

msm-4.14 defines 7 speedbins for SM6150. Akhil, I don't see any of them
here.

> 
> [...]
> 
> > +
> > +				opp-745000000 {
> > +					opp-hz = /bits/ 64 <745000000>;
> > +					required-opps = <&rpmhpd_opp_nom_l1>;
> > +					opp-peak-kBps = <6075000>;
> > +				};
> > +
> > +				opp-650000000 {
> > +					opp-hz = /bits/ 64 <650000000>;
> > +					required-opps = <&rpmhpd_opp_nom>;
> > +					opp-peak-kBps = <5287500>;
> > +				};
> 
> Here the freq map says 700 MHz
> 
> > +				opp-500000000 {
> > +					opp-hz = /bits/ 64 <500000000>;
> > +					required-opps = <&rpmhpd_opp_svs_l1>;
> > +					opp-peak-kBps = <3975000>;
> > +				};
> 
> 550
> 
> Konrad

-- 
With best wishes
Dmitry
