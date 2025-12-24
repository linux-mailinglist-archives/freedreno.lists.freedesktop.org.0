Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 851D5CDB845
	for <lists+freedreno@lfdr.de>; Wed, 24 Dec 2025 07:36:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CF9B10E34D;
	Wed, 24 Dec 2025 06:35:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZkE7jdAm";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ERPJaA3x";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EACA10E349
 for <freedreno@lists.freedesktop.org>; Wed, 24 Dec 2025 06:35:57 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BO3wlkG3797270
 for <freedreno@lists.freedesktop.org>; Wed, 24 Dec 2025 06:35:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=O/ai+EcQhmuEEaMU3xpLlQek
 lMb0G3yAwRXrO+mFiyg=; b=ZkE7jdAmY4rEwCd9pzj0kuDronNBYGzAuHLUSVeS
 te3102OnEGM7QfKZQbKStnV7KJSnj9/zP8U20G5OxaIlYrSpKTZZXkA409zTj2pp
 gNGvbEbwcsfQ0dvI/VV1wopJD88u0JPHE73ejZAJsGH0y06+8f6DCHrMjkHpM/RS
 1N+Fz7n4mBF2olhq2iNArLp7kMKh4eEhuBhe0DcLu2nqBcqfHwYRRiPpii7CftTW
 kCWfYB2d4JDbp/GauUvtz2PwkbDNs7PIXcQiMK3Si038zqFTIo1IYTEbMHvHKUVY
 ECxfA3TnY2A4x6iLXr0b8je75rfWLFLssVjJnJNTBMs8Bg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b88r68b6u-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 24 Dec 2025 06:35:56 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4f183e4cc7bso101788131cf.0
 for <freedreno@lists.freedesktop.org>; Tue, 23 Dec 2025 22:35:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766558155; x=1767162955;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=O/ai+EcQhmuEEaMU3xpLlQeklMb0G3yAwRXrO+mFiyg=;
 b=ERPJaA3xOhBO1g9KrfGnmqAkQytKF9e6Rz9TIUnXjSl9CZuVUUPBOsrEYpokALQE2G
 6ljGRM3k5VpuY0wOWA/YCywRrSAjtTptnaVLUSAn6eqQ7QKfShPqJXIIQiuGFoUfelg9
 ebhceLY7/1/F6YNRg1g0OPZ33Vw33z5raDSoZTSHIOtlaVnAXlvmyoVI8GUWobPF0bH+
 v/X7STTXlNX3udhs2/ZYDDw3yLVWTK/A9DvX7x6u3OQie1/CxUGckXAs9Kv14RYP23Av
 cq1vBAwXTe5ldAiNOB+Hz/WJbDjIRD16O9cLU0eZ3G8TY7OAp+WsjmrUi60+fkuvj6Dg
 vO3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766558155; x=1767162955;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O/ai+EcQhmuEEaMU3xpLlQeklMb0G3yAwRXrO+mFiyg=;
 b=oxJHBzq6IXAeEFG5c1KcDzY1qGldWSpLTTPIXAZqBr8kiM3WCYQ3jgPhJE+0y7u05G
 AxkBhPX6USPsZK3ujjuEV3zbIKD8lAHoWel+jJ7LYh39ZAPMfsuKETYPLDB8nqVoGKbG
 Wq1VAbGk+4WJ6vGc8f2QK4ZRIdMPdkWkDYJHBlD6RggGqaxTYV41Khiks2rF55XPSO/g
 N/YlYNmc+uPD6yrw6cgK6x2VyJidQNaSURMw52jbCNd3U3cstgpGS4mDy8nHaqtndwKo
 AR87jeUT7Q7YkNAzXdEoue1AlEobomIYJPD7EK2PG3Y5mA1+JPENNrhVG7BCl0HS/Vio
 Ej7g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUC+0QhLOeTyyhoP8fQvyiaoNR3+s574uG7dzhJ9p97x3zbVp4TbGVEYv6YFSVdT3L4p+vfKuMccYc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxxUG1zm8Se1dC4R9DJf06OUdaKDKDRchv72RGX3/ItwKApO62S
 rPil9hECxrvh3UFHo/+A1npKkMSq8ypIQA0RfSYR0MWFa29MVQz0LwF0ORRVmKxAZX4DpT3Xt/f
 mTUoWUg/n9V/K1/xEMZF/CwjtbPC0ecW06bTSi8fZNGy1WcYBIgV/CIK+XDt6fzJ846tm0zigXZ
 1PynM=
