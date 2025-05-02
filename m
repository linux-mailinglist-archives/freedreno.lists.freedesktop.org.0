Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5751AA6EE1
	for <lists+freedreno@lfdr.de>; Fri,  2 May 2025 12:09:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5034110E8EA;
	Fri,  2 May 2025 10:09:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="A5QNqvAp";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C5C210E18F
 for <freedreno@lists.freedesktop.org>; Fri,  2 May 2025 10:09:53 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5421Nr1E002627
 for <freedreno@lists.freedesktop.org>; Fri, 2 May 2025 10:09:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=eGb1DlUbL3NjKY/kTW9b+ae2
 nxS0xZx64n5ndmQSd6c=; b=A5QNqvAp5jkwLT+0EyVxkW5mulaAL90Je2+xwzeM
 qyBWdXFm0tbRwy54j3HeK1MpiN1rita+E4lQKTJIt7Iu49/UToqQxANcpBRy7K/K
 I3P1L23ExvE1bH/vDER3dlrchk16s0vq/EU3ThgSHe8KSnR+3UUloULe1V8+SCP2
 iesFZIeyB7x/OhRWuhkjLuUPXguVqWzveeu6f0fVzDsgS1/WZLdJzmXWnNiSJ9JD
 pIgpkyg6LGKOk5CdrvfXWsmCLRHg64M/rgsO00jJLikmiZ3rTWHw1tBdXLDpS8AD
 Xfq/3SNCExOlmrkl6RD19f6H9eX8r2NEDhcXe1iQeMPVhw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u2fy9j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 02 May 2025 10:09:52 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4766afee192so67470311cf.0
 for <freedreno@lists.freedesktop.org>; Fri, 02 May 2025 03:09:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746180591; x=1746785391;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eGb1DlUbL3NjKY/kTW9b+ae2nxS0xZx64n5ndmQSd6c=;
 b=idN9gWeWyhyYXfWuvGteN8g83lKJM/dYZycupySRzoHBQY6c+kdw7j9e6PaOlpn5vM
 aQZzpnmXfaPzQXxyuYyPMi6GAt4Df7Fl2aG1sYn/pAIhIqblwcV0ZrpY3X9TL04fapty
 yUdCZ+m7odxnxFiUTZhcqHjBkvxDdpfE226SUEfqB6TDHVOkIbIlPXaWXQ+pYr8zHCsE
 jsJIiukdTnsAXtdQ5jOrwe4PHPcNguN0V2OY02GdbT9tOOVHT0FKjrwjyc7cR4tLlHUN
 rOKo4QjGdLqucZ+zIFKNNWgWpcLbJ+9zrStWynIK20KeHe7y8uOUNRwVzm7fUgWpa+t7
 HbrA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXpccidhMrX1AUTgYtFh4HNmJiffdx0XwjwIkgO4aBiIn/z712x0JzTCGadEZ1GoW8G704QdlwpdLo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzA0wvTjNUxnnWmmVIk2cZL6KLbk41PZU6ZWRAkLBeXNZbQVcFt
 dydA7w0PM7qkMgcwKu3ARY7tEgu172UyQIWKhu4sb6BsHcEaAx/tbFmayXxQApEjPjiqTZrPaeH
 NsQf2YuiSnMAU4vVrrH7NoEwQ7T35YZhgrOPDj8m4Sby8YQYpQj3nN+xlPXYtYB3GnTg=
X-Gm-Gg: ASbGncsyP1ZJtSh4UQXgxRnTuw1hDMAjrCdAOnmfb80v5P4kqVpxB4UGFeM0hk6qGDR
 ocvSIkwJFP8eN7MuXMygkpZWq6gLY+Runuyke7D84P4b3zyzSPKch5U3HHjYscaq5vnJlpayRSh
 yfcrmABllWdHyKQwAeRtWr4adVL03vVl+6Te7A58le888u30jt3F8YP3b1OPDgESAbSRY8r3dmE
 7eJ/HTnnxu8efqmt6C6McIfWRbekZ9C/+A4KUKKvp2MtgbpUHxoR+yFjSx/L4CaLAHzJ0MGX4IE
 /kiKQ/23Jcwi3cBPAfaH05Pl/kkSFfUdPQYCj3rv2e32vvaZRXtJZJR3fE0uSvlckLHCldeyKGA
 =
X-Received: by 2002:a05:622a:908:b0:476:7f5c:e303 with SMTP id
 d75a77b69052e-48c31c1393amr33914611cf.26.1746180591588; 
 Fri, 02 May 2025 03:09:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEI+T+sdPnhpQgFYsQMx/i1P/XK7HsEdfcoW/C3AL1UBNlcOIoAgvN7TUEI2OJ5tLKMoKv/uQ==
