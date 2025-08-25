Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA000B348B2
	for <lists+freedreno@lfdr.de>; Mon, 25 Aug 2025 19:32:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B218B10E518;
	Mon, 25 Aug 2025 17:32:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="NVZ9EhpK";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2659510E518
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 17:32:47 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57PGY1I4028657
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 17:32:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=PtOiqEStQKZ77zF7pAKUnMDX
 Hl86zn3BR3KKMOrL/y8=; b=NVZ9EhpKamed2usnZ22OuD7deiCJJtYDOVcRZlh4
 C7h0LGQNQm4BhPWhv5UxLXdQSm6CPiDDWxMgkf8XfW4x/0ShSHHRDa988lxJHkdY
 NMkcr10gI4fWSRf3z3vL78XnME/a7n3ijNuUXGwpfJFzZVXbJ30z2xzJ0rlP3MuP
 CNOc6p3+/nvhLe+EUYefcW/fhy5KdLsVz+Wepweh0hDQMC41mRXMR51xnSJCOeJP
 3JaDIIjgRpaJNIKcglNm6TILMfgVSJ1BlG0wpkw255znSohOILxAJL9i+Vg4xdBs
 H8GcFpp5dOTcDqddrRJs4zhsj07NveIQud2D/+C0TDQXOA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q6thwy40-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 17:32:46 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4b109765d3fso99849861cf.1
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 10:32:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756143165; x=1756747965;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PtOiqEStQKZ77zF7pAKUnMDXHl86zn3BR3KKMOrL/y8=;
 b=vxLnRgbZdTbuOZIu8EjhjKL2dCTFZ85xB1bNn+/I68Zux3Fe/8B3yUFuktVHZpklbR
 g/LzkAISJZXuSoG/hCL2iU5PIg+TqG3NU7zHTcb+7FAA7227xeeslMI9SmcS5bj6wBpJ
 o4r2lwvlkRNEiQmIBGOsuUxEMPMcqcuwT+ZhTPfm5TE4Aade5ECmdTam4Zbf9KLqOdQ2
 7OBsMmegUAMpZfCQntlj4FIZnJi9yaiFv8HilhktxJ0o7BYnLgfukMA/SqVdetD2vu8D
 D1fQDKpqTtGXd38mrnLuzvWoVQpLEALQmLnLvotBrMCS9XrO4b+sqEy/SZvoRjK82Gfa
 4CeQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXw7Gc2sOzyoudEFbIFW4KfYeZSNazPvBH1+RZhiyT9nWV8nLb0JSo1v0VevZWOjIjW000asFUt+8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzLKWEjiu75za7ZTSIFRE9A5N1k5U0xqx1WKo8LKbV+jJ9JrKwn
 111FBeNCotChPqh3UMYZY/ms03a491poPHEaiWDN6JH9ndz+VJxUK35LfIsfjJX2us5vGTqnKG1
 ukIBt+5+DV80DGwXau/cCCK2i1XTt1llkPdR8J9pgAWkumGrYscwoSkFb9PZQOcIGaRgLoV4=
X-Gm-Gg: ASbGncvaSTovK93GUZQdFCdnJoUck8pHt+D6kfKC1L/m+HNa2NudHExj1wlVRxIgte1
 TmdKzqGYgh6NGLYcNAJAz06eqbLzfV1UMJGxkJ06nTIoPNKWBXW/rDYSnp/DjeNJO/uTSXWWu5T
 Wl+9KThnqOifghTpdJXO/pMX/9ik+J9DSAMiNJV+2+thRpRaIxZ+lXTxL1PFZ2L6vFjcHlw00nY
 +4aLvILMvlD4pTGvmUKunB0oDLDK2kvj4eCXF7KBViODO/nHGmFswocqIntxvIPXJ6I19QL0zl/
 lZGeezm9O1VOfnF3eD6yg17dogkCzKxYP0CcSnmBMvdWg/O4Q1IzCj1JLS4U+gh8SXbd8mSUULr
 8dN5TlEWvl8ItLgzf/gPjGl8Ssme5Gi93yBR/iW7a7C/ZZ5HrhqVZ
