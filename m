Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26670B04A96
	for <lists+freedreno@lfdr.de>; Tue, 15 Jul 2025 00:28:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D02CA10E0E3;
	Mon, 14 Jul 2025 22:28:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="mAIJedhU";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52DB910E0EA
 for <freedreno@lists.freedesktop.org>; Mon, 14 Jul 2025 22:28:13 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56EGRJod026483
 for <freedreno@lists.freedesktop.org>; Mon, 14 Jul 2025 22:28:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=g58Cwy9wjp0YmHwQ5wI0oyKa
 mpOyzB7ETzY1FZOvoHQ=; b=mAIJedhUanJ7jP4mKdvJ6tRPoyd+7plz2X6m9FbV
 Zvhr2F1k9wtyF7hxTZgtRf1/0wpipMaTjmq9HwzAbzetO/xoNaNJMlhQo+kZNjZS
 XyXIY6tEEBBflXcE48EiI9I80vHVn+tAuao51E658I4vlp0RveJN85MHvtdEU/7G
 4heeLbD94Xovb+zTwgmNZF0PBkDpdjFO+JV7e4KFuiy39CFgGzlUrgXjmhc1JgF7
 oW0NwgUUzekoS2SPs3W4j9bD08v44m8Cq9jp+r3++vh9ya4GXmdaK0wDZ/BryP6X
 mSURlvxegggCAKZdLXbilUSadw02PS7o1z9AOS/r4Xb0+Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5drgs8n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 14 Jul 2025 22:28:12 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7e207330b6cso376180685a.0
 for <freedreno@lists.freedesktop.org>; Mon, 14 Jul 2025 15:28:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752532091; x=1753136891;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g58Cwy9wjp0YmHwQ5wI0oyKampOyzB7ETzY1FZOvoHQ=;
 b=FGSzZk4mcURrY0qiEdbPb8mzYnA7jUrie8KPGBJurjpWH/wo5ggPoOI0D90GVMSq4R
 WMmHN6rwkwOQkHl/dt2XUWLx7eHQB907B9ZlViXGoy6XIuHIxhovR6G3c+UfSrJ25YNo
 iCXC2RARV0fRd1jxDb5P4wF5CZ/HxdPKptPaFZZNetf5zzuc9CjR2t7CaivzUrN6ybJL
 7RRXh1Ii+VO7hN3ydBHZQBq594UqVQxlV4EZvmp4LCnK3mi4EB0z+8X4qw1e9t55gFRF
 5dmLYfG6HtnyEkksB7X9ts0V+aJ+d+sXVltolPPSmD2G07ZYvEPatPd9V7GEA6NcZWHg
 c8bg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVH2CzxH/i9wvFgtCWTAwzZNVg1kzB20aTDnSUTJlIT2Kl7zK6CEvtF4OB7on20+PfYBM3waaaeV0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwR4ItdT7M9CQj9t7BDllEZ6O65SkFjHnnWNumJoRjePRbFwAds
 3kCRjVVlJQ5jm1qQ/G50IPhSpfeiwo2f5ToI+/ZL/GjeW6KlSmDY3q8Ra4sYm7DJquTLSvd7PEK
 vlbwkmhO1R4nWe2Oj7SyWdUkLWnIHuWz2ENV2/rbG/o3UAUBPYFgS76J2WdopZxBtGEXcXaM=
X-Gm-Gg: ASbGncvff9MDfSmgwFwCY9aj4eNJsTKJn4jFo2FCshzO5ODlfLzShxBwK5EfAcO+0Zs
 ZJ0qWO1DAf/ip4g03JRt7E5Hv/V3Nhq8cGIHTVyuWwVaNCj9S0E2evzqgz1+MsjdLnBK1qIc5PZ
 6wwP+9HVTg2t9NfzaoAoqAKj1/118PLr3UlSEu7OCLUaiwhm8L2AWyYiH8nbrKF0p3p+bA7oWCn
 4NQQljXjDhJNuGZ6lFjUpSxLvoqEqSTtrfRSaPeVKoN7kzdtPZTeY5/RNOm3hsI/q5avTdbbsqJ
 FGpqx2baGDwGQXYzaKjhQMCJ9iKjFSO4cuZ9CyuYUDqAANqgOCoUdqn0q2dk537FZfzD1R3gEhd
 9rGeuP+S3FNDhT6n+4hbqF97TxXq+49Tjc0REdtCLyoEin6ka6Clz
