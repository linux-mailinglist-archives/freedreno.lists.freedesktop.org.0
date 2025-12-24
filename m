Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3FFCDC4E4
	for <lists+freedreno@lfdr.de>; Wed, 24 Dec 2025 14:03:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A713510F185;
	Wed, 24 Dec 2025 13:03:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="LUkJZvQx";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W7r4yIwD";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B698310F183
 for <freedreno@lists.freedesktop.org>; Wed, 24 Dec 2025 13:03:22 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BO3wWPr3796894
 for <freedreno@lists.freedesktop.org>; Wed, 24 Dec 2025 13:03:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=CoMLQ3A+FSqHoq7wci+EuOku
 pFXnNaASmggKwByogQw=; b=LUkJZvQxGCXyxxq7p8ATp89C8XN+5L0H83SU3qcB
 SF2G24XZlM+8S4yZO3lXR1AKx1HspfDA1P7/aFhU02tQD6B1aAM78h0NWwaCX7cy
 pl1rVvpSpVQ63ogkC7qdyyV5iulFm5X75sm1xniOHXFq5Zm8NODWqpFSL4R3Rjj1
 2FQ1SlOm+fMbATJFjpCOWm2v2j94+BxwKEHpgogGGHGFX+PcKisuL6ZZRHVkvDZ9
 OY7BxnmnVIyMRJtsS+Zlq4cF1UUo+P+VSgi3Y1EG4VKCQLyGMhGRRvFsZXSihph0
 GRIuRp82y4MgxBnE8B1rR5QWSdRguzyBlfuGRKhf7UqBuA==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b88r697th-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 24 Dec 2025 13:03:22 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id
 46e09a7af769-7c75663feaeso6238464a34.3
 for <freedreno@lists.freedesktop.org>; Wed, 24 Dec 2025 05:03:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766581401; x=1767186201;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=CoMLQ3A+FSqHoq7wci+EuOkupFXnNaASmggKwByogQw=;
 b=W7r4yIwDRyWHf0SGJYL9n6FwBldlKtwZEisPhOmghYrLEShDX2v7/Oq+PlJTmjlO0/
 sqG0KqpO1WV/w4ltJYdnVVjEXrtURlzxYcG8CZLFflVDm5tegA8G+I58KnXBFMPJad1r
 tvJfQP8V6Op/qXLI7U1fL2opNQJuABuwrYL6KtfQ4kFRIlms7njCvhYIoZycc7qF0rZT
 AFe0FLXhOQdiRAMapkOMg3VikGHIVOcaKqBUQn9WzYMLkWS2xU5UP1piYHnbiCAzvkr0
 0msyB0mI8RB6NecYBpXzNmOvMlcu6tjVLKurMTy3ijlv1yuLUM7lRD6kOmPTJaRujGKd
 yWtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766581401; x=1767186201;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CoMLQ3A+FSqHoq7wci+EuOkupFXnNaASmggKwByogQw=;
 b=GSibg5wm8VXG2PWN1zkYl1zgcLCtuQykQwo8qBxagbGtrU44PV4WjENw9Xobk35cft
 td3p/mfocy8s2Ky24GSIkRmfqjr+f5RoHAttalSjOS+T/VPnRelKUufQK/cZ0x28HoJ5
 Br9sXTbq2FiUmjFEkZIn4wZRAMfViBrm4SzPO+d8nqGj+kOik8swJAFroqCjcYB/z/7K
 41NW9H7peXiomZga7IYv3woW3Y/OURea2Hx9/H5cS4fp54I7ZnDybWdEwaHs2mY9NYt+
 9Mf36woDAt0EDddxPeaNWVY/FrRDAfiNdyhtfyqlMo/VsURn6hcrWXh3YK9NQDGYuGt7
 lmww==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTojzZyorU/C5PioNsJ07dHZXBvECx9H44svERmVrTP7SixCUVEhCfwFH3caya/WT6ZLrRYeXDjR0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyjDlIWBErELp31Y/Z9gXPkKKHQj4vRZpT0kAvIl0/ZuM66Sw2W
 c20XAb3mDNbUIfZZyE49MneUXhbir2lDD41QUzobf0Q8BAAT8nL3HtV5pUB+PQmB6n047TD0YKX
 QYf16e32DUH3a2WLDMpM3aQ0BTqs501TLmWI6PAIIXHuPjP6O/+4y2SjXaTux3XMwEKWufzU=
