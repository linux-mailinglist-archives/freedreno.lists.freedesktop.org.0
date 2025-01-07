Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 930FFA04D5B
	for <lists+freedreno@lfdr.de>; Wed,  8 Jan 2025 00:20:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5497F10E041;
	Tue,  7 Jan 2025 23:20:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="aX12G3BI";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAD9E10E041
 for <freedreno@lists.freedesktop.org>; Tue,  7 Jan 2025 23:20:33 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-aaf57c2e0beso1348728466b.3
 for <freedreno@lists.freedesktop.org>; Tue, 07 Jan 2025 15:20:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736291972; x=1736896772; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=mMn+z48n5sDePMLHOThKGK3HUHhS6YpHtjLFF5FzZzw=;
 b=aX12G3BISLkrOiB/iRPBnFTjGo5RYOKZEOs4zry0WCs3d5OalzBDws2LF62PobKap0
 E3pWiRRUGghllpNOEzRWqFFRWY+QBfowzZxquTAYlmicOfE/NH1XQPaf9sS6+i8aoUWu
 DcZkZwFilql9FFj/5mobzCCSt2Bjr51MF8sEkzcmLX5GZdREaDFWW1fDKlaSw2PGVIcQ
 4Qfs1SOJ+UYW9MFnZPd65CutFpcEYDyEemMgdoqQpyiugA/Yy0VEERWiPVsvgBr4YauQ
 HQMU3QHL3uXqH0jwaQUOkcTNtkrXs7mGMhWf7PgffjMrQCQQrnd20xsPbuf4oGJbKW2g
 aw1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736291972; x=1736896772;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mMn+z48n5sDePMLHOThKGK3HUHhS6YpHtjLFF5FzZzw=;
 b=pQYfeCy5GmnFgSg4qy1cfflpErievwP8OMhDIJ2AeBP2UzNDfk5NCSWiyWg71sB6pW
 wwjaeX0Bxc8vnD2B8o4SNRaFR1kXs9MgORaMEyFGLt/jUEzx6bIl4DsJaTJNZaCwbnR8
 t2bpEa97aW7tzDH/95UhJIH/PXs4pjQbXH+kIBG7qBN1JPBOw6Zvthpk6iqp3vPfV2mn
 Q7LrpSEySdNMmTB4AiqM7wUzmutAn6KAusfzpHt1ABgRP6hXLAh5iUPZvnLKkWA8rhh1
 S5mrzUKvnwqBIqUIcBqnEIuNMAo7oC5xPGqX9Xm3HDy+KWcJaV5c2DSS3Pt6LwCYLZTA
 /ruQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUtIYKTN0ht31JuCJlVvpEeuCfBiu1qfW7L8h0l88GCcEpFveNOu/VoQXf5y3Or4qUyYfjHOSICxwQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YynnuQte1yjCFyHBYzVwk1oCb8jCpaGH8r/UHIEhbfmLLiOptIR
 D2zFcxNOfaY8Mc7GaLyAFXKpl1N2zLXlQQRd7o2hyrbOfzplCA5icr7pyC1NihLcmorEOCce+mX
 2
X-Gm-Gg: ASbGncv8Ub1FqshWwQ/zEcDsfp3B91hkMYYruA8ar/uZKAsDLe36SEBDxy0sl45/bbw
 bMcI6e2kTuQEhrtdxoPfALby1PCPWc30vAXgMYq09nYr1coSLAt2/b5+5G1axTWsQ2FQWX1Z286
 qMSNBbHGc1Wmv+x5FqEPSqi5FGk5E0DlMVy5YPCp21nsCkWDGRQBax7K2Ev8SAermp1z83w/UNf
 TeTR3uu/DMfK7OLVsKAyIOhAodmTQcvR5m7tROoZlhru1Rceg7VSn/HHDEco55rSrsiYn2l6zXo
 l4YVpnAR+cM7YMm8Rp4x08d65/1J26szy9cF
X-Google-Smtp-Source: AGHT+IFCpSE+6bYHg6NHBaB8kARffXJeZAVotzbF1jSuppzcHd7AtPj85AqoS/RBH5MSht9AXr1DdA==
X-Received: by 2002:a05:6512:2803:b0:542:29b6:9c26 with SMTP id
 2adb3069b0e04-542848108femr117742e87.47.1736288750743; 
 Tue, 07 Jan 2025 14:25:50 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-542235f6002sm5357569e87.36.2025.01.07.14.25.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2025 14:25:49 -0800 (PST)
Date: Wed, 8 Jan 2025 00:25:47 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 15/15] drm/msm/dpu: Enable quad-pipe for DSC and
 dual-DSI case
Message-ID: <mo45zzcmr56grnj42o5rc57t2xdj3rq27chryaqbiwzcbzhjdh@4cvk6er7fr3g>
References: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-0-92c7c0a228e3@linaro.org>
 <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-15-92c7c0a228e3@linaro.org>
 <etci547cjykqlqfswhkzdbdfx7cuyrszzswxv2qaghzu2fnu3y@fgitftlhe3oh>
 <CABymUCNxSKAzNq34evjOdWQy5EmRLg96_S=2O1EUguNFztFgVw@mail.gmail.com>
 <eshnauruu4sybpgsfrrwlvk3cpb2zg4mykg4agwong3dbiduic@nvupoe6aoyzu>
 <CABymUCPXnXYgwemODHOP-Ez3TpGfX3X8ZrOWx7j1a81XzNSjSA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABymUCPXnXYgwemODHOP-Ez3TpGfX3X8ZrOWx7j1a81XzNSjSA@mail.gmail.com>
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

On Mon, Jan 06, 2025 at 04:21:43PM +0800, Jun Nie wrote:
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> 于2025年1月4日周六 01:51写道：
> >
> > On Fri, Jan 03, 2025 at 11:49:07PM +0800, Jun Nie wrote:
> > > Dmitry Baryshkov <dmitry.baryshkov@linaro.org> 于2024年12月20日周五 07:46写道：
> > > >
> > > > On Thu, Dec 19, 2024 at 03:49:33PM +0800, Jun Nie wrote:
> > > >
> > > > >  #ifndef DPU_MAX_DE_CURVES
> > > > >  #define DPU_MAX_DE_CURVES            3
> > > > >  #endif
> > > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > > > > index 57ccb73c45683..b5c1ad2a75594 100644
> > > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > > > > @@ -1474,7 +1474,7 @@ static void _dpu_plane_atomic_disable(struct drm_plane *plane)
> > > > >               trace_dpu_plane_disable(DRMID(plane), false,
> > > > >                                       pstate->pipe[i].multirect_mode);
> > > > >
> > > > > -             if (pipe->sspp && i == 1) {
> > > > > +             if (pipe->sspp && pipe->multirect_index == DPU_SSPP_RECT_1) {
> > > >
> > > > Separate change, please. Also I'm not sure how does that work with the
> > > > shared SSPP case that I pointed to in one of the previous replies.
> > >
> > > Maybe we can add a peer member in the pipe to reference each other, then we have
> > > chance to use multirect across all pipes in all planes.
> >
> > I'd rather not. We have pairs of pipes. I'd rather see the code stay the
> > same way: processing one pair at the same time.
> 
> I mean only use the peer only when the SSPP multi-rect pips cross
> planes. This shall not change
> too much to current SSPP management.

Still no. Please please don't add extra 'peer' member. There should be
no need to have one.


> >
> > >
> > >
> > > >
> > > > >                       pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> > > > >                       pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> > > > >

-- 
With best wishes
Dmitry
