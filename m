Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A15B2CCB5
	for <lists+freedreno@lfdr.de>; Tue, 19 Aug 2025 21:01:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C037510E652;
	Tue, 19 Aug 2025 19:01:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="nNOTwsmK";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B585110E20A
 for <freedreno@lists.freedesktop.org>; Tue, 19 Aug 2025 19:01:09 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57JHWp6d026990
 for <freedreno@lists.freedesktop.org>; Tue, 19 Aug 2025 19:01:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=eSDc9BAB3b8+b7b3/+MDQM9E
 BEAEmQchCpTlVTVH4Ro=; b=nNOTwsmKxmiAAPv1CaIr7jcGE7rJUarSvvDl0fFw
 2vOcYRSEyqJ6z0bw1sI/tw5eGGR2SMmqV48HP2AXM7SOqjQH5mTNXLfpY9zNn/4Y
 /r79/dDwqOgYdW1wjwD1b1hyR91ItzIuYKdS/bKtYclVd5ROt6sVSfDrOLHerYck
 3ja5ntGtPKSXflcnhIvDPduVrodYB7tiGbDWh3nMjpnpY5p8r+Y25hNIX4BOV1t2
 iN3SxuUmFL4Wk2xc+6GOPUJ2jn5TH51q0IaVL5AVyHpg2/o3KYfFkggjy6tjC+yF
 cqBJP/DHJy6JXqoMjHQM0og9CLI+w/Z2iIZDuviGHNvDSA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jhjyhnqh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 19 Aug 2025 19:01:08 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-70ba7aa11c2so94727986d6.1
 for <freedreno@lists.freedesktop.org>; Tue, 19 Aug 2025 12:01:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755630068; x=1756234868;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eSDc9BAB3b8+b7b3/+MDQM9EBEAEmQchCpTlVTVH4Ro=;
 b=oR+Ah+oHtDTBPyrKS2SS+/UxVOvYvXZwflgr0VTfrFiCQzfv1+xruBWfCGR8ey1/P9
 zT8MLYtn+6CKr11A2gj3xFXs/mQwcwFEJWkXOQQnFEqnqDlnGLcNUyUyRwoRScujnew/
 EYQto6x329hUve21ctt8gnqGtUDbAPpxAeOjx6aqQE5xj/6eLqf+USrq/WGgtkoUrHpZ
 37hfUshX1XxflbZezYp4riQXjvQFIQ241N23ypW6TE7OsTCzxtDjtumSwbQ8lq20egOW
 2pbT50UgKrXLJugo/ZNoRzd0yr+i8tjQaD9h04jq+cA2Xeae3g9OCbr+p5K/cNIe1o2t
 FwMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWo84YEat+XsT6xyTEyeSXFpBaUVuc3yQPQ9d7p/njVKAhYmx1Misawoe5LmTHCugRRcNG6+LFFwkM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz9R6oEIMMTeml4VxziWakPjralSn1vkIpm1SBXXlmdUP4GWHWA
 8rwdvTeNwd5/gBPELzBHS2VSf9a7FMVP+WchJE3FmIXlClTocRHm2sYWFv4Ieg0zvbYEx/fn8bj
 agwojki2UFClha1DzYspPMDj8grRZLR0AAQgUITKM7rV8aVyoaPb98GkW+RU155iOZA9BFhE=
X-Gm-Gg: ASbGncvhISGYg4I+4nAh2JYR327Z9/7y712HnJNc2IG92EKfLJ7fL8yrQfn2qI9PASb
 F6OWHfaZe5mOeSiS9GTA/uQ/6ikwIVg7/98/M6RTid7R6ZjaO2cuKuBPxVew7tq3nN8GfjolJqG
 zy8h3WFnNv/IAFYSGsfIm/Pg5mxzdyyPsp9GGIBsSDVjqKDO/NY4TZ286zEOT1sd/3iuiiAjT1U
 +cM0i94lvpKIpsSAjIZzsVWo6004zN7yQBGsertkeG9AgjIxia5U4ObjZt+z2hSV/OjOsHBSzvl
 Y6Oet4PnmNmSWmWK0ObUqhuSrU/EVSfdaV8/LqItqrMRiQ4o3llRW8JStacmRBle9/gCRvDxf6M
 Pc6lgXw5WaC3ynGM+ptg7CnMb+ozV/ESlOO7VmBLtevhZ46UO8jQq
