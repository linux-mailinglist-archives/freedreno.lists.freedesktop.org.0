Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A14DA7FE821
	for <lists+freedreno@lfdr.de>; Thu, 30 Nov 2023 05:06:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F127710E6AB;
	Thu, 30 Nov 2023 04:06:23 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com
 [IPv6:2607:f8b0:4864:20::112d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A489410E6A6
 for <freedreno@lists.freedesktop.org>; Thu, 30 Nov 2023 04:06:21 +0000 (UTC)
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-5cc589c0b90so5297567b3.2
 for <freedreno@lists.freedesktop.org>; Wed, 29 Nov 2023 20:06:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701317181; x=1701921981; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1zwuamlIV1jDg6rOlQdipklJQb9oUjXdjuftFM5av+U=;
 b=UuQG3uxzhYK0TWVnwAmyoPQhQnHMdBCiCvgb+YzGulJGxbgkxcRuKDV++jR+EHt60P
 fapdPiokCul0JUtC53qeA+XpmcTntCEPhM2lkCBxWzNo6V1Qxf+91jv76V6Fe4k5oxQj
 Qe2FFPUuwL8+oNyX/PRBokLWF+nKIl4V5LEhywWmDQCRKgztr9W8IGV5X51HUU5CbyGh
 9fOVdlnW9v+/DDcbPoucPKd71q+PMkOyDTTazpRiwwR85HB+fHz6HL/WCZToYTvwia1g
 OU3F+6rgi4zxsXRpaATfk/H3eFJ7GWna9KamIf0MaAJlM0g0+Y35L5kLMKhSpPQFXJFP
 skqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701317181; x=1701921981;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1zwuamlIV1jDg6rOlQdipklJQb9oUjXdjuftFM5av+U=;
 b=WmutrKVEeZKddCYjtPhJTQgImVMsZ58C6q1+bzBotThXfEie+REIMjtBE78C5shc8W
 kdHQgpze90mpts653OrYTVvzoc93uuzwZGAKMiL+j6OgEE2oqZjo4+iN5/CT1ebrN6nz
 HMSY6Sah9VtwnLnGcsic7w7U+24yMN+ibMe8an0Pj6ZGtRcYCV0KtyGMu6tBCylQ69zV
 vlvDo0fHPmdNtN3lCTXaKX0rPbPitX1IH0ZpQMQtnd6fFP3y1O/nVADt5GpU/2Pp+B+I
 HptNXUr+hkf19c6V+LudwviShA8E74FDdp2n339tqXia2O5k7yqVQcEEK6b4b51WfrvX
 P2VQ==
X-Gm-Message-State: AOJu0YxSdSelhSBKAddfFKwDzgmBVoUtPFXREcIL15gko+aPFmwk6SOW
 Nwa+y04s1yd3ZILJ6FYzn51Ko/R0oFzhoXJT6YimCg==
X-Google-Smtp-Source: AGHT+IH5VqWkIJEXkSlzehGjOyCBp+myDPhrn3B4acVuNRIw/JkoNdioljfuRcqvXowZACNims6bGNNgqho9TQqZ5ow=
X-Received: by 2002:a0d:ef47:0:b0:5a7:b481:4dd2 with SMTP id
 y68-20020a0def47000000b005a7b4814dd2mr21943989ywe.47.1701317180853; Wed, 29
 Nov 2023 20:06:20 -0800 (PST)
MIME-Version: 1.0
References: <20231027-solid-fill-v7-0-780188bfa7b2@quicinc.com>
 <20231027-solid-fill-v7-7-780188bfa7b2@quicinc.com>
In-Reply-To: <20231027-solid-fill-v7-7-780188bfa7b2@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 30 Nov 2023 06:06:09 +0200
Message-ID: <CAA8EJppjVcP3YbBLG2vaZrRP2FAVfVM4WvLieLpV3z1VQ2exAA@mail.gmail.com>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH RFC v7 07/10] drm/atomic: Loosen FB atomic
 checks
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 sebastian.wick@redhat.com, ppaalanen@gmail.com,
 Thomas Zimmermann <tzimmermann@suse.de>, Sean Paul <sean@poorly.run>,
 dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 quic_abhinavk@quicinc.com, Maxime Ripard <mripard@kernel.org>,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 laurent.pinchart@ideasonboard.com, Daniel Vetter <daniel@ffwll.ch>,
 contact@emersion.fr, Marijn Suijten <marijn.suijten@somainline.org>,
 wayland-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 ville.syrjala@linux.intel.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Sat, 28 Oct 2023 at 01:33, Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>
> Loosen the requirements for atomic and legacy commit so that, in cases
> where pixel_source != FB, the commit can still go through.
>
> This includes adding framebuffer NULL checks in other areas to account for
> FB being NULL when non-FB pixel sources are enabled.
>
> To disable a plane, the pixel_source must be NONE or the FB must be NULL
> if pixel_source == FB.
>
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/drm_atomic.c        | 21 ++++++++++----------
>  drivers/gpu/drm/drm_atomic_helper.c | 39 +++++++++++++++++++++----------------
>  include/drm/drm_atomic_helper.h     |  4 ++--
>  include/drm/drm_plane.h             | 29 +++++++++++++++++++++++++++
>  4 files changed, 64 insertions(+), 29 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
