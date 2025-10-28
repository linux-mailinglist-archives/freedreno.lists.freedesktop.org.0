Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D6D8C16066
	for <lists+freedreno@lfdr.de>; Tue, 28 Oct 2025 18:02:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7628D10E617;
	Tue, 28 Oct 2025 17:02:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="O5WeeqEg";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UlUwVPCZ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA4B010E621
 for <freedreno@lists.freedesktop.org>; Tue, 28 Oct 2025 17:02:43 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59SEnlsf1936829
 for <freedreno@lists.freedesktop.org>; Tue, 28 Oct 2025 17:02:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=cxkp5uN1hgEm1U7CQUVNW25h
 7bex2SPSJGWvI/3+x5g=; b=O5WeeqEgym/Ed2fgGBQMV6HSxphMhBfeNluJHd1n
 YEfHstEthnB/DoPpsTjyRIiu7yldRCJRYfWemRT/RMH9gtf0tVNsP/tAXpt+5iQh
 hwktCzhnbuYqw+zjjS5OGwp9l8GhWImoC7Du3RAPAvCgGMh++TzymCbLvQ9P/JQ5
 aSFvcfJlBFQM2gEDnxsW6ff/lNqaNaJNhv3CiDTQ47cbi+VZslZ/r7obTzZpN9iU
 qk3P9N7WZUBUkNUPZU+3+xuGdxx3+yTZzgVwfGICkeaz2KfO+gWwMRqbB0C6KRWJ
 AMhsWaVNvtEggSym9aXFtPjW9op3o80FLZ+yK5tdocunEw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a2pjfa8pf-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 28 Oct 2025 17:02:43 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id
 71dfb90a1353d-54a87b8f9c6so3385082e0c.2
 for <freedreno@lists.freedesktop.org>; Tue, 28 Oct 2025 10:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1761670962; x=1762275762;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=cxkp5uN1hgEm1U7CQUVNW25h7bex2SPSJGWvI/3+x5g=;
 b=UlUwVPCZCp9WfhganfXeHCsgL2w+XAaaIZEsfdBeCSyQwA2w0WujzcKYHZnv/Zzics
 wK4YVlevF8Rzje8KrB2pd439O3BD58Fa6Snxr78I25E4id1z9vUAdkG2oO3ejXYQtn06
 Yue72Chm7fQPE0SGalHKPzGMYVh+F+T/8DH5ouR+5OymY4u3aCXV3NCHiR5ovvr3j/jI
 w1QK4LwRRcXC+qcCMz1B+xY/6i32oOUkcdk5roYbWxzeCgXGgJ41nD8IoIhjyah5cZaN
 cW0g/eScaBuRHnrOC/uao18Q/ShASiCcqO3DGhzJnpIQ1eQMeaD4r1ourNqKj2wJ4388
 3vcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761670962; x=1762275762;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cxkp5uN1hgEm1U7CQUVNW25h7bex2SPSJGWvI/3+x5g=;
 b=eqpedZS5RXbCMoYcq3IH2tw+LgIa9FecY8+UwNk7CMC9uQBObZNncPJPdz6SB7GUtU
 1nt3s9gTSM0KQIIGZ0LWYPy+Bxdzan0YZyqhl9dtjcV/qn57AlBImD45M6akp+dEH5r4
 PlL7F+IgPR3hIaxqwb33irI9jVBXWvDAta8qQiHgTR72LkAskOwa8h4xbpo0VdvMUF30
 Ait+q/pWaDclbZm0nelDTYEzHO4KR5OsmLtMH+pMsFDBsN8lQ7oxhej/ngvqp7adTvqD
 m22EvCSL3CnbZzZI9K+pClrU5JdtPlft+sAUS4SHmFEtxHm6tJf/Qj0yip4ZIfsRFjOo
 3Mbg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVvmPosBZNZlDcQ/yicd3lwhUv9L+tv69mm8xSMIEUxdzewDjhKbfJH6EUZxtXioTuRx2K7Ey7MAJU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyF9UMa1XAD2wkroqpZJJFykrSnrdjVgilEaTj2p1LPYWnJc90X
 RD5nROGs87LITN2VYtrIWg+C7NIDfFzuqeOvkPlNkqpGJuRzT34XyEd0dUoqMBzVCXXzwPdRt1U
 wXXNfTbs6J80ApFPhor8FnGv9ELEoY3plEnnDBknSV8NzSVZAJ5hNutcgjws8EpupMsC4qNM=
X-Gm-Gg: ASbGncvy6uF7ssmEgTTlVQ5UVWFCZDmyl+KhVJVyiCh/HQl1aAfGegcQsW2OIp2vc7l
 lD3BNmKLlH5r1DcRMJ/jtN7oxbShYNv07TOfx51lVP5dSX2PV7WYeWIi04wEL8yxrnXfNTH7FM0
 aYsEww6Z91HHR/QGcOQMU4r8jyavAAsvf33OhZ6z1/oz1j+U+Yojre4jJVVIQww4dhcjw3RMxEP
 WN07x/t4qnOo2UeCrH3H+IaTSyArMJ+FJufjxTG3Z0h+ldZFFcI+forpBp0xH7CE/kov88K9SeC
 q04KLQ1LBrXReBOosW6zXqU923tv6eEN1DJUOizlo8yjoMVKdRhYTOdHy7tOQptOMCD4ALDowJK
 oa022u0UhraropRr6UAfgUeQf6G4uvCpQtMFSUBWlf5URK0+7TG8W1wBzAvFucLYepLJmKUsRle
 y0Rj194/R2b6C+
