Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B3CA35CD2
	for <lists+freedreno@lfdr.de>; Fri, 14 Feb 2025 12:47:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21B9510EC5F;
	Fri, 14 Feb 2025 11:47:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Tfp4pjQ4";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C07D310EC5F
 for <freedreno@lists.freedesktop.org>; Fri, 14 Feb 2025 11:47:06 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-5452e6f2999so196581e87.3
 for <freedreno@lists.freedesktop.org>; Fri, 14 Feb 2025 03:47:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739533625; x=1740138425; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Z+OQLoQ4w2P2wl26RlQhREWTqKJj63sDchzFcZ4MIw8=;
 b=Tfp4pjQ4KeTsmbULIQvk7onMpV5vt6UrzxJeZsXEFLAIQ65ookojrxTG4ITLA4tcme
 cF7CsU/AY8r8iUiKdxSidJd+5+2Z6kGfLRKNa9uL8vjwWLZ7wh6c0E6jg+We17iQsxlI
 M2yYCZJE26lJ68ymbn/4gkqEKgzE8/M+IZDddjnjiLvLrIervVO+j2rHeIoprbuU+ltV
 zlhxlX8ewVy56XIO9kQ2hOoPRoFl588wDN7Pfs3JAvtTyiBq9fD7M2jth2DkEPWLi1us
 DcYo3KVrNCQ9+leZqqN71Tcu8hELKi/eYGoMS7UgcUD3gmZ/tv21nwtqo2zY25f3rduH
 tBuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739533625; x=1740138425;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z+OQLoQ4w2P2wl26RlQhREWTqKJj63sDchzFcZ4MIw8=;
 b=fkHLFykpH6h27QnPL8GSP9NOiGPrUNxlaDxFSduFoXA74xmCFXP1Gx5arTx81vU1n/
 YDdYYeV614houKeuBJvO4kQJvFzbGoG5NPrRSltf06KKvKYYesdaIHIH9fDs2+CNNwv/
 4BW1GtLQK9YKGyCKPmGhVKx2pW+hiKTrzOW18h5puMlxNy07d7DzxvuEcuCBhQBzzqTI
 8VNSpjEMsyav5p1JekC0EkDOavMVazU7Hb8iL5aDK8g6sy7LbljcUla81G0Ql+IEuJuF
 5ky8aGgndBIuEPn+1BpprgahdkX66DaTOUV6MirnWBpeKMo2HeXywsiY8JSGJKOj5jx9
 6PdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXU81YNKrBzvbXxLocxjxCfc01uxN6DERvDIqQcuncGKv9i+AzdfvyK/cvL9VVFQlEVau550mPr24M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyzkMBU3L2Hw6fxb92dh7sxuIegC22LFBDa7ZRyDUmIDFObK2KK
 9kYgVSriHGG1qdHV3mcB0Dt7w/TCsbGWDPHw+uXcAGD6Cso2ZwdJe5vQrfrbUnY=
X-Gm-Gg: ASbGncsTbdxlH3Ht07JZ2bCdUhwrxv6gEdbwZW2BHd7GQMCZTr95qFS1E47OJweKfMp
 Eb5uahUOGGpQpinXTWhBodTFnfmcZ0xgSCTiy7wQYLqGI5nvQSmb4ddLBzPSWMXY15vSZPYEVX4
 jCyhRLhbIjpQhUd502Bzn/S/dBYzFDtAS7w2gThii3jSIZyllnKzTUXhySJUJ6TdBzouyrN8Axy
 RPpYKh9syxFlv/mDnBOoUmdIh8p/0kwEbgx6JJQqxz5tnfIpkoGwZYfIRpTQOlOko4uZTs5f1Wj
 ejUsOwMWFwqxRFL/8S44iYld79g61hTKlrEBuVMXZJKEaFwJbxp50wfl9M8/bza2gMN8hmo=
X-Google-Smtp-Source: AGHT+IHKxKT40jo96mqb7NkALHmaQtXaFtWBP2ROk8yL8YBS3KSBU18a4KW3uLJNYHaNWpdoTwyNbg==
X-Received: by 2002:ac2:58c9:0:b0:545:ae6:d73f with SMTP id
 2adb3069b0e04-5451ddd9ec6mr1786235e87.46.1739533625012; 
 Fri, 14 Feb 2025 03:47:05 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5452e44052fsm62574e87.80.2025.02.14.03.47.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2025 03:47:04 -0800 (PST)
Date: Fri, 14 Feb 2025 13:47:02 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] drm/msm/dsi: Minor cleanups
Message-ID: <cwzxsmoykpobyn43thiyum7ncurmdhdv7qx5pqo27itls54mqt@6l3eekacxlex>
References: <20250106-drm-msm-cleanups-v1-0-271ff1c00795@linaro.org>
 <ad2bc7a7-2e28-4599-bb94-fd66fd2ba88e@linaro.org>
 <r5mq66osrzle4xbduvaqhv4ypqc5dfkjrhvqwchjmni2q32sbd@gh77gkgj3imp>
 <c5288872-31ef-427f-8438-06e1f0da1e71@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c5288872-31ef-427f-8438-06e1f0da1e71@linaro.org>
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

On Fri, Feb 14, 2025 at 12:39:30PM +0100, Krzysztof Kozlowski wrote:
> On 14/02/2025 12:30, Dmitry Baryshkov wrote:
> > On Fri, Feb 14, 2025 at 11:52:14AM +0100, Krzysztof Kozlowski wrote:
> >> On 06/01/2025 09:49, Krzysztof Kozlowski wrote:
> >>> Few minor improvements/cleanups why browsing the code.
> >>>
> >>> Best regards,
> >>> Krzysztof
> >>>
> >>
> >> 5 weeks on the list. Any more comments from DRM side? Can it be merged?
> > 
> > Are you going to repost for the patch #2 commit message update?
> 
> I did not plan, but I can send v2 with that update.

Yes, please.

-- 
With best wishes
Dmitry
