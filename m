Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB94EB249FD
	for <lists+freedreno@lfdr.de>; Wed, 13 Aug 2025 14:59:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B207910E70C;
	Wed, 13 Aug 2025 12:59:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Icnrw6NI";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BABE10E70C
 for <freedreno@lists.freedesktop.org>; Wed, 13 Aug 2025 12:59:38 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DBLckM027001
 for <freedreno@lists.freedesktop.org>; Wed, 13 Aug 2025 12:59:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=89undOGSCm/t00epashw1SYp
 cyoRiHj2yOfvXPYa4Gc=; b=Icnrw6NI3VZBRsPQEIn3O/rHU03NXKW8iaSfsR+W
 xjm7lwQianwOHArGJIew0ymKsdw9+Zge40Fb4e8ZLrR8Q9RagIh4Od+Dv4Ft/Q/9
 Jfl9uTN3Wzx4Py6BSiOWqUv3FofupRi3rpIQLOJNalPZjAecOXpH4nw3nVm3Au60
 zsnrA1agm0TRClxCLwdBJKvoJ6cI3pDHm4FUbpX2XDSdz9+3Y8PObwl3JIxWkcjw
 du/Ctlu/TQiWN5yPHz1m6Jl2VY3caVdz28/kPIlJe1+RPcLNLRD9KWYBdvukpll7
 2UbWeqFFAY3a5zp7XdjzCDbIRSumaBVsYnix3ODCBnfB0g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ffhjqn4c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 13 Aug 2025 12:59:38 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4b076528c4aso73288861cf.0
 for <freedreno@lists.freedesktop.org>; Wed, 13 Aug 2025 05:59:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755089977; x=1755694777;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=89undOGSCm/t00epashw1SYpcyoRiHj2yOfvXPYa4Gc=;
 b=Trs6+g1tHfzz2igKgEtKldtYeFr4/ZC/PyEefxliV5R2f4xf5xna2nlb/FYKq4PZbq
 GWDa3TinBA4hdIiEJ5A8QV6MwV76ksDvxVt7NNT+8LSDdTWtmTahOiF0A/6onBaP/fOg
 nmFxUIz72UO5ki0mYYcRhi8klYm5Hb6cni3HUK7FZvoXJz2A0brm6q3/3Nf5OW8qlZQ4
 UHTDBMDdZGSRMAQhtK4Iv/y8Xj+I1D9aacKuJ5KTsJ22/MouV0sVeGH68+yew+06eSe5
 i+r2cO24Jn7Dn9BxjGm03hWiwoxFqlQuvf7MCuT/reTR/UYpHU9YAxFxoIZ5bbuhCliu
 Bycg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4cD5Gs/2VglFC+3plGe8/ndTUevV1B92NfGAp/Jg1twaRbA7bzlsmANGc0ZGxVAvOAzgifNreHW8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzI/be9pQmjjlxhrtbR2vC9Dbv3Dvafo+Tl2011DTuj2sn2dHPB
 No9vbR18cPA4R/S22/Io1QHTD40gOxvUVGsF+1eDqbF/e2500pnV0w1ZUycMup9RAJo5bTNn6aL
 jXS5sak9VCOfuHO1daGgKPCQ4ykc3RnPRLlm9rtabk9trhUUsTKsudeT5/nj1tXSPhychr1A=
X-Gm-Gg: ASbGncvsfTVseSwLou/aDNh+EmhS8X8zS4/9wF8T38HYio1lt2OJZKN9u9pk5qDZOEB
 65tM5RhLncFaZ/oXKHiRRe92MmfaodJQYDKA9t4WhAbF8MCLvgoUIjTnrLrkqTI1645S3a9Skfz
 S3NnRoY+G19p5mV47bhsHsiW2CWTw+Ch/D9/tl4ZMwRmWmkrIV2/cyUPeBSqdymvc9n3jFBMG7c
 0f3X1h4CHTrFoTWSs2bLD+i0+lBm+/5ng91Bk2zBSEj/rmeqMvFcp7/mWgK/MWGbOAQqnn9oot2
 pNQrg5UAW9lwHxVcJB6Z44M9RQ8bLmtNDJGuZBdlEj7JvQ0AsY/FOf19piwh6a7tScyPsAnWD5v
 FDzta/OeySh9HI0KXaye3C1Qf+3LSXNMy7D9e2bK/tmm7vOjrO2h8
X-Received: by 2002:a05:622a:590b:b0:4ab:5277:a5ab with SMTP id
 d75a77b69052e-4b0fc6f1fc4mr43132811cf.6.1755089977144; 
 Wed, 13 Aug 2025 05:59:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGYZUZcRFNXr1nwU79ordj5X3vkd99gbFsAKVm6AbEVLEEMy/o0VEZaEaiD7x9HvcpYcqpeHA==
X-Received: by 2002:a05:622a:590b:b0:4ab:5277:a5ab with SMTP id
 d75a77b69052e-4b0fc6f1fc4mr43132151cf.6.1755089976524; 
 Wed, 13 Aug 2025 05:59:36 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-332388fef31sm49861901fa.70.2025.08.13.05.59.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Aug 2025 05:59:35 -0700 (PDT)
