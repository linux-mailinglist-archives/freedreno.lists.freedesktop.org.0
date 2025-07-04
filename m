Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC26AF9A37
	for <lists+freedreno@lfdr.de>; Fri,  4 Jul 2025 19:58:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAAB310EA49;
	Fri,  4 Jul 2025 17:58:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="SkktpzdW";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1324410EA59
 for <freedreno@lists.freedesktop.org>; Fri,  4 Jul 2025 17:58:13 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 564DGeiq024738
 for <freedreno@lists.freedesktop.org>; Fri, 4 Jul 2025 17:58:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=U1F4fPAEqvP62EdjTi0IWSox
 l7RsMJ0HC0KZyKC5XOg=; b=SkktpzdW58ERgizP6ibeQh2xFgVNN+gVoR/z5zbG
 T0iP1N9Sr9Dzdt92V6BKDI1TqwXXBpoKGLIxgnresQrzyyxqIyxnXonCuGIx9Jec
 UPn0UZ8Qgf3vlhSUkvaVjYwt5spK2HsRW9+oru0KHgektVXbxHEFro9yJMAL0KRQ
 ixh8lWzuywlB/TVb/pBihvB2WEbtH680U278abcnUb8Y2QUjrmFE812Rhj1WoiQT
 JQHaxiCdtQfRo505QBjaH/1zh53bciDM0C42CYSX2G+BPDl/wrVnhi8dkxvyuqgR
 ory9yToRZ7YbVJMs/LV+HAY/I70YQcrzuNSYode+mnIoyQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8s9vngk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 04 Jul 2025 17:58:11 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c5e2872e57so174467185a.0
 for <freedreno@lists.freedesktop.org>; Fri, 04 Jul 2025 10:58:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751651891; x=1752256691;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U1F4fPAEqvP62EdjTi0IWSoxl7RsMJ0HC0KZyKC5XOg=;
 b=txuLrop/wusfS1JIbaPzPO+wCu0pzKjJgXAIlnkUP4S9QqjRkWJlFxXLd2lN4UTdcB
 ROpgrj24vNTuZCmLF+mZJtyXjCtJTpjHLsQwpAdQkTtoypaaOa9abP4b5BZIMeGPzMUz
 xAYYBQv6UpDbBYSlFDdk0c+o3DJZ5lSQgeaSJJFrL/cfwlSUDMa3VniM44eVzk7/DaIT
 yC+jixPkZVjxx5MXr4Yk6oj4GRQ9lhXuoW0++y6qAAcfKhC21KeEmHh2NXm4T80vX5z9
 gHzGa9Scr6KVki0MvUKjZ6ocyH13gZwTvmvYlLMVnnQKqmv8BlsGgeHQCFwasjzzCmWW
 FsdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXGY1BHrEiLsaCuFmJSknEVtGnZmtCjgo7/uy4vVhxfrqFUkrdF87QBQ2a4/LmUQZJ0ugPx5mejgMw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyMzcKSZz+XGmIYHofIXH+QNwQ73myaSNhwGaqsKce694ifIbnU
 HlM8ACMEL0QodgQ6GRuv/qfW/MeaO5AGS1WQRaNBGy1bp8Y834JJRLcrvFfFUPqDWFxyrw4Qp/j
 Y5CSWF6PXtI7JD5T2kIj031/9tJwWgFNffJ+b5pcAWQOoASVRqiKkTXyTM1liQAaMdyC74RQ=
X-Gm-Gg: ASbGnctCCAX2Oqt3PO57zXy8o7/53q+aEZ0XNsokMJ9pJe5V5BpMwOzc2EyyKGhBbJC
 1w26ccwadjvX+W4EUxiDBEoFO9A95X1D4Q6XIWSc/X/LzkmUIUsh/VFpbSTzyREfuiWJaEF4EmG
 L0fhIkPHALPHvrbw3f1wbpo43X8Aa3u4s5ncyAO+RYEH81vKAv88+bzxdYHlJI05ObaS93xAY12
 O3ZZVS1ZREryi16ykVOd3f7olSpiyZo+/vGs6WtZ1MnyynPBmKQhIrIK4gffOMvRb/ZxdoRAyHh
 sevPCdsZDI4nq/yyJKFok2+Cv6Vm4ciQ7fwSqzzn5fHVqaG0ifOOlzahFpwd114bbONU5vyyH/V
 QSX6Aib7zGBQijqhviW/fLu93GIJ32E2ZV54=
