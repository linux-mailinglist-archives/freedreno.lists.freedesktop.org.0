Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 592A89B83B1
	for <lists+freedreno@lfdr.de>; Thu, 31 Oct 2024 20:53:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2735C10E91B;
	Thu, 31 Oct 2024 19:53:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="nlGdy50F";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77AFB10E91B
 for <freedreno@lists.freedesktop.org>; Thu, 31 Oct 2024 19:53:20 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-53b13ea6b78so2273408e87.2
 for <freedreno@lists.freedesktop.org>; Thu, 31 Oct 2024 12:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730404399; x=1731009199; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=FfLXMCQQFkBg7dASFcVMaYIBkwL01Sjg2kKn5PFIJT4=;
 b=nlGdy50FdDUJc6uuDdniQPiJcPiEV1IjTwOoL+vbHHwOOVAbWIAWhmTCnm5ntVmwRy
 lDksX4GGkAHdTfhyTVrmDPBZkjg8nW3ZibKeUUYOkWrjcTTi6YWPt3oqSJ6+qiUsKL0e
 +GQCZOyX6aX+NlMxgQlKkaKAmJgyfcdVKx94GtQtgsPzaSzMyyz4ymn+TDPXFGnPQmbO
 vxu8czmFOYqSRTpcF0n5l3PwMgRGlFmRqUe628AZh0ZBM9JyXdvf9LH3S1/Ys2cF8B8D
 Bge8yTaQNPix8eixRkcQbdL0NvVj7brmm5nI8GR6SF/BZdIvn2/TE0P4orflNhac7ATD
 Z2FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730404399; x=1731009199;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FfLXMCQQFkBg7dASFcVMaYIBkwL01Sjg2kKn5PFIJT4=;
 b=Sd2IAatumlld3tcM0/7k/JyCN4N4o7sxigCLZxLBQTL5iH32MRre4VVgYySDaEL/mp
 /8XDAs1ybaKiooB0msIKTFqIfcSby7T7zQZNFeMCjFSQq6WRXWlRtJEE6V1/a8TJtwk7
 Qq6Xr+p0HKqulJ5u2TIFLZHPYjN4nPtzbaCMDsfKZE9JTF6ZnByqN2EaWiwcipvR+xkZ
 8QdygHhD2dPYGXfwtz1lqk/UybAvGviQfHJY+5OE4rAjceHvlfh0/eBR4LZ+W6nZuFYq
 7xJMCt/ttfDSajV0MOdjvLZECD0qP6SWLPkSrnezOnWtDauKN52dBathe1gHnuVkYoTJ
 xPNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVyNcLmokaUkcqHLy1pcVpLE2yRpBv5UFmKA7KbQh2aLnMv+Hyy4Ptsy6BGBqIDU+2QSHiskAA62L0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxjWk+/q1ER4qnM6893ietCCZ52+1IcLpvbFwNCVtSTLr6cZBkx
 mJOEOiWUSlSY9mkqWJ0d32aZWWOffWAG/UhMySNoKVBFQV1NW4T610Zxb8/lid4=
X-Google-Smtp-Source: AGHT+IFbIDigm0flj16NCCbZnnareTFGiMJU9B1xBShOIW2PD8XpTBELPIlnMY8x52kyuov0Cc5GyA==
X-Received: by 2002:a05:6512:3e0d:b0:539:f10b:ff97 with SMTP id
 2adb3069b0e04-53d65e16242mr1025066e87.49.1730404398459; 
 Thu, 31 Oct 2024 12:53:18 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53c7bdcbcf6sm306468e87.194.2024.10.31.12.53.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Oct 2024 12:53:17 -0700 (PDT)
Date: Thu, 31 Oct 2024 21:53:14 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>, 
 Simona Vetter <simona.vetter@ffwll.ch>, quic_ebharadw@quicinc.com,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@chromium.org>,
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v3 05/23] drm/msm/dpu: move resource allocation to CRTC
Message-ID: <33b25qy73byvz35djhduq4r4kksqtvels2fty6ikxkawox33u5@udv6j6buxnj2>
References: <20241016-concurrent-wb-v3-0-a33cf9b93835@quicinc.com>
 <20241016-concurrent-wb-v3-5-a33cf9b93835@quicinc.com>
 <3afded46-7aef-4444-9b61-b97f71d0e5fc@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3afded46-7aef-4444-9b61-b97f71d0e5fc@quicinc.com>
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

On Thu, Oct 31, 2024 at 12:37:03PM -0700, Abhinav Kumar wrote:
> 
> 
> On 10/16/2024 6:21 PM, Jessica Zhang wrote:
> > From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > 
> > All resource allocation is centered around the LMs. Then other blocks
> > (except DSCs) are allocated basing on the LMs that was selected, and LM
> > powers up the CRTC rather than the encoder.
> > 
> > Moreover if at some point the driver supports encoder cloning,
> > allocating resources from the encoder will be incorrect, as all clones
> > will have different encoder IDs, while LMs are to be shared by these
> > encoders.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > [quic_abhinavk@quicinc.com: Refactored resource allocation for CDM]
> > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > [quic_jesszhan@quicinc.com: Changed to grabbing exising global state]
> > Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  86 ++++++++++++
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 201 +++++++++++-----------------
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  19 +++
> >   3 files changed, 183 insertions(+), 123 deletions(-)
> > 
> 
> <Snip>
> 
> > -	/* See dpu_encoder_get_topology, we only support 2:2:1 topology */
> > +	/* We only support 2 DSC mode (with 2 LM and 1 INTF) */
> >   	if (dpu_enc->dsc)
> > -		num_dsc = 2;
> > +		topology->num_dsc += 2;
> > -	return (num_dsc > 0) && (num_dsc > intf_count);
> > -}
> 
> I dont recall the context of replacing num_dsc = 2 with num_dsc += 2
> and its not documented.
> 
> <Snip>
> 
> > +	/* We only support 2 DSC mode (with 2 LM and 1 INTF) */
> > +	if (dpu_enc->dsc)
> > +		num_dsc += 2;
> > -	return topology;
> > +	return (num_dsc > 0) && (num_dsc > num_intf);
> >   }
> 
> Same here
> 
> This should not break anything with current code. We could land it the way
> it is as this was the version which was last tested and post a follow up if
> this was not right. Something to be documented though, hope this note serves
> that purpose. Rest of the change LGTM,

As this is supposed to be a refactor, I'll land it as num_dsc = 2 and
let Jessica fix it in the followup patches. I think it's better this
way.

> 
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

-- 
With best wishes
Dmitry
