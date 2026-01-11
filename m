Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6792AD0FB02
	for <lists+freedreno@lfdr.de>; Sun, 11 Jan 2026 20:48:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 087A410E03A;
	Sun, 11 Jan 2026 19:48:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="QXaglRlx";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PIMdQHkU";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CC7810E058
 for <freedreno@lists.freedesktop.org>; Sun, 11 Jan 2026 19:48:28 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60BIneLX3126652
 for <freedreno@lists.freedesktop.org>; Sun, 11 Jan 2026 19:48:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 8JXECXhL/Gf4VA0I4yuJTgib+HbbOUVNVA5HBiQtRbE=; b=QXaglRlxp/jBx2Ns
 zN9paAS9wTb3nrVQX8Pq//IZapelQkrmaJGcFGRphXHhFLbOjO+OV+7E4GdXXl2F
 NpoJlZCa22wy7sKuYs3kKu1M0c+ti/05zUxOe7r9dkSCOvwm9nU29cVrJv7oZ+ZW
 B/J340Si9sxq7XD0nXg01MJJSNHn5BJcY1YLAepd/AuLwTi0P03SO8CmR5s+lkSy
 j2bHqXDaAIiukGgVp70fS7uTDakndv7apElH1OdEAN8OKGNBXLtKyrCLgBwFgqiQ
 ezuSpkaeCHHBpRtjdEfVcPJ6DYo8KgQ3XFqeLUTW34TRDnQ+ogRnDRTmK1zG3ayi
 Cf0E7Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkjvxtbpv-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 11 Jan 2026 19:48:27 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8ba026720eeso93044485a.1
 for <freedreno@lists.freedesktop.org>; Sun, 11 Jan 2026 11:48:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768160907; x=1768765707;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=8JXECXhL/Gf4VA0I4yuJTgib+HbbOUVNVA5HBiQtRbE=;
 b=PIMdQHkUcahMjR4pLQdDH+8H1SoL2lz6FXbgrjYQ/fuFkc4gX0JrWtjQdZUj+fF6hn
 inT5R6rdSEGHUAdff5tLfznMDYp4jYXNGGUafWGLMjqReaDHRHhcOQNsndvMT+yhrjVI
 m+6vxgibt0aZkJgeVja8MFLNLsrehvFlVwVtNlR3Q6UTSTzSLgG4sdFOIEfodqspKhoC
 DL8mmHoYFwTa2vi375ETgE0aFPr22ZWs10aF9spGDQ/VPR/hoYxN21PjnPRZILcangGN
 +8lsm4DvR6WR2Rj7BTlhG3tnaHOVLchKt6lAdBrrNGQYY12yyEBPheMBcu8rVJN3WGRW
 FJEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768160907; x=1768765707;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8JXECXhL/Gf4VA0I4yuJTgib+HbbOUVNVA5HBiQtRbE=;
 b=OBegP4Vr/6JPCRKRG129I2DoWDo7xi+3PmjHq9L/OIN8m7gRdZXE1vBDqZ1/PmaSbH
 NnHfsaKkvKVfWCSg+8pBXUif+fAjfGI+B/5PxoHjWV5u+4mssUN3MJ7C+r3PCIIpI7QC
 Wq8bXcRbgaRV+sBfvR5TOn7ZZA00lOxA5A8GKg3tk3tv8MapxWMzrW2SNpk8ZW5iXxp7
 Aiz5R13cfgHjI26Kw1YKEmpW7BUPoAXtcfgxtm9SLTIPswI5AQgp1FsstNXYcU+vuTe7
 Kyz9rlhtvu0ZQGRDnpZHHjR5nZzFGwcnlo2bW3AoTmnXsmm8KXZx/iQDibo4uW5tZ3IW
 dp0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVfXWU7nRD5LDm48aSaGVxLJ2o/8cLrYfhnrxpPP/V37VLH2CUUEnf7P9exey1iEwM9fW3usI0itkQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywbr2TTM9sK6pBSGfnjpIWUu8xDVFPkPzgZK+So9gW1seXzfj2i
 MhHy3ctS8kogI2o4c0/EbUwKuwHL//CZw+B+i4ayLIZeQQkxDhXDRDAU3e3fk1RJ3a/2vEyH5YB
 wcgTG10JG4dAK6lIwIs/C9jTU56WQJ3y8z1eGo9jRhqdkmpqG3VR93cx2equBo5CctvqhMRA=
X-Gm-Gg: AY/fxX4oUjx6LaAJvQTLFd31d1PoBy6fvZUvTFtzANyUVP0Kk4C3HeLw4Gftk5htHKQ
 K+Xf4V9mANwmZ39E/ojTBy8WtNe6yZC35vvh4cPv2UoGIPtTH3BcXAQktOANVi4Ks7LxUu+76X3
 ILhF4okV+YdAPjoH57IEImbRj0W5r0iJ5QLT8IqUPWONhTzIe9WRTbfbeEtpJAOv44A9fxo5JnU
 +bdTTro4Q8jgKAxCzcSky63UHN6GBbl+1PeRzMP10T59WfR8PHnYRfWaQEuUNbNLnNL7RehIq1h
 mQ5yEbv8e7NPTc5+QECs5Qre5UUZIYQjykUu8gVzWoonjCozjqMXZ3r1L9q3BcuDEn6RVeewQjk
 fj1VuVyOgWk5yTyb0szz8CFYHrnW59OTF/HxOPI/M0HXpxDUvekUOuuIcnteOe8BYq08Rns+3da
 BL/pzrnilafYTVqYsD2b/+V0o=