X-Gm-Gg: AY/fxX7hwWKcj/DLhZJPYUkG8yoZGMjWOoL0lO3/wu7cSq/JKKkmiMujv9Cjx9XRo57
 745+dLs40Xqu+iSPZZR0JY9FO3DaAOOTqkuUGNbluFjk2btdxMkevg7tIXPDQlJYs6UwGc11WtT
 FUkq2FSWsVwDBdnGuxOLtKifBCx9zFsqLu1GtP/Tz/5JOysCyoA+o1T3qO7nP3q1Zi2gmOdNKgc
 SC4oDSa7cO+kSWZF9dp7lVr/QPYf5hJGMqOGnalb6V9v91WKKFp2IVe9D5KhhvZoPVsa/iTa2Gm
 ld5B+VOZaHCURZCwbbpBrnOMBdbDByzBEgJQ2U2UwFEUmxzDOxxfu69ei1L8ynqibkYdxawIRM/
 gawRphk/DdUwUp8CQLPIGhLamGm9q8o1xV4jYyOfDDud1SSd8w8MkRGP23HUx6WOBwj9WBdpcyd
 g7TTJOLsGSot6J+k8HBRN/y/E=
X-Received: by 2002:a05:6830:2e05:b0:7c7:2df4:faa3 with SMTP id
 46e09a7af769-7cc66aa23fdmr8356411a34.33.1766581401111; 
 Wed, 24 Dec 2025 05:03:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFci56BqdajGnWbClbkiviThpt3xVm3rf78bzux61dK3ALULPOf/isq+eEuZE9ShzSWosGYHw==
X-Received: by 2002:a05:6830:2e05:b0:7c7:2df4:faa3 with SMTP id
 46e09a7af769-7cc66aa23fdmr8356385a34.33.1766581400633; 
 Wed, 24 Dec 2025 05:03:20 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3812262b391sm41256101fa.29.2025.12.24.05.03.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Dec 2025 05:03:19 -0800 (PST)
Date: Wed, 24 Dec 2025 15:03:17 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Teguh Sobirin <teguh@sobir.in>, Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/msm/dpu: Set vsync source irrespective of mdp top
 support
Message-ID: <un2arvxos2kuyrqej4p4fs3jfd3kzpa4r5txoitoctfwl7hair@i2a5lu3p3iem>
References: <TYUPR06MB6099C539BD2C937F8630FF8EDDD5A@TYUPR06MB6099.apcprd06.prod.outlook.com>
 <aUu5vZdr9RJ-VML8@SoMainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aUu5vZdr9RJ-VML8@SoMainline.org>
X-Proofpoint-GUID: 7NKxqOBX4vAdDqAXpKtEOqVxjc52eEqn
X-Proofpoint-ORIG-GUID: 7NKxqOBX4vAdDqAXpKtEOqVxjc52eEqn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDExNCBTYWx0ZWRfXyKV00dIqleNh
 kTNFs5S4xLCKf2ZPJyPqzXmX+lweck5HtTL8dPDpunS3NlY3onu/yfxuuapwGIGUXEF8H5ZAfTl
 g5YZyr8Jmb39FwWpxS7y8WNp9uY6fTJcP/uTDWosR9ELNSAI/jSwIgZZCjN/sfvR5Sb6gDHj7eu
 NBasVwkJZDLynYmyYpOCwMQkyV3EBZ47Smj++JEBEm78gwuCLIWRaYZOKKHVC480d8vJp2c7zMb
 qPEY/tY3gz5I2DmrEdtox+R3+znNQP0cnN/1lGSS338KsqmJVOOXxVfj68uviFj+u0StgVPJAr/
 +odljAjZbHULfn6TwS7EloDFOAhexDFhI6z+JTI0kWYU/kx1d5GUDo/bQ/C4X9Stxe+UPcmrxxM
 IAKJbQv6WnFslbDsqL3RJttrxNOKBnO6Y9tZux26UlP80XqK8Erc2tyCQpu6I4RrZ1G2grnf4Qr
 D2pZWY4raJGPVLWoNZg==
X-Authority-Analysis: v=2.4 cv=Qahrf8bv c=1 sm=1 tr=0 ts=694be49a cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=UqCG9HQmAAAA:8 a=EZJLH4LHemoWMIo9gjsA:9 a=CjuIK1q_8ugA:10
 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 bulkscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240114
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

