Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 052F8BBDB6C
	for <lists+freedreno@lfdr.de>; Mon, 06 Oct 2025 12:39:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3F8E10E3F0;
	Mon,  6 Oct 2025 10:39:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="D5EX7/DR";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 459D810E3EF
 for <freedreno@lists.freedesktop.org>; Mon,  6 Oct 2025 10:39:27 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5962h2lP017143
 for <freedreno@lists.freedesktop.org>; Mon, 6 Oct 2025 10:39:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=tL32lBVtdQG6FBp70cR/0+e7
 GT0m4lIzY/Mtg+rXvr0=; b=D5EX7/DRqdw74gyFVv30BXiPneQ15mlAaTP2HjDm
 feAYYiqjOPAYmPpAFYI5+3TWaOlTeMPhwYA0dj6EdoZV9f2GSyaxbzWK4EmYA3g2
 iOhN77zsnxwkAFw4T7zhfurMFEjQxipDWD3kDm84j430i8cqscibhxKsjwYdF53a
 BSvTXYSzYCJpKyXqjgTJLA+XLoQdqNMqLFXndcNI+PPNmBKiCU6J96pljJXCn4G+
 HmL09PXq9CEso3ZCoEmguWSMBFrljKWQ9nx/5CdtGN4EUpDTXD8xVdaxkwJx6LDe
 cQUdNEsES8NdcM7pwhF6YXJNAmEGlWNFh76gTPLND9kLlA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49k6bfjr2j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 06 Oct 2025 10:39:26 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-86835654255so1666226885a.3
 for <freedreno@lists.freedesktop.org>; Mon, 06 Oct 2025 03:39:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759747165; x=1760351965;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tL32lBVtdQG6FBp70cR/0+e7GT0m4lIzY/Mtg+rXvr0=;
 b=rdBXrYcBbIgKn94LVYdk8BiajXjzL/DUdHJtr+eSvBfy+qom/+VUiLpfMolKs4L2hh
 SGtqMvzobqho3z26ik9qilB0CD/MRJgABlvFbryaPB/wwtIPu0gkwvaLghGG1OT96DTN
 fbIKof6deh4ZLAJWkyraonYDEXDt8dfyAp7sk2fvf7xpI9qX05o6GwxjqAuc/Drsgea5
 i5XqHKKEP2W56TlGfrKAOk58lWMUtG5QS2mnbYzdZZE9sQHs0QEP4Y/qXeVS7v/NT/hg
 wSBwePj1ZaLwLyEsJxIzwkZuKSLtXFsmwsM13hyc+gt8WVW4KMfYrwiV/5u77/g3doEx
 2SqQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWihUUkm7FqWfjrJLp/yC8LiGFsISeod48GePE38qPe7I9eqUw1P1bMKcb38sc6yRL672YccZHnmcs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyvOwC+V9YegI6ZiOvSu2jl+sy1Z4/KfcQEtY+dvu1CEecjHFyX
 +gTqr7TfrG/LsR0Kg+UR5Pl+wNB7KskB1wVp8THAv43BUuZr+DLPyrTeg/1DYLVVNjqPDGF43gV
 n6mlfo9hZ1UuxvHtb2JxmSZsleKSlBUQPwqECa5i7Fdr1eU8K09QUblp+FOWkP4L02L0dzhk=
X-Gm-Gg: ASbGncsrR+90nTLtg2HOolZVapVAPpARv+MxawKZXpdbLNHpN9pWQX2feCQkUZXlwXh
 RKFminkBTTkACJiJ3bquI+2riRHOppNdrpkNW3y/LFr7tNW/WVbFkgP7Ba47yUKsSLOOqdOEDKf
 BElmQcc6FOtmGaKR1pqdtja9g29BQOaOjWy9FRbOcwz0pgGqDuxQ+7XXZR7+KF9z4Ag2Jzn0i2D
 OmUtHno0f4e3dOzsfegS1rZMpcf0LM7haTix2Jkj6F6Qhun3H1KFdXnsZQfwxOj/69nzEmpVvyz
 ZlpKg5JqdZaD3hGRu8Beypw0/cEgp8S+7RyyLu/pk0d556C80qjkVBcGIIrn9PD3YNm0Kq4TSCl
 6BeaJnJOiGPfIYgG5GBv4Jurza0D2KU9c5c6eg8dATRMCgZF7MHn1Oelybw==
X-Received: by 2002:a05:620a:f05:b0:847:cb75:95e4 with SMTP id
 af79cd13be357-87a38a3a9a9mr1257909885a.78.1759747164952; 
 Mon, 06 Oct 2025 03:39:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFzjLLv0vLtf2KwPjN7Isng+2S6+xF8KquObPMQpThzVTOWmfSKiJh31vn8lJ3hYibY9HOs5w==
X-Received: by 2002:a05:620a:f05:b0:847:cb75:95e4 with SMTP id
 af79cd13be357-87a38a3a9a9mr1257906985a.78.1759747164471; 
 Mon, 06 Oct 2025 03:39:24 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-373ba444ae4sm43603661fa.36.2025.10.06.03.39.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Oct 2025 03:39:23 -0700 (PDT)