X-Received: by 2002:a05:620a:461f:b0:8b3:c8ee:7240 with SMTP id
 af79cd13be357-8c3893690efmr2381776585a.5.1768160906846; 
 Sun, 11 Jan 2026 11:48:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF84LD8KsARu0mNzELBrZRjajRCkUd2bM77Q15DgPYpZ5PTeYY5nvdYL83BdzThlXISIigEiA==
X-Received: by 2002:a05:620a:461f:b0:8b3:c8ee:7240 with SMTP id
 af79cd13be357-8c3893690efmr2381774885a.5.1768160906339; 
 Sun, 11 Jan 2026 11:48:26 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59b7a0ca367sm2531114e87.38.2026.01.11.11.48.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Jan 2026 11:48:25 -0800 (PST)
Date: Sun, 11 Jan 2026 21:48:23 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <rob.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] drm/msm: Fix GMEM_BASE for gen8
Message-ID: <oukfjvwbzi2z4xu43k3wapbu6fuzromxfxkxbyaj3spmvf6osf@bjmt42ui2peq>
References: <20260109153730.130462-1-robin.clark@oss.qualcomm.com>
 <20260109153730.130462-3-robin.clark@oss.qualcomm.com>
 <iwmyig2v6lk47gnbimut2qkmp3swscqjxpj2h472q2tqtes5sj@hwlajed33h2t>
 <CACSVV0242GE5adkic6QASUzAsO5eW8Yddf52feRn3k5pktd2FA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACSVV0242GE5adkic6QASUzAsO5eW8Yddf52feRn3k5pktd2FA@mail.gmail.com>
X-Authority-Analysis: v=2.4 cv=Wrsm8Nfv c=1 sm=1 tr=0 ts=6963fe8b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=5nr-ZfxueVFsKMbAJ4gA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: vLycy6FyM0AbH-deZP6QEiNmsPhbpgS1
X-Proofpoint-ORIG-GUID: vLycy6FyM0AbH-deZP6QEiNmsPhbpgS1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTExMDE4MiBTYWx0ZWRfXzIl/Rbo3TurG
 zMC8UiM/EAHG0qStFiw6o44ZEeUaxdkpj5huxuyPPfmX9JdNgLJ3ngQu6kyxwagkefDXpeNxVcL
 t9CX/YrLWRwAPaEjOHfkYfdBXqQeu/c4gbtQOde1TwO5+ojUOg181oP6VjwVYlvakmBz5nUZq50
 JUlPrTrVCfRbn7HXbu7O6hIB8Hlbr+7nqCVD9uR1JTfOxf1zk8mmPrrdZ9Nq81eTqYJspvEwzWq
 hXQMn8ZdUd/2iMvG27UIZPVxb3Jt7U8gHZC/NPr0EiIQsc9M+WleechRd1h+Ft4i+q5uDxUFi6y
 C7l+wHQmVl3F9Q0x4Bz5WJbQj2vUCe2qZJ8qcHCmQ0+gg0S8AOT1s5SmQ3FNM8/4UYoYfVqxU/x
 TKpX3lA4y89ThQOYLEDsk0Iiu3neiAI0cUnwSBUt33iDgjY8UW6MmMDjWSEZByED3KgTs08Qpoe
 1ogtYumFpa0zeIEB+uA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-11_07,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601110182
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

On Sat, Jan 10, 2026 at 06:23:59PM -0800, Rob Clark wrote:
> On Sat, Jan 10, 2026 at 6:17 PM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On Fri, Jan 09, 2026 at 07:37:29AM -0800, Rob Clark wrote:
> > > This should also be zero for gen8.
> > >
> > > Fixes: 288a93200892 ("drm/msm/adreno: Introduce A8x GPU Support")
> > > Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> > > ---
> > >  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 3 +--
> > >  1 file changed, 1 insertion(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > > index 1c80909e63ca..d5fe6f6f0dec 100644
> > > --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > > +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > > @@ -376,8 +376,7 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
> > >               *value = adreno_gpu->info->gmem;
> > >               return 0;
> > >       case MSM_PARAM_GMEM_BASE:
> > > -             if (adreno_is_a650_family(adreno_gpu) ||
> > > -                 adreno_is_a740_family(adreno_gpu))
> > > +             if (adreno_gpu->info->family >= ADRENO_6XX_GEN4)
> >
> > What about a7xx gen1? should it also be 0?
> 
> *probably*.. I'm guessing this was incorrect before

I'd at least mention it in the commit message.

> 
> BR,
> -R
> 
> >
> > >                       *value = 0;
> > >               else
> > >                       *value = 0x100000;
> > > --
> > > 2.52.0
> > >
> >
> > --
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry
