Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6EE7B19ADF
	for <lists+freedreno@lfdr.de>; Mon,  4 Aug 2025 06:49:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AADAB10E29D;
	Mon,  4 Aug 2025 04:49:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="g7eiM1y5";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E6D710E29D
 for <freedreno@lists.freedesktop.org>; Mon,  4 Aug 2025 04:49:45 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 573NmRtu026599
 for <freedreno@lists.freedesktop.org>; Mon, 4 Aug 2025 04:49:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=7Yglzp+yr4eKtq6gEDEP5fa6
 YZypOJLaqkMYl6UIZkg=; b=g7eiM1y5O/gIMYLOM748dtFF6sgsQD7aG486JCJa
 uBkwY8WfteAbZIH95pEwiQQd1PtY1yEb3zBkLdNfbRmd1+OlQl813xqdyVbSVgHZ
 2Y0xPIxXj+ALbWW8I2h1xR0IhI+gSptZp/NU168tZkrvEIRs4n6oyeYK9LFwvcSe
 8fH0G+9Fj1+NycxDvQ7stY5p5IKDFe5jLYxTtji+ioQ6wOZn0ednUHoeeMrz1Z4y
 /WJZNsOXeDtK9XNFxJZVDGSoX3EaQgwzOXcFEsaeVq2G/TPYE5YAjdcOc0e9K/I2
 5pWFdV4+Rg+oP76TWRJ7ylTk1CGComuikXj8XR7hpjR/Rw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48981rkter-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 04 Aug 2025 04:49:44 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7e7fd5f63a0so52190685a.1
 for <freedreno@lists.freedesktop.org>; Sun, 03 Aug 2025 21:49:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754282983; x=1754887783;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7Yglzp+yr4eKtq6gEDEP5fa6YZypOJLaqkMYl6UIZkg=;
 b=cv9bNRnd6v87XKS4WdbpSqGaE42nL8Ax3vuMznllrUcZizj65AUrDmnjkSOX49qBZl
 lXMlbqw7o7cI3QEw3Wr8gQX+PP5iY+tiCRU0LPLkuiowmIBvkP3v32Qlt7wefQFKD/Y0
 JcvENJW4xNu8cFlikmwBPCgOCUOCaWJ0wItt8oD81c0R7cnHOmKZ8CBkxYRjEqjMCfm0
 gD4kySzEPjUUaQsIE2V8q9YNtf/9In57MxiryQxrzsISVi4n3rSHFR0Szsnl7+Ts/fNC
 Z74x5mwfs4IrUezteIMdbFdLIYWGkcZ7DGA/3AJdCnSgB259oZxLpwLprzvXHJCtaW1t
 wApw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUwebDLEmj7ta8tmIG6TO3bRZ0IgHBlRJ4qP7XNrHyasSnWFQVsiFM9zlr9GnCS/ePtxzcNlJYcTcM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx7EhcATMK+lU203PyDgl2VeruQPPdyauhTrzyMlisdNZ1fvx2T
 pv2SdeBQG9HDjaVNfQUBckbmKk/73FZOa2aKHRDpGmy0S3rhOs4+lHb+P9Tm3AChN52U9M42qUz
 QRJpmDwGn3xi9+8jPPkOgZ7L1RDIkjf9E1wIQ3rzCR6k0JxSL4D0ZT79Jyn0GRfunq7gi/xU=
X-Gm-Gg: ASbGnculD9/sfheq0RHYMwZgqc6T1J72X1tl5YAlTULWoPh/b6ZiWm/3pe1ifJQZ+gX
 H20CR2mGgWzz3lM7lr93Z2lcSLcg9y/aISwFUtCJmZgsR83nxCFy0gBWC0fjUfApgyZu1du9F3R
 2EvY4OinMK0v7VdloaazxRP+okYnMX1Yrs3qB/annymPaup5ehkRD9SgDviB4gPV8KId16vZ5yi
 Ql05/CBZ/dLzpt8n/4Lz2jhGnGK3QFbl6vqnDwtEIokYD7w8wOYx094eM0Ku3ynFvT55MmMJo0Q
 xOseZ+RKMsn5KWROXJNjT//7qacDrIT6OajGByWEmPEdUBwIi+9ZH8g4dqhunCwtOOQ4Y9Urme8
 o2n01ZX9vw9GrbrbmM9xkKr6oucq/sPJzuy5a4YRINBsnPcqUu/yV
X-Received: by 2002:a05:620a:36c7:b0:7e6:5e9d:f8e6 with SMTP id
 af79cd13be357-7e69629dbcdmr1106345885a.22.1754282983184; 
 Sun, 03 Aug 2025 21:49:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHzOqo7RSMXHRYDfEyQ47x4B+Pz6jpUX0s23rEdmLa1EGEICWbN/mAirTNdrgCZnMomrjhq8g==
X-Received: by 2002:a05:620a:36c7:b0:7e6:5e9d:f8e6 with SMTP id
 af79cd13be357-7e69629dbcdmr1106343785a.22.1754282982745; 
 Sun, 03 Aug 2025 21:49:42 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b88c98c15sm1529094e87.106.2025.08.03.21.49.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Aug 2025 21:49:41 -0700 (PDT)
Date: Mon, 4 Aug 2025 07:49:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: "Rob Herring (Arm)" <robh@kernel.org>, linux-arm-msm@vger.kernel.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org,
 Abhinav Kumar <abhinav.kumar@linux.dev>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 dri-devel@lists.freedesktop.org, Simona Vetter <simona@ffwll.ch>,
 Maxime Ripard <mripard@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 David Airlie <airlied@gmail.com>
Subject: Re: [PATCH v5 3/5] dt-bindings: display/msm: Document MDSS on QCS8300
Message-ID: <aiaonlbxwzbpuvnzijzp7btf2oxvtseq7zoylopllooeqshmux@unhoejkdyl6v>
References: <20250730-mdssdt_qcs8300-v5-0-bc8ea35bbed6@quicinc.com>
 <20250730-mdssdt_qcs8300-v5-3-bc8ea35bbed6@quicinc.com>
 <175390746243.1660386.11206814214268936734.robh@kernel.org>
 <cdbe1013-4f15-4638-870b-151292920ce7@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cdbe1013-4f15-4638-870b-151292920ce7@quicinc.com>
X-Proofpoint-ORIG-GUID: OqQu1ooTHNSbGzsJDKoz13aGS7v23nEr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA0MDAyMiBTYWx0ZWRfX0l96rN22iSmQ
 5rWDU0yKZuwpJJ9OSkzKqQ18TJfnCyOyP2N9+a+km+NxynWUlyDrg7+/efbhwT1NFgDlB+JmDep
 sxh3qbLZBwK48mg0I5sA2MLT+D/gado6HXgj/4AWJ6+SgTcqPGKOlJedP0odvL6Og1gSTaPtECl
 VBLuw9FmVHaj31Znui96vCvTmL4C68XgCpYkelZAe8rbPTR3nzSlhEMIzWOBjEfyGq6AgrdnPJl
 B9dDlKSRvhwY0izJLJQ/5mO/Psuqc+haSQ39WA3rXstXWIEmtC0dR21cEW7d1EpkzEPGn+fufUR
 PM7vnWDZ9VKkyo/HFfcRgP4n5wE7BivmohayqGlWJQF3Ic88iUftByaWzySWlF59c4zNBTDEX+W
 VvMxZztlMnCeRTnRJcsWOIovz6aYYbQjO6pOlLsU8+obI56/96JnluNmEIi+CxDIPCJrypkp
X-Proofpoint-GUID: OqQu1ooTHNSbGzsJDKoz13aGS7v23nEr
X-Authority-Analysis: v=2.4 cv=a8Mw9VSF c=1 sm=1 tr=0 ts=68903be8 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=gEfo2CItAAAA:8 a=voM4FWlXAAAA:8 a=COk6AnOGAAAA:8
 a=VwQbUJbxAAAA:8 a=Wy_ckEHB4fXvzh_zUiEA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=sptkURWiP4Gy88Gu7hUp:22 a=IC2XNlieTeVoXbcui8wp:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-04_02,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0
 spamscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508040022
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

On Mon, Aug 04, 2025 at 12:00:39PM +0800, Yongxing Mou wrote:
> 
> 
> On 2025/7/31 4:31, Rob Herring (Arm) wrote:
> > WARNING: This email originated from outside of Qualcomm. Please be wary of any links or attachments, and do not enable macros.
> > 
> > On Wed, 30 Jul 2025 17:42:28 +0800, Yongxing Mou wrote:
> > > Document the MDSS hardware found on the Qualcomm QCS8300 platform.
> > > 
> > > Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> > > ---
> > >   .../bindings/display/msm/qcom,qcs8300-mdss.yaml    | 284 +++++++++++++++++++++
> > >   1 file changed, 284 insertions(+)
> > > 
> > 
> > My bot found errors running 'make dt_binding_check' on your patch:
> > 
> > yamllint warnings/errors:
> > 
> > dtschema/dtc warnings/errors:
> > /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,qcs8300-mdss.example.dtb: phy@aec2a00 (qcom,qcs8300-edp-phy): compatible:0: 'qcom,qcs8300-edp-phy' is not one of ['qcom,sa8775p-edp-phy', 'qcom,sc7280-edp-phy', 'qcom,sc8180x-edp-phy', 'qcom,sc8280xp-dp-phy', 'qcom,sc8280xp-edp-phy', 'qcom,x1e80100-dp-phy']
> >          from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
> > /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,qcs8300-mdss.example.dtb: phy@aec2a00 (qcom,qcs8300-edp-phy): compatible: ['qcom,qcs8300-edp-phy', 'qcom,sa8775p-edp-phy'] is too long
> >          from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
> > 
> > doc reference errors (make refcheckdocs):
> > 
> > See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250730-mdssdt_qcs8300-v5-3-bc8ea35bbed6@quicinc.com
> > 
> > The base for the series is generally the latest rc1. A different dependency
> > should be noted in *this* patch.
> > 
> > If you already ran 'make dt_binding_check' and didn't see the above
> > error(s), then make sure 'yamllint' is installed and dt-schema is up to
> > date:
> > 
> > pip3 install dtschema --upgrade
> > 
> > Please check and re-submit after running the above command yourself. Note
> > that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> > your schema. However, it must be unset to test all examples with your schema.
> > 
> This warning need to apply this patch..
> https://lore.kernel.org/all/20250730072725.1433360-1-quic_yongmou@quicinc.com/
> thanks, link in the cover-letter seem wrong. and there is an unnecessary ~

It's not listed in b4 dependencies.

-- 
With best wishes
Dmitry
