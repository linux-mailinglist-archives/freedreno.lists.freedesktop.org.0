Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B54C0EF46
	for <lists+freedreno@lfdr.de>; Mon, 27 Oct 2025 16:28:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F5FE10E4D8;
	Mon, 27 Oct 2025 15:28:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="fXl9Ky+8";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0636D10E4F1
 for <freedreno@lists.freedesktop.org>; Mon, 27 Oct 2025 15:28:47 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59RCTtXT2752236
 for <freedreno@lists.freedesktop.org>; Mon, 27 Oct 2025 15:28:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=YrpC/Eij51oIcLt5fwITYt7x
 pzA6N/JSreOhEW3wMcU=; b=fXl9Ky+89oD+F37ykbRqhqQ3dkXcpSACYzcYskik
 WZpI/aMEkH22yOmFh3SshHaNj9KDqs3bYZMDF0FpbTiUvgplvZ5feNcCBjya0//2
 O5sidI6HDx6bqtPtAPvyJuTkzXVvXxQiTGul73MyoFNxawgFtKM4S9SAcuah67eo
 8D7yfw6QNSzjonTu2dLuVJSb5g9WKOpkfn50GypsFIy0E1tYhFsztJFosY4kXZM1
 LWsnrHSUdtvQXV4lY5iGbr28GMrUbUOWqUFENIXUyh40M/lLLfDzZ32VqR1DLWjm
 4fULpVLiCOuhYh0xxIcY8sNWyoR9zVkXmDi4C6B3f12xsg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a28swgp6b-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 27 Oct 2025 15:28:46 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4ecf0501ec2so36538931cf.0
 for <freedreno@lists.freedesktop.org>; Mon, 27 Oct 2025 08:28:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761578926; x=1762183726;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YrpC/Eij51oIcLt5fwITYt7xpzA6N/JSreOhEW3wMcU=;
 b=p3Yq4pLN58lR5CUUgEc1pPDZkapkGA7YFbMpI1mVYGxNxERSMoSVMWCTYq0FCWdohA
 ZsGMZ7kge0IXmyKOpF2lwyaKfD8M/d5t5WgwSic5+r058+JazFPYdU9CzJrBRsgl9ZSP
 lzXBLmDFghj22xsDiXaH3ePMrMzWlxjoiqSgbDd9zUQEN6uHsBAAjeClm33Sm5ldEkY6
 dLWjv5blKPc5sWDc2pybJjKy6F72ur3D/kM7mXk77laXwhoP/5t1Xb71CV8IK76aBDBX
 a5Ec7bA5IKyOgyYvy13IMA5+WSWMe1wJiyQufB3B+G9kmB/Ztm0C64pFXxLdwHRZbCGS
 oQZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWv7x8fSjpNRWWTv9JD2fgeTGiTLSGzEjx0Ug4xc0lWG88fBNF5amp0MR/hNhPxqOJ7/lTrwUasNCg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzDGk58rKpqbMbuQ+ajTDAT3O1af1rG4vecNlf2ttOVoWfG3kg0
 XtWVWjLQy5CyqH/rJj/14KuW7KlY+Df4t8BjCYXIIirF7xTomBOCRsNmLlCZx7kJvxijZWZOepI
 4k32NH5dIRU6BZ1p3Ik3aYbA9h9bGp7PB6acOcUxT6NKCvYG2ghM7kCqabvjVf4vQtvkXpFg=
X-Gm-Gg: ASbGncs0YeGHgsLYoMhhYbYmiUKQMZxazYHs+2WbBSfopFU78eov+Fb7BEUhJ9YNU9G
 DQ7nY75Zra5wZgRqLAE8GwlLnBq9IDge6fbf+955BlLERKQiLtgC68IJovlpQg3+ZVM91cfhU0Q
 HgWYtjUbu4GP4SmbGg4kRLcDPcG1So/5YPKNFBxJ7MAKe3h1SLvw4ux4arZGWtwWwek/q39DZBQ
 L6gZEHE1f2tAhMtYMh1SfVms3jewbFUDOnqLHASEkInkdsph/2z+iFOClQ+wf2jf9XKSmdGVLA/
 VowiVBA63NZ7g3+OOPrZej0fK92qFt+iDRYDFIFOgrp7uyEydaQnfEjxtNfwBgIzZxR3vTmIdUT
 ltYtJg8+fBdpyMX/12rX1vmBqBP9VHKl6t5jtKLr8O2s2Kkc9fwComKpCrxMB5QOxvuSxxHySRL
 jkgluIisrpL3Wj
