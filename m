Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FCEB9EDA3A
	for <lists+freedreno@lfdr.de>; Wed, 11 Dec 2024 23:41:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A12210E93A;
	Wed, 11 Dec 2024 22:41:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="blyP3rsy";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com
 [IPv6:2607:f8b0:4864:20::112f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B903710E93A
 for <freedreno@lists.freedesktop.org>; Wed, 11 Dec 2024 22:41:03 +0000 (UTC)
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-6eff4f0d627so41988497b3.1
 for <freedreno@lists.freedesktop.org>; Wed, 11 Dec 2024 14:41:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733956863; x=1734561663; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=kQZXgd67ZCOvJ076FqycnZdlFNGoIk/UlxfteNEpnm8=;
 b=blyP3rsy8T/c6khdZ/SafY+lBRm4MsBwfpRaAJx1botjJ2lddxXtCq6+8RDU3ygyIR
 1W3dSX6K/Iub1ID7x281R8asaTUD6R/DjPzZGtUS3im4O3bgxxFIX8/cYLEEXmrtLF/E
 WJTIUua1RRAxN4VSx49E6y9upv6JhCNqLK+HIbmw5pnKKRcjtAzTOLE9ZlQtgUE/H/hl
 Se9J3sP88NuWr+be6f7MUQsSks9mqhWpV5um1HtO/aUe/N/Gqy31aag0O9sYZzSyHiyU
 aHj5JBTn6v4WID7tE8GffOalraFlTUR+8f+Ytgg/CUBs2pI42cY67yvKk1K8WQc8NIAB
 0f2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733956863; x=1734561663;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kQZXgd67ZCOvJ076FqycnZdlFNGoIk/UlxfteNEpnm8=;
 b=v34iW03IiW1xXallj64TAC+SbkbM8twS69NNni8RltgpWYJD2vHYvQIaVPdSXFzhK4
 MV+sLILJBPSJEqzBk9HxqOwFYM0VW3w+5ysjXseVPATkhVMdf1p2IrBDQQYTSeQQcxd6
 8VkMZ5oUlDNGCjgJbGAHLD/HSWJXlpRBSnbVOus+O4laubBFf8Ft7xnv8Kty6riBvX/g
 lbEykoyNcbVLW6cgfbjOd0L9HFOYxfBj6CNl5nqu8xKXLn8N//u/qVmq1ujPketyP9ps
 8MyO+fBJM9tCGzGw+7A1ACfdZVNamgELkJdP74c1Kbm0+tdfTRZ+VdzMB4W1jXFEXthB
 mAug==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXnHEJjhSZV/fbubx5T4ZBehy2llMSzlOPNDoDTeEDOax+IxtiztocBYdTC8wwZUcAHkKEe6AhJP4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyi+piBGO9V3gVi5EESl78UJ/4CK3Jr7oRG/X/Q2o4f0PuYZojV
 9LcN9tK3+hlR1hm9ziDUOuqhKbdFL7pqLgs+F48Z7PNGdQxfHqyLNQQURQVzBM61TIymiZ/62rp
 OFn0oadZtixbP0vh1cr8Jflzplr8M08beCn0BqA==
X-Gm-Gg: ASbGncsutkqgofIWN9qLTvNPa9V5GLrsSHK/Wp0W8dBdyi70B0jvxugYZOWZaLKm6uE
 UO+9pk+NE2gKvoyyaF60Zz5Jgdy8le+3hiH2m
X-Google-Smtp-Source: AGHT+IFx9U1xmIQiDX1vBx6D7MZb4EK2Reh5V7D+ZfzgWjxQn2K+gafTKYLrSeI+6HrlwX0/AVB9Z8wzIXTbGCE1GE0=
X-Received: by 2002:a05:690c:6f92:b0:6ef:7fdb:7d41 with SMTP id
 00721157ae682-6f19060cabemr17208557b3.0.1733956862793; Wed, 11 Dec 2024
 14:41:02 -0800 (PST)
MIME-Version: 1.0
References: <20241130-dpu-virtual-wide-v7-0-991053fcf63c@linaro.org>
 <20241130-dpu-virtual-wide-v7-2-991053fcf63c@linaro.org>
 <160151f0-9cc6-40f6-9f53-466185835e4d@quicinc.com>
 <hpmxj7tjmvbo55izoxgygqmysbabnpb35mprvn6w53vbtehnwe@yxmiigoeuyf3>
 <cfbadc5a-6de0-4081-948c-3542c615a992@quicinc.com>
In-Reply-To: <cfbadc5a-6de0-4081-948c-3542c615a992@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 12 Dec 2024 00:40:51 +0200
Message-ID: <CAA8EJpoLwOVN3MB70UkiPe-dRhFMBigpTYc2PMn+tXnD=LhoBg@mail.gmail.com>
Subject: Re: [PATCH v7 2/3] drm/msm/dpu: allow using two SSPP blocks for a
 single plane
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Thu, 12 Dec 2024 at 00:38, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 12/11/2024 2:24 PM, Dmitry Baryshkov wrote:
> > On Wed, Dec 11, 2024 at 01:51:51PM -0800, Abhinav Kumar wrote:
> >>
> >>
> >> On 11/29/2024 5:55 PM, Dmitry Baryshkov wrote:
> >>> Virtual wide planes give high amount of flexibility, but it is not
> >>> always enough:
> >>>
> >>> In parallel multirect case only the half of the usual width is supported
> >>> for tiled formats. Thus the whole width of two tiled multirect
> >>> rectangles can not be greater than max_linewidth, which is not enough
> >>> for some platforms/compositors.
> >>>
> >>> Another example is as simple as wide YUV plane. YUV planes can not use
> >>> multirect, so currently they are limited to max_linewidth too.
> >>>
> >>> Now that the planes are fully virtualized, add support for allocating
> >>> two SSPP blocks to drive a single DRM plane. This fixes both mentioned
> >>> cases and allows all planes to go up to 2*max_linewidth (at the cost of
> >>> making some of the planes unavailable to the user).
> >>>
> >>
> >> Overall looks so much cleaner after unification!
> >>
> >> One small nit below,
> >>
> >>
> >> You can still have,
> >>
> >> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> >>
> >> Note: we have started testing this series with sc7180 CrOS, and will report
> >> our findings/ give tested-by this week.
> >>
> >>
> >> <snip>
> >>
> >>> +static bool dpu_plane_try_multirect_parallel(struct dpu_sw_pipe *pipe, struct dpu_sw_pipe_cfg *pipe_cfg,
> >>> +                                        struct dpu_sw_pipe *r_pipe, struct dpu_sw_pipe_cfg *r_pipe_cfg,
> >>> +                                        struct dpu_hw_sspp *sspp, const struct msm_format *fmt,
> >>> +                                        uint32_t max_linewidth)
> >>> +{
> >>> +   r_pipe->sspp = NULL;
> >>> +
> >>> +   pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> >>> +   pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> >>> +
> >>> +   r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> >>> +   r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> >>> +
> >>
> >>
> >> There are two places where the multirect_index and multirect_mode are reset.
> >> Would it be better to just have a small api dpu_plane_reset_multirect() and
> >> do this there?
> >
> > I'm not sure, what's the benefit. We can add an API to reset one pipe
> > (to also be able to use it in _dpu_plane_atomic_disable()), but then
> > it's just deduplication for the sake of deduplication.
> >
>
> Yeah I was thinking something like
>
> dpu_plane_reset_multirect(pipe);
> dpu_plane_reset_multirect(r_pipe);
>
> But its only a minor benefit, hence as I wrote it as a nit. We can keep
> things as it is, if its unnecessary in your opinion.

Well, granted that I hope to be able to drop non-virtual planes after
a few releases, I don't think it makes real sense.


-- 
With best wishes
Dmitry