X-Received: by 2002:a05:6214:5086:b0:709:b691:c9b3 with SMTP id
 6a1803df08f44-70d76fb432bmr1090186d6.21.1755630067728; 
 Tue, 19 Aug 2025 12:01:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEEzyh25IcZixT1XrdjSA5oTENrZfRkUdENPuOBeZx3C/0fuWIV+BjW3wFDLEBMFAfYSgCcXQ==
X-Received: by 2002:a05:6214:5086:b0:709:b691:c9b3 with SMTP id
 6a1803df08f44-70d76fb432bmr1088806d6.21.1755630066382; 
 Tue, 19 Aug 2025 12:01:06 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3340a4758bfsm25257681fa.32.2025.08.19.12.01.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Aug 2025 12:01:05 -0700 (PDT)
Date: Tue, 19 Aug 2025 22:01:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v15 11/13] drm/msm/dpu: support SSPP assignment for
 quad-pipe case
Message-ID: <hrcp5pcjkqotexrnenm7dxojcmmzx2fl6ybxxofbtcot6q2hxu@3w4vyod2n74r>
References: <20250819-v6-16-rc2-quad-pipe-upstream-v15-0-2c7a85089db8@linaro.org>
 <20250819-v6-16-rc2-quad-pipe-upstream-v15-11-2c7a85089db8@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819-v6-16-rc2-quad-pipe-upstream-v15-11-2c7a85089db8@linaro.org>
X-Proofpoint-ORIG-GUID: wlkZRuKWtCkajFogeqEgDhJRzOaAaTeb
X-Authority-Analysis: v=2.4 cv=ZJHXmW7b c=1 sm=1 tr=0 ts=68a4c9f4 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=sWKEhP36mHoA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=nT20EUERFaLimiOwrcQA:9 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: wlkZRuKWtCkajFogeqEgDhJRzOaAaTeb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyOCBTYWx0ZWRfX+VjHnYmR+jWR
 0Mgpqulq+Qzi44do+cZm8mQXYq3BPhYtv6BC9vQGZspCESFMdjITyIr2nlVop4p+SAWfZKx5ozg
 tgxwI1kxRjxSW5KvnTxMl/vfIQGVE8HI6AlWaNGhyRAWI7dqFrDgh+smpvOUVvpVTHz/ChaoENE
 /TueFLZrdhJdtVE6ueSxzx6X2lS+3XiEzJJKn2V+2b2zzYMYMBMeYkKSpHVK5z2hzIo9t8ePBme
 xiDbYG9on+5szDnheCfeGBvvduRWrWgaV1EEbC72mZ2u3xfoLS5fdRelFqWHUzJpdkmoePP1Z81
 iadUHgyPyYynB0KVhOzFFI809eV/dYu9sdObKG3lfhUfUn1F4Z6WOs0DWeS+Qa7/Y7Epsi8O/2T
 3O/yAaNA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0 clxscore=1015
 bulkscore=0 spamscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160028
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

On Tue, Aug 19, 2025 at 09:31:05AM +0800, Jun Nie wrote:
> Currently, SSPPs are assigned to a maximum of two pipes. However,
> quad-pipe usage scenarios require four pipes and involve configuring
> two stages. In quad-pipe case, the first two pipes share a set of
> mixer configurations and enable multi-rect mode when certain
> conditions are met. The same applies to the subsequent two pipes.
> 
> Assign SSPPs to the pipes in each stage using a unified method and
> to loop the stages accordingly.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 150 ++++++++++++++++++------------
>  1 file changed, 89 insertions(+), 61 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
