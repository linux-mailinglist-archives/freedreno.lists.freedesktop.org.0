Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A3DCC1EB06
	for <lists+freedreno@lfdr.de>; Thu, 30 Oct 2025 08:08:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D62A10E029;
	Thu, 30 Oct 2025 07:08:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="k+v7FLmK";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PDBXVLAG";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76D1610E029
 for <freedreno@lists.freedesktop.org>; Thu, 30 Oct 2025 07:08:14 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59U0ibah1995213
 for <freedreno@lists.freedesktop.org>; Thu, 30 Oct 2025 07:08:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=IYBMombL8T1bltomZZaQTOz9
 2EhYNFQ6v2Qs6UxOLuI=; b=k+v7FLmKgRWh6+sAFlXrqWjVGaylcQDC/8Z1iokE
 d5w9DhvSHUU9nEqRrXe5dGBfvVQr8l4nqbqPEG3GFgcsIPXVrMYCOYV7PNqegvbk
 mUETGV2cfEkyIFoCErKTb6qC6ObQ1BHtZVyFVePGdSBQGWPspJM4putckJBamGB6
 b0IWbroqpWj8nZG6DjVQklpKqVTyoQ6FJlFJ63VqfLsuVMwCpOyxyEWqSK2UTBZq
 esEiR1dX2HF+tdzOXI+CxdnxnlhmxeMIdGURByXxIDQVZpQXg8YFnyV3CIlMM+lO
 uGEoaBUN4GnSKC5M31ok+MFOQ+cro30GTZ8kR+54vmG1ng==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3wr70v8q-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 30 Oct 2025 07:08:13 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-88021ab477cso5311666d6.0
 for <freedreno@lists.freedesktop.org>; Thu, 30 Oct 2025 00:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1761808093; x=1762412893;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=IYBMombL8T1bltomZZaQTOz92EhYNFQ6v2Qs6UxOLuI=;
 b=PDBXVLAGn1EmOs0Sim+IriXVkArOrOSEnL582SsoYQFn9XOD9EhCDpFTFx7wFQr+qS
 oUeHDmeP5QNjT++Cfsw5CWdYi7aadQphLj1Tg2IZcxYd10H0ofxrdnz5dwQ3L8LEoO9L
 /KrhO85Pti+cuJxjdMxh8wVQIvQbNRTpK3Ai4/OZNmZpB0+6qGneNX02c9PVb8ttpYUG
 nV7Qsu1IuKJlJUnWlK/UQ6MbTwRE0XkIfHDYbE/43MSFloXU7OAhvMKAnizHYLwXI4t5
 U8EDC/2b5nuXIwye5bLFOBqe1qIiJhxCG/dyl8hqDJrGoiegFU2y9nkVSuJ1NC0MRVxa
 l8KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761808093; x=1762412893;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IYBMombL8T1bltomZZaQTOz92EhYNFQ6v2Qs6UxOLuI=;
 b=tzIOx3mh6Q7PN2VAM8cDhmo0GvMwcgPWqU+a3SlviGLV27EGaf4X9JFDDDnDk3XMng
 DmsL8oait26vgh555g5R/fJhs0xFhBJKtP1KRb/ybSAqP5MP5I0NLbNvjhp8hfyjKdbH
 qnmndKjjqzmoGygJn+AMuMCJYRe6MA4wdWWPS2v/kDRf0TIyKmyX3IMaNhhe4YKb51mm
 W6qDh9XzzErKNTJ5pjG39zTjwuj4+iVAW7uHngoYk7fY72e/w0cydfETl3q+otch/S58
 WwQaJLWQ3G/SrkO/uW7wMaqvYl96lVnW+k7oSNo3eH3n07jfiRqDNKzr/aEAVwDtK+Cj
 ChHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWq4db3a89IbOlO5jP8HW7wDbaOMJSShy948KMpSSFqEoUzdmpRgiEneAbcF2n5bWUCYcpeKFefv4A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy9raeUPYYOmMEK8z5IVQKXwaZ8NL66l3W0ciCv78I1liQldQCO
 CPIVm0P9+bTsJB4El0DPMtV8C961zh5nc4LmppXX1+ApW98VEJuTeyE+Qk6JO+uI9i0TRFHLOl6
 i9/V6nSMMNbpDzY2t1EYRkSwZq75Xr9MItO2vdImEjD4xa6h1BDD27MEwi2D39qDxEakMxk0=
X-Gm-Gg: ASbGncvi+euQiUwRaWF1I9qeXyX1NQmf7EwHfJYo35Ap8lA8oXNnMTYmns4DxhWDR/K
 phy9DLfow/Hfc0hcVJOtKtqyFJEhF6CdyUJx+WKS99aOLOW78rbJ08hKiYzXGJO7uAyTZP4sSh5
 UlRpD+YyHZoZUGHAkeqcjwBnFhqSVAeK3BWRAMCQJzbrPI4HSVsCpenoY/95vRrb6h+i0ZFaTFl
 OCMz41IDQHyrEPZ0WcHui3B2kbupCptQAtOzG3z08GLGgF/kttpBiKfqp1KrTpBzqHzS14zLRe6
 MzNFPo7NFj6r9CRdQYLofOYZxPrVyldtNLTUJ369IV+gn2oXLh0idbhCgqCxlXnSgWUnYpyU+i2
 n7Aa499nEGmm74sLhZCKH0prv2BKAf149m7WymR1Nz/1O5V1QE09jibz+Z9YsOPIK