X-Received: by 2002:a05:6123:2eb:b0:544:c8bf:6504 with SMTP id
 71dfb90a1353d-55812a5716dmr211153e0c.12.1761670957322; 
 Tue, 28 Oct 2025 10:02:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFylu7+GWulmg8QmGwQJyndA+hF5O5s0KQz/TRjUhN57ySnCjdNwxNX2a1vWTcx0/uWdHcc3A==
X-Received: by 2002:a05:6123:2eb:b0:544:c8bf:6504 with SMTP id
 71dfb90a1353d-55812a5716dmr210602e0c.12.1761670952807; 
 Tue, 28 Oct 2025 10:02:32 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-378ee0c61a7sm26970681fa.28.2025.10.28.10.02.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Oct 2025 10:02:31 -0700 (PDT)
Date: Tue, 28 Oct 2025 19:02:28 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Teguh Sobirin <teguh@sobir.in>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: Set vsync source irrespective of mdp top
 support
Message-ID: <ukz4djjytsne3y2w3epkdc7gzegmeeijpcqblvftcx73ccs43p@es6b4ew4nrzx>
References: <TYUPR06MB6099CBBE5090DB12A2C187E3DDFDA@TYUPR06MB6099.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TYUPR06MB6099CBBE5090DB12A2C187E3DDFDA@TYUPR06MB6099.apcprd06.prod.outlook.com>
X-Authority-Analysis: v=2.4 cv=Ut9u9uwB c=1 sm=1 tr=0 ts=6900f733 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=DMwz6m7ubag84I2EhSAA:9 a=CjuIK1q_8ugA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDE0NSBTYWx0ZWRfXx2j4URPpNkp1
 MLF17Y6mNFWux3+AgSHorlQlluIzMf62OMYtTZuuStApEXYzvk15zw96G+/6COLNlYZw+a8P/cr
 m0lwRF6j31sZzyMwu8jRnNa2NoeVFCe+ImjKBoehh7DFU1TOV69Vouh2UTJo1z0Twu3DcqZAkqG
 LHCFQr0kvatqjbHHxAX6HhGLAeCs0sxW3nseznjNQccvo/DkbC52KxXQCLfF3XDComcoNBbcxKl
 i2qnhhbdvdMW3s0CCC6hd/pJXsvnD4Tj/D1vtVjmZrHzgXa+iMGMZ0OhNemMiQXuwSL327zQArD
 o+Nlt35aUIRyrcsOQDYXJXqYPk/gRRX9PZNNqlGsIO5iE2QvDNFmJ47tv06GF4tkz63APuGhn4j
 C4Brdr26DkYPjHbWV8U4AI1TW+P9sQ==
X-Proofpoint-GUID: l7NxY61A_N9ZmA8-smpDCHXhl3-qBhLx
X-Proofpoint-ORIG-GUID: l7NxY61A_N9ZmA8-smpDCHXhl3-qBhLx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_06,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510280145
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

On Tue, Oct 28, 2025 at 08:36:35PM +0800, Teguh Sobirin wrote:
> Move the loop over phys_encs outside the
> hw_mdptop->ops.setup_vsync_source block.
> This way, vsync_sel() is called for each interface.
> 
> This change ensures TE vsync selection works
> even if setup_vsync_source is not implemented.

Please see Documentation/processs/submitting-patches.rst. Don't describe
the change and pleasw wrap the commit message on 72-75 chars boundary.

I can suggest something like this:

Since DPU 5.x the vsync source TE setup is split between MDP TOP and
INTF blocks.  Currently all code to setup vsync_source is only exectued
if MDP TOP implements the setup_vsync_source() callback. However on
DPU >= 8.x this callback is not implemented, making DPU driver skip all
vsync setup. Move the INTF part out of this condition, letting DPU
driver to setup TE vsync selection on all new DPU devices.

The patch itself looks good to me.

> 
> Signed-off-by: Teguh Sobirin <teguh@sobir.in>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 22 +++++++++------------
>  1 file changed, 9 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 258edaa18fc0..f36c5c7924a3 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -784,24 +784,20 @@ static void _dpu_encoder_update_vsync_source(struct dpu_encoder_virt *dpu_enc,
>  		return;
>  	}
>  
> +	/* Set vsync source irrespective of mdp top support */
> +	vsync_cfg.vsync_source = disp_info->vsync_source;
> +
>  	if (hw_mdptop->ops.setup_vsync_source) {
>  		for (i = 0; i < dpu_enc->num_phys_encs; i++)
>  			vsync_cfg.ppnumber[i] = dpu_enc->hw_pp[i]->idx;
> +	}
>  
> -		vsync_cfg.pp_count = dpu_enc->num_phys_encs;
> -		vsync_cfg.frame_rate = drm_mode_vrefresh(&dpu_enc->base.crtc->state->adjusted_mode);
> -
> -		vsync_cfg.vsync_source = disp_info->vsync_source;
> -
> -		hw_mdptop->ops.setup_vsync_source(hw_mdptop, &vsync_cfg);
> -
> -		for (i = 0; i < dpu_enc->num_phys_encs; i++) {
> -			phys_enc = dpu_enc->phys_encs[i];
> +	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
> +		phys_enc = dpu_enc->phys_encs[i];
>  
> -			if (phys_enc->has_intf_te && phys_enc->hw_intf->ops.vsync_sel)
> -				phys_enc->hw_intf->ops.vsync_sel(phys_enc->hw_intf,
> -						vsync_cfg.vsync_source);
> -		}
> +		if (phys_enc->has_intf_te && phys_enc->hw_intf->ops.vsync_sel)
> +			phys_enc->hw_intf->ops.vsync_sel(phys_enc->hw_intf,
> +					vsync_cfg.vsync_source);
>  	}
>  }
>  
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
