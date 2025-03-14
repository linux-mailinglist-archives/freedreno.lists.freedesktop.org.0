Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75FC5A6116A
	for <lists+freedreno@lfdr.de>; Fri, 14 Mar 2025 13:33:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5049A10EA04;
	Fri, 14 Mar 2025 12:33:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="iXyRTU/K";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ADED10E969
 for <freedreno@lists.freedesktop.org>; Fri, 14 Mar 2025 06:11:27 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52DKZoih019087
 for <freedreno@lists.freedesktop.org>; Fri, 14 Mar 2025 06:11:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=IScPRMJWlAypVVGTG3eAzrrq
 ZqNhSbnrEPn3z5FtHkc=; b=iXyRTU/KjwoMm7sAi2n6/0MoFdyJBjWemiSQIiuz
 9+4o1A0h52Vtt1uwzkVm62tTPwx1p+E6Ix1ZZdhdKzgsIf8jjUlOrUus7eqjFtHA
 LMKpgYLYM3O61kvZTgWqJNUnACPaAqn2dgqp9Hq17OkXQ7XGH0Z4qj8nhZIJ7g5i
 HU/rIBrLqPtn+w44KjNhCPsHp4TlRKHm4LiY/EXUwU25ZjU5Ti9IsUdbgdsOpGNC
 +6KVypEYLvaIH3Cf+Aj68WzdW9r3GIM3K5XPoRiPtkE8n8kEpb+ZfmzHTcCdxDgw
 Jf7TaekIC7TH0cNdEGa3clDdH3MAFJTfWtBd1qP4bvsYXA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45au2p884s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 14 Mar 2025 06:11:27 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-47682f9e7b9so29931091cf.2
 for <freedreno@lists.freedesktop.org>; Thu, 13 Mar 2025 23:11:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741932686; x=1742537486;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IScPRMJWlAypVVGTG3eAzrrqZqNhSbnrEPn3z5FtHkc=;
 b=OhtxVWF6OXJI7g9+9vRvAEunZUwEz/cd9zIwfqi7GDAlIdnMCJzlL1BxDnXmUAU1lg
 9XyeuZZyKFQdfwqAzqZW7cTpPHXOcgxtBXRkfST370xtNTiSOKx7wvVdfoj6rFA40Zp8
 X0U3Z63zQWqCdIMN59SuklyEtYyxhC8THxktRQK1v3YfIsdtkSm631/i2wjB9dsFSn4b
 ZpHdZwmj8kjOdyucBsD4YlMcstQLvsfLE3lf6mQ7u2xahQ1y5rIdCtpfrYYwHGKGjls7
 Cf/4a1CqwUAtaRYgBiEmpIdhSywtrsC9uB1SvOs+aPzpo/FSoKdrqxHuwIu6glLnTD6m
 DCLg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXEkVLDYgPc9SBc36eL3sJSqWop8DVZ5vq2MNNeYHQe45HAi/kDIxn2HIxGgI24LlhpRPHpTUGcmNE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxDiEx9HFuT/O/rBFJ8N5/kWgiSjkFQlu1rNMG0Jin+gSXJ1lKr
 ahcT8mMHgB11k7IvWlLU9smBPNOMk7pDuxR2ugDfGnq6ZUudJdRVKnRIUEqrIcNEcDU0ooMgTJW
 0JjJrw/IZSKSL0R9lDNScdGIRW2Ep6mPygvKXyyz9yEMgqCbvNMkuvh0/aDkhVUb5XYQ=
X-Gm-Gg: ASbGncs2O5CSad8WreZse0k8ROprwxqhayBtidOugQ2buLreISsBDRO7dJ2Wu3ihk2E
 ZmDJVmeehg4rc21hERx7uJPBXpsp6Dc+ulKi0aRE8cqs8lEnkgPfcQ6M7O3jXRNLhqQ/kgMLZLU
 qQvFOFAVd5qvYtdBHDyt0LFe4R9A75nDx4ELvSy/UX1gM61c5vzjGciXt62Y5JaaUykHtEGICy1
 g13g3GRwqmWVswPQTiM9knxtMEEOy+rlGQhD3o7IV4+MN4iCJHYIoZgeUpwApKUubEXMbOBkMnU
 C+sLWB+1WCuhzFfx2BSEm2SkS0g4y9gwHu6Bmy1dTR/qja+v77U48Ptkb3TYEMsnLHLrQIP4I6x
 /q2M=
X-Received: by 2002:a05:622a:438b:b0:476:b33f:6694 with SMTP id
 d75a77b69052e-476c815ef7bmr17237851cf.28.1741932686425; 
 Thu, 13 Mar 2025 23:11:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFHNONjkAR8RZmnBgw7/nNpbDzwNbQgBnWMqJdks15ZpyrrMTOeZPgm8VR3KSNnTn4CBULsAw==
X-Received: by 2002:a05:622a:438b:b0:476:b33f:6694 with SMTP id
 d75a77b69052e-476c815ef7bmr17237651cf.28.1741932686118; 
 Thu, 13 Mar 2025 23:11:26 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-549ba88577csm415667e87.205.2025.03.13.23.11.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 23:11:24 -0700 (PDT)
Date: Fri, 14 Mar 2025 08:11:21 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Chenyuan Yang <chenyuan0y@gmail.com>
Cc: robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, sean@poorly.run,
 marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: Fix error pointers in
 dpu_plane_virtual_atomic_check
Message-ID: <5dhbi7a62mebu6trwr3umjnkiia7nnaru533653z67qmmsc2hb@krmvfeuw5xtn>
References: <20250314011004.663804-1-chenyuan0y@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250314011004.663804-1-chenyuan0y@gmail.com>
X-Authority-Analysis: v=2.4 cv=HP/DFptv c=1 sm=1 tr=0 ts=67d3c88f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Vs1iUdzkB0EA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=fWY0QR86pWCIX_IcxasA:9
 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: WRxVc_dWcLYHSJ_OQ-YQF2TBpoH2upNs
X-Proofpoint-GUID: WRxVc_dWcLYHSJ_OQ-YQF2TBpoH2upNs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-14_02,2025-03-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=912
 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0
 malwarescore=0 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503140047
X-Mailman-Approved-At: Fri, 14 Mar 2025 12:33:27 +0000
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

On Thu, Mar 13, 2025 at 08:10:04PM -0500, Chenyuan Yang wrote:
> The function dpu_plane_virtual_atomic_check was dereferencing pointers
> returned by drm_atomic_get_plane_state without checking for errors. This
> could lead to undefined behavior if the function returns an error pointer.
> 
> This commit adds checks using IS_ERR to ensure that plane_state is
> valid before dereferencing them.
> 
> Similar to commit da29abe71e16
> ("drm/amd/display: Fix error pointers in amdgpu_dm_crtc_mem_type_changed").
> 
> Fixes: 774bcfb73176 ("drm/msm/dpu: add support for virtual planes")
> Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
-- 
With best wishes
Dmitry
