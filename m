Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D482CA673DA
	for <lists+freedreno@lfdr.de>; Tue, 18 Mar 2025 13:26:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFF4B10E476;
	Tue, 18 Mar 2025 12:26:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="KUyifBEd";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30E8610E476
 for <freedreno@lists.freedesktop.org>; Tue, 18 Mar 2025 12:26:52 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52IAqdnU020847
 for <freedreno@lists.freedesktop.org>; Tue, 18 Mar 2025 12:26:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=fn6o9sruIXfwvCI8WMCUouk1
 Y9QTIiAVEqwCsNznX/A=; b=KUyifBEdxAy+bNjktmMLxn1q0cz885B8NnY82uZV
 BXPTBeBzaz+rjyOpCifm8s04bgwGhH6WFTRw031xNMOkFSKCqeivFf/hXTnAECC8
 JCYrzC0pzigFX2h1ZhI3NaZP+ALy0/o+xN7zXMwPzFkpJXpn24todpgOz9XTsHA7
 b5ILmsHdrOVkqjh8ZTf/XfqiytLlM+tvqLqJTGsZHSxIMmeh5xIhHEqykGtP+k9v
 sqCfqI+xO46ERt9zeG2tN9FxJ0/XBrAQp/dcQaKr5WBQYZP2x1UUHmTBAdI3ObQj
 BE6RB5aO7zh4oJtZQGCAjPgpq0d2inE5ox0J7bPeYJ9bqg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45exxbhqpu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 18 Mar 2025 12:26:51 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-476870bad3bso102057791cf.3
 for <freedreno@lists.freedesktop.org>; Tue, 18 Mar 2025 05:26:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742300810; x=1742905610;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fn6o9sruIXfwvCI8WMCUouk1Y9QTIiAVEqwCsNznX/A=;
 b=Om/rp8AtE2PGHNNf1cVZTppK7rZ8XByIDKugBIg70ZwaqEkibC9ss+BVqxamGKGpA0
 yhj/iKEWegcSK2Dehr3tDLnsHm1U7RPfWKn2ClPwH2Xdjs1PYvxR7Qro4rf9dTSiURxz
 AxLqSYReMowiOQAtc8zfabW0nbl6Czdgp8H7C1pufnnE+iMOl+9mv473cafZ5XMXomka
 SgzurySp35oNHmsEkOQlqhnuy9HPd8I3sVPb9FzEflCao6bsmh9puvnnT2H2OEIrip02
 8qzFntUlappVJw+RuZWtB+Xh/tITzkq0MRaQvNv3WzNyf7t9uTo3hjIHIufyIpXTr9Pu
 Nijg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgRfwYWJaP6p6gUr/xzczJ/RfCm/aOn9NMphM6THXFpQI3kg8gJcVFet0KzDCC16kH/BrRu+u60B0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx57pyxDYUaXzUh8WAaIk//T691KaaebUGmSWkftQSfRHeA/H17
 NpZFY5VbaYGQAm2p9dKfpzbH1CHv0lM7J4rATDQJMXIJvq350xNBk5rNzoqbEE6k3uEBkqfM7Y/
 /6VMbGnbNLoxlyzVmsxEZnr3jkM4WSFYb5Bzfqa49LvngBTDX6s0Zl76V5c+zdPTCaRY=
X-Gm-Gg: ASbGncvUd9n8fpYRUsZ6d2z+Wqj5ZhfFffNH63nrrOXfQR9P0A82weSTbfwMA5CjECj
 hn+3PcYHmvoM5GpD3WnTQzWzg4Mi/+m7UkqXHAgrhW40yKMYNzElUjyjOwIPYx/AIzYcgUrM4Hy
 q3myMV6SUfN9CsnCAP/2kUeDbEjX8/1nAmkO7h01Wc45TUQGI1iBENHFZ1sbDa4zg6tQpq68nK1
 qeJJa2ypWIiI10DDwuGROX8iEIT2f9nEahH+WjCGAsgVqwzmVBdVfbpOh1OMYADoqkOUNAx/mBe
 MfbfnnG35qcGoYC/lUrdD6WR7c+onyWI4qID2zVXUt9otvMp4fE5JWemi2GfsImztMO13pLSXjT
 Dhlk=