X-Gm-Gg: AY/fxX4t2h30BG78aHNEeNLzxE9k+D2ehUfyZLGSqrgsO2MfBgLZluvfbqqqNDQPk4w
 KDehl95L0yEo9MtT7+CUFdlkb2fm3kGoPN63xZLU7NwjnJdk+vm1sTlhw29sZZEsMtGT2SDsYxl
 vT18oPHkmCSbkznoxyOVb5vzs+u3Bx2+o4geKOVudq9KeeIvnws+rJgl497CWEl6nTq3j3Tdla4
 f/bsLyweBU9FdAt/bJpUNhdzkTHfJRNB2tL3KthmpXElR2ut2GcVEAeRQs/wcXBoQK6pPWNDR1c
 mLyWMWmUsQBc3SRwP6ZhDmzEXS46PC4TX/EKd8b1V53foOsu0KDc4GgCob+i+BC+XlzPoOrIueh
 F9SwhFRh+G+Bi11UccUExFozxdgRo9jUD14MrMuZJD1/zBvpQLSnrp/OTo/HuhZAhvnmYNRinJJ
 c8By3mB7jJSPceX06Grc/ejjg=
X-Received: by 2002:a05:622a:189e:b0:4f1:c76b:d003 with SMTP id
 d75a77b69052e-4f4abdca7bamr248300871cf.78.1766558155394; 
 Tue, 23 Dec 2025 22:35:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEpI/rBZcdIhw1TBccG58XQ7KCp9DIvIyshdUz5Zd7gDt37SyXo77uS5l9pViKqGvVhj3r+sg==
X-Received: by 2002:a05:622a:189e:b0:4f1:c76b:d003 with SMTP id
 d75a77b69052e-4f4abdca7bamr248300721cf.78.1766558154912; 
 Tue, 23 Dec 2025 22:35:54 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3812264bf90sm38755151fa.35.2025.12.23.22.35.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Dec 2025 22:35:54 -0800 (PST)
Date: Wed, 24 Dec 2025 08:35:51 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/disp/dpu: add merge3d support for sc7280
Message-ID: <5ucbip23c23z5cpoevo5uxifl5de7mfipjfkhblyiw2vbxv3j5@h464opwvswrd>
References: <20251124-merge3d-sc7280-v1-1-798d94211626@oss.qualcomm.com>
 <nw6oxqdeoeckcqk4lycxyujh2uk63vjdzdpaddddkjb257xldx@eh36fawnt2an>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <nw6oxqdeoeckcqk4lycxyujh2uk63vjdzdpaddddkjb257xldx@eh36fawnt2an>
X-Proofpoint-GUID: lFyItEYWqvhsxLq3jpBoTLMqETh5KDy3
X-Proofpoint-ORIG-GUID: lFyItEYWqvhsxLq3jpBoTLMqETh5KDy3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA1NSBTYWx0ZWRfXxFtOQtHaeHXc
 Fn4DwZNp/oPXg2hMITI3SfVuOdkZfCvudv9Uao+G7YA0c+Lj7yhxC8yFwblX9wowmQlyb4I7XYD
 8/mrge/HfpN5M+G6VDPPxipmKHzKpDo6kDa0szvb2MT2dkJLdNgxzLuRKyFli94GwHkY6YH9cKz
 fI8dZ9LPiSumBOM8q5gfzcOKmgKF+kqu1B6ug2cFIttNl6S1wkcONkEJ3RhOLl8hRJJ7h5rFBVm
 6KU5LzS53zEwDFfBSZV4fII5Hj/ohv8U8iS0dfVFxfjOxTsAI4GbjmY/gQMV9H7LUmZr1TUD2QV
 E6IiaUgzW/rOHcj4teX68eQo26k+sEQF22+o7NOTUQOu9cYsru3y32X++CdNkzXk9n7JL5Z9PP7
 EfbQvnAYwvNnBcSPvA7l+xTj4reH/hzsJkiGbxqkDf0zizOFeFiC1NWquFL3fVAiODK+DjkAROg
 RpmdZqdBUoky3rcHcBw==
X-Authority-Analysis: v=2.4 cv=Qahrf8bv c=1 sm=1 tr=0 ts=694b89cc cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=qRJANdtSRza86Q3VVk0A:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 bulkscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240055
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

On Wed, Nov 26, 2025 at 02:32:41AM +0200, Dmitry Baryshkov wrote:
> On Mon, Nov 24, 2025 at 07:57:01PM +0530, Mahadevan P wrote:
> > Add support for the merge3d block on sc7280 which will allow
> > merge of streams coming from two layer mixers routed to single
> > non DSC interface. This change helps to support larger buffer
> > width which exceeds max_linewidth of 2400.
> 
> Please see Documentation/process/submitting-patches.rst.
> 
> First describe the issue that you observe, then describe steps required
> for solving it.
> 
> > Fixes: 591e34a091d1 ("drm/msm/disp/dpu1: add support for display for SC7280 target")
> > Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h | 14 ++++++++++++--
> >  1 file changed, 12 insertions(+), 2 deletions(-)
> > 
> 
> The patch LGTM.

Mahadevan, you got review comments about a month ago. Any updates?

-- 
With best wishes
Dmitry
