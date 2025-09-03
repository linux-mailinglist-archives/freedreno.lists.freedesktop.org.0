Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9998CB422D5
	for <lists+freedreno@lfdr.de>; Wed,  3 Sep 2025 16:00:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3127D10E8A7;
	Wed,  3 Sep 2025 14:00:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="CFVGfxqV";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E27610E8A6
 for <freedreno@lists.freedesktop.org>; Wed,  3 Sep 2025 14:00:52 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583E0FGn007700
 for <freedreno@lists.freedesktop.org>; Wed, 3 Sep 2025 14:00:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=Z6pj88/J3j1NKaodwkNXmQxi
 gRcyLxr517oZ55+1nuk=; b=CFVGfxqVsPqKflGUyxNKOIe0rLvur1zSQf2LpgzV
 +ILbhpQ0vD5AoJ7+LmJFdk6AHSfrSenkwAEsCZ+DbtBU64bsBOwqQF1RWuvTY7u3
 Rbjt+M/eTERLXCzecdEpMLPFnzObwrwUvK7Fj5aBVkGAM8J1/7aeTbKPShBkyjjx
 gpCTHlt4+cUB/nfSH4McgdMVB+jIWPkLI+cvNHkQfoXjt7Y1/YAqddjpM3XlrP1W
 lyhzm7i7qMIFOSy/C+eC+4mrBSuLC8bb/IK2i9qM8pVmNe4sbKEl7TqJnvwtUwyc
 qYaXegb/3vEHbjSe9rSinT5HrTClAeeXJM96kLIjMSNXaA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ur8s407c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 03 Sep 2025 14:00:49 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4b49715fdfbso12851361cf.2
 for <freedreno@lists.freedesktop.org>; Wed, 03 Sep 2025 07:00:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756908048; x=1757512848;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z6pj88/J3j1NKaodwkNXmQxigRcyLxr517oZ55+1nuk=;
 b=cR2HMX6UCVKRnOPAARBbCqKYPVFY5/07KQ3bVlpcfJl2QLHhhlUq3CSwpTHWhHX/cN
 eQANEt8jOiQ02Rx+tXQ42c4HZh+jR8DT0YEGs/q1/PFhJGd7s1uOXmbXL88O6qYbLNAX
 OeyBQACxYrMqveFQLCZS9C9E6lgMDWS8XsVbOJXmiOtra4lpGQV2ngYKYjtW81QprUej
 FAgKhuoFJBvsxHe1OEB0VSThqZdeNdtKZ9wPKzhIoNYmy+Cg7kPL0zsgnm9demQ4KlZ1
 Y5T4kedbRkNZHgA5wHPRJtpurKl2cXGc39hgwMUREhyVMSHRDSYHb0OGO2xUyim14PxI
 VaXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXl7JF+z2oZpsrXFe3FDqsFdbRBx4uatP3lZfUnMOQdCDOVQXX4hMbND0odJcSoFM4WcgqbeoT0i0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YziatjrCzv7OJ/+h4KsE0Z5aJhMJiBc6/D9Pqx3+Ku9GnnNB3xr
 ZCWMuXn5ERyfAOu6qMmR6/TQwjQvyonRU/fMOmPJqTgmLP3aUR8X6oWr5L+xk1bdbRpwHHeSobx
 TWVZudu1fijjdIDmn9y7KALB+B+4FNbG115FWY5ujMjqr3L3/HxIXw65t5+jOc90SDkP3tig=
X-Gm-Gg: ASbGncv9Blt66Qmvmo7YP+5RbNH1lHbDi+hAP1+qho4ST4vrivCe3VY91qYW3Oa5mSs
 eZ1A2YegIEluHmRLke7m77+FTkSe+tD8e/58THH+JKnEamsy+FZzsGx3kSJE/zSGUaCTLjGxcSL
 LeQxt79dwgcEbeSKC0lRep+xd1uFAgyZkvxX5sG8KUkKomK5Y8ldfV8lxaTKrauQR/ZySzYVai4
 XAdyDbq8WDZkram7AVpY7YeE6gdKzNj5+BoVbXXzbhjY+vDQ/vAVmBPdVRQyhRe066I/uBqFqbf
 oKfMITyCD2dAkJXdqYmwevHEb70liqYXNldgTuIsVSno/wK0kOL6Q7qMvBsFabIlAKD8LFdL/sy
 ID70fFnMoGUFfS7iHzZpG6EMBJZNMbZBR0aQNM/4gx6aI7LKfCO2v
X-Received: by 2002:ac8:5e53:0:b0:4b3:48b2:aa9f with SMTP id
 d75a77b69052e-4b348b2b623mr70291571cf.50.1756908045449; 
 Wed, 03 Sep 2025 07:00:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEnDnwIQkCmFKK18oDjQbnACoTF/d8n+oT9VNWxZl8INMw0myHrJGeaehADC9LPm5hkCdYKhA==