X-Received: by 2002:a05:622a:210:b0:4d8:afdb:1264 with SMTP id
 d75a77b69052e-4ed075ae66amr5031561cf.51.1761578926121; 
 Mon, 27 Oct 2025 08:28:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHjv+f9Wm8zIpfZr0CI4TlRCnBPRjNZSJNUnKZu9weamrR66/3k2l4bfVFcQ9Uy6J4XGbePmw==
X-Received: by 2002:a05:622a:210:b0:4d8:afdb:1264 with SMTP id
 d75a77b69052e-4ed075ae66amr5030901cf.51.1761578925321; 
 Mon, 27 Oct 2025 08:28:45 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59301f700fbsm2410946e87.81.2025.10.27.08.28.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 08:28:44 -0700 (PDT)
Date: Mon, 27 Oct 2025 17:28:42 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 7/7] soc: qcom: ubwc: Add configuration Glymur platform
Message-ID: <2ppfdoqa3fyjysfv4kiincmpbdstkgfwxso7tlfcfyfmwsndok@7krfjzdvsozv>
References: <20251014-glymur-display-v2-0-ff935e2f88c5@linaro.org>
 <20251014-glymur-display-v2-7-ff935e2f88c5@linaro.org>
 <7dxq62ltoeerb4g2fgchb2hd7eomvlexfgyvamxsuuirblavtn@4bg3dy2bukdq>
 <vngf7cnsj36ddg4pdm72airm2nketxk3m34qw6f65ompimpcfl@r3lbv73tmutj>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <vngf7cnsj36ddg4pdm72airm2nketxk3m34qw6f65ompimpcfl@r3lbv73tmutj>
X-Proofpoint-ORIG-GUID: fliyzKEvkZcJelM8fc7TUV8j8PqjejEx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDE0NCBTYWx0ZWRfX20GhlOF818NJ
 1H3LkrnBj38PyK6S2XzKahMDp7tI4LQbimg6YKizvIo9MJVE3CIk1QXXKE+OcRYkrESOj8yqQ+9
 U7sbqBvRzY26PSQbuKrFtGMrxXNSFNv4T9UJU4+i7KXpMWzM0M6bUqcMDhIVp+xuoaQ1rM7p8Y2
 zzARPSDcZs6SsbKxBjOeSKiGsvKQeSa2fltjhveB9aZUIyazI67QmHZ4rGr70griB2i9Ckv0s42
 F9QKLo0mdHmQIohDxPYh5VV6urdC8m1uCcYR3utcQXuGIKq5Cb1D6XS1R1p9UoAJ0EjB0uzp+KU
 28ibJBlGmQJQwg5v4fJvWG3+/Uj+ZNiClCTkAT5H1bjKccJHEmRQEJg6Odj1yVJ7Fy9its6Rylf
 5R58IL+i5BNCXGOchLg/GysefI1NkQ==
X-Proofpoint-GUID: fliyzKEvkZcJelM8fc7TUV8j8PqjejEx
X-Authority-Analysis: v=2.4 cv=fL40HJae c=1 sm=1 tr=0 ts=68ff8fae cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=L6mQZqrAOGHZejgJyMIA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_06,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 phishscore=0 suspectscore=0 priorityscore=1501
 clxscore=1015 adultscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510270144
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

On Mon, Oct 27, 2025 at 05:03:43PM +0200, Abel Vesa wrote:
> On 25-10-27 14:29:01, Dmitry Baryshkov wrote:
> > On Tue, Oct 14, 2025 at 03:38:32PM +0300, Abel Vesa wrote:
> > > Describe the Universal Bandwidth Compression (UBWC) configuration
> > > for the new Glymur platform.
> > > 
> > > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > > ---
> > >  drivers/soc/qcom/ubwc_config.c | 12 ++++++++++++
> > >  1 file changed, 12 insertions(+)
> > > 
> > 
> > Bjorn, do you indent to pick up this patch on your own or would you ack
> > merging it through the drm/msm tree?
> > 
> 
> Please note that v3 is out:
> https://lore.kernel.org/r/20251027-glymur-display-v3-0-aa13055818ac@linaro.org

Thanks. The question is still valid though.

-- 
With best wishes
Dmitry