X-Received: by 2002:ac8:574d:0:b0:476:7327:382b with SMTP id
 d75a77b69052e-476c814a05emr237383151cf.16.1742300810261; 
 Tue, 18 Mar 2025 05:26:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFcR9xUHBK9TFXZWSwLWT2FsKGFofnO2SkdyZ7fM94gEY42uE07dGuuS4gCqZY8gVYIkurgsg==
X-Received: by 2002:ac8:574d:0:b0:476:7327:382b with SMTP id
 d75a77b69052e-476c814a05emr237382801cf.16.1742300809924; 
 Tue, 18 Mar 2025 05:26:49 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-549ba7bee7fsm1638070e87.54.2025.03.18.05.26.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Mar 2025 05:26:48 -0700 (PDT)
Date: Tue, 18 Mar 2025 14:26:46 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Leo Yan <leo.yan@linux.dev>, Kumar Gala <galak@codeaurora.org>,
 Andy Gross <agross@codeaurora.org>,
 "Ivan T. Ivanov" <ivan.ivanov@linaro.org>,
 Andy Gross <andy.gross@linaro.org>, Georgi Djakov <djakov@kernel.org>,
 David Heidelberg <david@ixit.cz>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 8/9] ARM: dts: qcom: apq8064: use new compatible for SPS
 SIC device
Message-ID: <p4hda4puovabvqnf3unge2rifzu37hgim2k4fnvdpbekhojzq5@cx7j4hrspzdy>
References: <20250317-fix-nexus-4-v1-0-655c52e2ad97@oss.qualcomm.com>
 <20250317-fix-nexus-4-v1-8-655c52e2ad97@oss.qualcomm.com>
 <e26284b1-217b-4afe-af40-ae65cb7ee646@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e26284b1-217b-4afe-af40-ae65cb7ee646@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=QN1oRhLL c=1 sm=1 tr=0 ts=67d9668b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=q9XyVQKgEbIbea8yYzIA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: T35JYwRjfL-e7xe7jjvJGO9RC0MZ8_NY
X-Proofpoint-GUID: T35JYwRjfL-e7xe7jjvJGO9RC0MZ8_NY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_06,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015
 phishscore=0 spamscore=0 impostorscore=0 suspectscore=0 mlxlogscore=469
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 adultscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503180092
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

On Tue, Mar 18, 2025 at 01:13:23PM +0100, Konrad Dybcio wrote:
> On 3/17/25 6:44 PM, Dmitry Baryshkov wrote:
> > Use new SoC-specific compatible to the SPS SIC in addition to the
> > "syscon" compatible and rename the node to follow the purpose of it.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  arch/arm/boot/dts/qcom/qcom-apq8064.dtsi | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
> > index 522387700fc8ce854c0995636998d2d4237e33df..a106f9f984fcb51dea1fff1515e6f290b36ccf99 100644
> > --- a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
> > +++ b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
> > @@ -402,8 +402,8 @@ saw3_vreg: regulator {
> >  			};
> >  		};
> >  
> > -		sps_sic_non_secure: sps-sic-non-secure@12100000 {
> > -			compatible = "syscon";
> > +		sps_sic_non_secure: interrupt-controller@12100000 {
> 
> The register that the consumer of this points to doesn't seem to exist..

It does, although it is marked as reserved. And this matches msm-3.4:

                .smsm_int.out_bit_pos =  1,
                .smsm_int.out_base = (void __iomem *)MSM_SIC_NON_SECURE_BASE,
                .smsm_int.out_offset = 0x4094,

#define MSM_SIC_NON_SECURE_BASE IOMEM(0xFA600000)
#define MSM_SIC_NON_SECURE_PHYS 0x12100000
#define MSM_SIC_NON_SECURE_SIZE SZ_64K

I don't think anybody tried bringing up dsps on APQ8064 though.

-- 
With best wishes
Dmitry