Date: Wed, 13 Aug 2025 15:59:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v2 03/38] drm/msm/dp: break up dp_display_enable into two
 parts
Message-ID: <ftlaxwogzz72rg4plguaet4wi64pmdfmd62qve4xffamxq4fsu@ytd4edwv6ixm>
References: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
 <20250609-msm-dp-mst-v2-3-a54d8902a23d@quicinc.com>
 <gwib6zcvkxsxcz222cno5jbvsnt2abdoqfnymlxq7e6c6wdfvn@nlplodnco2sw>
 <48c61bce-21e6-488a-b976-da53004b6226@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <48c61bce-21e6-488a-b976-da53004b6226@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA3NCBTYWx0ZWRfX4rmWwXNd2XMk
 62kMuuzxPKmpDpuMfIldTDRXbxLWmCfgSDswc947D/zsAYHU51iPvL49aNCBoprNLCnXwOwpJnA
 kCgMx1s/L4STs70/lUmlSlNSaCM/DH/eP5P9f44ax1zF34AWlwwFhlvbgrXBn8lot6F5sl1fj1m
 6+hbzvWvitgORZoNa5LNf58rWpnQjp1EjIBqDmZe0ulmlfm2PdRgFTT3gg4AFhCLyjIUHTWe+7A
 TCSg2j/r4U4vQ8gWjpxobs4ZoyuoQpA/m9nS/DtG69g9N4KwqJxjYvgxlzi3YzOk8bHXF7XUdQN
 mvtdIVy9npVP3zfThNBxTWb0042p1LJI5iFIfoeSSXUIqdaFEpbkLl9VAvqzknXzPtCr89JzKwZ
 LX0atBHJ
X-Proofpoint-GUID: v-tQcZQRGS6PrkOpx4EdFZBBBbj0sh-0
X-Authority-Analysis: v=2.4 cv=TJFFS0la c=1 sm=1 tr=0 ts=689c8c3a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=bAkpl6uDeKY4ZaPGbNUA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: v-tQcZQRGS6PrkOpx4EdFZBBBbj0sh-0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_01,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508110074
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

On Wed, Aug 13, 2025 at 05:36:10PM +0800, Yongxing Mou wrote:
> 
> 
> On 2025/6/9 20:59, Dmitry Baryshkov wrote:
> > On Mon, Jun 09, 2025 at 08:21:22PM +0800, Yongxing Mou wrote:
> > > From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > 
> > > dp_display_enable() currently re-trains the link if needed
> > > and then enables the pixel clock, programs the controller to
> > > start sending the pixel stream. Splite these two parts into
> > > prepare/enable APIs, to support MST bridges_enable inserte
> > 
> > typos
> > 
> > > the MST payloads funcs between enable stream_clks and programe
> > > register.
> > > 
> > > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> > > ---
> > >   drivers/gpu/drm/msm/dp/dp_ctrl.c    | 57 +++++++++++++--------
> > >   drivers/gpu/drm/msm/dp/dp_ctrl.h    |  3 +-
> > >   drivers/gpu/drm/msm/dp/dp_display.c | 99 +++++++++++++++++++++++++++----------
> > >   drivers/gpu/drm/msm/dp/dp_display.h |  1 +
> > >   4 files changed, 111 insertions(+), 49 deletions(-)
> > > 

> > > @@ -831,7 +831,37 @@ static int msm_dp_display_set_mode(struct msm_dp *msm_dp_display,
> > >   	return 0;
> > >   }
> > > -static int msm_dp_display_enable(struct msm_dp_display_private *dp, bool force_link_train)
> > > +static int msm_dp_display_prepare(struct msm_dp_display_private *dp)
> > > +{
> > > +	int rc = 0;
> > > +	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
> > > +	bool force_link_train = false;
> > > +
> > > +	drm_dbg_dp(dp->drm_dev, "sink_count=%d\n", dp->link->sink_count);
> > > +	if (msm_dp_display->prepared) {
> > > +		drm_dbg_dp(dp->drm_dev, "Link already setup, return\n");
> > > +		return 0;
> > > +	}
> > 
> > How can it be prepared here? It is called at the beginning of the
> > .atomic_enable() only, so there is no way this can be true.
> > 
> Emm, sorry for forget this case.. Whern MST enabled,
> msm_dp_display_prepare() will be called from mst_bridge_atomic_pre_enable,
> that means, when second stream called this func, it already prepared, so we
> should skip here. so this condition will really hit in MST case..

Then it should be refcounted. And, ideally, this should come later as a
part of one of MST-enablement patches, when it actually makes sense

> > > +
> > > +	rc = pm_runtime_resume_and_get(&msm_dp_display->pdev->dev);
> > > +	if (rc) {
> > > +		DRM_ERROR("failed to pm_runtime_resume\n");
> > > +		return rc;
> > > +	}
> > > +
> > > +	if (dp->hpd_state == ST_CONNECTED && !msm_dp_display->power_on) {
> > > +		msm_dp_display_host_phy_init(dp);
> > > +		force_link_train = true;
> > > +	}
> > > +

-- 
With best wishes
Dmitry
