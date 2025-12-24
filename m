Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18337CDC2E6
	for <lists+freedreno@lfdr.de>; Wed, 24 Dec 2025 13:18:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D74D510F010;
	Wed, 24 Dec 2025 12:18:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kB9M1Jno";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="brjJOTJi";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CC1110F010
 for <freedreno@lists.freedesktop.org>; Wed, 24 Dec 2025 12:18:31 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BOAMpJ81597726
 for <freedreno@lists.freedesktop.org>; Wed, 24 Dec 2025 12:18:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=bKI8QVztLgm/VTUggHqWkOdu
 mvv03Az0PJtQAcYfPWc=; b=kB9M1Jno4ggr+1Mt8zQ6HBEzDZHsASRLi7te1e76
 AZjT0U9s0PyTQffp7b42YQLC2sW6mw3XirwSBcwaTSvis736uq5raYVEs4lziN1A
 T+HnzqBRfh3B/vns/eVqvINhDrD1e5d/p7Mmf5Qz4HfuqcyUwn8pgvSwug3mLsKh
 c2IHbDt+MIGl/qvuOuNbzdOZQiZGXQQaPXuZncbVnJvdocKy/go5KVKKrRZOwUW8
 eeC+mD2vduk1AYHO+zkn4PP1zDrsxoVQuI5H8cuCKbsi59+eccovt1lTzDI5MM+7
 WpW6IjxhZ+ceXTfjK6uFNpEXWge6++UteYcoFxCSHgtJDg==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b8683hj0p-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 24 Dec 2025 12:18:31 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id
 a1e0cc1a2514c-9415ceb0a03so4370305241.1
 for <freedreno@lists.freedesktop.org>; Wed, 24 Dec 2025 04:18:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766578710; x=1767183510;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=bKI8QVztLgm/VTUggHqWkOdumvv03Az0PJtQAcYfPWc=;
 b=brjJOTJiUrdhCznoFFvzY80pJfG2ZVIBjZEgD+E+GHXzorF6pxlT+bWrWEK34ITX+C
 RJ16AlZObWTV1oB4VuB6tq6KhPrazyZw2+MReu9RM//jSVzXpz0rLdhsIjQYDA46ahN7
 OV65npWQ66EeRLQlpqoQESiG7WJW8cPky03AqVfnSkjIBawsd3csCBV9pZmZz36kQHmL
 SLszldvY84LfzVqkaSB1syeyxDHhvpAXeNW1T2kWNNuaEtEPzb8+FuOzJNSb4m1/EJEj
 Ori0zn0otMzZpnGGcOLU27MZmJHhHvMz/3SJFmW03JcE4QdBhdP6Kb2TMGlgaatW9rlo
 uS1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766578710; x=1767183510;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bKI8QVztLgm/VTUggHqWkOdumvv03Az0PJtQAcYfPWc=;
 b=G9u8iayHl1wKW3riiwi5kDs7dXnIuJD6PXkdbjVXOxveee12ikl/frEWB+aLXmmV/c
 xlOizuOfAfuMz2u0RODPQaHF3HtiFMRlFf4Mbog94XMYlDm+eJPWadF4oiOOKnapdz1x
 wftREAJV13uBRirGjHK414zrcWClRppZ2eZJoj/AN3FOzGaSDGTFlxZ5vKMl0MlE0SuA
 uYtGcvK5QGFwj3s9JnDo9/eXUyStSfjgYlN63kD8LQruYmm6QADSrulGhq7OJF+i1fh2
 Qu1ND1JKqOLBmkI0glACFo0vEqYTNrW+iWf7krPVCdBz/R9gj6P57GNCQ/GTZm+koQrv
 j0hg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVA5Oxr4xEFoJiNMcWlJ2cWkFmJEyN+KBkZi57V2gkEGyPob4hnc6n6dNLvRa/xqdO41qVoOXRwjDA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz4h7AVDGD3thzNnX02Mn0536IQ08G8QSx0ZUQP2Mtobgnnks4A
 omKauaPvATadwaxcRB/d6Hk4gidVi4d8WkctLuYR0MKgtxh4w4sFA0IGQBwXZjigiHX2tlZX+Vq
 W0gZTwpFrVaRjuHSr8/lEdHHf34lR4Q0xxTOuHmpm5U7s5wTs0eAcABoSdRPl02nZwD58sW8=