X-Received: by 2002:a05:622a:908:b0:476:7f5c:e303 with SMTP id
 d75a77b69052e-48c31c1393amr33914241cf.26.1746180591064; 
 Fri, 02 May 2025 03:09:51 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54ea94f680dsm309413e87.220.2025.05.02.03.09.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 May 2025 03:09:49 -0700 (PDT)
Date: Fri, 2 May 2025 13:09:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/7] drm/msm: make it possible to disable KMS-related code.
Message-ID: <lyzp62vwvina435pdskwalcgjmejkbs6u6ozx3nn3epvyjyqo4@2o4w7uxrklp6>
References: <20250413-msm-gpu-split-v1-0-1132f4b616c7@oss.qualcomm.com>
 <20250413-msm-gpu-split-v1-3-1132f4b616c7@oss.qualcomm.com>
 <71594689-06f7-41cb-ba6c-65459388fd1d@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <71594689-06f7-41cb-ba6c-65459388fd1d@quicinc.com>
X-Proofpoint-GUID: a-u-2tlB7rJiYHxTBVRd5XRFYWZHTsjr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDA3OSBTYWx0ZWRfX16XLx5qeb0+m
 o19wUp3q2+wvZpxP+eyNCjfDPDBnuh8EHvhgQO7pFy21+l8UbWvnB7O5is52wwSNUjkFb1+RWIR
 3jndHUKMIrXXbFelQiSzGcuJD4fWZ/Rq/0UVKzV72fhIDRG++NqDNfTy42iiWTQMXMh/MDaWVy8
 n16+G8GeFATmNb+oEkWed4I3femPGsJyPnvfUiP2DWnnChLfP3L8r4AJpYKGyK9h3z4fc/J9GId
 7Fhy6oiBK3e0q5O3hRWIm/cIs/KuSNknLdTXQuGtcehGCMonC6/rB5U69xjh+3dtW7I/iBZMAUG
 s4gDJYf3GXL73k0SNiETxo1G7MH88/9AIS6qTYIu1w1mbXnIczpnx/K56vC8Bh1IOJ12C1zx9js
 Z/IagnkjJTS3jzK0aNOCRWtpolIe/Sjk668AdS/cfUW/U10P/wWzg9JM4tytGx18HeVtoMO1
X-Authority-Analysis: v=2.4 cv=b5qy4sGx c=1 sm=1 tr=0 ts=681499f0 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=CDNnaGQRe6Xf55pPQM8A:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: a-u-2tlB7rJiYHxTBVRd5XRFYWZHTsjr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-01_06,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=790 phishscore=0
 mlxscore=0 impostorscore=0 malwarescore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505020079
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

On Wed, Apr 30, 2025 at 01:09:31PM -0700, Abhinav Kumar wrote:
> 
> 
> On 4/13/2025 9:32 AM, Dmitry Baryshkov wrote:
> > If the Adreno device is used in a headless mode, there is no need to
> > build all KMS components. Build corresponding parts conditionally, only
> > selecting them if modeset support is actually required.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >   drivers/gpu/drm/msm/Kconfig       | 14 ++++++
> >   drivers/gpu/drm/msm/Makefile      | 16 +++----
> >   drivers/gpu/drm/msm/dp/dp_debug.c |  4 ++
> >   drivers/gpu/drm/msm/msm_debugfs.c | 92 ++++++++++++++++++++++-----------------
> >   drivers/gpu/drm/msm/msm_drv.h     |  7 ++-
> >   drivers/gpu/drm/msm/msm_kms.h     | 23 ++++++++++
> >   6 files changed, 108 insertions(+), 48 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> > index a65077855201746c37ee742364b61116565f3794..5f4d3f050c1fde71c405a1ebf516f4f5a396cfc4 100644
> > --- a/drivers/gpu/drm/msm/msm_drv.h
> > +++ b/drivers/gpu/drm/msm/msm_drv.h
> > @@ -88,6 +88,7 @@ struct msm_drm_private {
> >   	/* subordinate devices, if present: */
> >   	struct platform_device *gpu_pdev;
> > +#ifdef CONFIG_DRM_MSM_KMS
> >   	/* possibly this should be in the kms component, but it is
> >   	 * shared by both mdp4 and mdp5..
> >   	 */
> 
> As the comment says, I am also thinking that this should be part of msm_kms
> struct, to avoid ifdefs. I didnt follow the second half of the comment that
> this is shared by both mdp4/mdp5. Why does that prevent it from being in the
> kms component?

Indeed, there are no such limitations nowadays.


-- 
With best wishes
Dmitry