X-Received: by 2002:ac8:5e53:0:b0:4b3:48b2:aa9f with SMTP id
 d75a77b69052e-4b348b2b623mr70287801cf.50.1756908041921; 
 Wed, 03 Sep 2025 07:00:41 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-337f4c90454sm10451921fa.18.2025.09.03.07.00.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Sep 2025 07:00:39 -0700 (PDT)
Date: Wed, 3 Sep 2025 17:00:37 +0300
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
Message-ID: <t5pxum74q3fwf6wgcbaeaginjvtjfn357pkfswvafsggtmvxfv@jl5qjfhpmmow>
References: <20250822-a663-gpu-support-v4-0-97d26bb2144e@oss.qualcomm.com>
 <20250822-a663-gpu-support-v4-3-97d26bb2144e@oss.qualcomm.com>
 <f11b778d-eba1-4712-81c7-b83f2cb38b46@oss.qualcomm.com>
 <exkrgx6rdotfrrsnklsd7zk4ydehsk5vaoevibpqisyq2dwbd4@sa4kgnuexlna>
 <f169be5a-faa5-4824-861e-27bd2083b9cf@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f169be5a-faa5-4824-861e-27bd2083b9cf@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: _2jXdM26SYgiREMWb5QIcffIbG3angrM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAxOSBTYWx0ZWRfX4FxdjndGop5C
 YFipsaquV25/2Y9ewF+TACL2vBYpjgGiU9GKAx8aaTazkEmX4jYrmC17j3QC3TOSO2lxIlN300a
 iYzHrR8+Z8BNBaht1PEsnxkMFLXx/jeIJcZTKMpjRKA73MPxt4SVhiII4DYbzf4jPa50Z0iA+bH
 Yv3wBlgexnWuKQLC1c9hiaz2dIvnCdxCLMkUl3n5ZxSB4a5fcD2NSwvc1BBGKhCIKa4+GQpv+IF
 E7VHhPnUh7Mug59PTLwBDcnm703O05uLDpB2um8Vfi90BwPh2lSrfdKTd+lev41Bzh9oxiFEMEc
 Drr3Nl5WRP3PwXEuS6k
X-Proofpoint-GUID: _2jXdM26SYgiREMWb5QIcffIbG3angrM
X-Authority-Analysis: v=2.4 cv=PNkP+eqC c=1 sm=1 tr=0 ts=68b84a11 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=I_3-zorBrfLWAkoykd4A:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_07,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2507300000
 definitions=main-2508300019
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

On Wed, Sep 03, 2025 at 03:36:34PM +0200, Konrad Dybcio wrote:
> On 9/3/25 2:39 PM, Dmitry Baryshkov wrote:
> > On Wed, Sep 03, 2025 at 02:26:30PM +0200, Konrad Dybcio wrote:
> >> On 8/21/25 8:55 PM, Akhil P Oommen wrote:
> >>> From: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
> >>>
> >>> Add gpu and gmu nodes for sa8775p chipset. As of now all
> >>> SKUs have the same GPU fmax, so there is no requirement of
> >>> speed bin support.
> >>>
> >>> Signed-off-by: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
> >>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> >>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>> ---
> >>>  arch/arm64/boot/dts/qcom/lemans.dtsi | 116 +++++++++++++++++++++++++++++++++++
> >>>  1 file changed, 116 insertions(+)
> >>>
> >>> diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
> >>> index 8ceb59742a9fc6562b2c38731ddabe3a549f7f35..8eac8d4719db9230105ad93ac22287850b6b007c 100644
> >>> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
> >>> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
> >>> @@ -1097,6 +1097,18 @@ ipcc: mailbox@408000 {
> >>>  			#mbox-cells = <2>;
> >>>  		};
> >>>  
> >>> +		qfprom: efuse@784000 {
> >>> +			compatible = "qcom,sa8775p-qfprom", "qcom,qfprom";
> >>> +			reg = <0x0 0x00784000 0x0 0x2410>;
> >>
> >> len = 0x3000
> >>
> >> [...]
> >>
> >>> +		gmu: gmu@3d6a000 {
> >>> +			compatible = "qcom,adreno-gmu-663.0", "qcom,adreno-gmu";
> >>> +			reg = <0x0 0x03d6a000 0x0 0x34000>,
> >>
> >> This bleeds into GPU_CC, len should be 0x26000
> > 
> > gpucc is in the middle of GMU, see other platforms.
> 
> This is not the case here

Why? I think GPU CC is a part of the GMU by design: GMU accesses GPU CC
registers directly from the firmware.

-- 
With best wishes
Dmitry