X-Gm-Gg: AY/fxX6OFOYH2dwILarNPSFlx7Ud8Z9/Icy/k0r55GpixedAZrvBz1TcOcVMz+6s978
 38P0u46bwwf/I7dgk8U8VZKRa/tj/DxU4dnEuRhnxVKP/BSAoeoe7/OfRO05os8uacHyVjs4nls
 wSXBOTyAAZR/luOm6yijjfn3QpFtfIHaw1AVu0g3YpRg6BGDec01kWWGl3FEHPsaTvUgcf2Kuvx
 tldMq+k0Xpg7wPJGGNlm9IAcGtLO29b++/3EiogjZwdAOHSEXACNZJSB40QKPioh//dN081jM8Y
 Wihpuc8vwZKu3M9Pvx8Hftb+4/sPM6E+b9DILhjZCIql93eWjkmPLmWcgAWg8kGOKFdFm/Gf8Zz
 Xm53F4gNfD+Fs6K71UAsMhNsJLVadak4W6axoYKfu+ojNhr4DtzwpRr4iusl1+4Qhp2Wvy5svB3
 vaydW3SRqKDaJHBBJCvAqO4Gc=
X-Received: by 2002:a05:6102:9d6:b0:5dd:85b8:d82b with SMTP id
 ada2fe7eead31-5eb1a67d474mr5554701137.14.1766578710002; 
 Wed, 24 Dec 2025 04:18:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFHiwFoU6VDGIWYRpV1cCuR3GUum+5cqV36N0kvTseaZzfOA1lWmDijjG9KtgAAiCj+X0GS5w==
X-Received: by 2002:a05:6102:9d6:b0:5dd:85b8:d82b with SMTP id
 ada2fe7eead31-5eb1a67d474mr5554692137.14.1766578709538; 
 Wed, 24 Dec 2025 04:18:29 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-381224de6eesm44436181fa.6.2025.12.24.04.18.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Dec 2025 04:18:28 -0800 (PST)
Date: Wed, 24 Dec 2025 14:18:25 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: veygax <veyga@veygax.dev>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 jessica.zhang@oss.qualcomm.com, sean@poorly.run,
 marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm: Replace unsafe snprintf usage with scnprintf
Message-ID: <oizhtyik43eyaixepugzndv53kn23tqsvxxwhjtiewbignqd4t@kyhnf2ttyomk>
References: <20251130012834.142585-2-veyga@veygax.dev>
 <176656845704.3796981.11008925293580480750.b4-ty@oss.qualcomm.com>
 <a5b8cf57-8697-49ba-b225-ec735bb4e337@veygax.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a5b8cf57-8697-49ba-b225-ec735bb4e337@veygax.dev>
X-Proofpoint-GUID: Q3LnrHYvLE3o0_OL2c70j1Kn8Q-a_w5u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDEwNyBTYWx0ZWRfX1ijGXUbQNJGI
 mQqM+RuvkSaSXAFhqOAHDCK6scKg9RfkaSq6xYjMwWneXwDWzpZbp+TpHq9WpVhNf+CAaDI2A3c
 RSyVcInvw2bdB44uOKxDf1fvHMP9Tx+nC7Fd+RFkMbqCBL/TMApQVQdPTSwnB2RosxN/0cEfQ8x
 aiFRSJQnXSpWW2E36Ih67YLEkGfykhCK3Kdi5citK0uzCZz4V1Nty5LQR+yN7Btj6+xIKXApukf
 +dEToqhKFVNLDBQxqkcsrCvZyuVRLr7agHYyCuqtR1J6tSfdvRjsEmdt0cUzIxHOIBBHyXBY7yU
 gxFot2yw5NeSd6xkmZWrspXw+l+RrZBA9KyaSQV3rZHhZFttk2BxhG+ioeVL6qWomJaOQpaVrYB
 rYqbS+eMZY6ngb1kUMMIluTjNoc6oKlmmGgPCsrXIKm8YnnOwK4tXHUTHApQN5p/xuU5JlUU4Xt
 J3CxwnDyFlBgjieOckQ==
X-Authority-Analysis: v=2.4 cv=HqV72kTS c=1 sm=1 tr=0 ts=694bda17 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=pwWpIS086ldQWxGsuL0A:9 a=CjuIK1q_8ugA:10 a=Qzt0FRFQUfIA:10
 a=TD8TdBvy0hsOASGTdmB-:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: Q3LnrHYvLE3o0_OL2c70j1Kn8Q-a_w5u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240107
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

On Wed, Dec 24, 2025 at 12:07:29PM +0000, veygax wrote:
> On 24/12/2025 09:27, Dmitry Baryshkov wrote:
> > [1/1] drm/msm: Replace unsafe snprintf usage with scnprintf
> >       https://gitlab.freedesktop.org/lumag/msm/-/commit/093cbd754382
> 
> Hi Dmitry,
> 
> Apologies but I've just noticed that I signed-off with my screen name
> instead of my real name. Would you like me to submit a patch V2 fixing this?

And I didn't notice it... Yes, please, send v2.

-- 
With best wishes
Dmitry