On Wed, Dec 24, 2025 at 11:10:35AM +0100, Marijn Suijten wrote:
> On 2025-11-21 14:02:08, Teguh Sobirin wrote:
> > Since DPU 5.x the vsync source TE setup is split between MDP TOP and
> > INTF blocks.  Currently all code to setup vsync_source is only exectued
> 
> typo: executed.
> 
> > if MDP TOP implements the setup_vsync_source() callback. However on
> > DPU >= 8.x this callback is not implemented, making DPU driver skip all
> > vsync setup. Move the INTF part out of this condition, letting DPU
> > driver to setup TE vsync selection on all new DPU devices.
> > 
> > Signed-off-by: Teguh Sobirin <teguh@sobir.in>
> > ---
> > Changes in v2:
> > - Corrected commit message suggested by Dmitry Baryshkov.
> > - Link to v1: https://lore.kernel.org/linux-arm-msm/TYUPR06MB6099CBBE5090DB12A2C187E3DDFDA@TYUPR06MB6099.apcprd06.prod.outlook.com/
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 22 +++++++++------------
> >  1 file changed, 9 insertions(+), 13 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > index d1cfe81a3373..f468d054f5bd 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > @@ -774,24 +774,20 @@ static void _dpu_encoder_update_vsync_source(struct dpu_encoder_virt *dpu_enc,
> >  		return;
> >  	}
> >  
> > +	/* Set vsync source irrespective of mdp top support */
> 
> Unnecessary comment, it's clear from the code flow that vsync_cfg.vsync_source
> is passed down into both functions.
> 
> Perhaps we should pass disp_info->vsync_source directly into
> hw_intf->ops.vsync_sel() and only initialize vsync_cfg when hw_mdptop has the
> function, to make this clear.

No, because on DPU 8.0+ WD is also setup per intf.

> 
> > +	vsync_cfg.vsync_source = disp_info->vsync_source;
> > +
> >  	if (hw_mdptop->ops.setup_vsync_source) {
> >  		for (i = 0; i < dpu_enc->num_phys_encs; i++)
> >  			vsync_cfg.ppnumber[i] = dpu_enc->hw_pp[i]->idx;
> > +	}
> >  
> > -		vsync_cfg.pp_count = dpu_enc->num_phys_encs;
> 
> This change is not mentioned in the commit description.  While true that
> pp_count is only used by dpu_hw_setup_vsync_sel(), that is still a valid
> function to be called on DPU < 5; it denotes the amount of ppnumber[i] array
> entries are used above.
> 
> > -		vsync_cfg.frame_rate = drm_mode_vrefresh(&dpu_enc->base.crtc->state->adjusted_mode);
> 
> Same, also not mentioned in the commit description.  frame_rate
> is used by dpu_hw_setup_wd_timer() on DPU < 8.
> 
> > -
> > -		vsync_cfg.vsync_source = disp_info->vsync_source;
> > -
> > -		hw_mdptop->ops.setup_vsync_source(hw_mdptop, &vsync_cfg);
> 
> But all of the above comments don't matter if the call to setup_vsync_source()
> is removed entirely - it didn't move anywhere else.  This is not described in
> the commit message.

Fun, I missed it earlier. Thanks for pointing it out.

Teguh, since we need to fix watchdog on MDP 8.0+, I'll send v3 on my
own, if you don't mind.

> 
> - Marijn
> 
> > -
> > -		for (i = 0; i < dpu_enc->num_phys_encs; i++) {
> > -			phys_enc = dpu_enc->phys_encs[i];
> > +	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
> > +		phys_enc = dpu_enc->phys_encs[i];
> >  
> > -			if (phys_enc->has_intf_te && phys_enc->hw_intf->ops.vsync_sel)
> > -				phys_enc->hw_intf->ops.vsync_sel(phys_enc->hw_intf,
> > -						vsync_cfg.vsync_source);
> > -		}
> > +		if (phys_enc->has_intf_te && phys_enc->hw_intf->ops.vsync_sel)
> > +			phys_enc->hw_intf->ops.vsync_sel(phys_enc->hw_intf,
> > +					vsync_cfg.vsync_source);
> >  	}
> >  }
> >  
> > -- 
> > 2.34.1
> > 

-- 
With best wishes
Dmitry