X-Received: by 2002:ac8:7c41:0:b0:4b2:8ac4:f098 with SMTP id
 d75a77b69052e-4b2e0a20a11mr6081381cf.34.1756143164890; 
 Mon, 25 Aug 2025 10:32:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEyWUI9/JcuNq34IRC/iYRA3AEnS2Qy6SSU8Z7TfujwVKyou4G/jnYD5HrIwMTWY66+zeUXJg==
X-Received: by 2002:ac8:7c41:0:b0:4b2:8ac4:f098 with SMTP id
 d75a77b69052e-4b2e0a20a11mr6080081cf.34.1756143163891; 
 Mon, 25 Aug 2025 10:32:43 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55f3d4d1afasm1436815e87.58.2025.08.25.10.32.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Aug 2025 10:32:43 -0700 (PDT)
Date: Mon, 25 Aug 2025 20:32:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v3 07/38] drm/msm/dp: allow dp_ctrl stream APIs to use
 any panel passed to it
Message-ID: <jlgm2fgkyflflphtb4cv5gqedvbrstc64rz5iihjvvwvncha2q@5mrwxuq3i7jx>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-7-01faacfcdedd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825-msm-dp-mst-v3-7-01faacfcdedd@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDA0MyBTYWx0ZWRfX4bEorgVYPuBT
 Pzkn3VxpqWvMBWCiPqbYrbR1r+ppspCCcbh9gElmU3YJObmYke31Wy45VN3pZI7HoSxxSNyk8WF
 Ilnjg/b4UHOF9Sf9t0qkTEllxXYSbPwVWq+H6ta1SuavEghe4DEBT69x1b+zKVOhsOKzEVPt2L1
 XEVUoNxIIcObD+HUXJIbb1jK3NEUDVCGtL1eNK+FGnnkn9mLS5+QJbdQRL0JILqP7ScFnmiKf1f
 yCgiYq/7fD2ibNAH4P0ekKQ19DyDSLwwdYs1t3i/DKJ9qhbyGKWuu1w/EBItBnd5Y3suhjHptXZ
 fYdfFhyjyeOrzU61QyebBGnE9kA64tgUBRFa0lE6DEB8CRxvs54AzI9tnTDJo3et2hV/qyexhyI
 bUBWaxh9
X-Proofpoint-ORIG-GUID: wUJqFffwgOYdLWu8H-EEEL4P0K7e82GX
X-Proofpoint-GUID: wUJqFffwgOYdLWu8H-EEEL4P0K7e82GX
X-Authority-Analysis: v=2.4 cv=W544VQWk c=1 sm=1 tr=0 ts=68ac9e3e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=6Lrzk36WTCfDkofcdswA:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_08,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 suspectscore=0 phishscore=0
 bulkscore=0 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230043
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

On Mon, Aug 25, 2025 at 10:15:53PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> Currently, the dp_ctrl stream APIs operate on their own dp_panel
> which is cached inside the dp_ctrl's private struct. However with MST,
> the cached panel represents the fixed link and not the sinks which
> are hotplugged. Allow the stream related APIs to work on the panel
> which is passed to them rather than the cached one. For SST cases,
> this shall continue to use the cached dp_panel.

cached -> stored

I think that for MST case we should not be using the msm_dp_panel for
the link handling at all. Does that make sense or would it require too
big refactoring?

> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    | 21 +++++++++++----------
>  drivers/gpu/drm/msm/dp/dp_ctrl.h    |  2 +-
>  drivers/gpu/drm/msm/dp/dp_display.c |  2 +-
>  3 files changed, 13 insertions(+), 12 deletions(-)
> 

The patch LGTM.

-- 
With best wishes
Dmitry
