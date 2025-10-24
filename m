Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D32A7C0472B
	for <lists+freedreno@lfdr.de>; Fri, 24 Oct 2025 08:10:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AEFD10E9D7;
	Fri, 24 Oct 2025 06:10:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="hV/iQ0Ve";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6F6D10E9D7
 for <freedreno@lists.freedesktop.org>; Fri, 24 Oct 2025 06:10:44 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59O3MBAT010242
 for <freedreno@lists.freedesktop.org>; Fri, 24 Oct 2025 06:10:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=iPDyisl44Ds/H4LrsIWE8heq
 Yin0PT0m3dP+JNRSHeI=; b=hV/iQ0VeW4QjxbWm9Z8aa1teHm+fAYtwOBru/D+u
 pN+54kTGbayJ6FViPbZT1uY9Yg33/T5rzquz//sIlwCumVOqXeE/MLjjCBPzwkEE
 eXRezn091PeuNcxYpdQRZaVxzP8wNTo3hWQSJ+U4VHHqJIPxhX0QGQSrf1tRfHCy
 3Pf+9PTcT5v1GPFtQRD7K3gR2uKIxv7crkRiDRzVdVVK3JhbWaRfMVv6WLSuOESV
 D8kZckRAB9VIvxbhuTecApkFcDFv3pkZwZzrfFGoA4qWIpexxWBl6m5f2oYemGJ4
 oWqZcu5Lh/In0a2ifFQfkQIr/r632CmX7xjMJb0Jxc2IhQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49y524d662-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 24 Oct 2025 06:10:44 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4e89265668fso51823641cf.3
 for <freedreno@lists.freedesktop.org>; Thu, 23 Oct 2025 23:10:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761286243; x=1761891043;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iPDyisl44Ds/H4LrsIWE8heqYin0PT0m3dP+JNRSHeI=;
 b=KHucu8Y1DgPlq7SWgtAt8OgZHjiEZkQd9WlJCGmt6ELrvC1rwuPyMIHYlpUWySSwtU
 X/cKh7wssRHNtbIXf11LE2lst6NQjC50JgdEPJ6FNTsI0HoMHudUnE6Y5BqeV2v6DnPF
 513g8vlJBW6THSVo4I9Mh+k07wggthGRb6SK1k66RAI5XKNhwSWLwCq40iglHx9VuDD8
 33iebT8ZrZRnJdrxpv2IP2StxgBVkoZ6M6OPBIoPN+anQQJhEeNGDryUxwXktItHIKdh
 98nXuBiCiVP8m4tWzqPSTuCA/7z9YjMU66o7z03dFWs8o0o9pdnZC0Fkvz20lC4vOCtH
 tSYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGy/BfVzR2ZuW+aReZpjOMnzxg0ZTrnRpltR56zbGLlEZvQB2SQvt7mxRjzxWOm+P102UQNMxBwsE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxUoc0dqZCCyDmAMWhlMmt4XlGv14orsm/fFiXuEMiKI516dW6f
 x3bwKQaiN44w/FyKiheGJn7vxFXcmn9S15s4ls7l40g0nhjGUV7lSi15ryXt+gS+7leNi5zUTtl
 7x+COIa8W+BOTBPq/+BdpBig/GrZSoQEPtHAjKKN2DXL9Nm8Ibj5ucTRmU3D0vMH1qx6G3ME=
X-Gm-Gg: ASbGncvWg1DJqkvRIVvpyVGjUYqCQdpPllzOioe2HLwRyWSvJq+25+flCHYnjXopHur
 Itj9Wdt8O3ZNCSJxBtqEDhqb7lp1/w3SD6+IuhBLJFz5im/bEpmtCiHN5CB6CpeJ1FJGHPllI/w
 OdzpXCO61v+SAcsn8/xShN8Y86D+cnOEhCl8tWFAa09Z4VStzfMG28oeBCOSvEEEsEjlSgxRx3C
 6EhgKNYdmFZaHKDAK8XpgWFmTA3DL+F0Zk1zKTGyPTBvfmSGGNYNMWRboAPS8A/iffiK40PnU3k
 FIq0vzbquslklgxY0t+Ew8B+Q9SgVwk7hY5MYEdsdjsCEVw0SH5o29EkRgtBvGmw/jSl6R5TMc7
 +c+kGLr5isylWKrvdsOMWMQelNUsBxB6XzjKfsveDq9a7r/B61MSaU+kmTV4O