X-Received: by 2002:a05:6214:b6c:b0:810:e12a:48fd with SMTP id
 6a1803df08f44-88009ad09a1mr83592196d6.7.1761808092776; 
 Thu, 30 Oct 2025 00:08:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF8zPyr7CBc17zabeEthaobsdk5MfrOpcUhAgyht/VFw5dcoi3n9FednzAFRqYb6ttQ+XA7xw==
X-Received: by 2002:a05:6214:b6c:b0:810:e12a:48fd with SMTP id
 6a1803df08f44-88009ad09a1mr83591986d6.7.1761808092324; 
 Thu, 30 Oct 2025 00:08:12 -0700 (PDT)
Received: from yuanjiey.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-87fc494ab16sm112217426d6.39.2025.10.30.00.08.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Oct 2025 00:08:11 -0700 (PDT)
Date: Thu, 30 Oct 2025 15:07:59 +0800
From: yuanjiey <yuanjie.yang@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, robin.clark@oss.qualcomm.com,
 lumag@kernel.org, abhinav.kumar@linux.dev, sean@poorly.run,
 marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
 quic_khsieh@quicinc.com, neil.armstrong@linaro.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Subject: Re: [PATCH 08/12] arm64: defconfig: Enable NT37801 DSI panel driver
Message-ID: <aQMOz4P2/WyjXy1b@yuanjiey.ap.qualcomm.com>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-3-yuanjie.yang@oss.qualcomm.com>
 <wuh7agcgg6spghilnx4amqukaaydj25u7kbdiod7fl6pu2ulvm@pmosyuo43cyw>
 <aQF98RvLuOlJZlFi@yuanjiey.ap.qualcomm.com>
 <38c8e26c-08a4-42d9-8f6d-93969af90d50@kernel.org>
 <aQLOaI3ngjswi7kd@yuanjiey.ap.qualcomm.com>
 <7c1e0cb5-2483-4efa-be52-84cbe5d1a4b2@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7c1e0cb5-2483-4efa-be52-84cbe5d1a4b2@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDA1NyBTYWx0ZWRfX3RZtWc3tA1G4
 m9jtM5KsJ2a9L5oGWQu6ZABMizSc7cosd4bb8k9kaldcvCvx2PytoujIP4bz/8V9YUkgJ0oj3im
 f5w1Ht7LFdEH4a/T9kwlTeK8N3tYzS4H2a7bJq3mCgEU4gV2j+Pk2ba96J+dCUpmdEVsiwx+yXO
 u0D/IYOKVL4TZuBWBkRLGWdkb+aS9msvkR4io3Qy8viqA8KCm5ydJSEI0lBGUxSZ5zKUr7bnEcz
 EmZJOErHZqHn3WlARZ9LCGpTgd3ODKYBzb6Ru7dyJUHc0zLWpPudi6NQeI90i8dXLq4NpxDrY6h
 vxP0gc/3599tJoiYGWjWcSqZDHsDtZfdSWaWdkUyv/ja2iUp+xj4cGVuUPOjqs7YWd3Ml2JKS1H
 3fBsYvmNBEDZvWyoUFEvAoj2Uuk58A==
X-Authority-Analysis: v=2.4 cv=P+Y3RyAu c=1 sm=1 tr=0 ts=69030edd cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8
 a=x1sgA4FD8JzbF63Z9coA:9 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: k_5b4hLxEq-JtQ5x51UCTqQ6_LZ2-Zzq
X-Proofpoint-GUID: k_5b4hLxEq-JtQ5x51UCTqQ6_LZ2-Zzq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_01,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 adultscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510300057
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

On Thu, Oct 30, 2025 at 06:37:40AM +0100, Krzysztof Kozlowski wrote:
> On 30/10/2025 03:33, yuanjiey wrote:
> > On Wed, Oct 29, 2025 at 02:05:20PM +0100, Krzysztof Kozlowski wrote:
> >> On 29/10/2025 03:37, yuanjiey wrote:
> >>> On Mon, Oct 27, 2025 at 10:51:23PM -0500, Bjorn Andersson wrote:
> >>>> On Thu, Oct 23, 2025 at 04:06:05PM +0800, yuanjie yang wrote:
> >>>>> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> >>>>>
> >>>>> Build the NT37801 DSI panel driver as module.
> >>>>>
> >>>>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> >>>>> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> >>>>
> >>>> You (Yuanjie) authored the patch, but forgot to sign-off, then Yongxing
> >>>> provided certificate of origin, then you provide certificate of origin
> >>>> and send it to list?
> >>>>
> >>>> Please correct.
> >>>
> >>> All the display patches were jointly developed by Yongxing and me.
> >>> So every patch 
> >>
> >>
> >> So two people were working on this absolutely trivial defconfig change?
> >> I have troubles believing this.
> > I want to say these patches I am first author and yongxing give me support, so
> > I think yongxing is second author.
> > 
> > I want to express my gratitude for Yongxing's support in every patch, so I included
> > both our names in the sign-off for each one.
> > 
> > However, if my intention causes any trouble for maintainer, I can remove Yongxing's
> > sign-off from this patch.
> 
> 
> Please read submitting patches to understand what Signed-off-by means.
> Otherwise I have doubts we can accept your patches - you simply do not
> understand what you are certifying.
Thanks for your tips, and I learn some tips from submitting patches: 
https://elixir.bootlin.com/linux/v6.18-rc3/source/Documentation/process/submitting-patches.rst#L524

I thinks below sign should be true, if you also think it true, I will use it in next patches.

 Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
 Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
 Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

Thanks,
Yuanjie
 
> Best regards,
> Krzysztof