X-Received: by 2002:a05:620a:318f:b0:7da:e6e:dac1 with SMTP id
 af79cd13be357-7dded000eb0mr1982780785a.58.1752532091234; 
 Mon, 14 Jul 2025 15:28:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEBbqen6Ycp/DBPIss3IXszYn/5lvf6AcTyj9CEOFH1Zo5pXcdZ/lkHLybnpi1M0aIYwXscAQ==
X-Received: by 2002:a05:620a:318f:b0:7da:e6e:dac1 with SMTP id
 af79cd13be357-7dded000eb0mr1982776885a.58.1752532090674; 
 Mon, 14 Jul 2025 15:28:10 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55943b72f68sm2093423e87.203.2025.07.14.15.28.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jul 2025 15:28:09 -0700 (PDT)
Date: Tue, 15 Jul 2025 01:28:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Yongxing Mou <quic_yongmou@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH 04/19] drm/msm/dp: replace ST_DISPLAY_OFF with power_on
 in msm_dp_hpd_unplug_handle()
Message-ID: <ux7tbizguenr33odq2utqdrdanih2ez6gvm2dcss37uuo6pi7y@qnh4rwrgqept>
References: <20250711-hpd-refactor-v1-0-33cbac823f34@oss.qualcomm.com>
 <20250711-hpd-refactor-v1-4-33cbac823f34@oss.qualcomm.com>
 <rmlgjr3fzb7dmnwmthf5bj67wb6fkcksmn3ouchzsvhhgxiv7h@vwcieejcufr7>
 <6883f346-452a-44b1-b670-3bd514f57b08@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6883f346-452a-44b1-b670-3bd514f57b08@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: UczY_xC9GUBBD0LWUguYIyZgQ1xk2_y-
X-Authority-Analysis: v=2.4 cv=D4xHKuRj c=1 sm=1 tr=0 ts=6875847c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=e5mUnYsNAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=V1oTyKxzMZC_ZlTkUykA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: UczY_xC9GUBBD0LWUguYIyZgQ1xk2_y-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDE1NiBTYWx0ZWRfX5QI9Nv4pITnY
 w1GxOhb94kfJHE/+v7Tj8V/tCLfGZz4p6BQD8/nC3e15aThduXHPkkTswel1R50brpNEiDoOG+2
 jDgTZjeIZa3QTn/FROS3nUjkpd0KvU79PBmymfVtsMyb+Wvan25XTuMU0OmiK8vZOTttppCHnLc
 HuQ9y3gSIm8rx0ksxqHJ3S+Qu6wjLjKZhM57ai0vqj40ASCEYy5pB2VjjCHG4ny66RgafiiQK6m
 OnNgrshGDE35Cw4gmXjvMVYLzktfz0jlIbs2dWmyWkTlSw3MQAjmQ/7c91Nn+w7xlY5psxPRjP2
 y7ehp6sfiTRiGVzbpl62AmJTdtadO0u31+rA93FK/oSino3kgfOB9VSwrprYqTpXnk1Q7RaqSM6
 DamL1XmzXjuFy1vT/yTjD5W+dEva8FtU3PCIO3gIy1tFw0ui7nOvdR9xzGYgoPbu3E39MzHI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_02,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=713 impostorscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507140156
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

On Mon, Jul 14, 2025 at 01:38:55PM -0700, Jessica Zhang wrote:
> 
> 
> On 7/14/2025 5:27 AM, Dmitry Baryshkov wrote:
> > On Fri, Jul 11, 2025 at 05:58:09PM -0700, Jessica Zhang wrote:
> > > From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > 
> > > msm_dp_hpd_unplug_handle() checks if the display was already disabled and
> > > if so does not transition to ST_DISCONNECT_PENDING state and goes directly
> > > to ST_DISCONNECTED. The same result can be achieved with the !power_on
> > > check.
> > > 
> > > Replace ST_DISPLAY_OFF with !power_on to achieve the same outcome.
> > > 
> > > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> > > ---
> > > Note: Taken from https://patchwork.freedesktop.org/series/142010/
> > > ---
> > >   drivers/gpu/drm/msm/dp/dp_display.c | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > Please squash all state-related patches into a single one. It would make
> > it easier to review and more logical.
> 
> Hi Dmitry,
> 
> Ack -- I'd wanted to keep all the patches small, but I can squash patches
> 4-16 into 1 patch if that makes it easier for you.

I think it's easier this way: we get rid of the HPD state machine and
use flags all over the place.

-- 
With best wishes
Dmitry