X-Received: by 2002:a05:620a:4629:b0:7d3:907f:7544 with SMTP id
 af79cd13be357-7d5df152bdfmr319545785a.35.1751651890967; 
 Fri, 04 Jul 2025 10:58:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGBxi3EOJEoPm5oFMT0+ivzet/BlEeCSvPIneOHAOarymVXusFmqrpwwE6fb7KX41R6g3zjQQ==
X-Received: by 2002:a05:620a:4629:b0:7d3:907f:7544 with SMTP id
 af79cd13be357-7d5df152bdfmr319541785a.35.1751651890486; 
 Fri, 04 Jul 2025 10:58:10 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-556383d8d6csm318439e87.79.2025.07.04.10.58.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jul 2025 10:58:09 -0700 (PDT)
Date: Fri, 4 Jul 2025 20:58:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Helen Koike <helen.fornazier@gmail.com>,
 Vignesh Raman <vignesh.raman@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/ci: Uprev igt
Message-ID: <wzivs2n2inkvtyy5wvyur5bpi6iexxmrsc2fyzm2vwm4o4opzu@lt7tm4q4g2iq>
References: <20250704174433.693630-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704174433.693630-1-robin.clark@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=H/Pbw/Yi c=1 sm=1 tr=0 ts=68681633 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=M1e0B-rp6HQtO0eZjbwA:9
 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: HVM2evGrjGGwoVweB_3aSAgLqHlYcKI8
X-Proofpoint-GUID: HVM2evGrjGGwoVweB_3aSAgLqHlYcKI8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDEzNiBTYWx0ZWRfXxcEBHidQf46y
 irq5jlC20HhIHakk+iET3VVQgA74ZTfZ+1cVaAfrs+XTIU04Cn7szjE3qXliiTG+Dq50SecwFIB
 DWHAKLIAVlWIdMIiUH4cxE6FalWAnn1BJjU6sfOOLSWcbFTwp4dw+DfqAWNZfgwXokKOQJo2i9W
 VT0ykcAwHOjqj+1k19XsZe6sTLvET5xKKanlUtz5lMVJYRXjY1F2/ZB9jub+twShpuB1aSkyJNC
 YlKMJoWig//oSPrw1p4Z0lBlahVka756WbhwFRrU1jXdzKt3FthAIz2pUL5WyprtWO2Z5HPjxyr
 UFYA3vqQr06bo8sdn03aI2wqrtqbijuHtg+AJiNjI1TVRYHuMtws2WGfnseYZdPv1ol/1qFmyYS
 RNtBE6t6eEv0RGS6BYTOoFLZP4rgyxl72ze41nh3BgTk8DYQV+mK9TZ1qMymL4wFi7xi6OHY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_06,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 mlxlogscore=918
 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507040136
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

On Fri, Jul 04, 2025 at 10:44:32AM -0700, Rob Clark wrote:
> Pull in igt updates that are a dependency for VM_BIND, and will reduce
> msm_mapping flakes.
> 
> Skip msm_mapping@memptrs on sc7180 (the test should be checking for
> preemption support, and skipping if it is not supported).
> 
> Closes: https://gitlab.freedesktop.org/drm/msm/-/issues/77
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/ci/gitlab-ci.yml                             | 2 +-
>  .../drm/ci/xfails/msm-sc7180-trogdor-kingoftown-skips.txt    | 5 +++++
>  .../ci/xfails/msm-sc7180-trogdor-lazor-limozeen-skips.txt    | 5 +++++
>  3 files changed, 11 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