X-Received: by 2002:ac8:590a:0:b0:4b0:677d:d8e1 with SMTP id
 d75a77b69052e-4eb947d0b75mr10195571cf.17.1761286242776; 
 Thu, 23 Oct 2025 23:10:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHEtR9U1iGlrQGZPr6uA0Clma7yT4910fb9qum1J+IWWzJ2J/Ji+vn8lfUnOE0P2SRWMpyyYA==
X-Received: by 2002:ac8:590a:0:b0:4b0:677d:d8e1 with SMTP id
 d75a77b69052e-4eb947d0b75mr10194911cf.17.1761286241626; 
 Thu, 23 Oct 2025 23:10:41 -0700 (PDT)
Received: from yuanjiey.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-89c120567b1sm320507385a.51.2025.10.23.23.10.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Oct 2025 23:10:41 -0700 (PDT)
Date: Fri, 24 Oct 2025 14:10:29 +0800
From: yuanjiey <yuanjie.yang@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
 quic_khsieh@quicinc.com, neil.armstrong@linaro.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Subject: Re: [PATCH 10/12] dt-bindings: display/msm: dsi-phy-7nm: Add
 Kaanapali DSi PHY
Message-ID: <aPsYVUjyPru5FwPe@yuanjiey.ap.qualcomm.com>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-5-yuanjie.yang@oss.qualcomm.com>
 <em666johhzrluo5z4t2nu5jo4yuowegaemlrursvczx2zze5o5@uakt5j22ygwm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <em666johhzrluo5z4t2nu5jo4yuowegaemlrursvczx2zze5o5@uakt5j22ygwm>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDE1NSBTYWx0ZWRfXyW7vlNqnl4I8
 zy6Uka2dOPF6swzDLDwrfObfSVwV9WW9Srx4vkFKJpUOwYQpLY3CK+IxAq/HABeeHr9KOLp9nO+
 W9IWB2qcf43Y37woOIwFDc72OiXBZv+WvIU93G/ljZeCYeYx0qtgcc8WeKmL90vKEM4YPJ9lxzb
 VmwrUv/juTqLnSHOuOmgoXsbKVa6rF0on+J7DlZoNGgkPnzAhI0uXq2GYcsZCjVSbupAb+Qy0vL
 jfZI0xbjLBtZbGRdOqEQpNTuOCAD30GghhytPQ7rEbq9a79Nrh+6gokSsU/N8Fv8XVPUWfyhqmT
 PuxcxXjva0FmcHz8A3unW+yD3p0rkAsJTQs/Xgcf5WijmfVc/2s969Q6/0JvoAnoHQ32mD/2Af5
 cOK+d27C1ZKkoC21zbzfp/B6lzgBcg==
X-Authority-Analysis: v=2.4 cv=Uotu9uwB c=1 sm=1 tr=0 ts=68fb1864 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=WIVAG7BfrJY6p4e7JxwA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: R7uTzGwkUFZcAIFJ_1XRCgKQY66DnrKr
X-Proofpoint-ORIG-GUID: R7uTzGwkUFZcAIFJ_1XRCgKQY66DnrKr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 adultscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510220155
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

On Thu, Oct 23, 2025 at 03:16:31PM +0300, Dmitry Baryshkov wrote:
> On Thu, Oct 23, 2025 at 04:06:07PM +0800, yuanjie yang wrote:
> > From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> 
> In the subject: DSI, not DSi
OK will note.

 
> > 
> > Add DSI PHY for Kaanapali.
> 
> Why?

DSI phy for Kaanapali have no significant diiference with previous version(SM8750).
But some register change make it imcompatible with previous version(SM8750).

I will give this reason in my next patch.

Thanks
Yuanjie.

> 
> > 
> > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > ---
> >  Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
> > index 1ca820a500b7..a6e044eed3df 100644
> > --- a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
> > +++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
> > @@ -17,6 +17,7 @@ properties:
> >      enum:
> >        - qcom,dsi-phy-7nm
> >        - qcom,dsi-phy-7nm-8150
> > +      - qcom,kaanapali-dsi-phy-3nm
> >        - qcom,sa8775p-dsi-phy-5nm
> >        - qcom,sar2130p-dsi-phy-5nm
> >        - qcom,sc7280-dsi-phy-7nm
> > -- 
> > 2.34.1
> > 
> 
> -- 
> With best wishes
> Dmitry