Date: Mon, 6 Oct 2025 13:39:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Junjie Cao <caojunjie650@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Jonathan Marek <jonathan@marek.ca>, Eugene Lepshy <fekz115@gmail.com>,
 Jun Nie <jun.nie@linaro.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH 3/3] drm/panel: Add Novatek NT36532 panel driver
Message-ID: <2do3dk7gqvbloocsv46t3zrc4ghvhrpiqre6djk6heese3wz75@dlqwkdsnrkbr>
References: <20251001135914.13754-1-caojunjie650@gmail.com>
 <20251001135914.13754-4-caojunjie650@gmail.com>
 <lfdhib6a7ct36nmj3of2setjft7ydrf6sfgtx7qued7qd56nhc@2xol3grm5re7>
 <e36572bf-4fb4-425e-8d10-c5efa5af97f3@oss.qualcomm.com>
 <rxm67cbwkp2qyxdlgqb3fz7fhiskmnhidhjvl4mhqn67iq2x4n@wfueruiiq7kp>
 <53aafa84-6d6a-4963-827e-c1600270662f@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <53aafa84-6d6a-4963-827e-c1600270662f@oss.qualcomm.com>
X-Proofpoint-GUID: iDRYtEncdNtZtL0FUwarjaZGcLTQHXQL
X-Proofpoint-ORIG-GUID: iDRYtEncdNtZtL0FUwarjaZGcLTQHXQL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDEzNSBTYWx0ZWRfX5HrOJB9OCxRR
 VllKQ97Mc0DJ78EbpEF3ofut0pmbiyaCw2FiBEuad6nQQY8bprH0sDLIvXvKlKt/e/tTnTIvscC
 phj5TUco4/dwx60fg1i1B2ag0uiIJM8yWM8w0snwyAcj1VsnuUl9t/SjBTSIRzXjQausJLePiRv
 lWoQ4vIayyCGp56P1xAPut2ng+BX45Ial7O+81kB+L+SlnxR5BDbQOhvgRpBdt1O+ELssuUe6z8
 oqhMHgVFzb8G3YcFuiWnraZ1mkJn9wSJmWFXatq/PVGXSmW08669H5350NiI87StQcxl2gud517
 bm8hkE8A6G97wzKPOB3J+Jy5XX4xwihCVL5smy0EpknkZc7Xl5NxKm+elFPkk+FqQ5gO3JyR8a/
 jG1kdQjoEr6DneTCnx48ZWuVmZJbgw==
X-Authority-Analysis: v=2.4 cv=Hr572kTS c=1 sm=1 tr=0 ts=68e39c5e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=pGLkceISAAAA:8 a=EU-ENxuI5XK3D0y7c1kA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_03,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2510040135
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

On Mon, Oct 06, 2025 at 12:10:05PM +0200, Konrad Dybcio wrote:
> On 10/6/25 12:02 PM, Dmitry Baryshkov wrote:
> > On Mon, Oct 06, 2025 at 11:24:35AM +0200, Konrad Dybcio wrote:
> >> On 10/2/25 4:04 AM, Dmitry Baryshkov wrote:
> >>> On Wed, Oct 01, 2025 at 09:59:14PM +0800, Junjie Cao wrote:
> >>>> Add a driver for panels using the Novatek NT36532 Display Driver IC,
> >>>> including support for the CSOT PPC100HB1-1, found in the OnePlus Pad 2
> >>>> tablets.
> >>>>
> >>>> Signed-off-by: Junjie Cao <caojunjie650@gmail.com>
> >>>> ---
> >>>>  MAINTAINERS                                   |   7 +
> >>>>  drivers/gpu/drm/panel/Kconfig                 |  10 +
> >>>>  drivers/gpu/drm/panel/Makefile                |   1 +
> >>>>  drivers/gpu/drm/panel/panel-novatek-nt36532.c | 437 ++++++++++++++++++
> >>>>  4 files changed, 455 insertions(+)
> >>>>  create mode 100644 drivers/gpu/drm/panel/panel-novatek-nt36532.c
> >>>>
> >>>> +
> >>>> +static const struct panel_info csot_panel_info = {
> >>>> +	.width_mm = 250,
> >>>> +	.height_mm = 177,
> >>>> +	.lanes = 4,
> >>>> +	.format = MIPI_DSI_FMT_RGB888,
> >>>> +	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_CLOCK_NON_CONTINUOUS |
> >>>> +		      MIPI_DSI_MODE_LPM,
> >>>> +	.display_mode = csot_display_mode,
> >>>> +	.dsc_slice_per_pkt = 2,
> >>>
> >>> As this is not a part of the standard, what if the DSI host doesn't
> >>> support this feature?
> >>
> >> Shouldn't the core gracefully throw something like an -EINVAL?
> > 
> > There is no 'core' here. Each DSI DRM host manages DSC on their own.
> 
> drm_dsc_helper?

No, that's just for calculating PPS and some other values. It's one of
the problems of the DSI model, which I tried to solve a year ago, but
failed up to now to do it completely and clearly. The DSI device can't
check host's capabilities. It declares what it needs inside struct
mipi_dsi_device and hopes for the best.

-- 
With best wishes
Dmitry
